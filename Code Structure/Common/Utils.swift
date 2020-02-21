//
//  Utils.swift
//  SwiftProjectStructure
//
//  Created by Krishna Patel on 19/06/18.
//  Copyright © 2018 Krishna. All rights reserved.
//

import UIKit
import MBProgressHUD

@available(iOS 10.0, *)
class Utils: NSObject {
    
    //MARK: - UserDefaults related Methods
    func setIsUserLoggegIn(status : Bool)  {
        UserDefaults.standard.set(status, forKey: sIS_USER_LOGGEDIN)
    }
    func getIsUserLoggegIn() -> Bool {
        return UserDefaults.standard.bool(forKey: sIS_USER_LOGGEDIN)
    }
    
    func setFCMTOKEN(fcmToken : String) {
        UserDefaults.standard.set(fcmToken, forKey: sFCM_TOKEN)
    }
    func getFCMTOKEN() -> String {
        return UserDefaults.standard.value(forKey: sFCM_TOKEN) as? String ?? "72.8311"
    }
    
    func setCurrentLat(currentLat : String) {
        UserDefaults.standard.set(currentLat, forKey: sCURRENT_LAT)
    }
    func getCurrentLat() -> String {
        return UserDefaults.standard.value(forKey: sCURRENT_LAT) as? String ?? ""//21.1702
    }

    func setCurrentLong(currentLong : String) {
        UserDefaults.standard.set(currentLong, forKey: sCURRENT_LONG)
    }
    func getCurrentLong() -> String {
        return UserDefaults.standard.value(forKey: sCURRENT_LONG) as? String ?? ""//72.8311
    }
    
    func setAssetLat(currentLat : String) {
        UserDefaults.standard.set(currentLat, forKey: sASSET_LAT)
    }
    func getAssetLat() -> String {
        return UserDefaults.standard.value(forKey: sASSET_LAT) as! String
    }
    
    func setAssetLong(currentLong : String) {
        UserDefaults.standard.set(currentLong, forKey: sASSET_LONG)
    }
    func getAssetLong() -> String {
        return UserDefaults.standard.value(forKey: sASSET_LONG) as! String
    }
    
    //MARK: - SHOW HUD
    func ShowHUD(inView : UIView)  {
        MBProgressHUD.showAdded(to: inView, animated: true)
    }
    
    func dismissHUD(fromView : UIView ) {
        MBProgressHUD.hide(for: fromView, animated: true)
    }
    
}
