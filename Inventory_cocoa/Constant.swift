//
//  Constant.swift
//  InventorySwift
//
//  Created by Vikram on 10/08/24.
//


import Foundation
import UIKit
struct Constant {
    
    // appdelegate
   // static let myappdelegate = UIApplication.shared.delegate as! AppDelegate
    
    // window screen size
    static  var screensize = UIScreen.main.bounds
    //without navigaiton height
    static var screenViewFrame = CGRect(x: 0, y: 0, width: screensize.size.width, height:screensize.size.height-66)
   
    static var screenViewFrameIphoneXAndMore = CGRect(x: 0, y: 0, width: screensize.size.width, height:screensize.size.height-113)
    

    //test adroit 3
    static let mainUrl = "https://uat8.cartradeexchange.com/mobile_api_json/"



    static let appId = "cteios2020v3.0"
    static let deviceId = "34543KLLKKKL345LK34J534KL"
    func STR_OR_NIL(x: Any?) -> Any {
        return x != nil ? x ?? "" : ""
    }
    
    // SYNC process API's
    
    static let camera="camera"
    static let gallery="gallery"
    
    
    
    // Validation chars
    static let password_ONLY = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 .@;',#-/$()&!%?!:\"%+_=*[]^~"
    static let NAMEChars_ONLY = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ."
    static let EmailChars_ONLY = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 .@!#$%&'*+-/=?^_`{|}~\"\""
    static let Numberonly = "0123456789"
    static let NameNumbers_ONLY = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    
    static let NAME_Chars_special_ONLY = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz/. "

    
   static let mainStoryBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)


    
    
    //
    static let  landScapeImageWidth:Float = 1600//1920 //1280.0//1024.0 //1920x1080
    static let  landScapeImageHeight:Float =  1200//1080 //720.0//768.0
    
    static let  portraitImageWidth:Float = 1200//1080 //720.0//768.0
    static let  portraitImageHeight:Float = 1600//1920 //1280.0//1024.0


    
}

