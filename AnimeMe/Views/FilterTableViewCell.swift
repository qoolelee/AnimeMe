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
            filterImageView.layer.cornerRadius = 20
            filterImageView.clipsToBounds = true
        }
    }
    @IBOutlet var filterLable: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addShadowLayer()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addShadowLayer(){
        let containerView = UIImageView(frame: CGRect(x: filterImageView.frame.minX, y: filterImageView.frame.minY, width: filterImageView.frame.width, height: filterImageView.frame.height))

        containerView.layer.cornerRadius =  20
        containerView.clipsToBounds = false

        containerView.dropShadow() // Generate Shadow
        
        filterImageView.superview?.addSubview(containerView)
        filterImageView.superview?.bringSubviewToFront(filterImageView)
        filterImageView.superview?.bringSubviewToFront(filterLable)
    }

}

extension UIView {

    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 10, height: 10) // I made this larger
        layer.shadowRadius = 10

        // I used a rounded rect here
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
}
