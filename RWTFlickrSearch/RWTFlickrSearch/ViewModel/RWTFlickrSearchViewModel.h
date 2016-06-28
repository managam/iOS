//
//  RWTFlickrSearchViewModel.h
//  RWTFlickrSearch
//
//  Created by Colin Eberhardt on 20/05/2014.
//  Copyright (c) 2016 Colin Eberhardt. All rights reserved.
//

#import "ReactiveCocoa/ReactiveCocoa.h"

@interface RWTFlickrSearchViewModel : NSObject

@property (strong, nonatomic) NSString *searchText;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) RACCommand *executeSearch;

@end