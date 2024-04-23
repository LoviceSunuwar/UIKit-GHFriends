//
//  GHButton.swift
//  GHFriends
//
//  Created by Lovice Sunuwar on 18/04/2024.
//

import UIKit

class GHButton: UIButton {
// Initalizing button with a frame
    // why use override ? -> this is a subclass of UIbutton so we have to override if we are going to do some custom integration
    override init(frame: CGRect) {
        // super means we are calling the super class
        // we are having the parameter frame insitalize with the frame
        // hence overrriding the frame of the actual Default UIButton with GHButton
        // this is like a subclass, we are making the GHButton on top of UIButton
        // hence inherting the UIButton
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        // This is saying what happens when you use storyboard,
        // but we are not using any storyboard hence we are just throwing fatal error
        fatalError("init(coder:) has not been implemented")
    }
    
    // creating a custom intializer, cause we dont want to give color everytime we want different color on the button
    
    init(backgroundColor: UIColor, title: String){
        super.init(frame: .zero) // we are doing the size with autolayout constraint so we are giving it zero here
        self.backgroundColor = backgroundColor
        // the purple/blue the one behind self. is the default
        // So, now self notice the small 's' in self, comes in to play
        // this is like saying,
        // hey who wants a tea? I myself want one, so i am getting one.
        
        // in a sense, its like saying this GHButton backgroundcolor, is going to be the background color
        
        // and boom same with title
        
        self.setTitle(title, for: .normal)
        configure() // calling configure cause, we want the heigth width to come form there
    }
    
    // so later we can just call this initializer and configure
    
    // welp, this is a private func, that will be only accesible to this class
    private func configure() {
        layer.cornerRadius      = 10
        titleLabel?.textColor   = .white
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        // This is like dyanimic font
        // we want to say to the program, hey we are using autolayout
        // when we do it code we have to do this
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
