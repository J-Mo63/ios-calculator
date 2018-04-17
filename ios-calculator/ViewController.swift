//
//  ViewController.swift
//  ios-calculator
//
//  Created by Jonathan Moallem on 17/4/18.
//  Copyright © 2018 Sudo-Code Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func contentButtonClicked(_ sender: UIButton) {
        label.text = label.text! + sender.titleLabel!.text!
    }
    
    @IBAction func clear(_ sender: UIButton) {
        label.text = ""
    }
    
    @IBAction func del(_ sender: UIButton) {
        guard let text: String = label.text else {
            label.text = "error"
            return
        }
        label.text = String(text.dropLast())
    }
    
    @IBAction func solve(_ sender: UIButton) {
        let expr = NSExpression(format: label.text!)
        
        if let result = expr.expressionValue(with: nil, context: nil) as? NSNumber {
            label.text = result.stringValue
        }
        else {
            label.text = "error"
        }
    }
}

