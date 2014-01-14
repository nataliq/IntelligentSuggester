//
//  ISAppDelegate.h
//  IntelligentSuggester
//
//  Created by Siyana Slavova on 1/14/14.
//  Copyright (c) 2014 Siyana Slavova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
