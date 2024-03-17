//
//  StretchyHeaderViewReusableView.swift
//  ProfileCollectionView
//
//  Created by AL-Mustapha on 3/17/24.
//

import UIKit

class StretchyHeaderViewReusableView: UICollectionReusableView {
    static let identifier = "StretchyHeaderViewReusableView"
    
    public var profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "bruce")
        imageView.isUserInteractionEnabled = true
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    
    public var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBackground
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "batfleck")
        
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundImageView)
        self.addSubview(profilePhotoImageView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundImageView.frame = self.bounds
        
        profilePhotoImageView.frame = CGRect(
            center: CGPoint(
                x: self.bounds.centerX,
                y: (self.bounds.centerY/2) + 20),
            size: CGSize(
                width: self.frame.height/4,
                height: self.frame.height/4))
        profilePhotoImageView.layer.cornerRadius = self.frame.height/8.0
        
    }
    
}
    
    
    
    extension CGRect {
        /** Creates a rectangle with the given center and dimensions
         - parameter center: The center of the new rectangle
         - parameter size: The dimensions of the new rectangle
         */
        init(center: CGPoint, size: CGSize)
        {
            self.init(x: center.x - size.width / 2, y: center.y - size.height / 2, width: size.width, height: size.height)
        }
        
        /** the coordinates of this rectangles center */
        var center: CGPoint
        {
            get { return CGPoint(x: centerX, y: centerY) }
            set { centerX = newValue.x; centerY = newValue.y }
        }
        
        /** the x-coordinate of this rectangles center
         - note: Acts as a settable midX
         - returns: The x-coordinate of the center
         */
        var centerX: CGFloat
        {
            get { return midX }
            set { origin.x = newValue - width * 0.5 }
        }
        
        /** the y-coordinate of this rectangles center
         - note: Acts as a settable midY
         - returns: The y-coordinate of the center
         */
        var centerY: CGFloat
        {
            get { return midY }
            set { origin.y = newValue - height * 0.5 }
        }
        
        // MARK: - "with" convenience functions for finding the center of a CGRect
        
        /** Same-sized rectangle with a new center
         - parameter center: The new center, ignored if nil
         - returns: A new rectangle with the same size and a new center
         */
        func with(center: CGPoint?) -> CGRect
        {
            return CGRect(center: center ?? self.center, size: size)
        }
        
        /** Same-sized rectangle with a new center-x
         - parameter centerX: The new center-x, ignored if nil
         - returns: A new rectangle with the same size and a new center
         */
        func with(centerX: CGFloat?) -> CGRect
        {
            return CGRect(center: CGPoint(x: centerX ?? self.centerX, y: centerY), size: size)
        }
        
        /** Same-sized rectangle with a new center-y
         - parameter centerY: The new center-y, ignored if nil
         - returns: A new rectangle with the same size and a new center
         */
        func with(centerY: CGFloat?) -> CGRect
        {
            return CGRect(center: CGPoint(x: centerX, y: centerY ?? self.centerY), size: size)
        }
        
        /** Same-sized rectangle with a new center-x and center-y
         - parameter centerX: The new center-x, ignored if nil
         - parameter centerY: The new center-y, ignored if nil
         - returns: A new rectangle with the same size and a new center
         */
        func with(centerX: CGFloat?, centerY: CGFloat?) -> CGRect
        {
            return CGRect(center: CGPoint(x: centerX ?? self.centerX, y: centerY ?? self.centerY), size: size)
        }
    }


