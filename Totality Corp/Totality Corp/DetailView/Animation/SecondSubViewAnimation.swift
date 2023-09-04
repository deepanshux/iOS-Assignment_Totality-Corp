//
//  SecondSubViewAnimation.swift
//  Totality Corp
//
//  Created by Deepanshu Jain on 31/08/23.
//

import Foundation

import UIKit

class SecondSubViewAnimation{
    
    static func animateTitleLabel(child:UIView, parent: UIView) {
        child.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut], animations: {
            child.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    static func animateImageStack(child:UIView, parent: UIView) {
        child.frame = CGRect(x: parent.frame.width, y: parent.frame.height/2 - 40, width: 300, height: 100)
        
        // Animate the change in constraints
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [.curveEaseInOut], animations: {
            child.frame.origin.x = 0-parent.frame.width
            child.frame.origin.y = parent.frame.height/2 - 40
        }, completion: nil)
    }
}
