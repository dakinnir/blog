//
//  WelcomeViewController.swift
//  InstantBlog
//
//  Created by Daniel Akinniranye on 7/17/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Propteries
    private var welcomeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hey! Welcome"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private var welcomeMessageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.text = "This is InstantBlog. This is a place where you can share your creative ideas, thoughts, and stories freely."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private var signInOptionButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .white
        button.setTitleColor(K.appColor, for: .normal)
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.updateLayerProperties()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(handleSignInOptionButtonClicked), for: .touchUpInside)
        return button
        
    }()
    
    private var signUpOptionButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = K.appColor
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.updateLayerProperties()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.addTarget(nil, action: #selector(handleSignUpOptionButtonClicked), for: .touchUpInside)
    
        return button
    }()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
    }

    @objc func handleSignInOptionButtonClicked() {
        let viewController = LoginViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func handleSignUpOptionButtonClicked() {
        let viewController = SignUpViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
    override func viewDidLayoutSubviews() {
        view.addSubview(welcomeTitleLabel)
        view.addSubview(welcomeMessageLabel)
        view.addSubview(signInOptionButton)
        view.addSubview(signUpOptionButton)

        // Constraints for the Subviews
        let welcomeTitleLabelLayoutContraints = [
            welcomeTitleLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            welcomeTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        NSLayoutConstraint.activate(welcomeTitleLabelLayoutContraints)
                
        let welcomeMessageLabelLayoutContraints = [
            welcomeMessageLabel.topAnchor.constraint(equalTo: welcomeTitleLabel.bottomAnchor, constant: 7),
            welcomeMessageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            welcomeMessageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ]
        NSLayoutConstraint.activate(welcomeMessageLabelLayoutContraints)
                
        let signInOptionButtonLayoutContraints = [
            signInOptionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            signInOptionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            signInOptionButton.heightAnchor.constraint(equalToConstant: 50),
            signInOptionButton.bottomAnchor.constraint(equalTo: signUpOptionButton.topAnchor, constant: -10),
        ]
        NSLayoutConstraint.activate(signInOptionButtonLayoutContraints)
                
        let signUpOptionButtonLayoutContraints = [
            signUpOptionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            signUpOptionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            signUpOptionButton.heightAnchor.constraint(equalToConstant: 50),
            signUpOptionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(signUpOptionButtonLayoutContraints)
    }
    
}
