//
//  ViewController.swift
//  imageFilter
//
//  Created by dai deguchi on 2022/06/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let ciImage = CIImage(image: imageView.image!)
        
//        let filter = CIFilter(name: "CIPhotoEffectMono")!
        let filter = CIFilter(name: "CIBoxBlur")!
        
        filter.setDefaults()
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        filter.setValue(30, forKey: kCIInputRadiusKey)
        
        let outputImage = filter.outputImage
        imageView.image = UIImage(ciImage: outputImage!)
    }


}

