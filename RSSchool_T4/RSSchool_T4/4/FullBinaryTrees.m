#import "FullBinaryTrees.h"
#import "Node.h"
@implementation FullBinaryTrees
int nodeNumber = 1;
-(NSMutableArray *) allPossibleTrees: (int) n {
  //  int nodeNumber = 1;
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    if (n < 1) {
        return nil;
    }else if (n == 1){
        Node *tempNode = [Node new];
        tempNode.val = @"0";
        return [[NSMutableArray alloc] initWithObjects: tempNode, nil];
//        NSLog(@"---------------------------------------------%d", nodeNumber);
 //       nodeNumber ++;
    }
    
    for (int i = 1; i < n; i += 2) {
        NSMutableArray *lefts = [self allPossibleTrees:i];
        NSMutableArray *rights = [self allPossibleTrees:n - i -1];
        for (Node *left in lefts) {
            for (Node *right in rights){
                Node *root = [[Node alloc] init];
                root.val = @"0";
   //             NSLog(@"=============================================%d", nodeNumber);
    //            nodeNumber ++;
                root.left = left;
                root.right = right;
                [resultArray addObject:root];
                
            }
        }
    }
    return resultArray;
}
/*
- (NSArray *) arrayOfStringsFrom: (Node *) node withLevel: (int) level to: (NSMutableArray*) resultArray count: (int) count{
    
    if (level == 1) {
        
        [resultArray addObject:@"0"];
    } else if (count < nodeNumber){
        
    }
    return nil;
}
*/

-(NSArray*) convertTreeToArray: (Node *)node  {
    NSMutableArray *tempArray = [NSMutableArray new];
    [tempArray addObject:node];
    NSMutableArray *resultArray = [NSMutableArray new];
    NSMutableString *tempString = [NSMutableString new];
    while ([tempArray count] > 0) {
        Node *tempNode = [Node new];
        tempNode = tempArray[0];
        [tempArray removeObjectAtIndex:0];
        if ([tempNode.val isEqualToString:@"0"]) {
            [tempString appendString:tempNode.val];
            [resultArray addObject:tempNode.val];
            if (tempNode.left == nil) {
                Node *tmpNode = [Node new];
                tmpNode.val = @"null";
                tempNode.left = tmpNode;
            }
            if (tempNode.right == nil) {
                Node *tmpNode = [Node new];
                tmpNode.val = @"null";
                tempNode.right = tmpNode;
            }
            [tempArray addObject:tempNode.left];
            [tempArray addObject:tempNode.right];
        }else{
            [tempString appendString:@"null"];
            [resultArray addObject:@"null"];
        }
        
    }
    while ([[resultArray lastObject] isEqualToString: @"null"]) {
        [resultArray removeLastObject];
    }
    while ([[resultArray firstObject] isEqualToString:@"null"]) {
        [resultArray removeObjectAtIndex:0];
    }
    return resultArray;
}
- (NSString *) convertArrayToString: (NSArray *) array{
    NSMutableString *tempString = [NSMutableString new];
    [tempString appendString:@"["];
    for (int i = 0; i < [array count]; i++) {
        [tempString appendString:@"["];
        for (int j = 0; j < [array[i] count]; j++) {
            [tempString appendString:array[i][j]];
            if (j != [array[i] count] - 1) {
                 [tempString appendString:@","];
            }
        }
        if (i != [array count] - 1) {
            [tempString appendString:@"],"];
        }else{
            [tempString appendString:@"]"];
        }
        
    }
    [tempString appendString:@"]"];
    return tempString;
}

-(NSString *) deleteTrailingNullFrom: (NSString *) stringWithTrailingNull{
    NSMutableString *str = [stringWithTrailingNull mutableCopy];
    if ([str length] < 5) {
        return str;
    }
    NSRange range = NSMakeRange([str length]-4, 4);
    while ([[str substringWithRange:range] isEqualToString:@"null"])  {
        
        [str replaceCharactersInRange:range withString:@""];
        if ([str length] > 3) {
            range = NSMakeRange([str length]-4, 4);
        }
        
        
    }
    [str insertString:@"[" atIndex:0];
    [str insertString:@"]" atIndex:[str length]-1];
    return str;
}

- (NSString *)stringForNodeCount:(NSInteger)count {
    if (count % 2 == 0) {
        return @"[]";
    }
    if (count == 1) {
        return @"[[0]]";
    }
    
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    NSMutableArray *treeArray = [[NSMutableArray alloc] init];
    
    nodeNumber = count;
    treeArray = [self allPossibleTrees: count];
 //   NSMutableArray *stringArray = [NSMutableArray new];
    NSString * tempString = [[NSString alloc] init];
    NSString * tmpString = [[NSString alloc] init];
    
    for (Node *node in treeArray) {
        [tempArray addObject:[self convertTreeToArray:node]];
        
     //   NSLog(@"%d",[node val]);
    }
    tempString = [self convertArrayToString:tempArray];
 //   NSLog(@"%@", stringArray);
    // good luck
    return tempString;
}
@end
