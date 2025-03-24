//
//  Hello.swift
//  InventorySwift
//
//  Created by Vikram on 26/04/24.
//

import Foundation
import CoreData

@objc public protocol HostAppToPodDelegate {
    func sendDataToPod(data: String)
}

public class MyPodManager {
    public static var makes = [String]()
    public static var delegate: HostAppToPodDelegate?

    public static func requestDataFromHost(makes : [String]) {
        print("Pod: Requesting data from Host App...")
        print(makes)
        self.makes = makes
        delegate?.sendDataToPod(data: "Pod needs user info")
    }
}


public  class Inventory{
    
    public var user_id = ""
    public init(){}
    public func printMessage(messageString:String){
        print(messageString + "from Framework vikram")
    }
    
    
    public func setupInventoryFramework(){
        
        InventoryAPIManager.sharedInstance.loadData()
        if InventoryUserDefaults.sharedInstance.getSyncStatus(){
            
        }else {
            callMakeModelAPIs()
        }
    }
    
    
    public func getSyncStatus()->Bool{
        NotificationCenter.default.addObserver(self, selector: #selector(receiveData(_:)), name: NSNotification.Name("MyPodEvent"), object: nil)

        return InventoryUserDefaults.sharedInstance.getSyncStatus()
    }
    @objc func receiveData(_ notification: Notification) {
           if let data = notification.userInfo?["data"] as? String {
               print("Pod received data from Host App: \(data)")
           }
       }
   
    public func getMakeList()->[String]{
        return InventoryAPIManager.sharedInstance.getMakes() as! [String]
    }
    public func getModelList()->[String]{
        return InventoryAPIManager.sharedInstance.getModels() as! [String]
    }
    public func getVarianList()->[String]{
        return InventoryAPIManager.sharedInstance.getVariants() as! [String]
    }

    // MARK: - API Calling
    
func callMakeModelAPIs(){
        
        let paramsDic = ["action":"loadmodels3_ios",
                         "api_id":"cteios2020v3.0",
                         "app_code":"ABD4CEE8-C8FA-48AA-8806-BC4FBD81E4BC",
                         "dealer_id":user_id,
                         "device_id":"ABD4CEE8-C8FA-48AA-8806-BC4FBD81E4BC",
                         "ios_version_code":"12.2",
                         "iosversion":"2",
                         "encrypted":"no",
                         "env_sec":"1",

        ]
    
        // Convert the parameters to JSON data
        guard let httpBody = try? JSONSerialization.data(withJSONObject: paramsDic, options: []) else {
            print("Failed to serialize JSON")
            return
        }

        // Create a URL request and configure it
        var request = URLRequest(url: URL(string: "\(Constant.mainUrl)")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody

        // Create a URLSession data task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle the response
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Try to parse the JSON response
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print("Response JSON: \(jsonResponse)")
                    InventorySaveDataIntoDB.sharedInstance.saveMakesModelsAndVariantsIntoDB(response: jsonResponse)
                    InventoryUserDefaults.sharedInstance.saveSyncStatus(status: true)
                } else {
                    print("Failed to parse JSON")
                }
            } catch let error {
                print("JSON Parsing Error: \(error.localizedDescription)")
            }
        }

        // Start the task
        task.resume()

    }
    
    // MARK: - Core Data stack
/*
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Inventory")
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

    lazy var viewContext: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()

    lazy var cacheContext: NSManagedObjectContext = {
        return self.persistentContainer.newBackgroundContext()
    }()

    lazy var updateContext: NSManagedObjectContext = {
        let _updateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        _updateContext.parent = self.viewContext
        return _updateContext
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
*/
}


