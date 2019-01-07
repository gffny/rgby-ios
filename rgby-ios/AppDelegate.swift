//
//  AppDelegate.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/9/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var RGBY_IOS_PERSISTENT_CONTAINER_NAME = "rgby_ios"

    // FIXME change this to be a user when handling logins
    static var COACH_ID = "12345"
    static var TEAM_ID = "team-1"

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // FIXME no need to use a specific Realm configuration just yet

        let realm = try! Realm()
        if realm.objects(RGBYCoach.self).count == 0 {
            // check if we want to load demo data
            RGBYDemoData.loadDemoData(in: realm)
        }
        // check if there have been any updates to the data in the API
        RGBYDataAPI.getCoach(id: AppDelegate.COACH_ID, onSuccess: { (result) -> Void in
            print("retrieved coach data for coach with id: \(result.id)")
            // get the logged in coaches detail
            var coach = RGBYCoach.get(id: result.id, in: try! Realm())
            if coach == nil {
                coach = RGBYCoach.create(coach: result, in: try! Realm())
            }
            // check if the api data last update is newer than the stored last update
            else if result.lastUpdate > coach!.lastUpdate {
                print("current coach data is behind api data; requesting data update")
                // request update of core data
                //FIXME Match List
                RGBYDataAPI.getMatchList(teamId: AppDelegate.TEAM_ID, onSuccess: { (result) -> Void in
                    // TODO store updated data in local repo
                    print(result.count)
                }, onFailure: {_ in
                    print("error")
                })
                // TODO Squad List
                RGBYDataAPI.getSquadList(onSuccess: { (result) in
                    // TODO store updated player data in local repo
                    print(result.count)
                }, onFailure: {_ in
                    print("error")
                })
            }
            coach = RGBYCoach.updateLastLogin(coach: coach!, in: try! Realm())
            print("updated coach last login to "+RGBYUtils.mmddyyyhhmm().string(from: (coach?.lastLogin)!))
        }, onFailure: {_ in
            print("error")
        }, onOffline: {
            print("iPad is offline")
        })
        
        if let matchDetailDO = RGBYMatchDetailDO.getActiveDetail() {
            print("there's an active detail")
            // TODO need to figure out how we make the correct view open up?
            // Do we prompt the user to go to the active match screen?
            // Do we jump directly to the active match screen?
            let matchDetail = RGBYMatchDetail(mddo: matchDetailDO)
            
        }
        self.configureStyle()
        return true
    }

    func configureStyle() {
        UINavigationBar.appearance().barTintColor = UIColor.darkGray
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 16.0)!]
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        return false
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: AppDelegate.RGBY_IOS_PERSISTENT_CONTAINER_NAME)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

