#import "NSArray+MinRotated.h"

@implementation NSArray (MinRotated)

- (NSNumber *)minRotated {
    NSInteger len = [self count];
    
    if (len == 0) {
        return nil;
    }
    
    if ([self[0] intValue] <= [self[len - 1] intValue]) {
        return self[0];
    }
    
    if (len == 2) {
        return [self[0] intValue] < [self[1] intValue] ? self[0] : self[1];
    }
    
    NSInteger median = len % 2 == 0 ? len / 2 : (len + 1) / 2;
    
    if ([self[0] intValue] < [self[median - 1] intValue]) {
        return [[self subarrayWithRange:NSMakeRange(median, len - median)] minRotated];
    } else {
        return [[self subarrayWithRange:NSMakeRange(0, median)] minRotated];
    }
}

@end
