//
//  UIColorExt.swift
//  GitHubSearchRep
//
//  Created by Ray on 2022/4/13.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(_ r:Int , _ g : Int, _ b : Int ,alpha : CGFloat = 1.0) {
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
    
    
}
