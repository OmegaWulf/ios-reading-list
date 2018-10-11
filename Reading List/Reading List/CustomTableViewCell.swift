//
//  CustomTableViewCell.swift
//  Reading List
//
//  Created by Nikita Thomas on 10/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var book: Book?
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBAction func buttonPressed(_ sender: Any) {
        
    }
    
    func updateViews() {
        if let title = book?.title {
            label.text = title
        }
        switch book?.hasBeenRead {
        case true:
            button.setImage(UIImage(named: "checked"), for: .normal)
        case false:
            button.setImage(UIImage(named: "unchecked"), for: .normal)
        default:
            return
        }
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
