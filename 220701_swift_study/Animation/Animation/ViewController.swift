//
//  ViewController.swift
//  Animation
//
//  Created by dai deguchi on 2022/05/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(sender: UIButton){
//        UIView.animate(withDuration: 1.0){
//            self.imageView.transform = CGAffineTransform(translationX: 0, y: -100)
//        }
//    }
    
    UIView.animate(withDuration: 1.0, animations: {
        self.imageView.transform = CGAffineTransform(translationX: 0, y: -100)
    }) { (_) in
        self.imageView.transform = CGAffineTransform.identity
    }
    
}

}
