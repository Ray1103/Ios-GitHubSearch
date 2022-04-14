//
//  searchHeadView.swift
//  GitHubSearchRep
//
//  Created by Ray on 2022/4/13.
//

import UIKit

class searchFooter: UICollectionReusableView {
    
    static let Identifier = "searchFooter"

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error \(coder)")
    }
    
    
    let loadView : UIActivityIndicatorView = {
        let load = UIActivityIndicatorView(style: .large)
        load.startAnimating()
        return load
    }()
    func setViews(){
        addSubview(loadView)
    }
    
    func setLayouts(){
        loadView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.top.equalTo(self).offset(20)
        }
    }

}
