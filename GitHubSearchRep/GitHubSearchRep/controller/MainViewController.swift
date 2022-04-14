//
//  MainViewController.swift
//  GitHubSearchRep
//
//  Created by Ray on 2022/4/13.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainview = MainView()
    var key = ""
    var page = 1
    
    var data : searchRes? {
        didSet{
            mainview.searchTable.reloadData()
            mainview.divView.isHidden = false
            
            mainview.loadView.stopAnimating()
            mainview.loadView.snp.updateConstraints { make in
                make.height.equalTo(0)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainview.searchEditAction = searchEdit
        mainview.searchTable.dataSource = self
        mainview.searchTable.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        self.view = mainview
    }
    
    
    @objc func searchEdit(_ q : String?){
        guard let text = q, !text.isEmpty else {return}
        key = text
        Task{
            do{
                data = try await callSearch(key,String(describing: page))
            }catch{
                print(error)
            }
        }
    }

}

extension MainViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchCollectCell.Identifier, for: indexPath) as! searchCollectCell
        
        
        guard let _d = data else {return cell}
        cell.descriptionLabel.text = _d.items[indexPath.row].description ?? "No Description "
        
        switch _d.items[indexPath.row].visibility {
        case "public" :
            cell.type.text = "公開"
        default :
            cell.type.text = "私人"
        }
        
        cell.name.text = _d.items[indexPath.row].full_name
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
    
    var isloadMore : Bool {
        let maxVisibleY = mainview.searchTable.bounds.height + mainview.searchTable.contentOffset.y
        
        let actualMaxY = mainview.searchTable.contentSize.height + mainview.searchTable.contentInset.bottom
        
        return maxVisibleY >= actualMaxY

    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if isloadMore && mainview.loadView.isHidden{
            loadMore()
        }
    }
    
    
    private func loadMore(){
        showLoadView()
        page += 1
        print(page)
        Task{
            do{
                
                let _d = try await callSearch(key,String(describing: page))
                data?.items.append(contentsOf: _d.items)
                
            }catch{
                print(error)
            }
        }
    }
    
    private func showLoadView(){
        mainview.loadView.startAnimating()
        mainview.loadView.snp.updateConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    
    
    
    
    
    
    
    
}
    

