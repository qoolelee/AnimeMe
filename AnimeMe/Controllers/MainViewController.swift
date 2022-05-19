//
//  MainViewController.swift
//  AnimeMe
//
//  Created by macqoolelee on 2022/5/11.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var newFiltersButton: UIButton!{
        didSet{
            newFiltersButton.backgroundColor = UIColor(red: 254/255, green: 241/255, blue: 119/255, alpha: 1)
            historyButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
            
            newFiltersButton.layer.cornerRadius = 10
            newFiltersButton.clipsToBounds = true
        }
    }
    @IBOutlet var historyButton: UIButton!{
        didSet{
            historyButton.layer.cornerRadius = 10
            historyButton.clipsToBounds = true
        }
    }
    
    
    @IBAction func newFilterButtonClicked(){
        if mainPageViewController?.currentIndex == 0{
            return
        }
        mainPageViewController?.backwardPage()
    
        newFiltersButton.backgroundColor = UIColor(red: 254/255, green: 241/255, blue: 119/255, alpha: 1)
        historyButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
    }
    
    @IBAction func historyButtonClicked(){
        if mainPageViewController?.currentIndex == 1{
            return
        }
        mainPageViewController?.forwardPage()
        
        newFiltersButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        historyButton.backgroundColor = UIColor(red: 254/255, green: 241/255, blue: 119/255, alpha: 1)
    }
    
    var mainPageViewController: MainPageViewController?
    var backgroundIndicator: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // navigationbar
        // title
        if let customFont = UIFont(name: "Montserrat-SemiBold", size: 24.0){
            setLeftAlignTitleView(font: customFont, text: "AnimeMe", textColor: UIColor.black)
        }
        
        // navigation icons spacing adjustment
        setNavigationIcons()
        
        
    }
    
    func setLeftAlignTitleView(font: UIFont, text: String, textColor: UIColor) {
        guard let navFrame = navigationController?.navigationBar.frame else{
            return
        }
        
        let parentView = UIView(frame: CGRect(x: 0, y: 0, width: navFrame.width*3, height: navFrame.height))
        self.navigationItem.titleView = parentView
        
        let label = UILabel(frame: .init(x: parentView.frame.minX + 10.0, y: parentView.frame.minY, width: parentView.frame.width, height: parentView.frame.height))
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = font
        label.textAlignment = .left
        label.textColor = textColor
        label.text = text
        
        parentView.addSubview(label)
    }
    
    
    func setNavigationIcons(){
        let loginImage = UIImage(named: "ic_account_circle")!
        let searchImage = UIImage(named: "ic_search")!
        let shareImage = UIImage(named: "ic_share")!

        let loginBtn: UIButton = UIButton.init(type: .custom)
        loginBtn.setImage(loginImage, for: .normal)
        loginBtn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        loginBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let loginBarBtn = UIBarButtonItem(customView: loginBtn)

        let searchBtn: UIButton = UIButton.init(type: .custom)
        searchBtn.setImage(searchImage, for: .normal)
        searchBtn.addTarget(self, action: #selector(searchBtnPressed), for: .touchUpInside)
        searchBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let searchBarBtn = UIBarButtonItem(customView: searchBtn)

        let shareBtn: UIButton = UIButton.init(type: .custom)
        shareBtn.setImage(shareImage, for: .normal)
        shareBtn.addTarget(self, action: #selector(shareBtnPressed), for: .touchUpInside)
        shareBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let shareBarBtn = UIBarButtonItem(customView: shareBtn)

        self.navigationItem.setRightBarButtonItems([loginBarBtn, searchBarBtn, shareBarBtn], animated: false)
    }
    
    
    @objc func loginBtnPressed(sender: UIButton){
        
    }
    
    @objc func searchBtnPressed(sender: UIButton){
        
    }
    
    @objc func shareBtnPressed(sender: UIButton){
        
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        
        if let pageViewController = destination as? MainPageViewController {
            mainPageViewController = pageViewController
            mainPageViewController?.mainDelegate = self
        }
    }
    
    func UpdateButtonBackGround(_ currentIndex: Int){
        if currentIndex == 0{
            newFiltersButton.backgroundColor = UIColor(red: 254/255, green: 241/255, blue: 119/255, alpha: 1)
            historyButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        }
        else{
            newFiltersButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
            historyButton.backgroundColor = UIColor(red: 254/255, green: 241/255, blue: 119/255, alpha: 1)
        }
    }

}

extension MainViewController: MainPageViewControllerDelegate{
    func didUpdatePageIndex(currentIndex: Int) {
        UpdateButtonBackGround(currentIndex)
    }
}
