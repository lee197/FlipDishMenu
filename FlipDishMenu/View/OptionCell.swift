//
//  OptionCell.swift
//  FlipDishMenu
//
//  Created by 李祺 on 07/09/2020.
//  Copyright © 2020 FlipDish. All rights reserved.
//

import UIKit

class OptionCell: UITableViewCell {
    var option: MenuItemOptionSetItem? {
        didSet {
            self.titleLabel.text = option?.name
            self.priceLabel.text = "€ " + String(option?.itemPrice ?? 0.0)
        }
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(titleLabel)
        self.addSubview(priceLabel)

        setTitleLabelConstraints()
        setBeerAbvLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.numberOfLines = 0

        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    private func setBeerAbvLabelConstraints() {

        let detailLabelConstraints = [
            priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            priceLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(detailLabelConstraints)
    }
    

}
