//
//  ViewController.swift
//  Assignment 1
//
//  Created by Sesha Kumar Reddy Nallamilli on 2/4/23.
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
    
    @IBAction func act(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            Input.text = ""
            Input.placeholder = "Enter Decimal Number"
        case 1:
            Input.text = ""
            Input.placeholder = "Enter Binary Number"
        case 2:
            Input.text = ""
            Input.placeholder = "Enter Octal Number"
        case 3:
            Input.text = ""
            Input.placeholder = "Enter Hexadecimal Number"
        default:
            Input.text = ""
            Input.placeholder = "Enter Decimal Number"
        }
    }
    
    @IBAction func Convert(_ sender: Any) {
        let typeIndex = inputType.selectedSegmentIndex
        let val = Int(Input.text ?? "0") ?? 0
        let val1: String? = Input.text
        let val2: String = val1!
        
        switch(typeIndex) {
            case 0 : decimalConvert(value: val)
            case 1 : binaryConvert(value: val)
            case 2 : octalConvert(value:val)
            case 3 : hexaConvert(value:val2)
            default: return
        
        }
        
        func decimalConvert(value:Int) {
            var digit = value
            decimal.text = String(value)
            var octalNumber = 0
            var count = 1
            while(digit != 0) {
               let rem = digit % 8
               octalNumber += rem * count
               count = count * 10
               digit /= 8
            }
            octal.text = String(octalNumber)
    
            var digit1 = value
            var binaryValue = ""
            while(digit1 > 0) {
               if ((digit1 & 1) == 1){
                  binaryValue += "1"
               }
               else {
                  binaryValue += "0"
               }
               
               digit1 >>= 1
            }

            let res = String(binaryValue.reversed())
            
            binary.text = String(res)
            
            var digit2 = value
                    var remainder: Int
                    var hexadigit = ""
                    let hexcharacters: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
                    while digit2 > 0 {
                        remainder = digit2 % 16
                        hexadigit = String(hexcharacters[remainder]) + hexadigit
                        digit2 /= 16
                    }
                    hexaDecimal.text=hexadigit
        }
        
        func binaryConvert(value:Int) {
            var digit3 = value
            var decimaldigit = 0
            var foot = 1
            binary.text=String(value)
            while(digit3 > 0){
               let last = digit3 % 10
               digit3 /= 10
               decimaldigit += last * foot
               foot *= 2
            }
            decimal.text = String(decimaldigit)
            
            var decimal = decimaldigit
                   var octaldigit = 0
                   var count = 1
                   
                   while(decimaldigit != 0) {
                       
                       let remainder = decimaldigit % 8
                       
                       octaldigit += remainder * count
                       
                       count = count * 10
                       decimaldigit /= 8
                       
                   }
                   
                   octal.text = String(octaldigit)
                   var remainder: Int
                   var hexdigit = ""
                   let hexcharacters: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
                   while decimal > 0 {
                       remainder = decimal % 16
                       hexdigit = String(hexcharacters[remainder]) + hexdigit
                       decimal /= 16
                   }
                   hexaDecimal.text=hexdigit
        }
        
        func octalConvert(value:Int) {
            octal.text = String(value)
                    let val3: Int = value
                    
                    
                    var output: Int = 0
                    
                    
                    var val4: Int = val3
                    
                    var s: Int = 0
                    while val4 > 0 {
                      
                        let t: Int = val4 % 10
                        
                      
                        let power: Double = pow(8, Double(s))
                        
                       
                        output += Int(Double(t) * power)
                        val4 /= 10
                        
                        s += 1
                    }
                    decimal.text = String(output)
                    var decimaldigit1 = output
                    var binarydigit1 = ""
                    while(decimaldigit1 > 0) {
                        
                        if ((decimaldigit1 & 1) == 1){
                            
                            binarydigit1 += "1"
                        }
                        else {
                            
                            binarydigit1 += "0"
                        }
                        
                        decimaldigit1 >>= 1
                    }
                    
                    let resultant = String(binarydigit1.reversed())
                    
                    binary.text = String(resultant)
                    var decimalnum = output
                    var remainder: Int
                    var hexdigit = ""
                    let hexcharacters: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
                    while decimalnum > 0 {
                        remainder = decimalnum % 16
                        hexdigit = String(hexcharacters[remainder]) + hexdigit
                        decimalnum /= 16
                    }
                    hexaDecimal.text=hexdigit
        }
        
        func hexaConvert(value: String) {
            let hexnum = value.capitalized
                    hexaDecimal.text=String(hexnum)
                    let length = hexnum.count
                    
                    var foot = 1
                    
                    var decimalvalue = 0
                    
                    for s in (0..<length).reversed() {
                        let character = hexnum[hexnum.index(hexnum.startIndex, offsetBy: s)]
                       
                        if character >= "0" && character <= "9" {
                            decimalvalue += (Int(character.asciiValue!) - 48) * foot
                            
                           
                            foot = foot * 16
                        }
                    
                        else if character >= "A" && character <= "F" {
                            decimalvalue += (Int(character.asciiValue!) - 55) * foot
                            
                            foot = foot * 16
                        }
                    }
                    decimal.text = String(decimalvalue)
                    var decimaldigit2 = decimalvalue
                    var octaldigit2 = 0
                    var add = 1
                    
                    while(decimalvalue != 0) {
                        
                        let remainder = decimalvalue % 8
                        
                        octaldigit2 += remainder * add
                        
                        add = add * 10
                        decimalvalue /= 8
                        
                    }
                    
                    octal.text = String(octaldigit2)
                    var binarynum = ""
                    while(decimaldigit2 > 0) {
                        
                        if ((decimaldigit2 & 1) == 1){
                            
                            binarynum += "1"
                        }
                        else {
                            
                            binarynum += "0"
                        }
                        
                        decimaldigit2 >>= 1
                    }
                    
                    let resultant = String(binarynum.reversed())
                    
                    binary.text = String(resultant)
                }
            
        }
    }
    



