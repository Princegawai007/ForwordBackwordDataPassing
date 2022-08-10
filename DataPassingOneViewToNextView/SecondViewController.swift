//
//  SecondViewController.swift
//  DataPassingOneViewToNextView
//
//  Created by Prince's Mac on 28/06/22.
//

import UIKit

//MARK BACK DATA PASSING STEP 1 CREATE A PROTOCOL WITH REQUIRED MANDATORY FUNCTION TO PASS THE DATA
  
protocol BackDataPassingProtocol {
func passData(textToPass : String?)
}
class SecondViewController: UIViewController {

    @IBOutlet weak var textFieldOnSecondVC: UITextField!
 //BACK DATA PASSING STEP 2 Link this protocol to second view controller via delegate property
//    (This property must be weak)

    var delegateSVC : BackDataPassingProtocol?
    
    @IBOutlet weak var dataLabel: UILabel!
   
    
    // FRONT DATA PASSING STEP 1
     var dataFromFirstVC : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//FRONT DATA PASSING STEP 4
        self.dataLabel.text = dataFromFirstVC
        
        navigationItem.title = "Second VC"
        navigationItem.hidesBackButton = true
    }
    
// BACK DATA PASSING STEP 3  Call the protocol method wherever we want to pass data (before pop)
    @IBAction func btnBack(_ sender: Any) {
       guard let delegate = delegateSVC else{
            print("The Delegate object delegateSVC was not found")
            return
        }
          let textRetrivedFromTextField = self.textFieldOnSecondVC.text
                delegate.passData(textToPass: textRetrivedFromTextField)
                
        self.navigationController?.popViewController(animated: true)
    }
    
}
