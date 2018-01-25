//
//  ViewController.swift
//  monster
//
//  Created by Jacky on 2018-01-02.
//  Copyright © 2018 Jacky. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {


    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    @IBOutlet weak var penalty1Img: UIImageView!
    @IBOutlet weak var penalty2Img: UIImageView!
    @IBOutlet weak var penalty3Img: UIImageView!
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var penalties = 0
    var timer: Timer!
    var monsterHappy = false
    var currentItem = 0
 /*
    var musicPlayer: AVAudioPlayer!
    var sfxBite: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    var sfxDeath: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!
  */
    @objc func changeGameState(){
        
        if !monsterHappy{
            penalties = penalties + 1
            //sfxSkull.play()
            
            if penalties == 1 {
                penalty1Img.alpha = OPAQUE
                penalty2Img.alpha = DIM_ALPHA
                
            }else if penalties == 2{
                penalty2Img.alpha = OPAQUE
                penalty3Img.alpha = DIM_ALPHA
            }else if penalties >= 3{
                penalty3Img.alpha = OPAQUE
            }else{
                penalty1Img.alpha = DIM_ALPHA
                penalty2Img.alpha = DIM_ALPHA
                penalty3Img.alpha = DIM_ALPHA
            }
            
            if penalties >= MAX_PENALTIES {
                gameOver()
            }
        }
        
        let rand = arc4random_uniform(2) // 0 or 1
        
        if rand == 0 {
            foodImg.alpha = DIM_ALPHA
            foodImg.isUserInteractionEnabled = false
            
            heartImg.alpha = OPAQUE
            heartImg.isUserInteractionEnabled = true
        } else{
            heartImg.alpha = DIM_ALPHA
            heartImg.isUserInteractionEnabled = false
            
            foodImg.alpha = OPAQUE
            foodImg.isUserInteractionEnabled = true
        }
        currentItem = Int(rand)
        monsterHappy = false
    }
    
    func gameOver(){
        timer.invalidate()
        monsterImg.playDeathAnimation()
        //sfxDeath.play()
    }
    @objc func itemDroppedOnCharacter(notif: AnyObject){
        monsterHappy = true
        startTimer()
        
        foodImg.alpha = DIM_ALPHA
        foodImg.isUserInteractionEnabled = false
        heartImg.alpha = DIM_ALPHA
        heartImg.isUserInteractionEnabled = false
/*
        if currentItem == 0 {
            sfxHeart.play()
        }else{
            sfxBite.play()
        }
 */
    }

    func startTimer(){
        //existing timer, then restart it
        if timer != nil {
            timer.invalidate()
        }
 //       timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: Selector(("changeGameState")), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        
        penalty1Img.alpha = DIM_ALPHA
        penalty2Img.alpha = DIM_ALPHA
        penalty3Img.alpha = DIM_ALPHA
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.itemDroppedOnCharacter), name: NSNotification.Name(rawValue: "onTargetDropped"), object: nil)
 /*
        do{
            
//            var resourcePath = Bundle.main.path(forResource: "cave-music", ofType: "mp3")!
//            var url = NSURL(fileURLWithPath: resourcePath)
//            try musicPlayer = AVAudioPlayer(contentsOf: url as URL)
            
            try sfxBite = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "cave-music", ofType: "mp3")!) as URL)
            
            try sfxBite = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "bite", ofType: "wav")!) as URL)
            try sfxHeart = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "wav", ofType: "wav")!) as URL)
            try sfxDeath = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "death", ofType: "wav")!) as URL)
            try sfxSkull = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "skull", ofType: "wav")!) as URL)
            
            musicPlayer.prepareToPlay()
            musicPlayer.play()
            
            sfxBite.prepareToPlay()
            sfxHeart.prepareToPlay()
            sfxDeath.prepareToPlay()
            sfxSkull.prepareToPlay()
            
        }catch let err as NSError{
            print(err.debugDescription)
        }
 */
        startTimer()
        
    }

//        var imgArray = [UIImage]()
//        for x in 1..<5 {
//            let img = UIImage(named: "idle\(x).png")
//            imgArray.append(img!)
//        }
//Animations
//        monsterImg.animationImages = imgArray
//        monsterImg.animationDuration = 0.8
//        monsterImg.animationRepeatCount = 0
//        monsterImg.startAnimating()
//

    //View Controller
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("I Just Touched the Screen")
//    }


}

