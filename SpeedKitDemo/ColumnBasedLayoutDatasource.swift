//
//  ColumnBasedLayoutDatasource.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 21/11/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import UIKit

class ColumnBasedLayoutDatasource :SPListingColumnBasedLayoutDatasource {
    func collectionView(collectionView: UICollectionView?, layout collectionViewLayout: UICollectionViewLayout, numberOfScrollingLinesAtSection section: Int) -> Int{
        switch section{
        case 0:
            return 2
        case 1:
            return 3
        default:
            return 1
        }
    }
    func collectionView(collectionView: UICollectionView?, layout collectionViewLayout: UICollectionViewLayout, numberOfLinesShouldFitInPage section: Int) -> Int{
        switch section{
        case 0:
            return 4
        case 1:
            return 6
        default:
            return 3
        }
    }
    
//    func collectionView(collectionView: UICollectionView?, layout collectionViewLayout: UICollectionViewLayout, lengthOfItemAtIndexPath indexPath: NSIndexPath, forGivenWidthOrHeight itemWidthOrHeight:CGFloat) -> CGFloat{
//        
//        if indexPath.item == 0{
//            return 110
//        }
//        
//        return 50
//    }
    
//    func collectionView(collectionView: UICollectionView?, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
//        switch section{
//        case 0:
//            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        case 1:
//            return UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
//        default:
//            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        }
//    }
    
//    func collectionView(collectionView: UICollectionView?, layout collectionViewLayout: UICollectionViewLayout, lineSpacingForSectionAtIndex section: Int) -> CGFloat{
//        switch section{
//        case 0:
//            
//        case 1:
//            
//        }
//    }
//    func collectionView(collectionView: UICollectionView?, layout collectionViewLayout: UICollectionViewLayout, interitemSpacingForSectionAtIndex section: Int) -> CGFloat{
//        switch section{
//        case 0:
//            
//        case 1:
//            
//        }
//    }

}