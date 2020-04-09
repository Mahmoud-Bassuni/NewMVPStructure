//
//  File.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/28/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation
typealias RepositoriesCodableModel = [RepositoryCodableModel]
struct RepositoryCodableModel: Codable {

    let name : String!
    let reposCodableModelDescription: String!
    let forksCount: Int!
    let language: String!
    let createdAt: String!
    let htmlURL: String!
    let owner: Owner!
    enum CodingKeys: String, CodingKey {
        case name
        case owner
        case htmlURL = "html_url"
        case reposCodableModelDescription = "description"
        case forksCount = "forks_count"
        case language
        case createdAt = "created_at"
    }
}
// MARK: - Owner
struct Owner: Codable {
    let avatarURL: String!

    enum CodingKeys: String, CodingKey {
      
        case avatarURL = "avatar_url"
    }
}



