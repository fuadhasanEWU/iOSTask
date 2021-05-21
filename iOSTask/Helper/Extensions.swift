//
//  Extensions.swift
//  InstagramFirebase
//
//  Created by Brian Voong on 3/18/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import UIKit



extension UILabel {
    convenience public init(text: String? = nil, font: UIFont? = UIFont.systemFont(ofSize: 14), textColor: UIColor = .black, textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
}


fileprivate var aView:UIView?
extension UIViewController {
    

    func showSpinner(){
        aView = UIView(frame: self.view.bounds)
        aView!.backgroundColor  = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let aIndicator = UIActivityIndicatorView(style: .large)
        aIndicator.center = aView!.center
        aIndicator.startAnimating()
        aView!.addSubview(aIndicator)
        self.view.addSubview(aView!)
        
    }
    
    func stopSpinner(){
        aView?.removeFromSuperview()
        aView = nil
    }
}


