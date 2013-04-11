//
//  UIResponder+PresentingErrors.m
//  CapitaineTrain
//
//  Created by Pierre de La Morinerie on 24/01/13.
//  Copyright (c) 2013 Capitaine Train. All rights reserved.
//

#import "UIResponder+PresentingErrors.h"

@implementation UIResponder (PresentingErrors)

- (void) presentError:(NSError *)error
{
    [self.nextResponder presentError:error];
}

@end

@implementation UIApplication (PresentingErrors)

- (void) presentError:(NSError *)error
{
    [[[UIAlertView alloc] initWithTitle:error.localizedDescription
                                message:error.localizedFailureReason
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil]
     show];
}

@end
