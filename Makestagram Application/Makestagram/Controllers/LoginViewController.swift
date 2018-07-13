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
import FirebaseDatabase

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
            // LoginViewController conformed to the FUIAuthDelegate protocol. Basic error handling that will let us know if something went wrong.
        }
        
        guard  let user = user //user = (FIRUser?)user
            else {return}
        
 //       let userRef = Database.database().reference().child("users").child(user.uid)
        
//        userRef.observeSingleEvent(of: .value, with: {(snapshot) in
//
//            if let user = User(snapshot: snapshot) {
//                print("welcome back \(user.username)!")
//            }else{
//                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
//            }
//                      //Retrieve the user data from DataSnapshot, we check that the snapshot exists, and that it is of the expected Dictionary type
//        })
        
//        userRef.observeSingleEvent(of: .value, with: {[unowned self]  (snapshot) in
//            if let _ = User(snapshot: snapshot){
//                let storyboard = UIStoryboard(name: "Main", bundle: .main)
//
//                if let initialViewController = storyboard.instantiateInitialViewController(){
//                    self.view.window?.rootViewController = initialViewController
//                    self.view.window?.makeKeyAndVisible()
//                }
//            }else{
//                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
//            }
//        })
        // if we received an existing user on our login view controller, we also want to redirect them to the main storyboard by setting the window's root view controller.
    
    
//        userRef.observeSingleEvent(of: .value, with: {[unowned self] (snapshot) in
//            if let user = User(snapshot: snapshot){
//                User.setCurrent(user)
//
//
//            let storyboard = UIStoryboard(name: "Main", bundle: .main)
//            if let initialViewController = storyboard.instantiateInitialViewController(){
//                self.view.window?.rootViewController = initialViewController
//                self.view.window?.makeKeyAndVisible()
//            }
//        }else{
//              self.performSegue(withIdentifier: "toCreateUsername", sender: self)
//        }
//        })
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                // handle existing user
                User.setCurrent(user)
                
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
                
                
            } else {
                // handle new user
                self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
            }
        }
    
    }
}
