//
//  ViewController.swift
//  assignment2
//
//  Created by Luther Yu on 9/12/19.
//  Copyright © 2019 Luther Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addButton(_ sender: Any) {
        let first = text1.text
        let second = text2.text
        label1.text = "Value \(first!) and \(second!) :)"
    }
    
}

