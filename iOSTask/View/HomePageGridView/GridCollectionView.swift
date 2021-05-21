//
//  GridCollectionView.swift
//  iOSTask
//
//  Created by Fuad Hasan on 21/5/21.
//

import UIKit

class GridCollectionView:UICollectionView {
    
    private let cellId = "GridCell"
    
    let interItemSpacing:CGFloat = 20.0
    let leadingSpacing:CGFloat = 20.0
    let trailingSpacing:CGFloat = 20.0
    let topSpacing:CGFloat = 20.0
    let bottomSpacing:CGFloat = 20.0
    let lineSpacing:CGFloat = 20.0
    
    var didselectClosure:((User)->())?
    
    var users:[User] = [] {
        didSet {
            self.reloadData()
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource  = self
        self.register(GridCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        self.contentInset = .init(top: topSpacing, left: leadingSpacing, bottom: bottomSpacing, right: trailingSpacing)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    


    
}

extension GridCollectionView:UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GridCollectionViewCell
        cell.user = users[indexPath.item]

        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = users[indexPath.item]
        didselectClosure?(user)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return  .init(top: 0, left: leadingSpacing, bottom: 0, right: trailingSpacing)
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width:CGFloat!
        var height:CGFloat!
        
//        let width = (self.frame.width - ((3 * interItemSpacing) + (leadingSpacing + trailingSpacing ))) / 4     // Get 4 Columns for Each Row
//
//        let height = (self.frame.height - ((4 * lineSpacing) + (topSpacing + bottomSpacing))) / 5
        
        
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            width = (self.frame.width - ((1 * interItemSpacing) + (leadingSpacing + trailingSpacing ))) / 2
            
            height = (self.frame.height - ((2 * lineSpacing) + (topSpacing + bottomSpacing))) / 3
        }
        else if  UIDevice.current.userInterfaceIdiom == .pad {
            width = (self.frame.width - ((3 * interItemSpacing) + (leadingSpacing + trailingSpacing ))) / 4
             
            height = (self.frame.height - ((4 * lineSpacing) + (topSpacing + bottomSpacing))) / 5
        }
        
        
        return .init(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return interItemSpacing
      }

}
