//
//  UserTableViewCell.swift
//  GorillaTest
//
//  Created by Eduardo Oliveros Acosta on 11/05/20.
//  Copyright © 2020 Eduardo Oliveros Acosta. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var model: UserTableViewModel? {
        didSet {
            dateLabel.text = model?.dateLabel
            nameLabel.text = model?.nameLabel
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func nib() -> UINib {
        return UINib(nibName: "UserCell", bundle: nil)
    }
}
