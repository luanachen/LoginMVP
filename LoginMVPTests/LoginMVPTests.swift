//
//  LoginMVPTests.swift
//  LoginMVPTests
//
//  Created by Luana on 24/04/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import XCTest
@testable import LoginMVP

class LoginMVPTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRegisterWithEmptyEmail() {
        let expec = expectation(description: "registration with empty email")
        let registrationPresenter = RegistrationPagePresenter(delegate: MockUIViewController1(expectation: expec))
        registrationPresenter.register(email: "", password: "12345678", fullName: "luana chen", phoneNumber: "999999999")
        wait(for: [expec], timeout: 3)
    }

    func testRegistrationWithEmptyPassword(){
        let expec = expectation(description: "registration with empty password")
        let registrationPresenter = RegistrationPagePresenter(delegate: MockUIViewController2(expectation: expec))
        registrationPresenter.register(email: "siapa@email.com", password: "", fullName: "luana chen", phoneNumber: "999999999")
        wait(for: [expec], timeout: 3)
    }

    func testRegistrationWithPasswordLessthan8Char(){
        let expec = expectation(description: "registration with min password char is 8")
        let registrationPresenter = RegistrationPagePresenter(delegate: MockUIViewController3(expectation: expec))
        registrationPresenter.register(email: "siapa@email.com", password: "123", fullName: "luana chen", phoneNumber: "999999999")
        wait(for: [expec], timeout: 3)
    }

    func testRegistrationWithEmptyFullName(){
        let expec = expectation(description: "registration with empty fullname")
        let registrationPresenter = RegistrationPagePresenter(delegate: MockUIViewController4(expectation: expec))
        registrationPresenter.register(email: "siapa@email.com", password: "12345678", fullName: "", phoneNumber: "999999999")
        wait(for: [expec], timeout: 3)
    }

    func testRegistrationWithEmptyPhoneNumber(){
        let expec = expectation(description: "registration with empty phone number")
        let registrationPresenter = RegistrationPagePresenter(delegate: MockUIViewController5(expectation: expec))
        registrationPresenter.register(email: "siapa@email.com", password: "12345678", fullName: "luana chen", phoneNumber: "")
        wait(for: [expec], timeout: 5)
    }
    func testRegisterWithAllFilled(){
        let expec = expectation(description: "registration with empty phone number")
        let registrationPresenter = RegistrationPagePresenter(delegate: MockUIViewController6(expectation: expec))
        registrationPresenter.register(email: "siapa@email.com", password: "12345678", fullName: "luana chen", phoneNumber: "999999999")
        wait(for: [expec], timeout: 3)    }
    
}

class MockUIViewController1: RegistrationDelegate {
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func showProgress(){}
    func hideProgress(){}
    func registrationDidSucceed(){}
    func registrationDidFailed(message: String){
        XCTAssertEqual(message, "email can't be blank")
        self.expec.fulfill()
    }
}


class MockUIViewController2: RegistrationDelegate{
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func showProgress(){}
    func hideProgress(){}
    func registrationDidSucceed(){}
    func registrationDidFailed(message: String){
        XCTAssertEqual(message, "password can't be blank")
        self.expec.fulfill()
    }
}
class MockUIViewController3: RegistrationDelegate{
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func showProgress(){}
    func hideProgress(){}
    func registrationDidSucceed(){}
    func registrationDidFailed(message: String){
        XCTAssertEqual(message, "the minimum password length is 8 char")
        self.expec.fulfill()
    }
}
class MockUIViewController4: RegistrationDelegate{
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func showProgress(){}
    func hideProgress(){}
    func registrationDidSucceed(){}
    func registrationDidFailed(message: String){
        XCTAssertEqual(message, "full name can't be blank")
        self.expec.fulfill()
    }
}
class MockUIViewController5: RegistrationDelegate{
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func showProgress(){}
    func hideProgress(){}
    func registrationDidSucceed(){}
    func registrationDidFailed(message: String){
        XCTAssertEqual(message, "phone number can't be blank")
        self.expec.fulfill()
    }
}

class MockUIViewController6: RegistrationDelegate{
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func showProgress(){}
    func hideProgress(){}
    func registrationDidSucceed(){
        XCTAssertTrue(true)
        self.expec.fulfill()
    }
    func registrationDidFailed(message: String){}
}

