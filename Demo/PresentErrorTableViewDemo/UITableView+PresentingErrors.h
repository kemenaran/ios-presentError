//
//  UITableView+PresentingErrors.h
//  PresentErrorTableViewDemo
//
//  Created by Pierre de La Morinerie on 10/04/13.
//  Copyright (c) 2013 Pierre de La Morinerie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIResponder+PresentingErrors.h"

@interface UITableView (PresentingErrors)
// Display an error message in the table view header
- (void) presentError:(NSError*)error;
@end
