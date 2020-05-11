//
//  PostTableViewCell.swift
//  GorillaTest
//
//  Created by Eduardo Oliveros Acosta on 11/05/20.
//  Copyright © 2020 Eduardo Oliveros Acosta. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var imagePostView: UIView!
    
    var model: PostTableViewModel? {
        didSet {
            dateLabel.text = model?.date.getDateFromTimeStamp()
            titleLabel.text = model?.title
            bodyLabel.text = model?.body
            DispatchQueue.main.async { [weak self] in
                guard let image = self?.model?.image else {
                    return
                }
                self?.imagePostView.isHidden = false
                self?.postImage.image = image
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func nib() -> UINib {
        return UINib(nibName: "PostCell", bundle: nil)
    }
}
