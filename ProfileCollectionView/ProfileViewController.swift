//
//  ViewController.swift
//  ProfileCollectionView
//
//  Created by AL-Mustapha on 3/17/24.
//

import UIKit

class ProfileViewController: UICollectionViewController, UINavigationBarDelegate, UICollectionViewDelegateFlowLayout {

    var images: [UIImage] = [UIImage(named: "bruce")!, UIImage(named: "batfleck")!, UIImage(named: "batfleck_2")!]
   
    
    init () {
     
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 0
            layout.scrollDirection = .vertical
            layout.sectionHeadersPinToVisibleBounds = true
            
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(ProfileGeneralCollectionViewCell.self, forCellWithReuseIdentifier: ProfileGeneralCollectionViewCell.identifier)
        collectionView.register(ProfileSecondHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileSecondHeaderCollectionReusableView.identifier)
        collectionView.register(StretchyHeaderViewReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StretchyHeaderViewReusableView.identifier)
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: view.frame.height*2)
        ])
    }


}

extension ProfileViewController {
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            return 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileGeneralCollectionViewCell.identifier, for: indexPath) as? ProfileGeneralCollectionViewCell else {
            fatalError("Could not dequeue cell")
        }
        
        
        cell.configure(with: images)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if #available(iOS 16.0, *) {
            let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            return .init(width: view.frame.width, height: view.frame.height - 110 - statusBarHeight) // - 104
        } else {
            return .init(width: view.frame.width, height: view.frame.height - 110 - UIApplication.shared.statusBarFrame.height)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if indexPath.section == 0 {
                guard let firstHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StretchyHeaderViewReusableView.identifier, for: indexPath) as? StretchyHeaderViewReusableView else {
                    return UICollectionReusableView()
                }
                
                return firstHeader
            } else {
                guard let secondHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileSecondHeaderCollectionReusableView.identifier, for: indexPath) as? ProfileSecondHeaderCollectionReusableView else {
                    return UICollectionReusableView()
                }
                
                return secondHeader
            }
            
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.frame.size.width, height: 500)
        } else {
            return CGSize(width: collectionView.frame.size.width, height: 50)
        }
        
        
    }
}

