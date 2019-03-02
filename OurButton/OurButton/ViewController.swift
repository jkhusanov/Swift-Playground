//
//  ViewController.swift
//  OurButton
//
//  Created by Jakhongir Khusanov on 2/14/19.
//  Copyright © 2019 Jakhongir Khusanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, OurButtonDelegate {
    
    
    
    @IBOutlet weak var ourButton: OurButton!
    @IBOutlet weak var pinkButton: OurButton!
    @IBOutlet weak var greenButton: OurButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ourButton.delegate = self
        ourButton.name = "blue"
        pinkButton.delegate = self
        pinkButton.name = "pink"
        greenButton.delegate = self
        greenButton.name = "green"

    }
    
    //now our viewController adheres to the OurButtonDelegate protocol
    func buttonWasClicked(_ sender: OurButton) {
        guard let buttonName = sender.name else {
            return
        }
        switch buttonName {
        case "blue":
            view.backgroundColor = .blue
        case "pink":
            view.backgroundColor = .red
        case "green":
            view.backgroundColor = .green
        default:
            view.backgroundColor = .white
        }
    }
}

