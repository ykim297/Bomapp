//
//  SearchResultModel.swift
//  Bomapp
//
//  Created by Yong Seok Kim on 2020/07/05.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit


struct SearchResultModel: Codable {    
    let id: Int
    let node_id: String
    let name: String
    let full_name: String
    let owner: OwnerModel
    let `private`: Bool
    let html_url: String
    let description: String?
    let fork: Bool
    let url: String
    let created_at: String
    let updated_at: String
    let pushed_at: String?
    let homepage: String?
    let size: Int
    let stargazers_count: Int
    let watchers_count: Int
    let language: String?
    let forks_count: Int
    let open_issues_count: Int
    let master_branch: String?
    let default_branch: String
    let score: Double
}

struct OwnerModel: Codable {
    let login: String
    let id: Int
    let node_id: String
    let avatar_url: String
    let gravatar_id: String
    let url: String
    let received_events_url: String
    let type: String
    
    let html_url: String?
    let followers_url: String?
    let subscriptions_url: String?
    let organizations_url: String?
    let repos_url: String?
    let score: Double?
    let location: String?
    let name: String?
    let public_repos: Int?
}
