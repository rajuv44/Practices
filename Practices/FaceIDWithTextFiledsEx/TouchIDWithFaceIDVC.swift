//
//  TouchIDWithFaceIDVC.swift
//  Practices
//
//  Created by Prince Raj on 06/12/18.
//  Copyright © 2018 Prince Raj. All rights reserved.
//

import UIKit
import LocalAuthentication

class TouchIDWithFaceIDVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onClickTouchID(_ sender: UIButton)
    {
        let contex:LAContext = LAContext()
        
        if contex.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        {
            contex.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We want to Login with your finger print", reply: {(wasCorrect, error) in
                
                if wasCorrect
                {
                    print("Finger ID Accessed")
                }
                else
                {
                   print("Finger ID Not - Accessed")
                }
            })
        }
        else
        {
           /// pending alert work
            
            let alert = UIAlertController(title: "Alert", message: "We want to Login with your finger print", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
