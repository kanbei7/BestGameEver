//
//  SpeedModeViewController.swift
//  Stick-Hero
//
//  Created by 刘嘉诚 on 11/12/15.
//  Copyright © 2015 koofrank. All rights reserved.
//


import UIKit
import SpriteKit
import AVFoundation

class SpeedModeViewController: UIViewController {
    
    
    @IBOutlet weak var display: UILabel!
    var musicPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SpeedModeScene(size:CGSizeMake(DefinedScreenWidth, DefinedScreenHeight))
        
        // Configure the view.
        let skView = self.view as! SKView
        //        skView.showsFPS = true
        //        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        musicPlayer = setupAudioPlayerWithFile("bg_country", type: "mp3")
        musicPlayer.numberOfLoops = -1
        musicPlayer.play()
    }
    
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer  {
        let url = NSBundle.mainBundle().URLForResource(file as String, withExtension: type as String)
        var audioPlayer:AVAudioPlayer?
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url!)
        } catch {
            print("NO AUDIO PLAYER")
        }
        
        return audioPlayer!
    }
    
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Portrait
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    /*
    var timer: NSTimer?
    var remainingSeconds: Int = 60{
    willSet(newSeconds){
    self.display.text! = "\(newSeconds)"
    }
    }
    
    var isCounting:Bool = false {
    willSet(newValue){
    if newValue{
    timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer:", userInfo: nil, repeats: true)
    }else{
    timer?.invalidate()
    timer = nil
    }
    
    
    }
    }
    
    
    
    @IBAction func CountDownBegin(sender: UIButton) {
    display.text="60"
    remainingSeconds = 60
    isCounting = !isCounting
    }
    
    
    
    func updateTimer(timer: NSTimer?){
    remainingSeconds -= 1
    if remainingSeconds <= 0{
    isCounting = false
    let alert = UIAlertView()
    alert.title = "Time's Up"
    alert.message = ""
    alert.addButtonWithTitle("OK")
    alert.show()
    }
    }
    */
    
}