//
//  ViewController.swift
//  Assignment 1
//
//  Created by Nallamilli Sesha kumar reddy on 2/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Input: UITextField!
    @IBOutlet weak var binary: UILabel!
    @IBOutlet weak var decimal: UILabel!
    @IBOutlet weak var octal: UILabel!
    @IBOutlet weak var hexaDecimal: UILabel!
    
    @IBOutlet weak var inputType: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Clear(_ sender: Any) {
        binary.text = ""
        decimal.text = ""
        octal.text = ""
        hexaDecimal.text = ""
        Input.text = ""
    }
    
    
    @IBAction func Convert(_ sender: Any) {
        let typeIndex = inputType.selectedSegmentIndex
        let val = Int(Input.text ?? "0") ?? 0
        let val1: String? = Input.text
        let val2: String = val1!
        switch(typeIndex) {
            case 0 : decimalToAll(value: val)
            case 1 : binaryToAll(value: val)
            case 2 : octalToAll(value:val)
            case 3 : hexaToAll(value:val2)
            default: return
        
        }
        
        func decimalToAll(value:Int) {
            var number = value
            decimal.text = String(value)
            var octalNumber = 0
            var count = 1
            while(number != 0) {
               let rem = number % 8
               octalNumber += rem * count
               count = count * 10
               number /= 8
            }
            octal.text = String(octalNumber)
    
            var decimalValue = value
            var binaryValue = ""
            while(decimalValue > 0) {
               if ((decimalValue & 1) == 1){
                  binaryValue += "1"
               }
               else {
                  binaryValue += "0"
               }
               
               decimalValue >>= 1
            }

            let res = String(binaryValue.reversed())
            
            binary.text = String(res)
            
            var decimal = value
                    var rem: Int
                    var hex = ""
                    let hexchars: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
                    while decimal > 0 {
                        rem = decimal % 16
                        hex = String(hexchars[rem]) + hex
                        decimal /= 16
                    }
                    hexaDecimal.text=hex
        }
        
        func binaryToAll(value:Int) {
            var number = value
            var decimalNum = 0
            var baseVal = 1
            binary.text=String(value)
            while(number > 0){
               let endVal = number % 10
               number /= 10
               decimalNum += endVal * baseVal
               baseVal *= 2
            }
            decimal.text = String(decimalNum)
            
            var decimal = decimalNum
                   var octalNumber = 0
                   var count = 1
                   
                   while(decimalNum != 0) {
                       
                       let rem = decimalNum % 8
                       
                       octalNumber += rem * count
                       
                       count = count * 10
                       decimalNum /= 8
                       
                   }
                   
                   octal.text = String(octalNumber)
                   var rem: Int
                   var hex = ""
                   let hexchars: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
                   while decimal > 0 {
                       rem = decimal % 16
                       hex = String(hexchars[rem]) + hex
                       decimal /= 16
                   }
                   hexaDecimal.text=hex
        }
        
        func octalToAll(value:Int) {
            octal.text = String(value)
                    let a: Int = value
                    
                    // Initialize result variable to 0.
                    var result: Int = 0
                    
                    // Take a copy of input
                    var copy_a: Int = a
                    
                    var i: Int = 0
                    while copy_a > 0 {
                        // Take the last digit
                        let temp: Int = copy_a % 10
                        
                        // Appropriate power on 8 suitable to its position.
                        let p: Double = pow(8, Double(i))
                        
                        // Multiply the digits to the into the Input and then add it to result
                        result += Int(Double(temp) * p)
                        copy_a /= 10
                        
                        i += 1
                    }
                    decimal.text = String(result)
                    var decimalValue = result
                    var binaryValue = ""
                    while(decimalValue > 0) {
                        
                        if ((decimalValue & 1) == 1){
                            
                            binaryValue += "1"
                        }
                        else {
                            
                            binaryValue += "0"
                        }
                        
                        decimalValue >>= 1
                    }
                    
                    let res = String(binaryValue.reversed())
                    
                    binary.text = String(res)
                    var decimal = result
                    var rem: Int
                    var hex = ""
                    let hexchars: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
                    while decimal > 0 {
                        rem = decimal % 16
                        hex = String(hexchars[rem]) + hex
                        decimal /= 16
                    }
                    hexaDecimal.text=hex
        }
        
        func hexaToAll(value: String) {
            let hexVal = value.capitalized
                    hexaDecimal.text=String(hexVal)
                    let len = hexVal.count
                    
                    // Initializing base value to 1, i.e 16^0
                    var base = 1
                    
                    var dec_val = 0
                    
                    // Extracting characters as digits from last character
                    for i in (0..<len).reversed() {
                        let char = hexVal[hexVal.index(hexVal.startIndex, offsetBy: i)]
                        // if character lies in '0'-'9', converting it to integral 0-9 by subtracting 48 from ASCII value
                        if char >= "0" && char <= "9" {
                            dec_val += (Int(char.asciiValue!) - 48) * base
                            
                            // incrementing base by power
                            base = base * 16
                        }
                        // if character lies in 'A'-'F' , converting it to integral 10 - 15 by subtracting 55 from ASCII value
                        else if char >= "A" && char <= "F" {
                            dec_val += (Int(char.asciiValue!) - 55) * base
                            
                            // incrementing base by power
                            base = base * 16
                        }
                    }
                    decimal.text = String(dec_val)
                    var decimalValue = dec_val
                    var octalNumber = 0
                    var count = 1
                    
                    while(dec_val != 0) {
                        
                        let rem = dec_val % 8
                        
                        octalNumber += rem * count
                        
                        count = count * 10
                        dec_val /= 8
                        
                    }
                    
                    octal.text = String(octalNumber)
                    var binaryValue = ""
                    while(decimalValue > 0) {
                        
                        if ((decimalValue & 1) == 1){
                            
                            binaryValue += "1"
                        }
                        else {
                            
                            binaryValue += "0"
                        }
                        
                        decimalValue >>= 1
                    }
                    
                    let res = String(binaryValue.reversed())
                    
                    binary.text = String(res)
                }
            
        }
    }
    



