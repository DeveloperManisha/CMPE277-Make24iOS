
#import "gameModel.h"

@implementation gameModel

static gameModel *gModel;

- (id)init
{
    if ((self = [super init])) {
       equationHolder = [[NSMutableArray alloc]init];
        attempt =0;
        skipped =0;
        success =0;
        timeInSeconds=0;
        assignedNumber =[[NSMutableArray alloc]init];
        isAssigned = false;
    }
    return self;
}
+(gameModel*)getInstance{
    if(!gModel)
        gModel =[[gameModel alloc] init];
    return gModel;
}
-(int)getAttempt{
    return attempt;
}
-(void)setAttempt:(int)a{
    attempt = a;
}
@end
