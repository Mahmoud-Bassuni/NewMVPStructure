//
//  RepositoryTableViewCell.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 4/1/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import UIKit
class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textLbl: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func setTitle(title : String) {
        textLbl.text = title
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
