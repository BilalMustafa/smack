//
//  AuthService.swift
//  smack
//
//  Created by Bilal Mustafa on 11/8/17.
//  Copyright © 2017 Bilal Mustafa. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

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
      
        let body: [String:Any] = [
            
            "email" : lowerCaseEmail,
            "password" : password
        ]
 
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            if response.result.error == nil{
                completion(true)

            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    
    func logInUser(email: String, password: String, completation: @escaping completationHandlar) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String:Any] = [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil{
                
             /*
                 //Apple way of doing json parsing
                 if let json = response.result.value as? Dictionary<String,Any>{
                    if let email = json["user"] as? String{
                        self.userEmail = email
                        
                    }
                    
                    if let token = json["token"] as? String{
                        self.authToken = token
                    }
             */
                //Using swiftyJson Library
                guard let data = response.data else {return}
                let json = JSON(data: data)
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
                
                self.isLoggedIn = true
                completation(true)
                }else{
                completation(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func CreateUser(name: String, email: String, avatarName : String, avatarColor: String, completation: @escaping completationHandlar){
        let lowerCaseEmail = email.lowercased()
        
        let body: [String:Any] = [
            "name" : name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        let header = [
            "Authorization" : "Bearer \(AuthService.instance.authToken)",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil{
                guard let data = response.data else {return}
                let json = JSON(data: data)
                let id = json["_id"].stringValue
                let color = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                let email = json["email"].stringValue
                let name = json["name"].stringValue
                UserDataService.instance.setUserData(id: id, color: color, avatarname: avatarName, email: email, name: name)
                completation(true)
            }else{
                completation(false)
                debugPrint(response.result.error as Any)
            }
        }
        
      
        
    }
    
    
    
    
    
    
}
