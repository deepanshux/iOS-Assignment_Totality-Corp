//
//  CustomButton.swift
//  Totality Corp
//
//  Created by Deepanshu Jain on 29/08/23.
//

import Foundation
import UIKit

class CustomButton : UIButton{

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    func setButtonLayout (title : String, backgroundColor : UIColor){
        configureButton(title: title, backgroundColor: backgroundColor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureButton(title : String = "", backgroundColor : UIColor = .blue){
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        self.backgroundColor = backgroundColor
    }

    func setButtonConstraints(contentView: UIView){
        // Add Auto Layout constraints
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            widthAnchor.constraint(equalToConstant: contentView.frame.width/1.2),
            heightAnchor.constraint(equalToConstant: contentView.frame.height/12),
            bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])

        let height = contentView.frame.height/12
        layer.cornerRadius = height/2
    }
}
