//
//  ViewController.swift
//  CalculatorIOS
//
//  Created by Jared Walton on 5/26/16.
//  Copyright © 2016 Jared Walton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // instance of the class "calcInput" which holds all the methods for calculation.
    var calc = calcInput()
    var hasInput1: Bool = false
    var hasInput2: Bool = false
    var input: String = " " //holds the input from view
    var prevOp: String = " "
    var input1: Double = 0
    var input2: Double = 0
    var opCount: Int = 0

    //text field outlet
    @IBOutlet weak var calcTextField: UITextView!
    
    // update text view on button click
    @IBAction func updateText(sender: AnyObject) {
        
        // get the button "id" as a string
        input = ((sender as! UIButton).titleLabel!.text!)
        
        // number was input so append it to view
        if (Double(input) != nil){
            self.calcTextField.text = self.calcTextField.text + input
        }
        
        // operation was input
        if (Double(input) == nil){
            
            // handle the case that are not "resuable logic"
            if (input == "C"){ clearCalc(); return}
            if (input == "."){ self.calcTextField.text = self.calcTextField.text + "."; return }
            if (input == "%"){
                self.calcTextField.text = calc.inputInterpretation("%", input1: Double(self.calcTextField.text)!, input2: 0)
                return
            }
            if (input == "N") { self.calcTextField.text = "-" + self.calcTextField.text; return }
            
            // set up the input
            if (hasInput1 == true) {
                if (Double(self.calcTextField.text) != nil){
                    input2 = Double(self.calcTextField.text)!
                    hasInput2 = true
                }
            }
            if (hasInput1 == false){
                if (Double(self.calcTextField.text) != nil){
                    input1 = Double(self.calcTextField.text)!
                    self.calcTextField.text = ""
                    hasInput1 = true
                }
            }
            
            opCount += 1
            if (opCount == 2){
                if (input == "="){
                    self.calcTextField.text = calc.inputInterpretation(prevOp, input1: input1, input2: input2)
                }else{
                    self.calcTextField.text = calc.inputInterpretation(input, input1: input1, input2: input2)
                }
                opCount -= 2
                hasInput1 = false
                hasInput2 = false
            }
            prevOp = input
        }

    }
    
    //reset everything!
    func clearCalc(){
        self.calcTextField.text = ""
        input1 = 0; input2 = 0; opCount = 0;
        hasInput1 = false; hasInput2 = false;
        prevOp = " "; input = " "
        calc.reset()
    }
}
