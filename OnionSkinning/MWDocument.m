//
//  MWDocument.m
//  OnionSkinning
//
//  Created by Max Winde on 14.09.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MWDocument.h"

@interface MWDocument () {
    
    NSImage *image;
    
}
@end

@implementation MWDocument

@synthesize imageView;

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        // If an error occurs here, return nil.
    }
    return self;
}

- (NSString *)windowNibName
{
    return @"MWDocument";
}

- (void)synchronizeWindowTitle;
{
    [[self.windowControllers objectAtIndex:0] synchronizeWindowTitleWithDocumentName];
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    aController.window.backgroundColor = [NSColor colorWithPatternImage:image];
    
    NSRect windowFrame = aController.window.frame;
    windowFrame.size = image.size;
    windowFrame = [aController.window frameRectForContentRect:windowFrame];
    [aController.window setFrame:windowFrame display:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(synchronizeWindowTitle) name:@"synchronizeWindowTitle" object:aController.window];
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    /*
     Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    */
    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    @throw exception;
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    if ([typeName isEqualToString:@"Image"]) {
        image = [[NSImage alloc] initWithData:data];
        
        if (image) return YES;
    }
    
    return NO;
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

@end
