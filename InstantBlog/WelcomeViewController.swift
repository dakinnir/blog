//
//  ViewController.swift
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
    
    private var signInButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .white
        button.setTitleColor(K.appColor, for: .normal)
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.updateLayerProperties()
        button.translatesAutoresizingMaskIntoConstraints = false
    
        return button
        
    }()
    
    private var signUpButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = K.appColor
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.updateLayerProperties()
        button.translatesAutoresizingMaskIntoConstraints = false
    
        return button
    }()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
    }

    override func viewDidLayoutSubviews() {
        view.addSubview(welcomeTitleLabel)
        view.addSubview(welcomeMessageLabel)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)

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
                
        let signInButtonLayoutContraints = [
            signInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            signInButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -10),
        ]
        NSLayoutConstraint.activate(signInButtonLayoutContraints)
                
        let signUpButtonLayoutContraints = [
            signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(signUpButtonLayoutContraints)
    }
    
}


extension UIButton {
    
    // Updating the layer properties: Shadow & Corner Radius
    func updateLayerProperties() {
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0;
        self.layer.shadowRadius = 2.4;
    }
}
