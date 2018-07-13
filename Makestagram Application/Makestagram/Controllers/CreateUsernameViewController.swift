//
//  CreateUsernameViewController.swift
//  Makestagram
//
//  Created by Nathan Pillai on 7/11/18.
//  Copyright © 2018 Nathan Pillai. All rights reserved.
//


import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController{
    
    
    //Poor Design structure of UI elements, should have created in vertical stack
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 6
    }
    
    @IBAction func nextButtonPress(_ sender: Any) {
        guard let firUser = Auth.auth().currentUser,
        let username = usernameTextField.text,
            !username.isEmpty else {return}
        
        
        UserService.create(firUser, username: username){ (user) in
            
            guard let user =  user else {return}
            print("Created new user: \(user.username)")
            }
       
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else {
                return
            }

            User.setCurrent(user)
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            
            if let initialViewController = storyboard.instantiateInitialViewController() {
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
        
        //            Create a new instance of our main storyboard
        //            Check that the storyboard has an initial view controller
        //            Get reference to the current window and set the rootViewController to the initial view controller
        
        
        
        
        
        
            //code was refactored
// First we guard to check that a FIRUser is logged in and that the user has provided a username in the text field.
// We create a dictionary to store the username the user has provided inside our database
// We specify a relative path for the location of where we want to store our data
// We write the data we want to store at the location we provided in step 3
// We read the user we just wrote to the database and create a user from the snapshot
 //Now whenever an user is created, a user JSON object will also be created for them within our database.
        }
        
    }
    

