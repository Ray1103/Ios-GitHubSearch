//
//  TextFieldExp.swift
//  GitHubSearchRep
//
//  Created by Ray on 2022/4/13.
//

import Foundation
import UIKit

extension UITextField{
    
    
    func toCustom(){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        let paddingRightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftView = paddingView
        self.rightView = paddingRightView
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
    
    func setRightIcon(_ icon : UIImage){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .center
        imageView.image = icon
        let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        emptyView.backgroundColor = .clear
        emptyView.addSubview(imageView)
        rightView = emptyView
        rightViewMode = .always
    }
    
    func toEnterStyle(_ text : String){
        self.toCustom()
        self.textColor = UIColor(58,58,58)
        self.layer.borderWidth = 1
        self.placeholder = text
        self.layer.borderColor = UIColor(183,183,183).cgColor
        self.layer.cornerRadius = 3
    }
    
    
}
