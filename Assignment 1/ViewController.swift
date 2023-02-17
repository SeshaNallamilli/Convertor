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
    }
    
    
    @IBAction func Convert(_ sender: Any) {
        let typeIndex = inputType.selectedSegmentIndex
        let val = Int(Input.text ?? "0") ?? 0
        switch(typeIndex) {
            case 0 : decimalToAll(value: val)
            case 1 : binaryToAll(value: val)
            default: return
        
        }
        
        func decimalToAll(value:Int) {
            var number = value
            decimal.text = String(value)
            

            var octalNumber = 0
            var count = 1
            
            while(number != 0) {

               // Calculating remainder
               let rem = number % 8

               // Storing octal number
               octalNumber += rem * count

               // Storing exponential value
               count = count * 10

               // Dividing the number by 8
               number /= 8
                
            }

            octal.text = String(octalNumber)
            
            // Decimal Number
            var decimalValue = value

            // String binary number
            var binaryValue = ""

            //print("Decimal Number: ", decimalValue)

            // Converting decimal to binary number
            while(decimalValue > 0) {
               // Perform bitwise AND operation to find 1 and 0
               if ((decimalValue & 1) == 1){
                  // Store “1”
                  binaryValue += "1"
               }
               else {
                  // Store “1”
                  binaryValue += "0"
               }
               
               // Right shift the decimal number by 1
               decimalValue >>= 1
            }

            // Reversing the string
            let res = String(binaryValue.reversed())
            
            binary.text = String(res)
            //print("Binary Number: ", res)
        }
        
        func binaryToAll(value:Int) {
            // Binary number
            var number = value
            var decimalNum = 0
            var baseVal = 1
            binary.text=String(value)

            //print("Binary Number: ", number)

            // Converting binary into decimal
            while(number > 0){
               // Extraction rightmost with the help
               // of remainder
               let endVal = number % 10
               number /= 10

               // Multiple the extracted digit with the base(power of 2)
               // and then add it to the decimalNum
               decimalNum += endVal * baseVal
               baseVal *= 2
            }
            decimal.text = String(decimalNum)
            //print("Decimal Number: ", decimalNum)
        }
        
        func octalToAll() {
            
        }
        
        func hexaToAll() {
            
        }
    }
    
}


