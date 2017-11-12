//
//  ChannelVC.swift
//  smack
//
//  Created by Bilal Mustafa on 11/6/17.
//  Copyright © 2017 Bilal Mustafa. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImg: CircleImage!
    
    @IBAction func prepareForUnWind(seague: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 60
        //Checking the broadcast notification and performing action based upon the notification
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGED, object: nil)

        
    }
    
    
   @objc func userDataDidChange(_ notif: Notification) {
    if AuthService.instance.isLoggedIn {
        loginBtn.setTitle(UserDataService.instance.name, for: .normal)
        userImg.image = UIImage(named: UserDataService.instance.avatarName)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
    }else{
        loginBtn.setTitle("Loigin", for: .normal)
        userImg.image = UIImage(named: "menuProfileIcon")
        userImg.backgroundColor = UIColor.clear
    }
    
    }
 
    
    @IBAction func loginbtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn{
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        }else{
              performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
        
        
      
    }
    
}
