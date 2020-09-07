//
//  BeerListCell.swift
//  FlipDishMenu
//
//  Created by 李祺 on 07/09/2020.
//  Copyright © 2020 FlipDish. All rights reserved.
//

import UIKit

class MenuSectionCell: UITableViewCell {
    var menuCellViewModel: MenuSection? {
        didSet {
            self.titleLabel.text = menuCellViewModel?.name
            self.menuSectionImageView.downloaded(from: menuCellViewModel?.imageURL ?? "", contentMode: .scaleToFill)
        }
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let menuSectionImageView: ScaleAspectFitImageView = {
        let imageView = ScaleAspectFitImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(titleLabel)
        self.addSubview(menuSectionImageView)

        setTitleLabelConstraints()
        setBeerImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.textAlignment = .center

        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: self.menuSectionImageView.bottomAnchor, constant: -20),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -20),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    private func setBeerImageConstraints() {
        let beerImageViewConstraints = [
            menuSectionImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            menuSectionImageView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20),
            menuSectionImageView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -20),
            menuSectionImageView.bottomAnchor.constraint(equalTo: self.titleLabel.topAnchor,constant: -10),
            menuSectionImageView.heightAnchor.constraint(equalToConstant: 400),
        ]
        NSLayoutConstraint.activate(beerImageViewConstraints)
    }
}
