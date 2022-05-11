//
//  FilterTableViewCell.swift
//  AnimeMe
//
//  Created by macqoolelee on 2022/5/11.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    
    @IBOutlet var filterImageView: UIImageView!{
        didSet{
            filterImageView.layer.cornerRadius = 20.0
            filterImageView.clipsToBounds = true
            
            filterImageView.layer.shadowColor = UIColor.gray.cgColor
            filterImageView.layer.shadowOpacity = 1.0
            filterImageView.layer.shadowOffset = .zero
            filterImageView.layer.shadowRadius = 10.0
        }
    }
    @IBOutlet var filterLable: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
