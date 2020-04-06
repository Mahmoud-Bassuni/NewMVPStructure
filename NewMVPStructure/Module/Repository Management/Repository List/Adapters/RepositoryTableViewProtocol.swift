//
//  RepoTableViewProtocol.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 4/3/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation

protocol RepositoryTableViewProtocol : NSObjectProtocol {
     func repositoryCellClicked(repo: RepositoryCodableModel, index: Int)
     func refreshDataSource()
     func paginate(page: Int)
}
