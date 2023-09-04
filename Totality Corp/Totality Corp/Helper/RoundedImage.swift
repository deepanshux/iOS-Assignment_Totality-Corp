//
//  RoundedImage.swift
//  Totality Corp
//
//  Created by Deepanshu Jain on 31/08/23.
//

import Foundation
import UIKit

class RoundedImageView : UIImageView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImage(){
        contentMode = .scaleAspectFit
        clipsToBounds = true
        layer.cornerRadius = min(frame.size.width, frame.size.height) / 2
        backgroundColor = .lightGray
    }
}
