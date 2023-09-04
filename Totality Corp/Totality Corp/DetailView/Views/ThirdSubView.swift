//
//  SecondSubView.swift
//  Totality Corp
//
//  Created by Deepanshu Jain on 31/08/23.
//

import Foundation
import UIKit

class ThirdSubView{
    
    private let view : UIView!
    private let titleLabel1 = UILabel()
    private let titleLabel2 = UILabel()
    private let subTitleLabel = UILabel()
    
    private let roundedImage1 = RoundedImageView(frame: .zero)
    private let roundedImage2 = RoundedImageView(frame: .zero)
    private let roundedImage3 = RoundedImageView(frame: .zero)
    
    private let imageStackView = UIStackView()
    
     init(view: UIView) {
         self.view = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        configureTitle()
        configureSubtitle()
        configureImages()
    }
    
    private func configureTitle(){
        setupTitle1()
        setupTitle2()
        SecondSubViewAnimation.animateTitleLabel(child: titleLabel1, parent: view)
        SecondSubViewAnimation.animateTitleLabel(child: titleLabel2, parent: view)
    }
    
    private func configureImages(){
        setupImageStackView()
        ThirdSubViewAnchors.addRoundedImageAnchors(child: roundedImage1, parent: view)
        ThirdSubViewAnchors.addRoundedImageAnchors(child: roundedImage2, parent: view)
        ThirdSubViewAnchors.addRoundedImageAnchors(child: roundedImage3, parent: view)
        imageStackView.addArrangedSubview(roundedImage1)
        imageStackView.addArrangedSubview(roundedImage2)
        imageStackView.addArrangedSubview(roundedImage3)
        SecondSubViewAnimation.animateImageStack(child: imageStackView, parent: view)
    }
    
    private func configureSubtitle(){
        subTitleLabel.backgroundColor = .lightGray
        view.addSubview(subTitleLabel)
        ThirdSubViewAnchors.addSubTitleAnchors(child: subTitleLabel, relative: titleLabel2, parent: view)
    }
    
    private func setupTitle1(){
        view.addSubview(titleLabel1)
        titleLabel1.text = Constant.ReadyToPlayTitle
        titleLabel1.font = UIFont.systemFont(ofSize: 24)
        ThirdSubViewAnchors.addFirstTitleAnchors(child: titleLabel1, parent: view)
    }
    
    private func setupTitle2(){
        view.addSubview(titleLabel2)
        titleLabel2.text = Constant.OSWALDTitle
        titleLabel2.textAlignment = .center
        titleLabel2.font = UIFont.systemFont(ofSize: 28)
        ThirdSubViewAnchors.addSecondTitleAnchors(child: titleLabel2, relative: titleLabel1, parent: view)
    }
    
    private func setupImageStackView(){
        imageStackView.axis = .horizontal
        imageStackView.alignment = .center
        imageStackView.distribution = .equalSpacing
        imageStackView.spacing = 8
        view.addSubview(imageStackView)
        SecondSubViewAnchors.addImageStackAnchors(child: imageStackView, relative: subTitleLabel, parent: view)
    }
    
}

