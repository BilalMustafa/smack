//
//  ProfileVC.swift
//  smack
//
//  Created by Bilal Mustafa on 11/12/17.
//  Copyright © 2017 Bilal Mustafa. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    //outlets
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var useremail: UILabel!
    @IBOutlet weak var userName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGED, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeModelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView(){
        userName.text = UserDataService.instance.name
        useremail.text = UserDataService.instance.email
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        profileImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
            dismiss(animated: true, completion: nil)
    }
    
}
