//
//  PriceLabelCell.swift
//  internshipAvito
//
//  Created by Влад Барченков on 25.01.2021.
//

import UIKit

class PriceLabelCell: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
        font = .boldSystemFont(ofSize: 16)
        textColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
