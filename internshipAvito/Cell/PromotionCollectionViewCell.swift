//
//   PromotionCollectionViewCell.swift
//  internshipAvito
//
//  Created by Влад Барченков on 25.01.2021.
//

import UIKit

class PromotionCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "PromotionCollectionViewCell"
    
    private var iconImageView = UIImageView()
    var titleLabel = TitleLabelCell()
    private var descriptionLabel = DescriptionLabelCell()
    private var priceLabel = PriceLabelCell()
    var checkmarkImage = CheckmarkImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .cellGray
        contentView.layer.cornerRadius = 5
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(priceLabel)
        addSubview(checkmarkImage)
                
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 40).isActive = true
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            iconImageView.heightAnchor.constraint(equalToConstant: 52),
            iconImageView.widthAnchor.constraint(equalToConstant: 52)
        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60)
        ])

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45)
        ])

        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(greaterThanOrEqualTo: descriptionLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])

        NSLayoutConstraint.activate([
            checkmarkImage.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            checkmarkImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(list: List) {
        if list.isSelected == true {
            iconImageView.downloaded(from: list.icon["52x52"]!)
            titleLabel.text = list.title
            descriptionLabel.text = list.description
            priceLabel.text = list.price
            checkmarkImage.isHidden = list.isSelected

        } else {
            contentView.isHidden = true
        }
    }
}
