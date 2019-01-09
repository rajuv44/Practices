//
//  ReturnKeyTFVC.swift
//  Practices
//
//  Created by Prince Raj on 06/12/18.
//  Copyright © 2018 Prince Raj. All rights reserved.
//

import UIKit

class ReturnKeyTFVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userTF1: UITextField!
    @IBOutlet weak var userTF2: UITextField!
    @IBOutlet weak var userTF3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userTF1.delegate = self
        userTF2.delegate = self
        userTF3.delegate = self
        
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(Tap)
    }
    
    /// Dismiss Keyboard while tapping any where
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == userTF1
        {
            userTF2.becomeFirstResponder()
        }
        else
        {
            userTF2.resignFirstResponder()
        }
        if textField == userTF2
        {
            userTF3.becomeFirstResponder()
        }
        else
        {
            userTF3.resignFirstResponder()
        }
        return true
    }
   

}
