//
//  RepoTableViewAdapter.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 4/1/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation
import UIKit

class RepositoryTableViewAdapter : NSObject
{
    var dataSource = RepositoriesCodableModel()
    weak var delegate : RepositoryTableViewProtocol?
    weak var tableView: PagingTableView?
    
    lazy var tableViewHeaderRefreshingControl: UIRefreshControl = {
           let refControl = UIRefreshControl()
           refControl.addTarget(self, action: #selector(refreshRepoList), for: UIControl.Event.valueChanged)
           return refControl
       }()
    
    lazy var tableViewFooterRefreshingControl: UIRefreshControl = {
        let refControl = UIRefreshControl()
        refControl.addTarget(self, action: #selector(refreshRepoList), for: UIControl.Event.valueChanged)
        return refControl
    }()
    
    
    init(_ tableview: PagingTableView) {
        super.init()
        tableView = tableview
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.refreshControl = tableViewHeaderRefreshingControl
        tableView?.register(UINib(nibName: "RepositoryTableViewCell", bundle: nil), forCellReuseIdentifier: RepositoryTableViewCell.identifier)
    }
    
    func reloadTableView(_ dataSource : RepositoriesCodableModel){
        self.dataSource = dataSource
        self.tableView?.reloadData()
        
    }
    
    @objc func refreshRepoList(_ sender: Any) {
           guard delegate != nil else { return}
           self.delegate?.refreshDataSource()
       }
       
      func endRefreshing() {
           tableViewHeaderRefreshingControl.endRefreshing()
       }
       
       func beginRefreshing() {
           tableViewHeaderRefreshingControl.beginRefreshing()
       }
    
    func isTableFooterLoading(loading: Bool) {
           self.tableView?.isLoading = loading
       }
    
}

extension RepositoryTableViewAdapter : UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.identifier, for: indexPath) as! RepositoryTableViewCell
        let title = dataSource[indexPath.row].name
        cell.setTitle(title: title!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard delegate != nil else { return}
        let repoItem = dataSource[indexPath.row]
        delegate?.repositoryCellClicked(repo: repoItem, index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == tableView.numberOfSections - 1 &&
                       indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            delegate?.paginate(page: self.tableView!.currentPage)
            self.tableView!.page += 1
        }
    }
}
