#import "ArrayCalculator.h"

@implementation ArrayCalculator
NSMutableArray *combineArray;
NSMutableArray *stackArray;
NSMutableArray *combinationArray;
+(NSArray *) prepareArray: (NSArray *) array{
    NSMutableArray *resultArray = [array mutableCopy];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self isKindOfClass:%@",[NSNumber class]];
    [resultArray filterUsingPredicate:predicate];
    return resultArray;
}
+ (NSArray *) findCombinationsFor: (NSInteger) k inArray: (NSMutableArray *)array withVar: (NSInteger) num andLast: (int) last{
   
    if (num == k){
        
        [combineArray addObject:[stackArray mutableCopy]];
    }
    for (int i = last + 1; i < [array count]; i++) {
       // if (!([combinationArray containsObject:@(i)])){
            [stackArray addObject:array[i]];
        //    [combinationArray addObject:@(i)];
        [self findCombinationsFor:k inArray:array withVar:(num+1) andLast: i];
            [stackArray removeLastObject];
        //    [combinationArray removeObject:@(i)];
     //   }
    }
    return nil;
}
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    // good luck
    NSMutableArray *tempArray = [NSMutableArray new];
    NSInteger tempNumberOfItems = numberOfItems;
    if (numberOfItems <= 0) {
        return 0;
    }else if (numberOfItems > [array count]){
        tempNumberOfItems = [array count];
    }
    stackArray = [NSMutableArray new];
    combinationArray = [NSMutableArray new];
    combineArray = [NSMutableArray new];
    tempArray = [array mutableCopy];
    tempArray = [[ArrayCalculator prepareArray:tempArray] mutableCopy];
    if ([tempArray count] == 0) {
        return 0;
    }
    if ([tempArray count] <= numberOfItems) {
        tempNumberOfItems = [tempArray count];
    }
    tempArray = [[ArrayCalculator findCombinationsFor:tempNumberOfItems inArray:tempArray withVar: 0 andLast: -1] mutableCopy];
    tempArray = [combineArray mutableCopy];
    NSInteger u = 1;
    NSInteger uc = 1;
    if ([tempArray count]){
        
    }
    for (int i=0; i< [tempArray count]; i++) {
        uc = 1;
        for (int j = 0; j < [tempArray[i] count]; j++) {
            
            uc = uc * [tempArray[i][j] intValue];
        }
        if (i == 0) {
            u = uc;
        }else if (u < uc){
            u = uc;
        }
        
    }
    
    return u;
}
@end
