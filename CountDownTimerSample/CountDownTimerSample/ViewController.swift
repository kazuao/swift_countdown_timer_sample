//
//  ViewController.swift
//  CountDownTimerSample
//
//  Created by Kazunori Aoki on 2021/04/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countdownLabel: UILabel!
    
    // timerの時間（1時間、10分、10秒）
    var time = [1, 10, 10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countdownLabel.text = String(time[0]) + ":" + String(time[1]) + ":" + String(time[2])
        
        // 1秒毎にtimerメソッドを呼ぶ
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timer), userInfo: nil,  repeats: true)
        
    }
    
    @objc func timer() {
        if (time[0] == 0 && time[1] == 0 && time[2] == 0) {
            countdownLabel.text = "終了"
            return
        }
        
        // 秒数が0以外の時
        if time[2] > 0 {
            time[2] -= 1
            
        } else {
            time[2] += 59
            
            // 分が0以外の時
            if time[1] > 0 {
                time[1] -= 1
            
            } else {
                time[1] += 59
                time[0] -= 1
            }
        }
        countdownLabel.text = String(time[0]) + ":" + String(time[1]) + ":" + String(time[2])
    }
}

