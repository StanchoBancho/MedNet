//
//  NewsFeed.h
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 6/2/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    NFTypeMessage,
    NFTypeImage,
    NFTypeURL
} NewsFeedType;

@interface NewsFeed : NSObject

@property(nonatomic, assign) NewsFeedType* type;
@property(nonatomic, strong) NSString* author;
@property(nonatomic, strong) UIImage* authorImage;

@property(nonatomic, strong) NSString* contentString;
@property(nonatomic, strong) NSString* content;
@property(nonatomic, strong) UIImage* contentImage;
@property(nonatomic, strong) NSURL* contentURL;

@property(nonatomic, strong) NSDate* date;

@end
