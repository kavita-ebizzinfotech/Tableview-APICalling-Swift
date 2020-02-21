//
//  SplashVC.swift
//  Code Structure
//
//  Created by EbitNHP-i1 on 20/02/20.
//  Copyright © 2020 EbitNHP-i1. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setUpLayout()
    }
    
    //MARK:-
    //MARK:- Initialization and Setup layout
    func initialize(){
        
    }
    
    func setUpLayout(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let pushController = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenVC") as! HomeScreenVC
            self.navigationController?.pushViewController(pushController, animated: true)
        }
    }
}
