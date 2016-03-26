//
//  DataBaseManager.h
//  WotStat
//
//  Created by Alexey Golovenkov on 13.04.14.
//  Copyright (c) 2014 1.5 Diggers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "UserInfoManager.h"

typedef void(^SaveDataCompetionBlock)(NSError* error);
NSString* const kDataBaseDidConnectNotification;


@interface DataBaseManager : NSObject

@property (nonatomic, strong, readonly) User* user;

/**
 *  Returns a singlton instance of DataBaseManager class. Does not create it. Use connectWithUser: method to create a new DataBaseManager object
 *
 *  @return DataBaseManager object or nil
 */
+ (instancetype)sharedManager;

/**
 *  Creates a new connection to data base if needed. Returns an old manager if it was created for the same user
 *
 *  @param user User that owns the database to connect to
 *
 *  @return DataBaseManager instance or nil if connection is impossible
 */
+ (instancetype)connectWithUser:(User*)user;

/**
 *  Context for UI
 *
 *  @return Managed object context for UI manipulating
 */
- (NSManagedObjectContext*)mainContext;

/**
 *  Background context
 *
 *  @return Managed object context for background tasks
 */
- (NSManagedObjectContext*)backgroundContext;

/**
 *  Saves changes of main context
 */
- (void)saveMainContext;

/**
 *  Saves changes of background context
 */
- (void)saveBackgroundContext;

/**
 *  Loads a part of statistics data
 *
 *  @param array           Statistics data from WoT server
 *  @param entityName      Name of local Data Base entity
 *  @param completionBlock Calls on the main thread when loading is completed
 */
- (void)loadStatistics:(NSArray*)array withEntityName:(NSString*)entityName completionBlock:(SaveDataCompetionBlock)completionBlock;

/**
 *  Loads a part of reference data (tankopedia, achievements etc.)
 *
 *  @param array           Reference from WoT server
 *  @param entityName      Name of local Data Base entity
 *  @param completionBlock Calls on the main thread when loading is completed
 */
- (void)loadReferenceData:(NSArray*)array withEntityName:(NSString*)entityName completionBlock:(SaveDataCompetionBlock)completionBlock;

- (UserInfoManager*)userInfoManager;

@end
