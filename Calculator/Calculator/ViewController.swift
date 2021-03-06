//
//  ViewController.swift
//  Calculator
//
//  Created by Managam Silalahi on 9/6/16.
//  Copyright © 2016 Managam Silalahi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!;
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display!.text!;
            display!.text = textCurrentlyInDisplay + digit;
        } else {
            display!.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue);
        }
    }
    
    var savedProgram: CalculatorBrain.PropertyList?
    
    @IBAction func save(sender: UIButton) {
        savedProgram = brain.program
    }
    
    @IBAction func restore(sender: UIButton) {
        if savedProgram != nil {
            brain.program = savedProgram!
            displayValue = brain.result
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
        
    }
}

