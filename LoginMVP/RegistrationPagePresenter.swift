//
//  RegistrationPagePresenter.swift
//  LoginMVP
//
//  Created by Luana on 24/04/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import Foundation

protocol RegistrationDelegate {
    func showProgress()
    func hideProgress()
    func registrationDidSucceed()
    func registrationDidFailed(message: String)
}

class RegistrationPagePresenter {

    var delegate: RegistrationDelegate

    init(delegate: RegistrationDelegate) {
        self.delegate = delegate
    }

    func register(email: String, password: String, fullName: String, phoneNumber: String) {

        if email.isEmpty {
            print("email empty")
            self.delegate.registrationDidFailed(message: "email can't be blank")
        }

        if password.isEmpty{
            self.delegate.registrationDidFailed(message: "password can't be blank")
            return
        }
        if password.count < 8 {
            self.delegate.registrationDidFailed(message: "the minimum password length is 8 char")
            return
        }
        if fullName.isEmpty{
            self.delegate.registrationDidFailed(message: "full name can't be blank")
            return
        }
        if phoneNumber.isEmpty{
            self.delegate.registrationDidFailed(message: "phone number can't be blank")
            return
        }
        self.delegate.showProgress()
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.delegate.hideProgress()
            self.delegate.registrationDidSucceed()
        }

    }
}
