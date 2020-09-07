//
//  BeerDetailCell.swift
//  FlipDishMenu
//
//  Created by 李祺 on 07/09/2020.
//  Copyright © 2020 FlipDish. All rights reserved.
//

import UIKit

class DishDetailCell: UITableViewCell {
    var dish: MenuItem? {
        didSet {
            self.titleLabel.text = dish?.name
            self.descriptionLabel.text = dish?.menuItemDescription
            self.priceLabel.text = "€ " + String(dish?.price ?? 0.0)

            self.dishImageView.downloaded(from: dish?.imageURL ?? "", contentMode: .scaleToFill)
        }
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let dishImageView: ScaleAspectFitImageView = {
        let imageView = ScaleAspectFitImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(dishImageView)
        self.addSubview(priceLabel)

        setTitleLabelConstraints()
        setDetailLabelConstraints()
        setBeerImageConstraints()
        setBeerAbvLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.numberOfLines = 0

        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: self.dishImageView.bottomAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    private func setBeerAbvLabelConstraints() {

        let detailLabelConstraints = [
            priceLabel.topAnchor.constraint(equalTo: self.dishImageView.bottomAnchor, constant: 20),
            priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            priceLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(detailLabelConstraints)
    }
    
    private func setDetailLabelConstraints() {
        descriptionLabel.numberOfLines = 0
        let detailLabelConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10)

        ]
        NSLayoutConstraint.activate(detailLabelConstraints)
    }
    
    private func setBeerImageConstraints() {
        let beerImageViewConstraints = [
            dishImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            dishImageView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20),
            dishImageView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -20),
            dishImageView.bottomAnchor.constraint(equalTo: self.titleLabel.topAnchor, constant: -20),
            dishImageView.heightAnchor.constraint(equalToConstant: 300),
        ]
        NSLayoutConstraint.activate(beerImageViewConstraints)
    }
}
