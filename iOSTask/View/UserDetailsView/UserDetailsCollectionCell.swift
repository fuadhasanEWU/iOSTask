//
//  UserDetailsCollectionCell.swift
//  iOSTask
//
//  Created by Fuad Hasan on 21/5/21.
//

import UIKit

class UserDetailsCollectionCell:UICollectionViewCell {
    
    let nameLabel = UILabel(text: "Md Fuad Hasan", font: .systemFont(ofSize: 25, weight: .bold), textColor: .label, textAlignment: .left, numberOfLines: 0)
    
    let valueLabel = UILabel(text: "Bangladesh", font: .systemFont(ofSize: 20, weight: .bold), textColor: .systemGreen, textAlignment: .left, numberOfLines: 2)
    
    let divider = UIView()
    
    var user:UserDetails? {
        didSet {
            
            self.nameLabel.text = user?.propertyName.rawValue
            self.valueLabel.text = user?.propertyValue
            
            if UIDevice.current.userInterfaceIdiom == .phone {
                self.nameLabel.font = .systemFont(ofSize: 16, weight: .bold)
                self.valueLabel.font = .systemFont(ofSize: 13, weight: .bold)
            }
            
            else if  UIDevice.current.userInterfaceIdiom == .pad {
                self.nameLabel.font = .systemFont(ofSize: 25, weight: .bold)
                self.valueLabel.font = .systemFont(ofSize: 20, weight: .bold)
                
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupView()
    }
    
    fileprivate func setupView(){
        
        self.divider.backgroundColor = .gray
        self.divider.constrainHeight(constant: 1)
        
        let hStack = UIStackView(addArrangedSubviews: [nameLabel,valueLabel], spacing: 10)
        hStack.distribution = .fillEqually
        
        let vStack = VerticalStackView(views: [hStack,divider], spacing: 5)
        
        self.addSubview(vStack)
        
        vStack.fillSuperview(padding: .init(top: 8, left: 8, bottom: 8, right: 8))
        
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
