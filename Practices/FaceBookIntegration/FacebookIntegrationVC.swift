//
//  FacebookIntegrationVC.swift
//  Practices
//
//  Created by Prince Raj on 05/12/18.
//  Copyright © 2018 Prince Raj. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FacebookIntegrationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onClickFBLoginButton(_ sender: UIButton)
    {
        let fbLoginManager:FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self){(result,Error) in
            
            if Error == nil
            {
                let fbLoginResult: FBSDKLoginManagerLoginResult = result!
                if fbLoginResult.grantedPermissions != nil
                {
                   if fbLoginResult.grantedPermissions.contains("email")
                   {
                     self.GetFBUserData()
                  //  fbLoginManager.logOut()
                    }
                }
            }
        }
    }
    
    ////// *** Mark:- Facebook Delegate
    
    func loginButtonDidLogout(_loginButton: FBSDKLoginButton!)
    {
        print("User Logout")
    }
    
    func GetFBUserData()
    {
       if FBSDKAccessToken.current() != nil
       {
        FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, name, first_name, last_name,picture.type(large),email"])?.start(completionHandler: { (connection, result, error)  -> Void in
            if error == nil
            {
                let faceDic = result as! [String:AnyObject]
                print(faceDic)
                print(result!)
                
                let email = faceDic["email"] as! String
                print(email)
                
                let id = faceDic["id"] as! String
                print(id)
                
            }
        })
        }
    }
}
