//
//  ViewController.swift
//  tipping
//
//  Created by Yang Tang on 9/1/15.
//  Copyright (c) 2015 Yang Tang. All rights reserved.
//

import UIKit

class TipViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var currentString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billTextField.text = ""
        
        // default to 1st position tip, store into defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(0, forKey: "tipPercent")
        defaults.synchronize()
        //set focus to bill input
        [billTextField .becomeFirstResponder()]
        
        self.billTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var billAmount = NSString(string:billTextField.text).doubleValue

        
        var tipPercentages = [0.15, 0.2, 0.3]
        var tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        
        var tip = billAmount * tipPercent
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }

    @IBAction func onTipChanged(sender: AnyObject) {
        // update the tip default
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "tipPercent")
        defaults.synchronize()
        
        // update tip and total
        formatCurrency(string: currentString)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // update the tip percent
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("tipPercent")
        
        // update tip and total
        formatCurrency(string: currentString)
        
        // set focus to bill input
        billTextField.becomeFirstResponder()
    }
    
    //Textfield delegates
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool { // return NO to not change text
        
        switch string {
        case "0","1","2","3","4","5","6","7","8","9":
            currentString += string
            println(currentString)
            formatCurrency(string: currentString)
        default:
            var array = Array(string)
            var currentStringArray = Array(currentString)
            if array.count == 0 && currentStringArray.count != 0 {
                currentStringArray.removeLast()
                currentString = ""
                for character in currentStringArray {
                    currentString += String(character)
                }
                formatCurrency(string: currentString)
            }
        }
        return false
    }
    
    func formatCurrency(#string: String) {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        var numberFromField = (NSString(string: currentString).doubleValue)/100
        billTextField.text = formatter.stringFromNumber(numberFromField)
        formatTipAmounts(billAmount: numberFromField)
    }
    
    func formatTipAmounts(#billAmount: Double) {
        var tipPercentages = [0.15, 0.2, 0.3]
        var tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        
        var tip = billAmount * tipPercent
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }

}

