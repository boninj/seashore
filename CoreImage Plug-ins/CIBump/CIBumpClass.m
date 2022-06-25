#import "CIBumpClass.h"

@implementation CIBumpClass

- (id)initWithManager:(PluginData *)data
{
    return [super initWithManager:data filter:@"CIBumpDistortion" points:2 properties:kCI_Scale,kCI_PointCenter,kCI_PointRadius,0];
}

@end
