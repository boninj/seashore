#import "CIWhitePointAdjustClass.h"

@implementation CIWhitePointAdjustClass

- (id)initWithManager:(PluginData *)data
{
    return [super initWithManager:data filter:@"CIWhitePointAdjust" points:0 properties:kCI_Color,0];
}

@end
