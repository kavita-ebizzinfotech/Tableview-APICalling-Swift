//
//  ServiceManager.swift
//  SwiftProjectStructure
//
//  Created by Krishna Patel on 20/06/18.
//  Copyright © 2018 Krishna. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireSwiftyJSON

@objc protocol ServiceManagerDelegate:NSObjectProtocol{
    func webServiceCallSuccess(_ response: Any?, forTag tagname: String?)
    func webServiceCallFailure(_ error: Error?, forTag tagname: String?)
}

class ServiceManager: NSObject {

    var delegate:ServiceManagerDelegate?
    
    //MARK:- GET Service Calling
    func callWebServiceWithGET(webpath: String?, withTag tagname: String?) {
        
        Alamofire.request(webpath!, method: .get, parameters: nil, encoding: URLEncoding.httpBody, headers: nil).authenticate(user: "", password: "").responseSwiftyJSON(completionHandler:{ (response) in
            
            //print(response.request)
           // print(response.result.value)
            
            if let json = response.result.value {
                guard !json["data"].isEmpty else{
                    return
                }
                guard let rawData = try? json.rawData() else {
                    return
                }

                var dicResponse : [String : AnyObject] = [:]
                do {
                    dicResponse =  (try JSONSerialization.jsonObject(with: rawData, options: []) as? [String:AnyObject])!
                    print(dicResponse)
                } catch let error as NSError {
                    print(error)
                 }
             
                if (self.delegate?.responds(to: #selector(self.delegate?.webServiceCallSuccess(_:forTag:))))! {
                    self.delegate?.webServiceCallSuccess(dicResponse, forTag: tagname)
                }
            }
            else{
                if (self.delegate?.responds(to: #selector(self.delegate?.webServiceCallFailure(_:forTag:))))! {
                    self.delegate?.webServiceCallFailure(response.result.error, forTag: tagname)
                }
            }
            
        })
    }
    
    
    //MARK:- POST Service Calling
    func callWebServiceWithPOST(webpath: String?, withTag tagname: String?, params: Parameters) {
        
        Alamofire.request(webpath!, method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: nil).authenticate(user: "", password: "").responseSwiftyJSON(completionHandler:{ (response) in
            
            //print(response.request)
            //print(response.result)
            
            if let json = response.result.value { 
//                guard !json["data"].isEmpty else{
//                    return
//                }
                guard let rawData = try? json.rawData() else {
                    return
                }
                
                var dicResponse : [String : AnyObject] = [:]
                do {
                    dicResponse =  (try JSONSerialization.jsonObject(with: rawData, options: []) as? [String:AnyObject])!
//                    print(dicResponse)
                } catch let error as NSError {
                    print(error)
                }
                
                if (self.delegate?.responds(to: #selector(self.delegate?.webServiceCallSuccess(_:forTag:))))! {
                    self.delegate?.webServiceCallSuccess(dicResponse, forTag: tagname)
                }
                
            }
            else{
                if (self.delegate?.responds(to: #selector(self.delegate?.webServiceCallFailure(_:forTag:))))! {
                    self.delegate?.webServiceCallFailure(response.result.error, forTag: tagname)
                }
            }
            
        })
    }
}


