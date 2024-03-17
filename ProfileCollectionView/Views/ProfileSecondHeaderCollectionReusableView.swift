//
//  ProfileSecondHeaderCollectionReusableView.swift
//  ProfileCollectionView
//
//  Created by AL-Mustapha on 3/17/24.
//

import UIKit

class ProfileSecondHeaderCollectionReusableView: UICollectionReusableView, ProfileTabBarCollectionViewDelegate {
    static let identifier = "ProfileSecondHeaderCollectionReusableView"
    
    var profileTabBarController = ProfileTabBarCollectionView(collectionViewLayout: UICollectionViewFlowLayout())
    
    let scrollView = UIScrollView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tabControllerView = profileTabBarController.view!
        tabControllerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tabControllerView)

        NSLayoutConstraint.activate([
            tabControllerView.topAnchor.constraint(equalTo: self.topAnchor),
            tabControllerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tabControllerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tabControllerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didTapTabItem(indexPath: IndexPath) {

    }
}
