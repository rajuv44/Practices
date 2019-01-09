//
//  CarsoulFlowLayOutVC.swift
//  Practices
//
//  Created by Prince Raj on 07/12/18.
//  Copyright © 2018 Prince Raj. All rights reserved.
//

import UIKit

class CarsoulFlowLayOutVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionArray = [#imageLiteral(resourceName: "pic2"),#imageLiteral(resourceName: "pic3"),#imageLiteral(resourceName: "pic1"),#imageLiteral(resourceName: "pic5"),#imageLiteral(resourceName: "pic4"),#imageLiteral(resourceName: "pic2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CarsoulFlowCVCell
        cell.imageView.image = collectionArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let gotoDiplayVC = storyboard?.instantiateViewController(withIdentifier: "DisplayCollectionDataVC")as! DisplayCollectionDataVC
        gotoDiplayVC.image = collectionArray[indexPath.row]
        self.navigationController?.pushViewController(gotoDiplayVC, animated: true)
    }
}

extension CarsoulFlowLayOutVC: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let bounds = collectionView.bounds
        return CGSize(width: bounds.width / 2 - 10, height: bounds.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 5
    }
}
