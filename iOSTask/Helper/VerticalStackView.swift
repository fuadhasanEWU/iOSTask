//
//  VerticalStackView.swift
//  MPPortal
//
//  Created by Fuad Hasan on 9/5/21.
//

import Foundation
import UIKit

class VerticalStackView:UIStackView {
    init(views:[UIView],spacing:CGFloat=0){
       super.init(frame: .zero)
        views.forEach { (view) in
          addArrangedSubview(view)
        }
       self.axis = .vertical
       self.spacing = spacing
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension UIStackView{
    convenience init(addArrangedSubviews:[UIView],spacing:CGFloat = 0){
        
        self.init(arrangedSubviews: addArrangedSubviews)
        self.spacing = spacing
    }
}
