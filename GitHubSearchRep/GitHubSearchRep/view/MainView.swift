//
//  MainVIew.swift
//  GitHubSearchRep
//
//  Created by Ray on 2022/4/13.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    
    
    var searchEditAction : ((_ q : String) -> Void)?
    
    @objc func searchSend() {
        guard let text = search.text ,!text.isEmpty else{return}
        searchEditAction?(text)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setLayouts()
    }

    
    required init?(coder: NSCoder) {
        fatalError("error")
    
    }
    
    
  
    
    
    let search : UITextField = {
        let textfiled = UITextField()
        textfiled.toEnterStyle("請輸入收尋關鍵字")
        return textfiled
    }()
    
    let sendButton : UIButton = {
        let button = UIButton()
        button.setTitle("搜尋", for: .normal)
        button.addTarget(self, action: #selector(searchSend), for: .touchUpInside)
        button.backgroundColor = .white
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    let searchTable : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collect = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collect.register(searchCollectCell.self, forCellWithReuseIdentifier: searchCollectCell.Identifier)
        let width  = UIScreen.main.bounds.width
        flowLayout.minimumLineSpacing = CGFloat(integerLiteral: 10)
        flowLayout.itemSize = CGSize(width: width, height: 60)
//        collect.register(searchFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: searchFooter.Identifier)
//        flowLayout.footerReferenceSize = CGSize(width: 20, height: 150)
        return collect
    }()
    
    let divView : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.isHidden = true
        return view
    }()
    
    let loadView : UIActivityIndicatorView = {
        let load = UIActivityIndicatorView(style: .large)
        load.stopAnimating()
        return load
    }()
    
    func setViews(){
        addSubview(search)
        addSubview(sendButton)
        addSubview(divView)
        addSubview(searchTable)
        addSubview(loadView)
    }
    
    func setLayouts(){
        
        sendButton.snp.makeConstraints { make in
            make.top.equalTo(self).offset(30)
            make.trailing.equalTo(self).offset(-10)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        search.snp.makeConstraints { make in
            make.top.equalTo(sendButton)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(sendButton.snp.leading).offset(-5)
            make.height.equalTo(40)
        }
        
        divView.snp.makeConstraints { make in
            make.top.equalTo(search.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
            make.height.equalTo(1)
        }
        searchTable.snp.makeConstraints { make in
            make.top.equalTo(divView.snp.bottom).offset(10)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(loadView.snp.top)
        }
        
        loadView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self)
            make.width.equalTo(10)
            make.height.equalTo(0)
        }
    }

}
