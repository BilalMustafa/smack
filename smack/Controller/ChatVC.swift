//
//  ChatVC.swift
//  smack
//
//  Created by Bilal Mustafa on 11/6/17.
//  Copyright © 2017 Bilal Mustafa. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    
    //outlets
    
    @IBOutlet weak var menuBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
       
        
        
        
        

    
    }

   
    


}
