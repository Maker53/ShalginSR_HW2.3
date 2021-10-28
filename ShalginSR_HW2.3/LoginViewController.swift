//
//  LoginViewController.swift
//  ShalginSR_HW2.3
//
//  Created by Станислав on 26.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    
    // Private constants
    private let userName = "User"
    private let userPassword = "Password"
    
    // Send userName from LoginViewController to WelcomeViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewController = segue.destination as? WelcomeViewController else { return }
        welcomeViewController.userName = userNameTextField.text
    }
    
    
    @IBAction func logInButton() {
        
        //Check optional input userName and Password
        guard let inputUserName = userNameTextField.text,
              let inputUserPassword = userPasswordTextField.text else {
                  showAlert(title: "Wrong!", message: "Please, enter correct name")
                  return
              }
        
        //Check correctly input userName and password
        guard inputUserName == userName, inputUserPassword == userPassword else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password")
            userPasswordTextField.text = ""
            return
        }
    }
    
    @IBAction func userForgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Ooops! \u{1F628}", message: "Your name is \(userName)")
        : showAlert(title: "Ooops! \u{1F628}", message: "Your password is \(userPassword)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        userPasswordTextField.delegate = self
        
        userNameTextField.returnKeyType = .next
        userPasswordTextField.returnKeyType = .done
        
        userPasswordTextField.enablesReturnKeyAutomatically = true
    }
    
    
    //Delete text in textfields when Log Out button pressed
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        userPasswordTextField.text = ""
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

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            userPasswordTextField.becomeFirstResponder()
        } else {
            logInButton()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
    
    //Hide the keybord when user touches the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
