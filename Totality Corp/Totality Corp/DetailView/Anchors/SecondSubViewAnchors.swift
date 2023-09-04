//
//  SecondSubViewAnchors.swift
//  Totality Corp
//
//  Created by Deepanshu Jain on 31/08/23.
//

import Foundation
import UIKit

class SecondSubViewAnchors {
    
    static func addTitleAnchors(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 120),
            child.trailingAnchor.constraint(equalTo: parent.trailingAnchor,constant: 0-120),
            child.topAnchor.constraint(equalTo: parent.topAnchor, constant: 40),
            child.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    static func addImageStackAnchors(child: UIView, relative:UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            child.widthAnchor.constraint(equalToConstant: parent.frame.width/1.6),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/6),
            child.topAnchor.constraint(equalTo: relative.bottomAnchor, constant: 16)
        ])
    }
    
    static func addRoundedImageAnchors(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.widthAnchor.constraint(equalToConstant: parent.frame.height/6),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/6),
        ])
        child.layer.cornerRadius = parent.frame.height/12
    }
    
    static func addSubTitleAnchors(child: UIView, relative: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            child.widthAnchor.constraint(equalToConstant: parent.frame.height/4),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/22),
            child.topAnchor.constraint(equalTo: relative.bottomAnchor, constant: 30)
        ])
        child.layer.cornerRadius = parent.frame.height/10
    }
    
    static func addWalletStackAnchors(child: UIView, relative:UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            child.widthAnchor.constraint(equalToConstant: parent.frame.width/1.2),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/12),
            child.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: 0-100)
        ])
    }
    
    static func addWalletLabelAnchors(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.widthAnchor.constraint(equalToConstant: parent.frame.width/8),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/22),
        ])
    }

}
