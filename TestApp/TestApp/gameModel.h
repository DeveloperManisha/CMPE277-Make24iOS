
#import <Foundation/Foundation.h>

@interface gameModel : NSObject{
    @public
    NSMutableArray *equationHolder;
    int attempt;
    @public
    int skipped;
    int success;
    int timeInSeconds;
    NSMutableArray *assignedNumber;
    Boolean isAssigned;
}
+(gameModel*)getInstance;
-(int)getAttempt;
-(void)setAttempt:(int)a;
@end
