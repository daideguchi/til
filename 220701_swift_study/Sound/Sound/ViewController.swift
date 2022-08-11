//
//  ViewController.swift
//  Sound
//
//  Created by dai deguchi on 2022/06/02.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(sender: UIButton){
        let url = URL(fileURLWithPath: Bundle.main.bundlePath).appendingPathComponent("sample.mp3")
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
            player.delegate = self
        }catch{
            print("Failed")
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("Finished!")
    }
    
}


