//
//  RepositoryPresenter.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 4/2/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation

class RepositoryPresenter: MVPPresenter<RepositoryViewController>, RepositoryPresenterProtocol {
    
    var isEndOfList = false
    private var repositoryList : RepositoriesCodableModel = []
    override func viewStarted() {
        super.viewStarted()
        self.view().setupViews()
        self.getRepositories(showLoading : true)
    }
    
    func getRepositories(showLoading : Bool = true , page : Int = 0) {
        showLoading ? self.view().showLoading() : self.view().beginRefreshing()
        api().getRepositories(pageNo: String(page)) { [unowned self]
            result in
            showLoading ? self.view().hideLoading() : self.view().endRefreshing()
            
            switch result {
            case .success(let resp):
                if(page == 0){ self.repositoryList = [] }
                
                for item in resp {
                    self.repositoryList.append(item)
                }
                
                self.view().reloadTable(dataSource: self.repositoryList)
                self.isEndOfList = (resp.count ) == 0
            case .failure(let error):
                self.view().showAlertMessage(type: .error, message: error.message){
                    self.getRepositories(showLoading: true)
                }
            }
            
        }
    }
    
    func refreshDataSource() {
        self.getRepositories(showLoading : false)
    }
    
    func repositoryClicked(repo: RepositoryCodableModel, index: Int) {
        view().vibrate()
        view().showAlertMessage(type: .info, message: repo.name,nil)
    }
    
    func paginate(toPage: Int) {
        if !isEndOfList {
            view().isTableFooterLoading(loading: true)
            self.getRepositories(showLoading: false, page: toPage)
        }
    }
    
}
