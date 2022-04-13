//
//  MainViewController.swift
//  GitHubSearchRep
//
//  Created by Ray on 2022/4/13.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainview = MainView()
    
    var data : searchRes? {
        didSet{
            mainview.searchTable.reloadData()
            print(data?.items[0].full_name)
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
        Task{
            do{
                data = try await callSearch(text)
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
    
    
    
    
}
    

