//
//  ProgressButton.swift
//  Totality Corp
//
//  Created by Deepanshu Jain on 30/08/23.
//

import Foundation
import UIKit
import QuartzCore

class ProgressButton: UIButton {
    
    private let progressView = UIView()
    private let percentageLabel = UILabel()
    private var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProgressButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupProgressButton()
    }

    private func setupProgressButton() {
        
        clipsToBounds = true
        backgroundColor = .green // Set the default dark blue color
        translatesAutoresizingMaskIntoConstraints = false
        
        progressView.backgroundColor = .clear
        addSubview(progressView)
        
        // Set up percentage label
        addSubview(percentageLabel)
        percentageLabel.textAlignment = .center
        percentageLabel.textColor = .white // Set the text color
        
        percentageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            percentageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            percentageLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func setButtonConstraints(contentView: UIView){
        self.contentView = contentView
        // Add Auto Layout constraints
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            widthAnchor.constraint(equalToConstant: contentView.frame.width/1.1),
            heightAnchor.constraint(equalToConstant: contentView.frame.height/12),
            bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])

        let height = contentView.frame.height/12
        layer.cornerRadius = height/2
    }
    
    func updateButtonConstraints(contentView: UIView){
        // Add Auto Layout constraints
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: contentView.frame.height/12),
            trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 0-contentView.frame.height/12),
            leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: (contentView.frame.width-contentView.frame.width/1.1)/2),
            bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])

        let height = contentView.frame.height/12
        layer.cornerRadius = height/2
    }
    
    func animateFill(withDuration duration: TimeInterval, color: UIColor, replacementColor: UIColor, completion: @escaping () -> Void) {
        
        progressView.backgroundColor = color
        progressView.frame = CGRect(x: 0, y: 0, width: 0, height: frame.height)

        var currentPercentage: CGFloat = 0
        
        reduceWidthAnimation()
        
        UIView.animate(withDuration: duration, animations: {
            self.progressView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        }) { _ in
            self.percentageLabel.text = "100%"
            completion()
        }
        
        let timer = Timer.scheduledTimer(withTimeInterval: duration / 100, repeats: true) { timer in
            currentPercentage += 1
            self.percentageLabel.text = "\(Int(currentPercentage))%"
            if currentPercentage >= 100 {
                timer.invalidate()
            }
        }
        RunLoop.main.add(timer, forMode: .common)
    }
    
    private func reduceWidthAnimation(){
        UIView.animate(withDuration: 1.0) {
            self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.size.width/1.3, height: self.frame.size.height)
        }
    }
    
}

