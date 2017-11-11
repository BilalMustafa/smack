//
//  AvatarCell.swift
//  smack
//
//  Created by Bilal Mustafa on 11/11/17.
//  Copyright © 2017 Bilal Mustafa. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    enum AvatarType {
        case dark
        case light
    }
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        
    }
    
    func configureCell(index: Int, type: AvatarType){
        if type == AvatarType.dark{
            avatarImage.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
            
        }else{
            avatarImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
        
    }
    
    func setupView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
    }
}
