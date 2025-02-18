#import "AbstractSelectTool.h"

#import "SeaDocument.h"
#import "SeaHelpers.h"
#import "SeaSelection.h"
#import "AbstractOptions.h"
#import "SeaContent.h"
#import "AbstractSelectOptions.h"
#import "SeaLayer.h"

@implementation AbstractSelectTool

- (void)downHandler:(IntPoint)localPoint withEvent:(NSEvent *)event
{	
    [self mouseDownAt: localPoint
              forRect: [[document selection] maskRect]
         withMaskRect: [[document selection] maskRect]
              andMask: [[document selection] mask]];
}

- (void)dragHandler:(IntPoint)localPoint withEvent:(NSEvent *)event
{
    IntRect newRect = [self mouseDraggedTo: localPoint
                                   forRect: [[document selection] maskRect] // TODO
                                   andMask: [[document selection] mask]];
    if(scalingDir > kNoDir && !translating){
        [[document selection] scaleSelectionTo: newRect
                                          from: [self preScaledRect]
                                 interpolation: NSImageInterpolationHigh
                                     usingMask: [self preScaledMask]];
    }else if (translating && scalingDir == kNoDir){
        SeaLayer *layer = [[document contents] activeLayer];
        IntPoint globalPoint = IntOffsetPoint(localPoint,[layer xoff],[layer yoff]);
        [[document selection] moveSelection:globalPoint fromOrigin:moveOrigin];
        moveOrigin = globalPoint;
    }
}

- (void)upHandler:(IntPoint)localPoint withEvent:(NSEvent *)event
{
    [self mouseUpAt: localPoint
            forRect: [[document selection] maskRect] // TODO
            andMask: [[document selection] mask]];

}

- (void)cancelSelection
{
	translating = NO;
	scalingDir = kNoDir;
	intermediate = NO;
	[[document helpers] selectionChanged];
}

- (void)switchingTools:(BOOL)active
{
    intermediate=FALSE;
}

- (void)updateCursor:(IntPoint)p cursors:(SeaCursors*)cursors
{
    int selectionMode = [(AbstractSelectOptions *)[self getOptions] selectionMode];

    if(selectionMode == kAddMode){
        [[cursors addCursor] set];
        return;
    }else if (selectionMode == kSubtractMode) {
        [[cursors subtractCursor] set];
        return;
    }

    if([[document selection] active]){
        IntRect selectionRect = [[document selection] maskRect];
        return [cursors handleRectCursors:selectionRect point:p cursor:[cursors crosspointCursor]];
    }
    [[cursors crosspointCursor] set];
    return;
}

@end
