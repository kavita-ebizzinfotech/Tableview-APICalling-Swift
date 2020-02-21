//
//  ExtraFunction.swift
//  JourneyPlan
//
//  Created by EbitNHP-i1 on 18/08/18.
//  Copyright © 2018 EbitNHP-i1. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD
import Reachability


func connected() -> Bool {
    let reachability = Reachability.forInternetConnection()
    let status : NetworkStatus = reachability!.currentReachabilityStatus()
    if status == .NotReachable{
        return false
    }else{
        return true
    }
}

//to make the circular
func makeCircular(view : UIView, cornerRadius : Float) {
    view.layer.cornerRadius = CGFloat(cornerRadius)
    view.layer.masksToBounds = true
    view.clipsToBounds = true
}

//to draw a border and apply the corner radius
func drawBorder(view: UIView?, color borderColor: UIColor?, width: Float, radius: Float) {
    view?.layer.borderColor = borderColor?.cgColor
    view?.layer.borderWidth = CGFloat(width)
    view?.layer.cornerRadius = CGFloat(radius)
    view?.layer.masksToBounds = true
}

//MARK:- Number of line in a label
func lines(label: UILabel) -> Int {
    let textSize = CGSize(width: label.frame.size.width, height: CGFloat(Float.infinity))
    let rHeight = lroundf(Float(label.sizeThatFits(textSize).height))
    let charSize = lroundf(Float(label.font.lineHeight))
    let lineCount = rHeight/charSize
    return lineCount
}

//MARK:- to get image aspect ratio
func getAspectRatioAccordingToiPhones(cellImageFrame:CGSize,downloadedImage: UIImage)->CGFloat {
    let widthOffset = downloadedImage.size.width - cellImageFrame.width
    let widthOffsetPercentage = (widthOffset*100)/downloadedImage.size.width
    let heightOffset = (widthOffsetPercentage * downloadedImage.size.height)/100
    let effectiveHeight = downloadedImage.size.height - heightOffset
    return(effectiveHeight)
}

//MARK:- for mail validation
func isValidEmail(testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

//MARK:- Username  validation
func isValidUsername(testStr:String) -> Bool {
    let emailRegEx = "[a-z0-9_.]{3,20}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}
