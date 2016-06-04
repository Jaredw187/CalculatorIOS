//
//  calcInput.swift
//  CalculatorIOS
//
//  Created by Jared Walton on 5/26/16.
//  Copyright © 2016 Jared Walton. All rights reserved.
//

import Foundation


class calcInput {
    
    var value: Double = 0;
    
    
    // methods for calculations
    private func mod(input: Double, input2: Double) { self.value = input % input2 }
    private func percent(input: Double) { self.value = input / 100 }
    private func add(input: Double, input2: Double) { self.value = input + input2 }
    private func sub(input: Double, input2: Double) { self.value = input - input2}
    private func mult(input: Double, input2: Double){ self.value = input * input2 }
    private func div(input: Double, input2: Double) { self.value = input / input2 }
    private func negate(input: Double) { self.value = -input}
    
    
    // determine the operation.
    internal func inputInterpretation(operation: String, input1: Double, input2: Double) -> String{
        
        if (operation == "M"){ mod(input1, input2: input2) }
        if (operation == "%")  { percent(input1) }
        if (operation == "+")  { add(input1, input2: input2) }
        if (operation == "-")  { sub(input1, input2: input2) }
        if (operation == "X")  { mult(input1, input2: input2) }
        if (operation == "/")  { div(input1, input2: input2) }
        if (operation == "N")  { negate(input1) }
        
        print(String(input1) + operation + String(input2) + " = " + String(self.value))
        
        
        return String(self.value)
    }
    
    
    
    func reset(){ self.value = 0 }
    
    // getters and setters
    func getValue() -> Double { return value }
    func setValue(input: Double) { value = input }
}
