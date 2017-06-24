//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by 何育昆 on 2017/6/23.
//  Copyright © 2017年 爱见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLable: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    //播放状态标志
    var isPlay: Bool!;
    //计时器
    var timer = Timer();
    //count
    var counter = 0.0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLable.text = String(counter)
        isPlay = false
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   //开始
    @IBAction func playTapped(_ sender: Any) {
        if isPlay {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.UpdateTimer), userInfo: nil, repeats: true)
        
        isPlay = true
        
        
    }
    //暂停
    @IBAction func pauseTapped(_ sender: Any) {
        if !isPlay{
            return
        }
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        isPlay = false
    }
    
    //复位
    @IBAction func resetTapped(_ sender: Any) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
        timer.invalidate()
        counter = 0.0
        counterLable.text = String(counter)
        isPlay = false
    }
    
    func UpdateTimer(){
        counter = counter + 0.1
        counterLable.text = String(counter)
    }
  

}

