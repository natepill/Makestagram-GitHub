//
//  User.swift
//  Makestagram
//
//  Created by Nathan Pillai on 7/11/18.
//  Copyright © 2018 Nathan Pillai. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot



class User{
    
    private static var _current: User?
    
    static var current: User{
        guard let currentUser = _current else{
            fatalError("Current user doesnt exist")
        }
        return currentUser
    }
    
    static func setCurrent(_ user: User){
        _current = user
    }
    
    //Check that _current that is of type User? isn't nil. If _current is nil, and current is being read, the guard statement will crash with fatalError().
   // If _current isn't nil, it will be returned to the user.
    //Once we receive the user from the database, we set the singleton with our custom setter method. After the singleton is set, it will remain in memory for the rest of the app's lifecycle. It will be accessible from any view controller with the following code:
//    let user = User.current
    
    let uid: String
    let username: String
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any],
        let username = dict["username"] as? String
            else{return nil}
        
        self.uid = snapshot.key
        self.username = username
        
    }
    
}

