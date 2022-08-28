//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by juris.katkovskis on 25/08/2022.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
