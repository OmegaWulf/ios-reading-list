//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Nikita Thomas on 10/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate {
    func toggleHasBeenRead(for cell: BookTableViewCellDelegate?)
}
