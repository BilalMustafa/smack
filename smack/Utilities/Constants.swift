//
//  Constants.swift
//  smack
//
//  Created by Bilal Mustafa on 11/8/17.
//  Copyright © 2017 Bilal Mustafa. All rights reserved.
//

import Foundation

typealias completationHandlar = (_ Success : Bool) -> ()

//Segues

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

let TO_AVATAR_PICKER = "toAvatarPicker"

//Colors
let SMACK_PURPLE_PLACEHOLDER = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.5)

let NOTIF_USER_DATA_DID_CHANGED = Notification.Name("NotifUserDataChanged")

//USER DEFAULTS

let TOKEN_KEY = "token"

let LOGGED_IN_KEY = "loggedIn"

let USER_EMAIL = "userEmail"



//URL CONSTANT

let BASE_URL = "http://localhost:3005/v1/"

let URL_REGISTER = "\(BASE_URL)account/register"

let URL_LOGIN = "\(BASE_URL)account/login"

let URL_USER_ADD = "\(BASE_URL)user/add"


//HEADERS

let HEADER = [
    "Contant-Type" : "application/json; charset=utf-8"
]



