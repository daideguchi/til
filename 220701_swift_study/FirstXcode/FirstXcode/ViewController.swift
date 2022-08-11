//
//  ViewController.swift
//  FirstXcode
//
//  Created by dai deguchi on 2022/05/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myLabel: UILabel!

    @IBAction func buttonTapped(sender:UIButton){
        myLabel.text = "Hello world"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

