//
//  FirstSubViewAnimation.swift
//  Totality Corp
//
//  Created by Deepanshu Jain on 31/08/23.
//

import Foundation
import UIKit

class FirstSubViewAnimation{
    static func animateTitleLabel(child:UIView, parent: UIView) {
        child.frame = CGRect(x: parent.frame.width, y: parent.frame.height/2-20, width: 100, height: 40)
        
        // Animate the change in constraints
        UIView.animate(withDuration: 5.0, delay: 0.0, options: [.curveEaseInOut], animations: {
            child.frame.origin.x = 0-parent.frame.width
            child.frame.origin.y = parent.frame.height/2 - 20
        }, completion: nil)
    }
    
    static func animateImageStack(child:UIView, parent: UIView) {
        child.frame = CGRect(x: parent.frame.width, y: parent.frame.height/2 - 40, width: 300, height: 100)
        
        // Animate the change in constraints
        UIView.animate(withDuration: 3.0, delay: 0.5, options: [.curveEaseInOut], animations: {
            child.frame.origin.x = 0-parent.frame.width
            child.frame.origin.y = parent.frame.height/2 - 40
        }, completion: nil)
    }
    
    static func animateSubtitleStack(child:UIView, parent: UIView) {
        child.frame = CGRect(x: parent.frame.width, y: parent.frame.height/2 - 40, width: 300, height: 100)
        
        // Animate the change in constraints
        UIView.animate(withDuration: 5.0, delay: 0.5, options: [.curveEaseInOut], animations: {
            child.frame.origin.x = 0-parent.frame.width
            child.frame.origin.y = parent.frame.height/2 - 40
        }, completion: nil)
    }
}
