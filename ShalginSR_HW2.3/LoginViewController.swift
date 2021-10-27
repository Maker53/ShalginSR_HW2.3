//
//  LoginViewController.swift
//  ShalginSR_HW2.3
//
//  Created by Станислав on 26.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    let userName = "User"
    let userPassword = "Password"
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInButton() {
        
        //Check optional input userName and Password
        guard let inputUserName = userNameTextField.text,
        let inputUserPassword = userPasswordTextField.text else {
            showAlert(title: "Wrong!", message: "Please, enter correct name")
            return
        }
        
        //Check correctly input userName and Password
        guard inputUserName == "User", inputUserPassword == "Password" else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password")
            userPasswordTextField.text = ""
            return
        }
    }
    
    @IBAction func userForgotNameButton() {
        showAlert(title: "Ooops! \u{1F628}", message: "Your name is \(userName)")
    }
    
    @IBAction func userForgotPasswordButton() {
        showAlert(title: "Ooops! \u{1F628}", message: "Your password is \(userPassword)")
    }
    
    //Send userName from LoginViewController to WelcomeViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewController = segue.destination as?
                WelcomeViewController else { return }
        welcomeViewController.userName = userNameTextField.text
    }
    
    //Delete text in textfields when Log Out button pressed
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        userPasswordTextField.text = ""
    }
    
    //Hide the keybord when user touches the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension LoginViewController {
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
