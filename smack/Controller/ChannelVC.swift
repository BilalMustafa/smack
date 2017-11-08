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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 60

        
    }
 
    
    @IBAction func loginbtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
}
