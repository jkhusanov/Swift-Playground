//
//  ViewController.swift
//  SpyApp
//
//  Created by Jakhongir Khusanov on 1/31/19.
//  Copyright © 2019 Jakhongir Khusanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputField: UITextField! // these "!" are ok only here
    @IBOutlet weak var secretField: UITextField!
    @IBOutlet weak var output: UILabel!
    
    
    var integerSecret: UInt32 {
        guard let secretString = secretField.text else {
            return 0
        }
        
        // turn string into an integer
        if let secretInt = UInt32(secretString) {
            return secretInt
        } else {
            return 0
        }
        
    }

    @IBAction func encryptButtonPressed(_ sender: Any) {
        guard
            let plaintext = inputField.text,
            let secretString = secretField.text //this went up to the integerSecret
        else {
            output.text = "No values provided" //this probably not going to happen because it will be just empty string
            return
        }
    
        
        var encoded = ""
        for character in plaintext {
            guard let firstUnicodeScalar = character.unicodeScalars.first else {
                continue //just skip this loop iteration, go to next character in plaintext
            }
            let unicode = firstUnicodeScalar.value
            let shiftUniCode = unicode + integerSecret
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftUniCode)))
            
            encoded += shiftedCharacter
        }
        output.text = encoded
    }
    
}

