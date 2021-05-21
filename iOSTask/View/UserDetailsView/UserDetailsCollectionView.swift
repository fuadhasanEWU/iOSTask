//
//  UserDetailsCollectionView.swift
//  iOSTask
//
//  Created by Fuad Hasan on 21/5/21.
//

import UIKit

class UserDetailsCollectionView: UICollectionView {
    
    private let cellId = "UserDetailsCell"
    

    let topSpacing:CGFloat = 20.0
    let bottomSpacing:CGFloat = 20.0
    let lineSpacing:CGFloat = 0
    let trailingSpacing:CGFloat = 20.0
    let leadingSpacing:CGFloat = 20.0
    
    var didselectClosure:((UserDetails)->())?
    
    var userDetails:[UserDetails] = [] {
        didSet {
            self.reloadData()
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource  = self
        self.register(UserDetailsCollectionCell.self, forCellWithReuseIdentifier: cellId)
        
        self.contentInset = .init(top: topSpacing, left: leadingSpacing, bottom: bottomSpacing, right: trailingSpacing)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UserDetailsCollectionView:UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! UserDetailsCollectionCell
        cell.user = userDetails[indexPath.item]
        

        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userDetails = userDetails[indexPath.item]
        didselectClosure?(userDetails)
       // didselectClosure?(user)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return  .init(top: 0, left: leadingSpacing, bottom: 0, right: trailingSpacing)
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.frame.width
        var height:CGFloat!
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            height = 60
        }
        else if  UIDevice.current.userInterfaceIdiom == .pad {
            height = 85
        }
        return .init(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
      }

}



