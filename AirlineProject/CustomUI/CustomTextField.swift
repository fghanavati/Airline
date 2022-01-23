//
//  CustomTextField.swift
//  AirlineProject
//
//  Created by Fatemeh Ghanavati  on 22/01/2022.
//

import Foundation
import UIKit



class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }
    
    func setupTextField() {
        self.backgroundColor = UIColor(named: "appTextfieldBG")
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor(named: "appBorder")?.cgColor
        self.layer.borderWidth = 1
        self.borderStyle = .none
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 12, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 12, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
}
