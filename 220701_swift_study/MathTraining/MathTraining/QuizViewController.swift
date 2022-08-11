//
//  QuizViewController.swift
//  MathTraining
//
//  Created by dai deguchi on 2022/05/29.
//

import UIKit

class QuizViewController: UIViewController {
    
    let total = 10 //問題数
    var correct = 0 //正解数
    var questionIndex = 0 //問題の番号
    var answerIndex = 0 //正解の番号
    
    @IBOutlet var leftNumberLabel: UILabel!
    @IBOutlet var centerNumberLabel: UILabel!
    @IBOutlet var rightNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestions()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender:Any?){
        if let resultVC = segue.destination as? ResultViewController{
            resultVC.result = Double(correct) / Double(total) * 100.0
        }
    }
    
    @IBAction func tapped(sender : UIButton){
        if sender.tag - 1 == answerIndex{
            correct += 1
        }
        questionIndex += 1
        if questionIndex >= total{
            performSegue(withIdentifier: "QuizToResult", sender:nil)
        }else{
            setQuestions()
        }
    }
    
    
    func setQuestions() {
        let leftNum = Int(arc4random_uniform(10))
        var centerNum = Int(arc4random_uniform(10))
        
        answerIndex = Int(arc4random_uniform(4))
        switch answerIndex {
        case 0:
            rightNumberLabel.text = "\(leftNum + centerNum)"
        case 1:
            rightNumberLabel.text = "\(leftNum - centerNum)"
        case 2:
            rightNumberLabel.text = "\(leftNum * centerNum)"
        default:
            if centerNum == 0 {
                centerNum = 1
        }
        rightNumberLabel.text = "\(leftNum / centerNum)"
        }
        leftNumberLabel.text = "\(leftNum)"
        centerNumberLabel.text = "\(centerNum)"

    }
}
