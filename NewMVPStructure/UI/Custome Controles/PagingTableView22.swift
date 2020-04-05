//
//  PagingTableView22.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 4/4/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation
import UIKit

class PagingTableView : UITableView  {
    
    private var loadingView: UIView!
    private var indicator: UIActivityIndicatorView!
    var page: Int = 0
    
    var currentPage: Int {
        get {
            return page
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            isLoading ? showLoading() : hideLoading()
        }
    }
    
    
    private func showLoading() {
        if loadingView == nil {
            createLoadingView()
        }
        tableFooterView = loadingView
    }
    
    private func hideLoading() {
        reloadData()
        tableFooterView = nil
    }
    
    private func createLoadingView() {
        loadingView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 50))
        indicator = UIActivityIndicatorView()
        indicator.color = UIColor.lightGray
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        loadingView.addSubview(indicator)
        centerIndicator()
        tableFooterView = loadingView
    }
    
    private func centerIndicator() {
        guard loadingView != nil  else { return }
        let xCenterConstraint = NSLayoutConstraint(
            item: loadingView!, attribute: .centerX, relatedBy: .equal,
            toItem: indicator, attribute: .centerX, multiplier: 1, constant: 0
        )
        loadingView.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(
            item: loadingView!, attribute: .centerY, relatedBy: .equal,
            toItem: indicator, attribute: .centerY, multiplier: 1, constant: 0
        )
        loadingView.addConstraint(yCenterConstraint)
    }
    
}
