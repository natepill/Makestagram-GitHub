//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Nathan Pillai on 7/9/18.
//  Copyright © 2018 Nathan Pillai. All rights reserved.
//


import UIKit
import FirebaseAuth
import FirebaseUI

typealias FIRUser = FirebaseAuth.User


class LoginViewController: UIViewController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }

    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginButtonPressed(_ sender: Any) {
      // 1
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        // 2
        authUI.delegate = self
        // 3
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
        
//        access the FUIAuth default auth UI singleton
//        set FUIAuth's singleton delegate
//        present the auth view controlle
    }
}


extension LoginViewController: FUIAuthDelegate{
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        // changed the argument type of User to FirebaseAuth.User. This will prevent namespace conflicts by being specific to which User type we're referring to in our code.
        if let error = error{
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        print("handle user signup / login")
        // LoginViewController conformed to the FUIAuthDelegate protocol. Basic error handling that will let us know if something went wrong.
    }
}



