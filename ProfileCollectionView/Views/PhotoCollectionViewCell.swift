//
//  PhotoCollectionViewCell.swift
//  ProfileCollectionView
//
//  Created by AL-Mustapha on 3/17/24.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    var shimmerLayer: CALayer?
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.tintColor = .secondarySystemBackground
        
        return imageView
    }()
    
    let noPubImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        
        return imageView
    }()
    
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.addSubview(imageView)
        contentView.layer.cornerRadius = 4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = contentView.frame.height/18
        imageView.frame = contentView.bounds
       
       
        
        
    }
    
    func showLoading() {
        let light = UIColor(white: 0, alpha: 0.1).cgColor
        

        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, light, UIColor.clear.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.525)
        gradient.locations = [0.4, 0.5, 0.6]

        gradient.frame = CGRect(x: -contentView.bounds.width, y: 0, width: contentView.bounds.width * 3, height: contentView.bounds.height)

        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9, 1.0]

        animation.repeatCount = .infinity
        animation.duration = 1.1
        animation.isRemovedOnCompletion = false

        gradient.add(animation, forKey: "shimmer")
        
        contentView.layer.addSublayer(gradient)
        
        shimmerLayer = gradient
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        
        shimmerLayer?.removeFromSuperlayer()
    }
    
    func configure(with image: UIImage) {
        imageView.image = image
       
    }
}
