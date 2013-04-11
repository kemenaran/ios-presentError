//
//  CellThatPresentErrors.m
//  PresentErrorTableViewDemo
//
//  Created by Pierre de La Morinerie on 10/04/13.
//  Copyright (c) 2013 Pierre de La Morinerie. All rights reserved.
//

#import "CellThatPresentErrors.h"

@implementation CellThatPresentErrors

- (void) presentError:(NSError *)error
{
    self.detailTextLabel.text = [error localizedDescription];
    
    // Fade the label to red, then to gray again
    [UIView transitionWithView:self duration:0.01 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.detailTextLabel.textColor = [UIColor redColor];
        
    } completion:^(BOOL finished) {
        [UIView transitionWithView:self duration:0.6 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.detailTextLabel.textColor = [UIColor grayColor];
        } completion:NULL];
    }];
}

@end
