//
//  CellThatPresentErrors.h
//  PresentErrorTableViewDemo
//
//  Created by Pierre de La Morinerie on 10/04/13.
//  Copyright (c) 2013 Pierre de La Morinerie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIResponder+PresentingErrors.h"

@interface CellThatPresentErrors : UITableViewCell
// Display a message in the detailsTextLabel, highlighted in red
- (void) presentError:(NSError *)error;
@end
