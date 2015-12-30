//
//  ViewController.swift
//  tips
//
//  Created by Aaron VanDeCasteele on 12/28/15.
//  Copyright (c) 2015 Aaron VanDeCasteele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var
    billField: UITextField!
    
    @IBOutlet weak var
    tipLabel: UILabel!
    
    @IBOutlet weak var TipText: UILabel!
    
    @IBOutlet weak var TotalText: UILabel!
    
    @IBOutlet weak var
    totalLabel: UILabel!
    
    @IBOutlet weak var oneSplit: UITextField!
    
    @IBOutlet weak var twoSplit: UITextField!
    
    @IBOutlet weak var threeSplit: UITextField!
    
    @IBOutlet weak var fourSplit: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tip Calculator"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        //billField.text = "$"
        tipControl.selectedSegmentIndex = 3
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.doubleForKey("defaultTip")
        tipControl.setTitle("\(tipValue)%", forSegmentAtIndex: 3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
     /*   let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.integerForKey("default_tip_percentage")
        */
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.doubleForKey("defaultTip")
        tipControl.setTitle("\(tipValue)%", forSegmentAtIndex: 3)
        var tipPercentages = [0.15, 0.2, 0.25, tipValue/100 ]
        var tipPercentage = tipPercentages[3]
        tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        
        let tip = billAmount * tipPercentage
        
        let total = billAmount+tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        billField.becomeFirstResponder()
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.doubleForKey("defaultTip")
        tipControl.setTitle("\(tipValue)%", forSegmentAtIndex: 3)
        var tipPercentages = [0.15, 0.2, 0.25, tipValue/100 ]
        var tipPercentage = tipPercentages[3]
        tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text!).doubleValue
        
        let tip = billAmount * tipPercentage
        
        let total = billAmount+tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        billField.resignFirstResponder()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
        
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.doubleForKey("defaultTip")
        tipControl.setTitle("\(tipValue)%", forSegmentAtIndex: 3)
        var tipPercentages = [0.15, 0.2, 0.25, tipValue/100 ]
        
        var tipPercentage = tipPercentages[3]
        tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        
        let tip = billAmount * tipPercentage
        
        let total = billAmount+tip
      
        let twoS = total/2
        let threeS = total/3
        let fourS = total/4
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        oneSplit.text = String(format: "$%.2f", total)
        twoSplit.text = String(format:"$%.2f", twoS)
        threeSplit.text = String(format: "$%.2f", threeS)
        fourSplit.text = String(format:"$%.2f", fourS)
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
   
}

