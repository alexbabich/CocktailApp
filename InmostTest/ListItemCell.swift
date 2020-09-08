//
//  ListItemCell.swift
//  InmostTest
//
//  Created by alex-babich on 08.09.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import UIKit

class ListItemCell: UITableViewCell {
    
    @IBOutlet weak var itemTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setItemTitle(_ name: String) {
        self.itemTitle.text = name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
