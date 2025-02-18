#import "Seashore.h"
#import "GradientOptions.h"
#import "AbstractTool.h"

/*!
	@class		GradientTool
	@abstract	The gradient tool allows the user to fill the selected area with
				the selected gradient.
	@discussion	N/A
				<br><br>
				<b>License:</b> GNU General Public License<br>
				<b>Copyright:</b> Copyright (c) 2002 Mark Pazolli
*/

@interface GradientTool : AbstractTool
{
	
	IntPoint startPoint;
    IntPoint tempPoint;

    GradientOptions *options;
	
}

/*!
	@method		mouseDownAt:withEvent:
	@discussion	Handles mouse down events.
	@param		where
				Where in the document the mouse down event occurred (in terms of
				the document's pixels).
	@param		modifiers
				The state of the modifiers at the time (see NSEvent).
	@param		event
				The mouse down event.
*/
- (void)mouseDownAt:(IntPoint)where withEvent:(NSEvent *)event;

/*!
	@method		mouseUpAt:withEvent:
	@discussion	Handles mouse up events.
	@param		where
				Where in the document the mouse up event occurred (in terms of
				the document's pixels).
	@param		modifiers
				The state of the modifiers at the time (see NSEvent).
	@param		event
				The mouse up event.
*/
- (void)mouseUpAt:(IntPoint)where withEvent:(NSEvent *)event;

/*!
	@method		mouseDraggedTo:withEvent:
	@discussion	Handles mouse dragging events.
	@param		where
				Where in the document the mouse down event occurred (in terms of the document's pixels).
	@param		event
				The mouse dragged event.
*/
- (void)mouseDraggedTo:(IntPoint)where withEvent:(NSEvent *)event;

- (IntPoint)start;
- (IntPoint)current;

@end
