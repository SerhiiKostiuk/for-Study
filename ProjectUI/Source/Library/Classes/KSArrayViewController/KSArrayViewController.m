//
//  KSArrayViewController.m
//  KSProjectUI
//
//  Created by Serg Bla on 20.03.16.
//  Copyright © 2016 Serg Kostiuk. All rights reserved.
//

#import "KSArrayViewController.h"

#import "KSArrayModel.h"
#import "KSUserCell.h"
#import "KSView.h"
#import "KSDispatch.h"
#import "KSCollectionObserver.h"

#import "UITableView+KSExtensions.h"
#import "UITableView+KSCollectionChangeModel.h"
#import "UIViewController+KSExtensions.h"

KSViewControllerForViewPropertySyntesize(KSArrayViewController, KSView, mainView);

@interface KSArrayViewController () <UITableViewDelegate, UITableViewDataSource, KSCollectionObserver>

- (id)cellClass;

@end

@implementation KSArrayViewController

#pragma mark -
#pragma mark Class Methods

+ (Class)cellClass {
    return nil;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.items = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setItems:(KSArrayModel *)items {
    if (_items != items) {
        [_items removeObserver:self];
        _items = items;
        [_items addObserver:self];
        
        [_items load];
        
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [self.items load];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Private

- (id)cellClass {
    return [[self class] cellClass];
}

- (UITableView *)tableView {
    return nil;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KSUserCell *cell = [tableView cellWithClass:[self cellClass]];
    cell.user = self.items[indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark KSCollectionObserver

- (void)collection:(id)collection didChangeWithModel:(id)changeModel {
    UITableView *tableView = self.tableView;
    [tableView updateWithCollectionChangeModel:changeModel];
}

#pragma mark -
#pragma mark KSModelObserver

- (void)modelWillLoad:(id)model {
    KSDispatchAsyncOnMainQueue(^{
        self.mainView.loadingViewVisible = YES;
    });
}

- (void)modelDidFinishLoading:(id)model {
    KSDispatchAsyncOnMainQueue(^{
        [self.tableView reloadData];
        self.mainView.loadingViewVisible = NO;
    });
}

- (void)modelDidFailLoading:(id)model {
    KSDispatchAsyncOnMainQueue(^{
        self.mainView.loadingViewVisible = NO;
    });
}

@end
