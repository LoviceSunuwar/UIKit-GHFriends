//
//  GHTextField.swift
//  GHFriends
//
//  Created by Lovice Sunuwar on 18/04/2024.
//

import UIKit

class GHTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) { // Putting it simply its a storyboard init
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius          = 10
        layer.borderWidth           = 2
        layer.borderColor           = UIColor.systemGray4.cgColor
        
        textColor                   = .label // Black on lightmode, white on dark mode
        tintColor                   = .label
        textAlignment               = .center
        font                        = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth   = true // If the text is tooo long it will shrink to fit
        minimumFontSize             = 12 // the minimum small it will go is 12
        
        backgroundColor             = .tertiarySystemBackground
        autocorrectionType          = .no // Disabling the autocorrect
        
        placeholder                 = "Enter a Username"
        
        returnKeyType               = .go
//        keyboardType =  here to check what options we have
    }
}
