//
//  searchApi.swift
//  GitHubSearchRep
//
//  Created by Ray on 2022/4/13.
//

import Foundation

let baseURL  = "https://api.github.com/search"
func callSearch(_ q : String) async throws -> searchRes{
    let url = URL(string:"\(baseURL)/repositories?q=\(q)&page=1")!
    var request = URLRequest(url: url)
    request.httpMethod = "get"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    
    
    let (data ,res) = try await URLSession.shared.data(for: request)
    guard let httRes = res as? HTTPURLResponse,
          httRes.statusCode == 200 else {
            throw SearchError.searchError
          }
    
    let decoder = JSONDecoder()
    let _data = try decoder.decode(searchRes.self, from: data)
    return _data
    
}
