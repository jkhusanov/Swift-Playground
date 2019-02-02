//
//  ViewController.swift
//  SpyApp
//
//  Created by Jakhongir Khusanov on 1/31/19.
//  Copyright © 2019 Jakhongir Khusanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var secretField: UITextField!
    @IBOutlet weak var output: UILabel!
    

    @IBAction func encryptButtonPressed(_ sender: Any) {
        let plaintext = inputField.text!
        let secretString = secretField.text!
        
        let secretInt = UInt32(secretString)! // turn string into an integer
        
        var encoded = ""
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftUniCode = unicode + secretInt
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftUniCode)))
            
            encoded += shiftedCharacter
        }
        output.text = encoded
    }
    
}

