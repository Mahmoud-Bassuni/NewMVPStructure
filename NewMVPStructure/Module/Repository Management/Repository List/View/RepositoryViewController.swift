//
//  RepoViewController.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 4/2/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import UIKit

class RepositoryViewController:  MVPViewController, RepositoryViewProtocol   {
   
    @IBOutlet weak var repositoryTableView: PagingTableView!
    weak var coordinator: MainCoordinator?
    private var presenter: RepositoryPresenterProtocol = RepositoryPresenter()
    private var repositorydapter : RepositoryTableViewAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design(self)
        (self.presenter as! RepositoryPresenter).setView(view: self)
        self.presenter.viewStarted()
    }
    
    func setupViews() {
        repositorydapter = RepositoryTableViewAdapter(repositoryTableView)
        repositorydapter?.delegate = self
    }
    
    func reloadTable(dataSource: RepositoriesCodableModel) {
        repositorydapter?.reloadTableView(dataSource)
    }
    
    func endRefreshing() {
        repositorydapter?.endRefreshing()
    }
    
    func beginRefreshing() {
        repositorydapter?.beginRefreshing()
    }
    
    func isTableFooterLoading(loading: Bool) {
        self.repositorydapter?.isTableFooterLoading(loading : loading)
    }
}

extension RepositoryViewController :RepositoryTableViewProtocol
{
    func repositoryCellClicked(repo: RepositoryCodableModel, index: Int) {
        self.presenter.repositoryClicked(repo: repo, index: index)
    }
    
    func refreshDataSource(){
        self.presenter.refreshDataSource()
    }
    func paginate(page: Int) {
        self.presenter.paginate(toPage: page)
    }
    
}


