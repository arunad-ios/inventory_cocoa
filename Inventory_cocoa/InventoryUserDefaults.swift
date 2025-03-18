//
//  InventoryUserDefaults.swift
//  InventorySwift
//
//  Created by Vikram on 10/08/24.
//


import UIKit
class InventoryUserDefaults: NSObject {
    
    static let sharedInstance: InventoryUserDefaults = {
        let instance = InventoryUserDefaults()
        return instance
    }()
    
    //Save And Get Local LeadId
    func saveInitialYear(year: String){
        let userDefaults: UserDefaults = UserDefaults.standard
        userDefaults.set(year, forKey: "initialYear")
        userDefaults.synchronize()
    }
    func getInitialYear() -> String {
        let userDefaults: UserDefaults = UserDefaults.standard
        var year: String? = userDefaults.object(forKey: "initialYear") as? String
        if year == nil {
            year = ""
        }
        return year!
    }
    
    
    // save sync status
    func saveSyncStatus(status: Bool){
        let userDefaults = UserDefaults.standard
        userDefaults.set(status, forKey: "syncStatus")
        userDefaults.synchronize()
    }
    func getSyncStatus() -> Bool {
        let userDefaults = UserDefaults.standard
        var returnValue = userDefaults.object(forKey: "syncStatus")
        if returnValue == nil {
            returnValue = false
        }
        return returnValue! as! Bool
    }

}
