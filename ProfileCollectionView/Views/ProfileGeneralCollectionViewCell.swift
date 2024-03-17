//
//  ProfileGeneralCollectionViewCell.swift
//  ProfileCollectionView
//
//  Created by AL-Mustapha on 3/17/24.
//

import UIKit

class ProfileGeneralCollectionViewCell: UICollectionViewCell,  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, ProfileTabBarCollectionViewDelegate {
    
    static let identifier = "ProfileGeneralCollectionViewCell"
    
    let genericCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var images: [UIImage] = []
//    MARK: - I am trying to move this profile Tab controller into the UIcollectionreusable you see duplicated when you run the app.
//    This will be important to pin layout.sectionHeadersPinToVisibleBounds = true just like on Twitter and Instagram
    
    let profileTabBarController = ProfileTabBarCollectionView(collectionViewLayout: UICollectionViewFlowLayout())
    let profileSecondHeader = ProfileSecondHeaderCollectionReusableView()
    
    let test: [UIColor] = [UIColor.systemRed, UIColor.systemGreen, UIColor.systemBlue, UIColor.systemYellow, UIColor.systemMint]

   
    
    
  
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let offset = x/5
        profileTabBarController.menuBar.transform = CGAffineTransform(translationX: offset, y: 0)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let item = Int(x / contentView.bounds.width + 0.5)
        let indexPath = IndexPath(item: item, section: 0)
        
        profileTabBarController.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpLayout()
        contentView.addSubview(genericCollectionView)
        genericCollectionView.register(ProfileContentGenericCollectionViewCell.self, forCellWithReuseIdentifier: ProfileContentGenericCollectionViewCell.identifier)
        genericCollectionView.isPagingEnabled = true
        genericCollectionView.dataSource = self
        genericCollectionView.delegate = self
        genericCollectionView.showsHorizontalScrollIndicator = false
        genericCollectionView.allowsSelection = true
//        genericCollectionView.clipsToBounds = true
        
        profileTabBarController.delegate = self
        profileTabBarController.collectionView.selectItem(at: [0, 0], animated: true, scrollPosition: .centeredHorizontally)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpLayout() {
        let profileTab = profileTabBarController.view!
        
//        profileTab.backgroundColor = .systemBackground
        genericCollectionView.allowsSelection = true
        contentView.addSubview(profileTab)
        contentView.addSubview(genericCollectionView)
        
        profileTab.translatesAutoresizingMaskIntoConstraints = false
        genericCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            // Menu view constraints
            profileTab.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileTab.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileTab.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            profileTab.heightAnchor.constraint(equalToConstant: 60),
            
            // Collection view constraints
            genericCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            genericCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            genericCollectionView.topAnchor.constraint(equalTo: profileTab.bottomAnchor, constant: 10),
            genericCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
            
        case 0:
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileContentGenericCollectionViewCell.identifier, for: indexPath) as? ProfileContentGenericCollectionViewCell else {
                fatalError("Could not dequeue cell")
            }
            
            cell.configure(with: images)
            return cell
            
        case 1:

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileContentGenericCollectionViewCell.identifier, for: indexPath) as? ProfileContentGenericCollectionViewCell else {
                fatalError("Could not dequeue cell")
            }
            
            cell.configure(with: images)
            return cell
            
            
        case 2:
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileContentGenericCollectionViewCell.identifier, for: indexPath) as? ProfileContentGenericCollectionViewCell else {
                fatalError("Could not dequeue cell")
            }
            
            cell.configure(with: images)
            return cell
            
            
        case 3:

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileContentGenericCollectionViewCell.identifier, for: indexPath) as? ProfileContentGenericCollectionViewCell else {
                fatalError("Could not dequeue cell")
            }
            
            cell.configure(with: images)
            return cell
            
            
        case 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileContentGenericCollectionViewCell.identifier, for: indexPath) as? ProfileContentGenericCollectionViewCell else {
                
               fatalError("Could not dequeue cell")
            }
            
            cell.configure(with: images)
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            
           return cell
        }
   
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width - 10, height: contentView.frame.height)
    }
    
    func didTapTabItem(indexPath: IndexPath) {
        
        let rect = self.genericCollectionView.layoutAttributesForItem(at: indexPath)?.frame
        self.genericCollectionView.scrollRectToVisible(rect!, animated: true)
       
    }

    
    public func configure(with images: [UIImage]) {
        self.images = images
        genericCollectionView.reloadData()
    }
    
}
