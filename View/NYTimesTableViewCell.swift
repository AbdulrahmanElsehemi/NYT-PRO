//
//  NYTimesTableViewCell.swift
//  NYT PRO
//
//  Created by Abdelrahman on 8/14/20.
//  Copyright © 2020 abdelrahman. All rights reserved.
//

import UIKit

class NYTimesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var articleTitleLabel: UILabel!
    
    @IBOutlet weak var byLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
