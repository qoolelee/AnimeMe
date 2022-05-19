//
//  FilterGifViewController.swift
//  AnimeMe
//
//  Created by macqoolelee on 2022/5/17.
//

import UIKit
import SwiftyGif

class FilterGifViewController: UIViewController {
    var filter: Filter!
    var containerView: UIImageView?
    
    @IBOutlet var gifImageView: UIImageView!{
        didSet{
            gifImageView.layer.cornerRadius = 20
            gifImageView.clipsToBounds = true
        }
    }
    @IBOutlet var selectPicButton: UIButton!{
        didSet{
            selectPicButton.layer.cornerRadius = 10
            selectPicButton.clipsToBounds = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // navigationbar
        // title
        if let customFont = UIFont(name: "Montserrat-SemiBold", size: 24.0){
            setLeftAlignTitleView(font: customFont, text: filter.name, textColor: UIColor.black)
        }
        
        setNavigationIcons()
        
        do{
            let gif = try UIImage(gifName: filter.name + ".gif")
            self.gifImageView.setGifImage(gif, loopCount: -1)
        }
        catch{
            print(error)
        }
        
        containerView = UIImageView(frame: CGRect(x: gifImageView.frame.minX, y: gifImageView.frame.minY, width: gifImageView.frame.width, height: gifImageView.frame.height))
        
        containerView?.center = gifImageView.superview!.convert(gifImageView.superview!.center, from:gifImageView.superview!)

        if let containerView = containerView {
            containerView.layer.cornerRadius =  20
            containerView.clipsToBounds = false
            
            gifImageView.superview?.addSubview(containerView)
            gifImageView.superview?.bringSubviewToFront(gifImageView)
        }
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        containerView?.dropShadow() // Generate Shadow
    }

    func setLeftAlignTitleView(font: UIFont, text: String, textColor: UIColor) {
        guard let navFrame = navigationController?.navigationBar.frame else{
            return
        }
        
        let parentView = UIView(frame: CGRect(x: 0, y: 0, width: navFrame.width*3, height: navFrame.height))
        self.navigationItem.titleView = parentView
        
        let label = UILabel(frame: .init(x: parentView.frame.minX, y: parentView.frame.minY, width: parentView.frame.width, height: parentView.frame.height))
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = font
        label.textAlignment = .left
        label.textColor = textColor
        label.text = text
        
        parentView.addSubview(label)
    }
    
    func setNavigationIcons(){
        let backImage = UIImage(named: "ic_arrow_back")!

        let backBtn: UIButton = UIButton.init(type: .custom)
        backBtn.setImage(backImage, for: .normal)
        backBtn.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        backBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let backBarBtn = UIBarButtonItem(customView: backBtn)

        self.navigationItem.setLeftBarButtonItems([backBarBtn], animated: false)
    }
    
    @objc func backBtnPressed(sender: UIButton){
        dismiss(animated: true)
    }
    
    

}
