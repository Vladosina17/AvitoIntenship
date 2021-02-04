//
//  CheckmarkImageView.swift
//  internshipAvito
//
//  Created by Влад Барченков on 25.01.2021.
//

import UIKit

class CheckmarkImageView: UIImageView {
    
   init() {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
        image = UIImage(named: "checkmark")
        isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
