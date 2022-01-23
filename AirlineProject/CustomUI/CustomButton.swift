//
//  CustomButton.swift
//  AirlineProject
//
//  Created by Fatemeh Ghanavati  on 22/01/2022.
//

import UIKit



class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    func setupButton() {
        
        backgroundColor = UIColor(named: "blueColor")
        setTitleColor(.white, for: .normal)
        setTitleColor(.white, for: .selected)
        self.layer.cornerRadius = 10
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
}

class CustomTitleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTitleButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTitleButton()
    }
    
    func setupTitleButton() {
        
        backgroundColor = UIColor(named: "blueColor")
        setTitleColor(.white, for: .normal)
        setTitleColor(.white, for: .selected)
        self.layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "Nunito-Bold", size: 22)
    }
}
