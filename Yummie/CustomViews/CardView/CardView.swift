//
//  CardView.swift
//  Yummie
//
//  Created by Andrew Emad on 06/10/2022.
//

import UIKit

class CardView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.2
        cornerRadios = 10
    }
}
