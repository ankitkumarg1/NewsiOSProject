//
//  Data.swift
//  NewsProject
//
//  Created by QUYTECH_ankit_ios on 14/07/20.
//  Copyright © 2020 QUYTECH. All rights reserved.
//

import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
}

class Api {
    
    func getPosts(){
        guard let url = URL(string: "https://jsonplaceholoder.typicode.com/posts") else{
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
         
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            print(posts)
        }
    .resume()
    }
}
