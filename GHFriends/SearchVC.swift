//
//  SearchVC.swift
//  GHFriends
//
//  Created by Lovice Sunuwar on 15/04/2024.
//

import UIKit

class SearchVC: UIViewController {

    let logoImageView = UIImageView()
    let usernameTextField = GHTextField()
    let callToActionButton =  GHButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureSearchButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // This will happend everytime the view appears
        // Most of the time make sure to use super
        // But if you dont want parent function to be called you dont need super
        super.viewWillAppear(animated)
        // The next view has a navigation bar  right, so we dont want navigation bar here, so we are hiding it every time the view will appear
        // hence the name
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureLogoImageView() {
        // This is like you dragging a image view in storyboard
        // you have to do this on every one
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")! // This is stringly typed (nickname of community name)
        // Dont use much since it can crash the app
        // any time you need stringly typed then, make it a constant but here we are using it just once so its fine.
        
        NSLayoutConstraint.activate([
            // just a rule 4 constraint per object, Height, width, x and y
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80), // this is like constraint you put in the storybaord
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // keep it in the center
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200) // these are the width and height
        ])
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50), // pining to the edges
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50), // always needs to be a negative anchor for trailiing
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func configureSearchButton() {
        view.addSubview(callToActionButton)
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50), // trialing andbottom you have to keep it on negative
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    
    
}
