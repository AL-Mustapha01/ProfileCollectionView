//
//  ProfileTabBarCollectionView.swift
//  ProfileCollectionView
//
//  Created by AL-Mustapha on 3/17/24.
//

import UIKit

protocol ProfileTabBarCollectionViewDelegate {
    func didTapTabItem(indexPath: IndexPath)
}

class ProfileTabBarCollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    fileprivate let tabItems = ["pencil.and.outline", "photo", "film", "text.quote", "waveform.path"]
    
    let menuBar: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = UIColor.label
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    var delegate: ProfileTabBarCollectionViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        collectionView.backgroundColor = .systemBackground
        collectionView.allowsSelection = true
        collectionView.register(ProfileTabCollectionViewCell.self, forCellWithReuseIdentifier: ProfileTabCollectionViewCell.identifier)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }
        
        view.addSubview(menuBar)
        
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
        menuBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
       
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabItems.count
    }
     
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileTabCollectionViewCell.identifier, for: indexPath) as? ProfileTabCollectionViewCell else {
            fatalError("Could not dequeue cell")
        }
        cell.imageView.image = UIImage(systemName: "\(tabItems[indexPath.item])")
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let x = view.width / 5 * CGFloat(indexPath.item)
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
//            self.menuBar.transform = CGAffineTransform(translationX: x, y: 0)
//        }
       
        delegate?.didTapTabItem(indexPath: indexPath)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        let height = view.frame.height
        
        return CGSize(width: width/5, height: height)
    }

}
