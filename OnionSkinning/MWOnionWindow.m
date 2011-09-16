//
//  MWOnionWindow.m
//  OnionSkinning
//
//  Created by Max Winde on 16.09.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MWOnionWindow.h"

@interface MWOnionWindow ()

- (void)moveBy:(CGSize)size;

@end


@implementation MWOnionWindow

@synthesize initialLocation;

- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    self = [super initWithContentRect:contentRect styleMask:aStyle backing:bufferingType defer:flag];
    
    if (self) {
        self.alphaValue = 0.8;
        self.backgroundColor = [NSColor clearColor];
        [self setMovableByWindowBackground:YES];
    }
    
    return self;
}

- (void)moveBy:(CGSize)size;
{
    NSPoint windowOrigin = self.frame.origin;
    windowOrigin.x += size.width;
    windowOrigin.y += size.height;
    [self setFrameOrigin:windowOrigin];
}

- (void)keyDown:(NSEvent *)theEvent;
{
    if (theEvent.keyCode == 123) {
        // left
        [self moveBy:CGSizeMake(-1.0, 0.0)];
    } else if (theEvent.keyCode == 124) {
        // right
        [self moveBy:CGSizeMake(1.0, 0.0)];
    } else if (theEvent.keyCode == 126) {
        // up
        [self moveBy:CGSizeMake(0.0, 1.0)];
    } else if (theEvent.keyCode == 125) {
        // down
        [self moveBy:CGSizeMake(0.0, -1.0)];
    }
}

- (void)keyUp:(NSEvent *)theEvent;
{
    if ([theEvent.characters isEqualToString:@"1"]) {
        self.alphaValue = 0.1;
    } else if ([theEvent.characters isEqualToString:@"2"]) {
        self.alphaValue = 0.2;
    } else if ([theEvent.characters isEqualToString:@"3"]) {
        self.alphaValue = 0.3;
    } else if ([theEvent.characters isEqualToString:@"4"]) {
        self.alphaValue = 0.4;
    } else if ([theEvent.characters isEqualToString:@"5"]) {
        self.alphaValue = 0.5;
    } else if ([theEvent.characters isEqualToString:@"6"]) {
        self.alphaValue = 0.6;
    } else if ([theEvent.characters isEqualToString:@"7"]) {
        self.alphaValue = 0.7;
    } else if ([theEvent.characters isEqualToString:@"8"]) {
        self.alphaValue = 0.8;
    } else if ([theEvent.characters isEqualToString:@"9"]) {
        self.alphaValue = 0.9;
    } else if ([theEvent.characters isEqualToString:@"0"]) {
        self.alphaValue = 1.0;
    }
}

- (BOOL)canBecomeMainWindow;
{
    return YES;
}

- (BOOL)canBecomeKeyWindow;
{
    return YES;
}

///*
// Start tracking a potential drag operation here when the user first clicks the mouse, to establish
// the initial location.
// */
//- (void)mouseDown:(NSEvent *)theEvent {    
//    // Get the mouse location in window coordinates.
//    self.initialLocation = [theEvent locationInWindow];
//}
//
///*
// Once the user starts dragging the mouse, move the window with it. The window has no title bar for
// the user to drag (so we have to implement dragging ourselves)
// */
//- (void)mouseDragged:(NSEvent *)theEvent {
//    NSRect screenVisibleFrame = [[NSScreen mainScreen] visibleFrame];
//    NSRect windowFrame = [self frame];
//    NSPoint newOrigin = windowFrame.origin;
//    
//    // Get the mouse location in window coordinates.
//    NSPoint currentLocation = [theEvent locationInWindow];
//    // Update the origin with the difference between the new mouse location and the old mouse location.
//    newOrigin.x += (currentLocation.x - initialLocation.x);
//    newOrigin.y += (currentLocation.y - initialLocation.y);
//    
//    // Don't let window get dragged up under the menu bar
//    if ((newOrigin.y + windowFrame.size.height) > (screenVisibleFrame.origin.y + screenVisibleFrame.size.height)) {
//        newOrigin.y = screenVisibleFrame.origin.y + (screenVisibleFrame.size.height - windowFrame.size.height);
//    }
//    
//    // Move the window to the new location
//    [self setFrameOrigin:newOrigin];
//}

@end
