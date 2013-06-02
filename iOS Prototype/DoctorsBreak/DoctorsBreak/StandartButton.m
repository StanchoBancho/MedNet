//
//  StandartButton.m
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 6/2/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import "StandartButton.h"

@implementation StandartButton

-(void)setupBackgrounds
{
    UIImage* normalImage = [UIImage imageNamed:@"ButtonBackGround"];
    normalImage = [normalImage resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f , 20.0f, 0.0f, 20.0f) resizingMode:UIImageResizingModeStretch];
    [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    UIImage* highlightedImage = [UIImage imageNamed:@"ButtonBackGroundHighlighted"];
    highlightedImage = [highlightedImage resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f , 20.0f, 0.0f, 20.0f) resizingMode:UIImageResizingModeStretch];
    [self setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupBackgrounds];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self setupBackgrounds];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
