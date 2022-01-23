//
//  NewPassengerViewController.swift
//  AirlineProject
//
//  Created by Fatemeh Ghanavati  on 21/01/2022.
//

import UIKit


protocol NewUserCreated {
    func userCreated(passenger: UserData)
}

class CreatePassengerViewController: UIViewController {
    
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var nameTextFiled: CustomTextField!
    @IBOutlet weak var tripsTextFiled: CustomTextField!
    @IBOutlet weak var airlineTextField: CustomTextField!
   
    
    var createViewModel: CreatePassengersViewModel!
    var delegate: NewUserCreated!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layer.cornerRadius = 10
        createViewModel = CreatePassengersViewModel()
    }
    
    @IBAction func submitButton(_ sender: Any) {
        createPassenger()
    }
    
    func createPassenger() {
        createViewModel.CreatePassenger(name: nameTextFiled.text, airline: airlineTextField.text, trips: tripsTextFiled.text) { reponse, error in
            if error == nil {
                if let response = reponse {
                    self.delegate.userCreated(passenger: response)
                    self.dismiss(animated: true)
                }
            } else {
                ErrorModel(title: Errors.errorTitle.description, message: Errors.localization.description)
            }
        }
    }
}
