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

//USER DEFAULTS

let TOKEN_KEY = "token"

let LOGGED_IN_KEY = "loggedIn"

let USER_EMAIL = "userEmail"

//URL CONSTANT

let BASE_URL = "http://localhost:3005/v1/"

let URL_REGISTER = "\(BASE_URL)account/register"



