//
//  Book.swift
//  Reading List
//
//  Created by Nikita Thomas on 10/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Book: Equatable, Codable {
    var title: String
    var reasonToRead: String
    var hasBeenRead: Bool
    
    init(title: String, reasonToRead: String, hasBeenRead: Bool = false) {
        (self.title, self.reasonToRead, self.hasBeenRead) = (title, reasonToRead, hasBeenRead)
    }
}

