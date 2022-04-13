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
    
    
    let divView : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    func setViews(){
        addSubview(divView)
    }
    
    func setLayouts(){
        divView.snp.makeConstraints { make in
            make.leading.equalTo(self).offset(5)
            make.trailing.equalTo(self).offset(-5)
            make.centerY.equalTo(self)
            make.height.equalTo(1)
        }
    }

}
