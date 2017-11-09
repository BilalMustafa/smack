//
//  AuthService.swift
//  smack
//
//  Created by Bilal Mustafa on 11/8/17.
//  Copyright © 2017 Bilal Mustafa. All rights reserved.
//

import Foundation
import Alamofire

class AuthService{
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool{
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        
        set{
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken : String {
        get {
                return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail : String{
        get{
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set{
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email : String, password : String, completion: @escaping completationHandlar){
        let lowerCaseEmail = email.lowercased()
        let header = [
            "Contant-Type" : "application/json; charset=utf-8"
        ]
        let body: [String:Any] = [
            
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            if response.result.error == nil{
                completion(true)

            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    
    
}
