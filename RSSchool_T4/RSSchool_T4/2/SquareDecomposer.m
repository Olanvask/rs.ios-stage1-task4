#import "SquareDecomposer.h"

@implementation SquareDecomposer
NSMutableArray *tempArray;
- (NSMutableArray *) decompose: (NSInteger) n with: (NSInteger) member{
    if (member == 0){
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        [tempArray addObject: @(n)];
        return tempArray;
    }

    for (long i = n - 1; i>0; i--) {
        if ((member - i*i) >= 0) {
            tempArray = [self decompose:i with:member - i*i];
            if (tempArray != nil){
                [tempArray addObject: @(n)];
                return tempArray;
            }
        }
    }
    return nil;
}
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    // good luck
    NSMutableArray *resultArray = [NSMutableArray new];
    
    NSInteger n = [number intValue];
   resultArray =  [[self decompose:n with:n*n] mutableCopy];
    if (resultArray != nil){
        [resultArray removeLastObject];
        return resultArray;
    }
    return nil;
 //   return @[@0];
}
@end
