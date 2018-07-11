//
//  CreateUsernameViewController.swift
//  Makestagram
//
//  Created by Nathan Pillai on 7/11/18.
//  Copyright © 2018 Nathan Pillai. All rights reserved.
//


import UIKit

class CreateUsernameViewController: UIViewController{
    
    //Poor Design structure of UI elements, should have created in vertical stack
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 6
    }
    
    @IBAction func nextButtonPress(_ sender: Any) {
        
    }
    
}
