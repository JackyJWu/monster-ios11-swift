//
//  DragImage.swift
//  monster
//
//  Created by Jacky on 2018-01-02.
//  Copyright © 2018 Jacky. All rights reserved.
//

import Foundation
import UIKit

class DragImg: UIImageView{
    
    var originalPosition: CGPoint!
    //person dropping to (why limit to just objects when u can just do uiview)
    var dropTarget: UIView?
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Save off where we started
        originalPosition = self.center
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            //know where finger touched in super view
            let position = touch.location(in: self.superview)
            //whereever ur finger is pointing , move object
            self.center = CGPoint(x: position.x, y: position.y)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //if theres a value (touch) and if there is a target
        if let touch = touches.first, let target = dropTarget{
            
            let position = touch.location(in: self.superview)
            
            //if its dropped in target frame then it means u dropped it on target
            if target.frame.contains(position){
                //if you dropped item on target make a notification so view controller knows what to drop next
                NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "onTargetDropped"), object: nil) as Notification)
            }
            
        }
        
        self.center=originalPosition

    }
    
    
    
    
}
