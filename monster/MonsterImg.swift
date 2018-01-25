//
//  MonsterImg.swift
//  monster
//
//  Created by Jacky on 2018-01-02.
//  Copyright © 2018 Jacky. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView{
    override init(frame: CGRect){
        super.init(frame:frame)
    }
    //when app first loads
    required init?(coder aDecoder: NSCoder){
        super.init(coder:aDecoder)
        playIdleAnimation()
    }
    
    func playIdleAnimation(){
        
        self.image = UIImage(named: "idle1.png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for x in 1..<5 {
            let img = UIImage(named: "idle\(x).png")
            imgArray.append(img!)
        }
        //Animations
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
        
    }
    
    func playDeathAnimation() {
        
        self.image = UIImage(named: "dead5.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for x in 1..<6 {
            let img = UIImage(named: "dead\(x).png")
            imgArray.append(img!)
        }
        //Animations
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
        
    }
    
}
