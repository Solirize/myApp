//
//  SecondViewController.swift
//  myApp
//
//  Created by Bennard brune Parker on 06/03/2020.
//  Copyright © 2020 Solirize. All rights reserved.
//

import UIKit
import GoogleSignIn

class SecondViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellId = "CellID"
    let headerCellId = "headerCellId"
    
    let names = [
        ["plane_forest", "Steve", "John"],
        ["Karl", "Pepegan!"],
        ["Freddy", "Alex", "plane_forest", "Megan", "Steve", "Megan", "plane_forest", "Steve"],
        ["Pepegan!"],
        ["Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve"]
    ]
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(names[indexPath.section][indexPath.row])
    }
    
    override func loadView() {
        super.loadView()
        setupNavBar()
        setupView()
    }
    
    func setupView() {
        collectionView?.register(MyCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerCellId)
        collectionView?.backgroundColor = .lightGray
    }
    
    func setupNavBar() {
        navigationItem.title = "Hello there!"
        let rB = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rB.backgroundColor = .red
        rB.addTarget(self, action: #selector(handleRightButtonPress), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rB)
    }
}

extension SecondViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return names.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCell
        
        cell.imageView.image = UIImage(named: names[indexPath.section][indexPath.row])
        cell.backgroundColor = .orange
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = self.view.bounds.width / 3
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerCellId, for: indexPath) as! HeaderCell
        
        headerView.backgroundColor = .darkGray
        headerView.titleView.font = UIFont(name: "Zapfino", size: 16.0)
        headerView.titleView.text = "Section " + String(indexPath.section)
        return headerView
    }
}

extension   SecondViewController {
    @objc func handleLeftButtonPress(){
        print("hello")
        GIDSignIn.sharedInstance().signOut()
        dismiss(animated: false, completion: nil)
    }
    @objc func handleRightButtonPress(){
        let ac = UIAlertController(title: "End!", message: "Have a good day!", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true, completion: nil)
    }
}
