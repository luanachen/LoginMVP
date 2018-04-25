//
//  ViewController.swift
//  LoginMVP
//
//  Created by Luana on 24/04/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!

    var presenter: RegistrationPagePresenter?

    // MARK: - View cicle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter = RegistrationPagePresenter(delegate: self)
    }

    // MARK: - Action
    @IBAction func buttonRegisterTapped(_ sender: UIButton) {
        self.presenter?.register(email: emailTextField.text!, password: passwordTextField.text!, fullName: fullNameTextField.text!, phoneNumber: phoneNumberTextField.text!)
    }

}
extension ViewController: RegistrationDelegate {
    func showProgress() {

    }

    func hideProgress() {

    }

    func registrationDidSucceed() {
        print("succeed")
    }

    func registrationDidFailed(message: String) {
        print(message)
    }


}

