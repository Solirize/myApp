//
//  MyCell.swift
//  myApp
//
//  Created by Bennard brune Parker on 06/03/2020.
//  Copyright © 2020 Solirize. All rights reserved.
//

import UIKit

class HeaderCell: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let titleView: UILabel = {
        let textView = UILabel()
        textView.backgroundColor = .clear
        textView.textColor = .white
        return textView
    }()
    
    func setupViews() {
        self.backgroundColor = .lightGray
        addSubview(titleView)
        titleView.textAlignment = .center
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.topAnchor),
            titleView.leftAnchor.constraint(equalTo: self.leftAnchor),
            titleView.rightAnchor.constraint(equalTo: self.rightAnchor),
            titleView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MyCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let imageView: UIImageView = {
        let iV = UIImageView()
        iV.backgroundColor = .blue
        return iV
    }()
    
    func setupViews() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

