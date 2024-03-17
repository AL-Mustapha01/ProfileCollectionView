//
//  ProfileTabCollectionViewCell.swift
//  ProfileCollectionView
//
//  Created by AL-Mustapha on 3/17/24.
//

import UIKit

class ProfileTabCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProfileTabCollectionViewCell"
    
    let imageView: UIImageView = {

        let image = UIImageView()
        image.tintColor = .darkGray
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
        
    }()
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.label : .darkGray
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        contentView.addSubview(imageView)
        
//        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
