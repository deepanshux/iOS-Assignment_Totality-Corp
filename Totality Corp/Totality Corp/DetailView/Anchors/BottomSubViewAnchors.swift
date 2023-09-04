//
//  BottomSubViewAnchors.swift
//  Totality Corp
//
//  Created by Deepanshu Jain on 31/08/23.
//

import Foundation
import UIKit

class BottomSubViewAnchors {
    
    static func addBottomSubViewAnchor(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            child.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            child.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/2)
        ])
    }
    
    static func addTitleAnchors(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 120),
            child.trailingAnchor.constraint(equalTo: parent.trailingAnchor,constant: 0-120),
            child.topAnchor.constraint(equalTo: parent.topAnchor, constant: 40),
            child.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    static func addNextButtonAnchors(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            child.widthAnchor.constraint(equalToConstant: parent.frame.width/1.3),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/12),
            child.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -25)
        ])
    }
    
    static func addImageStackAnchors(child: UIView, relative:UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            child.widthAnchor.constraint(equalToConstant: parent.frame.width/1.6),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/7),
            child.topAnchor.constraint(equalTo: relative.bottomAnchor, constant: 16)
        ])
    }
    
    static func addSubtitleStackAnchors(child: UIView, relative:UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            child.widthAnchor.constraint(equalToConstant: parent.frame.width/1.5),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/24),
            child.topAnchor.constraint(equalTo: relative.bottomAnchor, constant: 12)
        ])
    }
    
    static func addRoundedImageAnchors(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.widthAnchor.constraint(equalToConstant: parent.frame.height/9),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/9),
        ])
        child.layer.cornerRadius = parent.frame.height/18
    }
    
    static func addSubTitleAnchors(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.widthAnchor.constraint(equalToConstant: parent.frame.height/7),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/24),
        ])
        child.layer.cornerRadius = parent.frame.height/20
    }


}
