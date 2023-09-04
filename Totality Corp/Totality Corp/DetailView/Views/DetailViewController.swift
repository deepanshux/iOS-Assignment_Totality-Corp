//
//  DetailViewController.swift
//  Totality Corp
//
//  Created by Deepanshu Jain on 29/08/23.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private let logoImage = UIImageView()
    
    private let cancelProgressButton = UIButton(type: .system)
    private let closeButton = UIButton(type: .system)
    private let readMoreButton = UIButton(type: .system)
    private let progressButton = ProgressButton()
    private let playButton = CustomButton(type: .system)
    
    var translucentBackgroundView = UIView(frame: .zero)
    var bottomSubView = BottomSubView()
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.setHidesBackButton(true, animated: true)
        setupUI()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        setLogoImage()
        setTitle()
        setDescription()
        setCloseButton()
        setReadMoreButton()
        setupCollectionView()
        setupProgressButton()
    }
    
    private func setLogoImage(){
        logoImage.backgroundColor = .yellow
        logoImage.clipsToBounds = true
        view.addSubview(logoImage)
        DetailViewAnchors.addLogoImageAnchor(child: logoImage, parent: view)
        logoImage.layer.cornerRadius = 20
    }
    
    private func setTitle(){
        titleLabel.numberOfLines = 2
        titleLabel.text = Constant.CandtBustTitle
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        view.addSubview(titleLabel)
        DetailViewAnchors.addTitleAnchor(child: titleLabel, relativeView: logoImage, parent: view)
    }
    
    private func setDescription(){
        setInitialDescription()
        view.addSubview(descriptionLabel)
        DetailViewAnchors.addDescriptionAnchor(child: descriptionLabel, relativeView: logoImage, parent: view)
    }
    
    private func setInitialDescription(){
        descriptionLabel.numberOfLines = 2
        descriptionLabel.text = Constant.dummyText
    }
    
    private func setDetailDescription(){
        descriptionLabel.numberOfLines = 4
        descriptionLabel.text = Constant.largeDummyText
    }
    
    private func setCloseButton(){

        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.addTarget(self, action: #selector(backButtonTap), for: .touchUpInside)
    
        view.addSubview(closeButton)
        DetailViewAnchors.addCloseButtonAnchor(child: closeButton, parent: view)

        // Using frame-based positioning
        closeButton.frame = CGRect(x: view.bounds.width - 40, y: 0, width: 40, height: 40)
        closeButton.setTitleColor(.black, for: .normal)
    }
    
    private func setReadMoreButton(){
        readMoreButton.setTitle("Read More", for: .normal)
        readMoreButton.setTitleColor(.green, for: .normal)
        readMoreButton.addTarget(self, action: #selector(readMoreButtonTap), for: .touchUpInside)
        view.addSubview(readMoreButton)
        DetailViewAnchors.addReadMoreAnchor(child: readMoreButton, relativeView: descriptionLabel, parent: view)
    }
    
    private func configureCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupCollectionView(){
        configureCollectionView()
        view.addSubview(collectionView)
        DetailViewAnchors.addCollectionViewAnchor(child: collectionView, relativeView: logoImage, parent: view)
    }
    
    private func setupProgressButton(){
        progressButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressButton)
        progressButton.setButtonConstraints(contentView: view)
        progressButton.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
    }
    
    private func setupBottomSubView(){
        bottomSubView = BottomSubView(frame: CGRect(x: 0, y: view.frame.height/2 , width: view.frame.width, height: view.frame.height))
        translucentBackgroundView.addSubview(bottomSubView)
        bottomSubView.setConstraints(parentView: view)
        bottomSubView.show()
    }
    
    private func setupPlayButton(){
        playButton.setButtonLayout(title: "Play", backgroundColor: .systemBlue)
        view.addSubview(playButton)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setButtonConstraints(contentView: view)
    }
    
    private func replaceWithPlayButton(){
        setupPlayButton()
        
        // Set Initial position of the Play Button
        playButton.frame = CGRect(x: progressButton.frame.origin.x, y: progressButton.frame.origin.y+progressButton.frame.size.height, width: progressButton.frame.size.width, height: progressButton.frame.size.height)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.playButton.alpha = 1.0
            self.playButton.frame = self.progressButton.frame
        })
        progressButton.removeFromSuperview()
    }
    
    private func setTranslucentBackgroundView(){
        translucentBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.addSubview(translucentBackgroundView)
        DetailViewAnchors.addTranslucentBackgroundAnchor(child: translucentBackgroundView, parent: view)
    }
    
    private func setupCrossButton(){
        cancelProgressButton.setImage(UIImage(named: "CrossButtonImage"), for: .normal)
        view.addSubview(cancelProgressButton)
        cancelProgressButton.addTarget(self, action: #selector(cancelProgress), for: .touchUpInside)
    }
    
    private func showCancelButton(){
        setupCrossButton()
        DetailViewAnchors.addCancelButtonAnchor(child: cancelProgressButton, parent: view)
    }
    
// MARK: - Button Tapped Methods
    
    @objc private func downloadButtonTapped() {
        progressButton.updateButtonConstraints(contentView: view)
        showCancelButton()
        progressButton.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        progressButton.animateFill(withDuration: 3.0, color: UIColor.green, replacementColor: UIColor.systemBlue, completion: {
            self.cancelProgressButton.removeFromSuperview()
            self.replaceWithPlayButton()
        })
    }
    
    @objc private func backButtonTap(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func readMoreButtonTap(){
        readMoreButton.removeFromSuperview()
        setDetailDescription()
    }
    
    @objc private func playButtonTapped() {
        setTranslucentBackgroundView()
        setupBottomSubView()
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        bottomSubView.hide {
            self.translucentBackgroundView.removeFromSuperview()
        }
    }
    
    @objc private func cancelProgress(_ sender: UITapGestureRecognizer) {
        // Handle the logic
    }
}

// MARK: - Extension for Collection View Delegate Methods

extension DetailViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = .lightGray
        cell.contentView.layer.cornerRadius = 5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height)
    }
}
