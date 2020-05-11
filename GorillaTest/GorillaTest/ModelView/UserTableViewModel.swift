//
//  UserTableViewModel.swift
//  GorillaTest
//
//  Created by Eduardo Oliveros Acosta on 11/05/20.
//  Copyright © 2020 Eduardo Oliveros Acosta. All rights reserved.
//

import Foundation

struct UserTableViewModel {
    var nameLabel: String
    var dateLabel: String
    
    init() {
        dateLabel = Date().getPrettyDate()
        nameLabel = "Hello Jane"
    }
}
