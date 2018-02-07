//
//  MaterialView.swift
//  ListItApp
//
//  Created by Jakub Slawecki on 31.01.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import UIKit

private var materialKey = false

extension UIView {

    @IBInspectable var materialDesign: Bool {
    
        get {
    
            return materialKey
        }
    
        set {
    
            materialKey = newValue
            
            if materialKey {
                
                self.layer.masksToBounds = false
                self.layer.cornerRadius = 0.0
                self.layer.shadowOpacity = 0.1
                self.layer.shadowRadius = 3.0
                self.layer.shadowOffset = CGSize(width: 8.0, height: 8.0)
                self.layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0).cgColor
           
            } else {
                
                self.layer.cornerRadius = 0
                self.layer.shadowOpacity = 0
                self.layer.shadowRadius = 0
                self.layer.shadowColor = nil
            }
            
        }
    }
    

}
