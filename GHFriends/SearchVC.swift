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
    
    var isUsernameEntered: Bool {
        return !usernameTextField.text!.isEmpty // returns false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureSearchButton()
        createDismissKeyboardTapGesture()
        
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
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing)) // end editing causes the view to resign the first responder, what view ? is going to act? right now the keyboard but other tap will end it.
        view.addGestureRecognizer(tap)
        
    }
    
    // anytime you create a function for #selector it has to be an objective c funciton/ since its a remanent of objective c
    
    @objc func pushFollowerListVC() {
        // putitng in guard saying hey, if there is valuye then go ahead and do rest
        guard isUsernameEntered else {
            print("No userName")
             return
        }
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
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
        // setting the delagate to listen to
        usernameTextField.delegate = self // self is the SearchVC viewcontroller
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50), // pining to the edges
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50), // always needs to be a negative anchor for trailiing
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func configureSearchButton() {
        view.addSubview(callToActionButton)
        
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        // for is like the differnt types of taps you can do in a button.
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50), // trialing andbottom you have to keep it on negative
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    
    
}


extension SearchVC: UITextFieldDelegate {
    // Delegate listens,listen who ? listen vc
    // first define the vc or set up
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
