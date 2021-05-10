#import "LeaderBoardTracker.h"

@interface LeaderBoardTracker()

@property (nonatomic, strong) NSArray <NSNumber *> *playersPlaces;

@end

@implementation LeaderBoardTracker

- (NSArray <NSNumber *> *)trackLeaderBoard:(NSArray <NSNumber *> *)rankedArray
                               playerArray:(NSArray <NSNumber *> *)playerArray {
    
    NSMutableArray *resultArray = [NSMutableArray new];
    
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:rankedArray];
    NSArray *rankedArrayWithoutDuplicates = [orderedSet array];
    
    int numberOfElements = (int)(rankedArrayWithoutDuplicates.count - 1);
    
    for (NSNumber *player in playerArray) {
        int realIndex = 0;
        if (numberOfElements >= 0) {
            for (NSNumber *ranked in rankedArrayWithoutDuplicates) {
                if (realIndex == numberOfElements) {
                    if (player.intValue >= ranked.intValue) {
                        NSNumber *rank = [NSNumber numberWithInt:realIndex + 1];
                        [resultArray addObject:rank];
                        break;
                    } else {
                        NSNumber *rank = [NSNumber numberWithInt:realIndex + 2];
                        [resultArray addObject:rank];
                        break;
                    }
                } else {
                    if (player.intValue >= ranked.intValue) {
                        NSNumber *rank = [NSNumber numberWithInt:realIndex + 1];
                        [resultArray addObject:rank];
                        break;
                    }
                }
                realIndex++;
            }
        } else {
            NSNumber *rank = [NSNumber numberWithInt:1];
            [resultArray addObject:rank];
        }
    }
    return resultArray;
}

@end
