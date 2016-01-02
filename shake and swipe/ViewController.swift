//
//  ViewController.swift
//  shake and swipe
//
//  Created by 迫 佑樹 on 2016/01/02.
//  Copyright © 2016年 迫 佑樹. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var randLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var state: UILabel!
    
    @IBAction func stop(sender: AnyObject) {
        
        scoreLabel.text = "\(score)円を持って逃走した"
        alive = false
    }
    
    
    var score = 0
    var player = AVAudioPlayer()
    var alive = true
    var dieCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event!.subtype == UIEventSubtype.MotionShake{
            
            if alive{
                print("shaked")
                
                var rand = Int(arc4random() % 100)

                
                var fileLocation = NSBundle.mainBundle().pathForResource("cin", ofType: "wav")
                randLabel.text = "\(rand * 100 * dieCount)円をゲットした!!"
                score = score + Int(rand * 100 * dieCount)
                
                scoreLabel.text = "合計 \(score)円です"
                
                
                if rand < 3 * dieCount{

                    fileLocation = NSBundle.mainBundle().pathForResource("mdai", ofType: "mp3")
                    scoreLabel.text = "よくばるから...(´・∀・｀)"
                    randLabel.text = "死んじゃったお..."
                    
                    alive = true
                }
                
                if rand > 98{
                    fileLocation = NSBundle.mainBundle().pathForResource("timlim", ofType: "mp3")
                    dieCount = 2
                    state.text = "あ，死ぬ確率2倍!!金も2倍!!"
                }
                
                
                
                

                
                
                
                
                do { try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                    
                    player.play()
                    
                } catch {
                    
                }
                
            }
        }
            
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

