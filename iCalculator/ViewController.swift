//
//  ViewController.swift
//  iCalculator
//
//  Created by Ádibádi on 19/02/16.
//  Copyright © 2016 Székely Ádám. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextFieldA: UITextField!
    @IBOutlet weak var inputTextFieldB: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet weak var operationSelector: UISegmentedControl!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operationSelector.selectedSegmentIndex = 0
        self.textView.editable = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backgroundTouchUpInside(sender: AnyObject) {
        view.endEditing(true)
    }
    
    enum OperationType {
        case Add
        case Mul
        case Div
    }
    
    var operationType = OperationType.Add
    
    @IBAction func operationSelectorValueChanged(sender: AnyObject) {
        switch operationSelector.selectedSegmentIndex {
        case 0:
            operationType = .Add
        case 1:
            operationType = .Mul
        case 2:
            operationType = .Div
        default:
            operationType = .Add
        }
    }
    
    @IBAction func calculateButtonTouchUpInside(sender: AnyObject) {
        let numberFormatter = NSNumberFormatter()
        
        view.endEditing(true)
        
        if let
            textA = self.inputTextFieldA.text,
            textB = self.inputTextFieldB.text,
            a = numberFormatter.numberFromString(textA)?.doubleValue,
            b = numberFormatter.numberFromString(textB)?.doubleValue {
                var result = 0.0
                var operatorString = ""
                switch operationType {
                case OperationType.Add:
                    result = a + b
                    operatorString = " + "
                case OperationType.Mul:
                    result = a * b
                    operatorString = " * "
                case OperationType.Div:
                    result = a / b
                    operatorString = " / "
                }
                resultLabel.text = "\(result)"
                let history = "\(a) \(operatorString) \(b) = \(result) \n"
                textView.text = history + textView.text
        }
    }
}






