//
//  CreateAccountVC.swift
//  smack
//
//  Created by Bilal Mustafa on 11/8/17.
//  Copyright © 2017 Bilal Mustafa. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    //Variables
    
    var avatarName = "ProfileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        
        guard let name = userNameTxt.text , userNameTxt.text != "" else{
            return}
        
        guard let email = emailTxt.text , emailTxt.text != "" else{
            return}
        
        guard let pass = passTxt.text , passTxt.text != "" else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print("registered user!")
                
                AuthService.instance.logInUser(email: email, password: pass, completation: { (success) in
                    if success {
                        print("Suceess...............")
                        AuthService.instance.CreateUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completation: { (success) in
                            if success {
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
            }
        }
        
        
    }
    
    @IBAction func picAvatarPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    
    @IBOutlet weak var picBGColorPressed: UIButton!
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
