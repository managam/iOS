//
//  ViewController.swift
//  Calculator
//
//  Created by Managam Silalahi on 9/6/16.
//  Copyright © 2016 Managam Silalahi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!;
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display!.text!;
            display!.text = textCurrentlyInDisplay + digit;
        } else {
            display!.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue);
        }
    }
    
    @IBAction func performOperation(sender: UIButton) {
        userIsInTheMiddleOfTyping = false   
        if let mathematicalSymbol = sender.currentTitle {
            if mathematicalSymbol == "π" {
                displayValue = M_PI
            } else if mathematicalSymbol == "√" {
                displayValue = sqrt(displayValue);
            }
        }
        
    }
}

