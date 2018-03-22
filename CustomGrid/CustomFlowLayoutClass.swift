//
//  CustomFlowLayoutClass.swift
//  CustomGrid
//
//  Created by Appinventiv on 07/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation
import UIKit

protocol CustomFlowLayoutDelegate{
    func collectionView(collectionView:UICollectionView, heightForItemAtIndexPath indexPath:NSIndexPath) -> CGFloat
}
class CustomFlowLayoutClass:UICollectionViewLayout{
    var delegate:CustomFlowLayoutDelegate!
    var numberOfColumns=1
    
    private var cache=[UICollectionViewLayoutAttributes]()
    private var contentHeight:CGFloat=0
    private var width:CGFloat{
        get {
            return (collectionView?.frame.width)!
        }
    }
}
