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
        }
        
        func octalToAll() {
            
        }
        
        func hexaToAll() {
            
        }
    }
    
}


