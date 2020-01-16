//
//  ViewController.swift
//  EAAlert
//
//  Created by Emre AYDIN on 01/14/2020.
//  Copyright (c) 2020 Emre AYDIN. All rights reserved
//

import UIKit
import EAAlert

class ViewController: UIViewController {

    var alert: EAAlert!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // create alert instance with or without message
        alert = EAAlert(message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
        alert.onAlertCloseTapped = {
            print("onAlertCloseTapped")
        }
        
        alert.onNegativeButtonTapped = {
            print("onNegativeButtonTapped")
        }
        
        alert.onPositiveButtonTapped = {
            print("onPositiveButtonTapped")
        }
        
        alert.closeButtonImage = UIImage(named: "close")
        alert.successButtonImage = UIImage(named: "tick")
        alert.messageType = .success

        alert.blurEffectStyle = .dark
        alert.alertBackgroundColor = .black

        alert.messageLabelFont = UIFont.systemFont(ofSize: 20)
        alert.messageLabelColor = .lightText

        alert.isPositiveButtonHidden = false
        alert.positiveButtonTextFont = UIFont.boldSystemFont(ofSize: 23)
        alert.positiveButtonTextColor = .white
        alert.positiveButtonText = "Ok"

        alert.isNegativeButtonHidden = false
        alert.negativeButtonTextFont = UIFont.boldSystemFont(ofSize: 23)
        alert.negativeButtonTextColor = .white
        alert.negativeButtonText = "Cancel"
    }

    @IBAction func showAlert(_ sender: UIButton) {
        alert.show()
    }

}

