//
//  UserDataService.swift
//  smack
//
//  Created by Bilal Mustafa on 11/11/17.
//  Copyright © 2017 Bilal Mustafa. All rights reserved.
//

import Foundation
class UserDataService{
    static let instance = UserDataService()
    
    public private(set) var id  = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    
    func setUserData(id: String, color: String, avatarname: String, email: String, name: String){
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarname
        self.email = email
        self.name = name
        
    }
    
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
    
    
    
}
