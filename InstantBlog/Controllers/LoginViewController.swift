//
//  LoginViewController.swift
//  InstantBlog
//
//  Created by Daniel Akinniranye on 7/17/22.
//

import Foundation
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    private var loginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login."
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var emailTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "Email:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .none
        textfield.returnKeyType = .next
        textfield.placeholder = "you@school.com"
        textfield.font = UIFont.systemFont(ofSize: 14)
        textfield.layer.cornerRadius = 5
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.returnKeyType = .next

        return textfield
    }()
    
    private var passwordTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "Password:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.isSecureTextEntry = true
        textfield.placeholder = "Password must be at least 6 characters"
        textfield.font = UIFont.systemFont(ofSize: 14)
        textfield.layer.cornerRadius = 5
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false

        return textfield
    }()
    
    var activityIndicator: UIActivityIndicatorView!


    private var signInButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = K.appColor
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.addTarget(nil, action: #selector(handleSignInButtonClicked), for: .touchUpInside)
        button.updateLayerProperties()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        emailTextField.delegate = self
        passwordTextField.delegate = self
        setUpActivityIndicator()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // Move view up when Keybord is shown
    @objc func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 120
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutSubviews()
    }
    
    func handleLoginError(error: Error) {
        let alertViewController = UIAlertController(title: "Error Logging In", message: error.localizedDescription, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertViewController.addAction(cancelAction)
        present(alertViewController, animated: true)
    }
    
    @objc func handleSignInButtonClicked() {
        
        // Validate that entries are not empty to start
        if let emailEntry = emailTextField.text, !emailEntry.isEmpty,
           let passwordEntry = passwordTextField.text, !passwordEntry.isEmpty {
            showActivityIndicator()
            
            Auth.auth().signIn(withEmail: emailEntry, password: passwordEntry) { [weak self] authResult, error in
                if let err = error {
                    self?.handleLoginError(error: err)
                    print(err)
                    self?.hideActivityIndicator()
                }
            }
            
            hideActivityIndicator()
            self.present(MainTabBarController(), animated: true)
        }
    }
    
    func showActivityIndicator() {
        activityIndicator.startAnimating()
    }

    func hideActivityIndicator(){
        activityIndicator.stopAnimating()
    }
    
    func setUpActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.tintColor = .black
        activityIndicator.color = .black
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 90).isActive = true
    }
    
}

// MARK: - Text Field Delegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            handleSignInButtonClicked()
        }
        return true
    }
}


extension LoginViewController {
    
    // Layout Subviews for Login View Controller
    func layoutSubviews() {
        
        // Add views as subviews
        view.addSubview(loginTitleLabel)
        view.addSubview(emailTextFieldLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextFieldLabel)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)

        // Login Title Label Constraints
        let loginTitleLabelConstraints = [
            loginTitleLabel.bottomAnchor.constraint(equalTo: emailTextFieldLabel.safeAreaLayoutGuide.topAnchor, constant: -40),
            loginTitleLabel.leadingAnchor.constraint(equalTo: emailTextFieldLabel.leadingAnchor),
        ]
        NSLayoutConstraint.activate(loginTitleLabelConstraints)
        
        // Email Text Field Label Constraints
        let emailTextFieldLabelConstraints = [
            emailTextFieldLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -100),
            emailTextFieldLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        ]
        NSLayoutConstraint.activate(emailTextFieldLabelConstraints)
        
        // Email Text Field Constraints
        let emailTextFieldConstraints = [
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldLabel.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        
        // Password Text Field Label Constraints
        let passwordTextFieldLabelConstraints = [
            passwordTextFieldLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextFieldLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        ]
        NSLayoutConstraint.activate(passwordTextFieldLabelConstraints)
        
        // Password Text Field Constraints
        let passwordTextFieldConstraints = [
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        
        // Sign In Buttton Constraints
        let signInButtonLayoutContraints = [
            signInButton.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 15),
            signInButton.heightAnchor.constraint(equalToConstant: 35),
            signInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(signInButtonLayoutContraints)
    }
}
