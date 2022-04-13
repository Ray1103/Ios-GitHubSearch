//
//  searchModel.swift
//  GitHubSearchRep
//
//  Created by Ray on 2022/4/13.
//

import Foundation


struct searchRes : Decodable {
    let total_count : Int
    let incomplete_results : Bool
    let items : Array<searchDetail>
}

struct searchDetail : Decodable {
    let html_url : String
    let description : String?
    let visibility : String
    let score : Double
    let name : String
    let full_name : String
    
}


enum SearchError : Error {
    case  searchError
}
