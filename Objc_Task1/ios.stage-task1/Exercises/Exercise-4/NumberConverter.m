#import "NumberConverter.h"

@implementation NumberConverter

- (NSArray *)numberConverter:(NSNumber *)number {
    
    NSMutableArray *characterArray = [[NSMutableArray alloc] init];
    
    if (number == nil) {
        return characterArray;
    }
    
    if (number.intValue < 0 ) {
        number = @(-number.intValue);
    }
    
    while (number.intValue > 0) {
        NSInteger digit = number.intValue % 10;
        NSString *symbol = [NSString stringWithFormat:@"%lx", digit];
        [characterArray addObject:symbol];
        number = @(number.intValue / 10);
    }
    
    return characterArray;
}
@end
