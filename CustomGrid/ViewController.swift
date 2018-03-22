//
//  ViewController.swift
//  CustomGrid
//
//  Created by Appinventiv on 07/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25"]
//    let images = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate=self
        collectionView.dataSource=self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
       let randomIndex = Int(arc4random()) % imageArray.count
        let randomImage=imageArray[randomIndex]
        imageArray.append(randomImage)
        //collectionView.reloadData()
        let insertedIndexPath = IndexPath(item: imageArray.count-1, section: 0)
        collectionView.insertItems(at: [insertedIndexPath])
    }
    
    
    
    
    
    
    
}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let height = view.frame.height
        //return CGSize(width:(width-15)/2, height: (height-160)/6)
        let widthOfZero = 2*(width-15)/3
        let heightOfZero = height/3 - 45
        if indexPath.row == 0{
            return CGSize(width:widthOfZero, height: heightOfZero)
        }
        else if indexPath.row == 1 {
            return CGSize(width:(width-15)/3, height: (heightOfZero-15)/2)
        }
        else
        {
            return CGSize(width:(width-20)/3, height: (height-150)/6)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCellClass
        cell.customImage.image=UIImage(named:imageArray[indexPath.row] + ".jpeg")
        return cell
    }
    
    
    
}

