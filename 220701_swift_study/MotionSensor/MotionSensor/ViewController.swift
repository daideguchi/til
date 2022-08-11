//
//  ViewController.swift
//  MotionSensor
//
//  Created by dai deguchi on 2022/06/05.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let motionManager = CMMotionManager()
    
    @IBOutlet var fish: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let originalX = fish.center.x
        
        if motionManager.isDeviceMotionAvailable{
            motionManager.deviceMotionUpdateInterval = 0.02
            motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: {(motion,error)in
                print(motion!.attitude.roll) //iphoneの縦方向を軸とした傾き
                let newX = originalX + CGFloat(motion!.attitude.roll * 100)
                self.fish.center = CGPoint(x: newX, y: self.fish.center.y)
            })
        }
    }


    
    
}

