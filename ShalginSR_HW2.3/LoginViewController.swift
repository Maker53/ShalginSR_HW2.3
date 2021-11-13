//
//  LoginViewController.swift
//  ShalginSR_HW2.3
//
//  Created by Станислав on 26.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    
    // MARK: - Private Properties
    private let userName = "User"
    private let userPassword = "Password"
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        userPasswordTextField.delegate = self
        
        userNameTextField.returnKeyType = .next
        userPasswordTextField.returnKeyType = .done
        
        userPasswordTextField.enablesReturnKeyAutomatically = true
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewController = segue.destination as? WelcomeViewController else { return }
        welcomeViewController.userName = userName
    }
    
    // MARK: - IB Actions
    @IBAction func logInButton() {
        if userNameTextField.text != userName || userPasswordTextField.text != userPassword {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: userPasswordTextField
            )
            return
        }
    }
    
    @IBAction func userForgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Ooops! \u{1F628}", message: "Your name is \(userName)")
        : showAlert(title: "Ooops! \u{1F628}", message: "Your password is \(userPassword)")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        userPasswordTextField.text = ""
    }
}

// MARK: - Private Methods
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            userPasswordTextField.becomeFirstResponder()
        } else {
            logInButton()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
    
}
