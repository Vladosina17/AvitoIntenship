//
//  CloseButton.swift
//  internshipAvito
//
//  Created by Влад Барченков on 25.01.2021.
//

import UIKit

class CloseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        setImage(UIImage(named: "closeButton"), for: .normal)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
