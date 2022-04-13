//
//  searchTableViewCell.swift
//  GitHubSearchRep
//
//  Created by Ray on 2022/4/13.
//

import UIKit

class searchCollectCell: UICollectionViewCell {
    
    
   static let Identifier = "searchTableViewCell"

    required init?(coder: NSCoder) {
        fatalError("cell error")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setLayouts()
    }
    
    
    func setViews(){
        addSubview(cardView)
        cardView.addSubview(name)
        cardView.addSubview(descriptionLabel)
        cardView.addSubview(type)
    }
    
    func setLayouts(){
        
        cardView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
        }
        name.snp.makeConstraints { make in
            make.top.equalTo(cardView).offset(10)
            make.leading.equalTo(cardView).offset(10)
            make.trailing.equalTo(type.snp.leading)
            make.height.equalTo(25)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(0)
            make.leading.equalTo(name)
            make.trailing.equalTo(cardView)
            make.bottom.equalTo(cardView)
        }
        
        type.snp.makeConstraints { make in
            make.top.equalTo(name)
            make.trailing.equalTo(cardView).offset(-10)
            make.width.equalTo(40)
            make.height.equalTo(20)
        }
    }
    
    let name : UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.text = "description"
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 100
        return label
    }()
    
    
    let type : UILabel = {
        let label  = UILabel()
        label.text = "public"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let cardView : UIView = {
        let view = CardView()
        view.backgroundColor = .white
        return view
    }()
    
    

}
