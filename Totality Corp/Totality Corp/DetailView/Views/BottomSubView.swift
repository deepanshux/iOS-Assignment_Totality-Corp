//
//  BottomSubView.swift
//  Totality Corp
//
//  Created by Deepanshu Jain on 30/08/23.
//

import Foundation
import UIKit

class BottomSubView : UIView {
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let subTitleLabe2 = UILabel()
    
    private let nextButton = CustomButton(frame: .zero)

    private let roundedImage1 = RoundedImageView(frame: .zero)
    private let roundedImage2 = RoundedImageView(frame: .zero)
    
    private let imageStackView = UIStackView()
    private let subtitleStackView = UIStackView()
    
    private var buttonCount = 1
    
    var secondSubView : SecondSubView!
    var thirdSubView : ThirdSubView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        // Additional setup for the subview
        backgroundColor = .white
    }
    
    func show() {
        transform = CGAffineTransform(translationX: 0, y: frame.height)
        isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.transform = .identity
            self.configureUIElements()
        }
    }
    
    func hide(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.5) {
            self.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
        } completion: { _ in
            self.removeFromSuperview()
            completion()
        }
    }
    
    func setConstraints(parentView: UIView){
        BottomSubViewAnchors.addBottomSubViewAnchor(child: self, parent: parentView)
    }
    
    private func configureUIElements(){
        configureTitle()
        configureButton()
        configureImages()
        configureSubtitle()
    }
    
    private func configureTitle(){
        setupTitle()
        FirstSubViewAnimation.animateTitleLabel(child: titleLabel, parent: self)
    }
    
    private func configureButton(){
        setupNextButton()
    }
    
    private func configureImages(){
        setupImageStackView()
        BottomSubViewAnchors.addRoundedImageAnchors(child: roundedImage1, parent: self)
        BottomSubViewAnchors.addRoundedImageAnchors(child: roundedImage2, parent: self)
        imageStackView.addArrangedSubview(roundedImage1)
        imageStackView.addArrangedSubview(roundedImage2)
        FirstSubViewAnimation.animateImageStack(child: imageStackView, parent: self)
    }
    
    private func configureSubtitle(){
        setupSubtitleStackView()
        subTitleLabel.backgroundColor = .lightGray
        subTitleLabe2.backgroundColor = .lightGray
        BottomSubViewAnchors.addSubTitleAnchors(child: subTitleLabel, parent: self)
        BottomSubViewAnchors.addSubTitleAnchors(child: subTitleLabe2, parent: self)
        subtitleStackView.addArrangedSubview(subTitleLabel)
        subtitleStackView.addArrangedSubview(subTitleLabe2)
        FirstSubViewAnimation.animateSubtitleStack(child: subtitleStackView, parent: self)
    }
    
    private func setupTitle(){
        addSubview(titleLabel)
        titleLabel.backgroundColor = .lightGray
        BottomSubViewAnchors.addTitleAnchors(child: titleLabel, parent: self)
    }
    
    private func setupImageStackView(){
        imageStackView.axis = .horizontal
        imageStackView.alignment = .center
        imageStackView.distribution = .equalSpacing
        addSubview(imageStackView)
        BottomSubViewAnchors.addImageStackAnchors(child: imageStackView, relative: titleLabel, parent: self)
    }
    
    private func setupSubtitleStackView(){
        subtitleStackView.axis = .horizontal
        subtitleStackView.alignment = .center
        subtitleStackView.distribution = .equalSpacing
        addSubview(subtitleStackView)
        BottomSubViewAnchors.addSubtitleStackAnchors(child: subtitleStackView, relative: imageStackView, parent: self)
    }
    
    private func setupNextButton(){
        nextButton.setButtonLayout(title: "Next", backgroundColor: .systemGreen)
        addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        BottomSubViewAnchors.addNextButtonAnchors(child: nextButton, parent: self)
        nextButton.layer.cornerRadius = frame.height/24
    }
    
    @objc private func nextButtonTapped(){
        switch (buttonCount){
            case 1:
                setupSecondSubView()
            case 2:
                setupThirdSubView()
            default :
                return
        }
        buttonCount += 1
    }
    
    private func setupSecondSubView(){
        removeUIFromSuperview()
        secondSubView = SecondSubView(view: self)
        secondSubView.setupUI()
    }
    
    private func setupThirdSubView(){
        secondSubView.removeElements()
        nextButton.backgroundColor = .darkGray
        nextButton.setTitle("Confirm", for: .normal)
        thirdSubView = ThirdSubView(view: self)
        thirdSubView.setupUI()
    }
    
    private func removeUIFromSuperview() {
        titleLabel.removeFromSuperview()
        imageStackView.removeFromSuperview()
        subtitleStackView.removeFromSuperview()
    }
}
