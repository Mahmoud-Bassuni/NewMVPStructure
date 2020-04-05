//
//  RepoDesigner.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 4/1/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation

extension RepositoryViewController : DesignerProtocol
{
    func renderUI() {
        self.view.backgroundColor = ColorCompatibility.systemBackground
        self.title = "Repo"
    }
    
    
}
