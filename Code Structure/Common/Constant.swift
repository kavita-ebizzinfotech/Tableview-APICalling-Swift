//
//  Constant.swift
//  JourneyPlan
//
//  Created by EbitNHP-i1 on 18/08/18.
//  Copyright © 2018 EbitNHP-i1. All rights reserved.AIzaSyD1iZzMliflN808RM0DZp2UT1G-XqB91YU
//

import Foundation
import UIKit
import AVFoundation

//MARK: - API HOST URL
let cWEBHOST = "http://"


//MARK: - USERDEFAULT RELATED
let sIS_USER_LOGGEDIN   = "IsUserLoggedIn"
let sFCM_TOKEN          = "FCM_TOKEN"
let sCURRENT_LAT          = "CURRENT_LAT"
let sCURRENT_LONG          = "CURRENT_LONG"
let sASSET_LAT             = "ASSET_LAT"
let sASSET_LONG            = "ASSET_LONG"

//MARK: - SCREEN BOUNDS
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

//MARK: - GET APPDELEGATE
@available(iOS 10.0, *)
let APPDELEGATE = UIApplication.shared.delegate as? AppDelegate

//MARK: - SOME COMMON THINGS
let kCHECK_INTERNET_CONNECTION   =  "No internet connection"
let kPROBLEM_FROM_SERVER         =  "Problem Receiving Data From Server"

//MARK: - API NAMES
let cLOGIN  = "login.php"
let cSIGNUP = "register.php"
let cSOCIALLOGIN = "social_login.php"
let cEDITPROFILE = "edit_profile.php"
let cFORGOTPASSWORD = "forgot_password.php"
let cRESETPASSWORD = "reset_password.php"
let cDELETEACCOUNT = "delete_user.php"


//MARK:- Color variable
let lightGray = UIColor(red: 208.0/225.0, green: 208.0/225.0, blue: 208.0/225.0, alpha: 1.0)
let btnDefaultColor = UIColor(red: 13.0/225.0, green: 95.0/225.0, blue: 95.0/225.0, alpha: 1.0)
let darkGray = UIColor.darkGray
let redThemeColor = UIColor(red: 251.0/225.0, green: 86.0/225.0, blue: 93.0/225.0, alpha: 1.0)

//MARK:- Tag declaration
let tagLOGIN = "tag_login"
let tagSIGNUP = "tag_signup"
