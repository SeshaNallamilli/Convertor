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
        switch(typeIndex) {
            case 0 : decimalToAll(value: val)
            case 1 : binaryToAll(value: val)
            case 2 : octalToAll(value:val)
            case 3 : hexaToAll(value:val)
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
        
        func hexaToAll(value:Int) {
            
        }
    }
    
}


