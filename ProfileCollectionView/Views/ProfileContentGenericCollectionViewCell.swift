//
//  ProfileContentGenericCollectionViewCell.swift
//  ProfileCollectionView
//
//  Created by AL-Mustapha on 3/17/24.
//

import UIKit

class ProfileContentGenericCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    static let identifier = "ProfileContentGenericCollectionViewCell"
    
    var images: [UIImage] = []
    
    let secondLevelCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var outerCollectionViewController: ProfileViewController?

//    MARK: - Init Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(secondLevelCollectionView)
        secondLevelCollectionView.delegate = self
        secondLevelCollectionView.dataSource = self
        secondLevelCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        secondLevelCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            secondLevelCollectionView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 40),
            secondLevelCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            secondLevelCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            secondLevelCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {
            fatalError("Could not dequeue cell")
        }
        
        cell.configure(with: images[indexPath.row])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = UICollectionViewFlowLayout()
        let size = (contentView.frame.size.width)/3.3
        layout.itemSize = CGSize(width: size, height: size)
        return layout.itemSize
    }
    
    public func configure(with images: [UIImage]) {
        self.images = images
        secondLevelCollectionView.reloadData()
    }
}
