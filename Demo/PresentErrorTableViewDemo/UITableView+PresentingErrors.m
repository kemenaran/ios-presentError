//
//  UITableView+PresentingErrors.m
//  PresentErrorTableViewDemo
//
//  Created by Pierre de La Morinerie on 10/04/13.
//  Copyright (c) 2013 Pierre de La Morinerie. All rights reserved.
//

#import "UITableView+PresentingErrors.h"

@implementation UITableView (PresentingErrors)

- (void) presentError:(NSError *)error
{
    UILabel *errorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -44, self.bounds.size.width, 44)];
    errorLabel.textColor = [UIColor redColor];
    errorLabel.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    errorLabel.textAlignment = NSTextAlignmentCenter;
    errorLabel.text = [error localizedDescription];
    [self addSubview:errorLabel];
    
    [self setContentInset:UIEdgeInsetsMake(44, 0, 0, 0)];
    self.contentOffset = CGPointMake(0, self.contentOffset.y + 44);
    
    [self setContentOffset:CGPointMake(0, self.contentOffset.y - 44) animated:YES];
}

@end
