//
//  SelectButton.swift
//  internshipAvito
//
//  Created by Влад Барченков on 25.01.2021.
//

import UIKit

class SelectButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .buttonBlue
        layer.cornerRadius = 5
        titleLabel?.font = .systemFont(ofSize: 16)
        setTitle("Выбрать", for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
