#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray *) performResultArray: (NSString *) number with: (NSArray*) keyboardArray{
    NSMutableArray *resultArray = [NSMutableArray new];
    for (int index = 0; index < [number length]; index++) {
        for (int i = 0; i < [keyboardArray count]; i++) {
            for (int j = 0; j < [keyboardArray[i] count]; j++) {
                if ([[number substringWithRange:NSMakeRange(index, 1)] isEqualToString:keyboardArray[i][j]]) {
                    if ([[number substringWithRange:NSMakeRange(index, 1)] isEqualToString:@"0"]) {
                        NSMutableString *tempString = [[NSMutableString alloc] initWithString:number];
                        [tempString replaceCharactersInRange:NSMakeRange(index, 1) withString:keyboardArray[i][j-1]];
                        [resultArray addObject:tempString];
                    }else{
                    if (j+1 < [keyboardArray[i] count]) {
                        NSMutableString *tempString = [[NSMutableString alloc] initWithString:number];
                        [tempString replaceCharactersInRange:NSMakeRange(index, 1) withString:keyboardArray[i][j+1]];
                        [resultArray addObject:tempString];
                    }
                    if (i+1 < [keyboardArray count]) {
                        NSMutableString *tempString = [[NSMutableString alloc] initWithString:number];
                        [tempString replaceCharactersInRange:NSMakeRange(index, 1) withString:keyboardArray[i+1][j]];
                        [resultArray addObject:tempString];
                    }
                    if (j-1 >= 0) {
                        NSMutableString *tempString = [[NSMutableString alloc] initWithString:number];
                        [tempString replaceCharactersInRange:NSMakeRange(index, 1) withString:keyboardArray[i][j-1]];
                        [resultArray addObject:tempString];
                    }
                    if (i-1 >= 0) {
                        NSMutableString *tempString = [[NSMutableString alloc] initWithString:number];
                        [tempString replaceCharactersInRange:NSMakeRange(index, 1) withString:keyboardArray[i-1][j]];
                        [resultArray addObject:tempString];
                    }
                    }
                    
                }
                
            }
        }
    }
    return resultArray;
}
- (NSArray *) prepareKeyboardArray{
    return @[@[@"1",@"4",@"7"],@[@"2",@"5",@"8",@"0"],@[@"3",@"6",@"9"]];
}
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    // good luck
    if (([number length]>0) && ([number intValue] > 0)){
        return [self performResultArray:number with:[self prepareKeyboardArray]];
    }else{
        return nil;
    }
    
    
}
@end
