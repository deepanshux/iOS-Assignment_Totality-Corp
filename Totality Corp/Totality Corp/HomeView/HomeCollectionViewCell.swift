//
//  HomeCollectionViewCell.swift
//  Totality Corp
//
//  Created by Deepanshu Jain on 28/08/23.
//

import Foundation
import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let customButton = CustomButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImageView()
        setButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setImageViewLayout()
        customButton.setButtonConstraints(contentView: contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setButton() {
        customButton.setButtonLayout(title: "", backgroundColor: .green)
        contentView.addSubview(customButton)
        customButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setImageView(){
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .yellow
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
    }
    
    private func setImageViewLayout(){
        imageView.layer.cornerRadius = 20
        imageView.frame = CGRect(x: 20, y: 30, width: 100, height: 100)
    }
}
