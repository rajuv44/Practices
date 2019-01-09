//
//  DisplayCollectionDataVC.swift
//  Practices
//
//  Created by Prince Raj on 08/12/18.
//  Copyright © 2018 Prince Raj. All rights reserved.
//

import UIKit

class DisplayCollectionDataVC: UIViewController {
    
    @IBOutlet weak var displayImageView: UIImageView!
    
    
    var image = UIImage()
    var name = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayImageView.image = image 
    }
    

   
}
