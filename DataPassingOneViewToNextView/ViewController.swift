//
//  ViewController.swift
//  DataPassingOneViewToNextView
//
//  Created by Prince's Mac on 28/06/22.
//

import UIKit

class ViewController: UIViewController ,BackDataPassingProtocol{

    @IBOutlet weak var dataLabelOnFirstVC: UILabel!
    @IBOutlet weak var dataTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
// BACK DATA PASSING STEP 5 Implement the required method in first view controller
       dataTextField.text = ""
       navigationItem.title = "First VC"
    }

    @IBAction func btnSendData(_ sender: Any) {
      
// FRONT DATA PASSING STEP 2
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        let dataToPass = self.dataTextField.text
    
// FRONT DATA PASSING STEP 3
        
        secondVC.dataFromFirstVC = dataToPass
// BACK DATA PASSING STEP 6 Assign the value to the delegate property of second view controller to self
        secondVC.delegateSVC = self
        
// FRONT DATA PASSING STEP NAVIGATE TO SVC
        
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
 // BACK DATA PASSING STEP 4 Take help of protocol (Confirm Protocol)
    func passData(textToPass: String?) {
        self.dataLabelOnFirstVC.text = textToPass
    }
    
}

