//
//  DetailViewAnchors.swift
//  Totality Corp
//
//  Created by Deepanshu Jain on 31/08/23.
//

import Foundation
import UIKit

class DetailViewAnchors {
    
    static func addLogoImageAnchor(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: 0),
            child.leadingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            child.widthAnchor.constraint(equalToConstant: 120),
            child.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    static func addTitleAnchor(child: UIView, relativeView: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.leadingAnchor.constraint(equalTo: relativeView.trailingAnchor, constant: 12),
            child.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: 16),
            child.trailingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    static func addDescriptionAnchor(child: UIView, relativeView: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: relativeView.bottomAnchor, constant: 16),
            child.leadingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            child.trailingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    static func addCloseButtonAnchor(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: 10),
            child.trailingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.trailingAnchor, constant: -36)
        ])
    }
    
    static func addReadMoreAnchor(child: UIView,relativeView: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.centerXAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerXAnchor),
            child.topAnchor.constraint(equalTo: relativeView.bottomAnchor, constant: 22),
        ])
    }
    
    static func addCollectionViewAnchor(child: UIView,relativeView: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: relativeView.bottomAnchor, constant: 120),
            child.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            child.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/2.5)
        ])
    }
    
    static func addTranslucentBackgroundAnchor(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            child.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            child.widthAnchor.constraint(equalToConstant: parent.frame.width),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height)
        ])
    }
    
    static func addBottomSubViewAnchor(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            child.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            child.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/2)
        ])
    }
    
    static func addCancelButtonAnchor(child: UIView, parent: UIView){
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.trailingAnchor.constraint(equalTo: parent.trailingAnchor,constant: 0-10),
            child.widthAnchor.constraint(equalToConstant: parent.frame.height/14),
            child.heightAnchor.constraint(equalToConstant: parent.frame.height/14),
            child.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -20)
        ])
        let height = parent.frame.height/12
        child.layer.cornerRadius = height/2
    }
}
