//
//  SecondSubView.swift
//  Totality Corp
//
//  Created by Deepanshu Jain on 31/08/23.
//

import Foundation
import UIKit

class SecondSubView{
    
    private let view : UIView!
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let walletBalanceLabel = UILabel()
    private let walletBalanceValueLabel = UILabel()
    private let walletLabel1 = UILabel()
    private let walletLabel2 = UILabel()
    
    private let roundedImage1 = RoundedImageView(frame: .zero)
    private let roundedImage2 = RoundedImageView(frame: .zero)
    private let roundedImage3 = RoundedImageView(frame: .zero)
    
    private let imageStackView = UIStackView()
    private let walletBalanceStackView = UIStackView()
    private let balanceStackView = UIStackView()
    private let otherBalanceStackView = UIStackView()
    
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
        configureWalletBalanceStack()
    }
    
    func removeElements(){
        titleLabel.removeFromSuperview()
        subTitleLabel.removeFromSuperview()
        imageStackView.removeFromSuperview()
    }
    
    private func configureTitle(){
        setupTitle()
        SecondSubViewAnimation.animateTitleLabel(child: titleLabel, parent: view)
    }
    
    private func configureImages(){
        setupImageStackView()
        SecondSubViewAnchors.addRoundedImageAnchors(child: roundedImage1, parent: view)
        SecondSubViewAnchors.addRoundedImageAnchors(child: roundedImage2, parent: view)
        SecondSubViewAnchors.addRoundedImageAnchors(child: roundedImage3, parent: view)
        imageStackView.addArrangedSubview(roundedImage1)
        imageStackView.addArrangedSubview(roundedImage2)
        imageStackView.addArrangedSubview(roundedImage3)
        SecondSubViewAnimation.animateImageStack(child: imageStackView, parent: view)
    }
    
    private func configureSubtitle(){
        subTitleLabel.backgroundColor = .lightGray
        view.addSubview(subTitleLabel)
        SecondSubViewAnchors.addSubTitleAnchors(child: subTitleLabel, relative: titleLabel, parent: view)
    }
    
    private func setupTitle(){
        view.addSubview(titleLabel)
        titleLabel.backgroundColor = .lightGray
        SecondSubViewAnchors.addTitleAnchors(child: titleLabel, parent: view)
    }
    
    private func setupImageStackView(){
        imageStackView.axis = .horizontal
        imageStackView.alignment = .center
        imageStackView.distribution = .equalSpacing
        view.addSubview(imageStackView)
        SecondSubViewAnchors.addImageStackAnchors(child: imageStackView, relative: subTitleLabel, parent: view)
    }
    
    private func configureWalletBalanceStack(){
        walletBalanceStackView.axis = .horizontal
        walletBalanceStackView.alignment = .fill
        walletBalanceStackView.distribution = .equalSpacing
        setupWalletBalance()
        setupOtherBalance()
        walletBalanceStackView.addArrangedSubview(balanceStackView)
        walletBalanceStackView.addArrangedSubview(otherBalanceStackView)
        view.addSubview(walletBalanceStackView)
        SecondSubViewAnchors.addWalletStackAnchors(child: walletBalanceStackView, relative: imageStackView, parent: view)
    }
    
    private func setupWalletBalance(){
        balanceStackView.axis = .horizontal
        balanceStackView.alignment = .center
        balanceStackView.spacing = 4
        walletBalanceLabel.text = Constant.WalletBalanceText
        walletBalanceValueLabel.backgroundColor = .lightGray
        SecondSubViewAnchors.addWalletLabelAnchors(child: walletBalanceValueLabel, parent: view)
        balanceStackView.addArrangedSubview(walletBalanceLabel)
        balanceStackView.addArrangedSubview(walletBalanceValueLabel)
    }
    
    private func setupOtherBalance(){
        otherBalanceStackView.axis = .horizontal
        otherBalanceStackView.alignment = .center
        otherBalanceStackView.spacing = 8
        walletLabel1.backgroundColor = .lightGray
        walletLabel2.backgroundColor = .lightGray
        SecondSubViewAnchors.addWalletLabelAnchors(child: walletLabel1, parent: view)
        SecondSubViewAnchors.addWalletLabelAnchors(child: walletLabel2, parent: view)
        otherBalanceStackView.addArrangedSubview(walletLabel1)
        otherBalanceStackView.addArrangedSubview(walletLabel2)
    }
    
}
