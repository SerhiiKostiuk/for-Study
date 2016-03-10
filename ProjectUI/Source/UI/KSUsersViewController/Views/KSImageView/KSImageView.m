//
//  KSImageView.m
//  KSProjectUI
//
//  Created by Serg Bla on 04.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSImageView.h"

#import "KSImageModel.h"

#import "KSDispatch.h"

@interface KSImageView ()
@property (nonatomic, strong) UIImageView *contentImageView;

@end

@implementation KSImageView

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(KSImageModel *)imageModel {
    if (_imageModel != imageModel) {
        [_imageModel removeObserver:self];
        _imageModel = imageModel;
        [_imageModel addObserver:self];
        
        [self fillWithModel:imageModel];
        [_imageModel load];
    }
}

#pragma mark -
#pragma mark Private

- (void)fillWithModel:(KSImageModel *)imageModel {
    self.contentImageView.image = imageModel.image;
}

#pragma mark -
#pragma mark KSModelObserver

- (void)modelWillLoad:(id)model {
    KSDispatchAsyncOnMainQueue(^{
        self.loadingViewVisible = YES;
    });
}

- (void)modelDidFinishLoading:(id)model {
    KSDispatchAsyncOnMainQueue(^{
        [self fillWithModel:model];
        self.loadingViewVisible = NO;
    });
}

- (void)modelDidFailLoading:(id)model {
    KSDispatchAsyncOnMainQueue(^{
        self.loadingViewVisible = NO;
    });
}

@end
