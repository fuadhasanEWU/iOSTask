//
//  GridCollectionViewCell.swift
//  iOSTask
//
//  Created by Fuad Hasan on 21/5/21.
//

import UIKit


class GridCollectionViewCell:UICollectionViewCell {
    
    let nameLabel = UILabel(text: "Md Fuad Hasan", font: .systemFont(ofSize: 25, weight: .bold), textColor: .label, textAlignment: .center, numberOfLines: 0)
    
    let countryLabel = UILabel(text: "Bangladesh", font: .systemFont(ofSize: 20, weight: .bold), textColor: .systemGreen, textAlignment: .center, numberOfLines: 1)
    

    
    
    var user:User? {
        didSet {
            
            self.nameLabel.text = "\(user?.name.title ?? "") \(user?.name.first ?? "") \(user?.name.last ?? "")"
            self.countryLabel.text = user?.location?.country ?? ""
            
            if UIDevice.current.userInterfaceIdiom == .phone {
                self.nameLabel.font = .systemFont(ofSize: 16, weight: .bold)
                self.countryLabel.font = .systemFont(ofSize: 13, weight: .bold)
                
            }
            else if  UIDevice.current.userInterfaceIdiom == .pad {
                self.nameLabel.font = .systemFont(ofSize: 25, weight: .bold)
                self.countryLabel.font = .systemFont(ofSize: 20, weight: .bold)
                
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        
        // setupShadow()
        
        self.setupShadow(opacity: 0.1, radius: 2, offset: .init(width: 0, height: 5), color: UIColor.gray)
        
        setupView()
        
        
        
    }
    
    fileprivate func setupView(){
        
        let vStack = VerticalStackView(views: [nameLabel,countryLabel], spacing: 8)
        
        self.addSubview(vStack)
        
        vStack.centerInSuperview(size: .init(width: self.frame.width - 20
                                             , height: 0))
    }
    
    //    fileprivate func setupShadow(){
    //        self.backgroundView = UIView()
    //        self.addSubview(backgroundView!)
    //        backgroundView?.fillSuperview()
    //
    //        self.backgroundView?.backgroundColor = .white
    //        self.backgroundView?.layer.cornerRadius = 5
    //        self.backgroundView?.layer.shadowOpacity = 0.1
    //        self.backgroundView?.layer.shadowRadius = 2
    //        self.backgroundView?.layer.shadowOffset = .init(width: 0, height: 5)
    //        self.backgroundView?.layer.shouldRasterize = true
    //        self.backgroundView?.backgroundColor = .white
    //        self.backgroundView?.layer.cornerRadius = 8
    //        self.layer.borderWidth = 0.2
    //        self.layer.borderColor = UIColor.gray.cgColor
    //    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
