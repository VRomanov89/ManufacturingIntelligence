//
//  DataService.swift
//  ManufacturingIntelligence
//
//  Created by Volodymyr Romanov on 5/14/18.
//  Copyright © 2018 Vladimir Romanov. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = FIRDatabase.database().reference()

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_PLANTS = DB_BASE.child("plants")
    private var _REF_FEED = DB_BASE.child("reportFeed")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    var REF_PLANTS: FIRDatabaseReference {
        return _REF_PLANTS
    }
    
    var REF_FEED: FIRDatabaseReference {
        return _REF_FEED
    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
