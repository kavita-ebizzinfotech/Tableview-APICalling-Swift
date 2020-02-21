//
//  HomeScreenVC.swift
//  Code Structure
//
//  Created by EbitNHP-i1 on 20/02/20.
//  Copyright © 2020 EbitNHP-i1. All rights reserved.
//

import UIKit

class HomeScreenVC: UIViewController {

    @IBOutlet weak var tblViewList: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var viewHeader: UIView!
    
    let serviceMgr = ServiceManager()
    let utils = Utils()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setUpLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getHomeScreenData()
    }
    
    
    //MARK:- 
    //MARK:- Initialization and Setup layout
    func initialize(){
        
        serviceMgr.delegate = self
        
        tblViewList.delegate = self
        tblViewList.dataSource = self
    }
    
    func setUpLayout(){
        
        let nib = UINib(nibName: "CellTVC", bundle: nil)
        tblViewList.register(nib, forCellReuseIdentifier: "CellTVC")
        
        drawBorder(view: tblViewList, color: UIColor.white, width: 2.0, radius: 5.0)
    }
    
    //MARK:-
    //MARK:- Buttons
    
    @IBAction func btnAdd(_ sender: Any) {
        
    }
}

//MARK:-
//MARK:- Tablview delegate's methods

extension HomeScreenVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewList.dequeueReusableCell(withIdentifier: "CellTVC") as! CellTVC
        cell.lblCounter.text! = "\(indexPath.row + 1). Blah blah blah"
        return cell
    }
}

//MARK:-
//MARK:- API Calling

extension HomeScreenVC {
    
    func getHomeScreenData(){
        
        if(connected()){
            
            utils.ShowHUD(inView: self.view)
            
            let param = [
                "email" : "",
                "password" : "",
            ]
            
            let webPath = "\(cWEBHOST)" + "\(cLOGIN)"
            serviceMgr.callWebServiceWithPOST(webpath: webPath, withTag: tagLOGIN, params: param)
        }
        else{
            //show alert for no internet connections
        }
    }
}

//MARK:-
//MARK:- Handle API Response

extension HomeScreenVC: ServiceManagerDelegate {
    
    //SERVICE MANAGER METHODS
    func webServiceCallSuccess(_ response: Any?, forTag tagname: String?) {
        if(tagname == tagLOGIN){
            parseLoginData(response: response, tagname: tagLOGIN)
        }
    }
    func webServiceCallFailure(_ error: Error?, forTag tagname: String?) {
        utils.dismissHUD(fromView: self.view)
        print(kPROBLEM_FROM_SERVER)
    }
    
    //Parse Data
    func parseLoginData(response : Any?, tagname: String)  {
        
        if(response != nil){
            let dicResponse = response as! NSDictionary
            let statusRes = dicResponse.value(forKey: "status") as! Int
            
            if(statusRes == 0){
                if(tagname == tagLOGIN){
                    let msg = dicResponse.value(forKey: "message") as! String
                    print(msg)
                    
                }
                else{
                    //Handle the response
                }
            }
        }
    }
}
