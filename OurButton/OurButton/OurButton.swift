//
//  OurButton.swift
//  OurButton
//
//  Created by Jakhongir Khusanov on 3/1/19.
//  Copyright © 2019 Jakhongir Khusanov. All rights reserved.
//

import UIKit

//interface
protocol OurButtonDelegate: class {
    func buttonWasClicked(_ sender: OurButton) // we want to our delegate know that our button was clicked,
}

// Colon ":" means inherit from something, In this case we inherit from UIView
class OurButton: UIView {
    weak var delegate: OurButtonDelegate?
    
    var name: String?
    
    override func didMoveToSuperview() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(buttonClicked))
        
        addGestureRecognizer(tap)
    }
    @objc func buttonClicked() {
        delegate?.buttonWasClicked(self)
    }
}
