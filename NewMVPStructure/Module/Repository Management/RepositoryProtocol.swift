//
//  ExploreProtocol.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 4/1/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation

protocol RepositoryViewProtocol: MVPViewProtocol {
    func setupViews()
    func reloadTable(dataSource : RepositoriesCodableModel)
    func endRefreshing()
    func beginRefreshing()
    func isTableFooterLoading(loading: Bool)
}

protocol RepositoryPresenterProtocol: MVPPresenterProtocol {
    func refreshDataSource()
    func getRepositories(showLoading : Bool, page : Int)
    func repositoryClicked(repo: RepositoryCodableModel, index: Int)
    func paginate(toPage: Int)
}
