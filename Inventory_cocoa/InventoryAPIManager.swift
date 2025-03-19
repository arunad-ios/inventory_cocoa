//
//  InventoryAPIManager.swift
//  InventorySwift
//
//  Created by Vikram on 10/08/24.
//

import UIKit
import CoreData

public class InventoryAPIManager: NSObject {
    

        var m_ModelManager: InventoryModelManager = InventoryModelManager()


    var deleteObjectIndex: Int = 0
    var m_Makes = [AnyHashable: Any]()
    var m_Models = [AnyHashable: Any]()
    var m_Variants = [AnyHashable: Any]()

    // MARK: - Singleton
    static let sharedInstance: InventoryAPIManager = {
        let instance = InventoryAPIManager()
        return instance
    }()
    
    override init() {
        super.init()
    //    if self != nil {
            self.loadData()
     //   }
    }

    
    func loadData() {
        m_ModelManager = InventoryModelManager.sharedInstance
        m_ModelManager.loadFromDB()
        
        self.loadMakes()
        self.loadModels()
        self.loadVariants()
    }
    
    
    
    
    //MARK: - AAMakes

    func loadMakes(){
        m_Makes =  [AnyHashable:Any](minimumCapacity:(m_ModelManager.makes.count))
        for obj:Makes in m_ModelManager.makes {
            m_Makes[obj.makeId] = obj
        }
    }
    
    func addMakes(makes:Makes?){
        if makes != nil {
            m_Makes[(makes?.makeId)!] = makes
            InventoryModelManager.sharedInstance.saveContext()
        }else {
            InventoryModelManager.sharedInstance.saveContext()
        }
    }
    
    func  getMakes()-> AnyObject{
        
        var returnArray:[Makes] = [Makes]()
        let makesArray:[Makes] = (m_Makes as NSDictionary).allValues as! [Makes]
        var returnMakesArry:[String] = [String]()
        for obj:Makes in makesArray {
            if obj.gf == "y" {
                returnArray.append(obj)
                returnMakesArry.append(obj.name ?? "")
            }
        }
        let orderedSet = NSOrderedSet(array: returnMakesArry)
        let arrayWithoutDuplicates: [Any] = orderedSet.array
        let sortedArray = arrayWithoutDuplicates.sorted { ($0 as AnyObject).localizedCaseInsensitiveCompare($1 as! String) == ComparisonResult.orderedAscending }
        return sortedArray as AnyObject
    }
    
    //MARK:- AAModels

    func loadModels(){
        m_Models =  [AnyHashable:Any](minimumCapacity:(m_ModelManager.models.count))
        for obj:Models in m_ModelManager.models {
                m_Models[obj.modelId] = obj
        }
    }
    
    func addModels(models:Models?){
        if models != nil {
            m_Models[(models?.modelId)!] = models
            InventoryModelManager.sharedInstance.saveContext()
        }else {
            InventoryModelManager.sharedInstance.saveContext()
        }
    }
    func  getModels()-> AnyObject{
        
        var returnArray:[Models] = [Models]()
        let modelsArray:[Models] = (m_Models as NSDictionary).allValues as! [Models]
        var returnModelsArry:[String] = [String]()
        for obj:Models in modelsArray {
            if obj.gf == "y" {
                returnArray.append(obj)
                returnModelsArry.append(obj.name ?? "")
            }
        }
        let orderedSet = NSOrderedSet(array: returnModelsArry)
        let arrayWithoutDuplicates: [Any] = orderedSet.array
        let sortedArray = arrayWithoutDuplicates.sorted { ($0 as AnyObject).localizedCaseInsensitiveCompare($1 as! String) == ComparisonResult.orderedAscending }
        return sortedArray as AnyObject
    }

    //MARK: - AAVariants
    
    func loadVariants(){
        m_Variants =  [AnyHashable:Any](minimumCapacity:(m_ModelManager.variants.count))
        for obj:Variants in m_ModelManager.variants {
                m_Variants[obj.variantId] = obj
        }
    }
    
    func addVariants(variants:Variants?){
        if variants != nil {
            m_Variants[(variants?.variantId)!] = variants
            InventoryModelManager.sharedInstance.saveContext()
        }else {
            InventoryModelManager.sharedInstance.saveContext()
        }
    }
    func  getVariants()-> AnyObject{
        
        var returnArray:[Variants] = [Variants]()
        let modelsArray:[Variants] = (m_Variants as NSDictionary).allValues as! [Variants]
        var returnModelsArry:[String] = [String]()
        for obj:Variants in modelsArray {
            if obj.gf == "y" {
                returnArray.append(obj)
                returnModelsArry.append(obj.name ?? "")
            }
        }
        let orderedSet = NSOrderedSet(array: returnModelsArry)
        let arrayWithoutDuplicates: [Any] = orderedSet.array
        let sortedArray = arrayWithoutDuplicates.sorted { ($0 as AnyObject).localizedCaseInsensitiveCompare($1 as! String) == ComparisonResult.orderedAscending }
        return sortedArray as AnyObject
    }

    
    
    //MARK: - Remove Sync Data From DB
      
         
      
      func removeDataFromDBAtIndex(index:Int){
      
      deleteObjectIndex = index
          
          let entitiesArray: [Any] = ["Makes","Models","Variants"]

          if deleteObjectIndex < entitiesArray.count {
          
            if entitiesArray[deleteObjectIndex] as! String == "Makes" {
              InventoryModelManager.sharedInstance.makes.removeAll()
              m_Makes.removeAll()
          }
          else if entitiesArray[deleteObjectIndex] as! String == "Models" {
              InventoryModelManager.sharedInstance.models.removeAll()
              m_Models.removeAll()
          }
          else if entitiesArray[deleteObjectIndex] as! String == "Variants" {
              InventoryModelManager.sharedInstance.variants.removeAll()
              m_Variants.removeAll()
          }
              
              let success:Bool = InventoryModelManager.sharedInstance.clearEntity(entity: entitiesArray[deleteObjectIndex]  as! String)
              if success {
                  deleteObjectIndex += 1
                  self.removeDataFromDBAtIndex(index: deleteObjectIndex)
              }
          }
          
      }
    
}
