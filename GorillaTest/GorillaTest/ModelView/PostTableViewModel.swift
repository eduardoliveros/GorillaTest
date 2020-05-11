//
//  PostTableViewModel.swift
//  GorillaTest
//
//  Created by Eduardo Oliveros Acosta on 11/05/20.
//  Copyright © 2020 Eduardo Oliveros Acosta. All rights reserved.
//

import Foundation
import UIKit

struct PostTableViewModel {
    
    var title: String
    var date: String
    var body: String
    var image: UIImage?
    
    init(post: Post) {
        title = post.first_name + post.last_name
        date = post.unix_timestamp
        body = post.post_body
        guard let imageName = post.image, let url = URL(string: imageName) else {
            return
        }
        
        do {
            let imageData = try Data(contentsOf: url)
            image = UIImage(data: imageData)
        } catch {
            print(error)
        }
    }
}
