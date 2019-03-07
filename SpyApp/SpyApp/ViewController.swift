//
//  ViewController.swift
//  SpyApp
//
//  Created by Jakhongir Khusanov on 1/31/19.
//  Copyright © 2019 Jakhongir Khusanov. All rights reserved.
//

import UIKit

protocol CipherProtocol {
    func encrypt(plaintext: String, secret: String) -> String
}

struct CesarCipher: CipherProtocol {
    func encrypt(plaintext: String, secret: String) -> String {
        // turn string into an integer
        guard let secretInt = UInt32(secret) else {
            return "Error"
        }
        var encoded = ""
        for character in plaintext {
            guard let firstUnicodeScalar = character.unicodeScalars.first else {
                continue
            }
            let unicode = firstUnicodeScalar.value
            let shiftedUnicode = unicode + secretInt
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            
            encoded += shiftedCharacter
        }
        return encoded
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var inputField: UITextField! // these "!" are ok only here
    @IBOutlet weak var secretField: UITextField!
    @IBOutlet weak var output: UILabel!
    
    
 
    var cipher: CipherProtocol = CesarCipher()
    
    var ciphers: [String: CipherProtocol] = [
        "Cesar": CesarCipher()
        // Add other ciphers here
    ]
    @IBAction func encryptButtonPressed(_ sender: Any) {
        guard
            let plaintext = inputField.text,
            let secretString = secretField.text //this went up to the integerSecret
        else {
            output.text = "No values provided" //this probably not going to happen because it will be just empty string
            return
        }

        output.text = cipher.encrypt(plaintext: plaintext, secret: secretString)
    }
    
    
    @IBAction func cipherSelected(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else{
            return
        }
        guard let selectedCipher = ciphers[buttonTitle] else {
            return
        }
        cipher = selectedCipher
        
    }
    
    
}

