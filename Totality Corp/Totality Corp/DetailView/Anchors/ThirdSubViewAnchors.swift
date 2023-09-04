//
//  ThirdSubViewAnchors.swift
//  Totality Corp
//
//  Created by Deepanshu Jain on 31/08/23.
//

import Foundation
import UIKit

class ThirdSubViewAnchors {
    static func addFirstTitleAnchors(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            child.topAnchor.constraint(equalTo: parent.topAnchor, constant: 36),
            child.heightAnchor.constraint(equalToConstant: 30),
            child.widthAnchor.constraint(equalToConstant: parent.frame.width/2.2)
        ])
    }
    
    static func addSecondTitleAnchors(child: UIView, relative: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            child.topAnchor.constraint(equalTo: relative.bottomAnchor, constant: 8),
            child.heightAnchor.constraint(equalToConstant: 40),
            child.widthAnchor.constraint(equalToConstant: parent.frame.width/2.5)
        ])
    }
    
    static func addSubTitleAnchors(child: UIView, relative: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            child.widthAnchor.constraint(equalToConstant: parent.frame.height/4),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/22),
            child.topAnchor.constraint(equalTo: relative.bottomAnchor, constant: 20)
        ])
        child.layer.cornerRadius = parent.frame.height/10
    }
    
    static func addImageStackAnchors(child: UIView, relative:UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            child.widthAnchor.constraint(equalToConstant: parent.frame.width/1.2),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/6),
            child.topAnchor.constraint(equalTo: relative.bottomAnchor, constant: 16)
        ])
    }
    
    static func addRoundedImageAnchors(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.widthAnchor.constraint(equalToConstant: parent.frame.height/6),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/8),
        ])
        child.layer.cornerRadius = (parent.frame.height/6)/2.5
    }
}
