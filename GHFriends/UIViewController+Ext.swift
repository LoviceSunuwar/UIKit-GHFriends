//
//  UIViewController+Ext.swift
//  GHFriends
//
//  Created by Lovice Sunuwar on 26/04/2024.
//

import UIKit

extension UIViewController {
    func presentGHAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GHAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
        
}
