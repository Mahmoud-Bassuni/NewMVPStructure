//
//  RepositoryRouter.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/28/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation

enum RepositoryRouter {
     case getAllRepositories(page: String)
}

extension RepositoryRouter: ServiceLayer {
    var baseURL: String {
        return EndPoint.baseUrl.rawValue
    }

    var path: String {
        switch self {
        case .getAllRepositories:
            return EndPoint.getRepositoriesURL.rawValue
        }
    }

    var parameters: [String: Any]? {
        switch self {
         case let .getAllRepositories(page):
            return ["page": page , "per_page" :"20"]
        }
    }

    var method: ServiceMethod {
        return .get
    }
    
    var headers: [String: String]? {
        return ["application/json":"Content-Type"]
    }
    
}
