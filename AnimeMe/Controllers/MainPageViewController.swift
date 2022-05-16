//
//  MainPageViewController.swift
//  AnimeMe
//
//  Created by macqoolelee on 2022/5/13.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    var filterNames0 = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oy ster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "RoyalOak", "CASK Pub and Kitchen"]
    
    var filterNames1 = ["Meme restaurant", "Papa Kitchen"]
    
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        if let startingTableViewController = filterTableViewController(at: 0){
            setViewControllers([startingTableViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainPageViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! FilterTableViewController).index
        index -= 1
        
        return filterTableViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! FilterTableViewController).index
        index += 1
        
        return filterTableViewController(at: index)
    }
    
    func filterTableViewController(at index: Int) -> FilterTableViewController?{
        // two pages only
        if index < 0 || index > 1 {
            return nil
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let filterTableViewController = storyboard.instantiateViewController(withIdentifier: "FilterTableViewController") as? FilterTableViewController{
        
            if index == 0 {
                filterTableViewController.filterNames = filterNames0
            }
            else{
                filterTableViewController.filterNames = filterNames1
            }
                
            return filterTableViewController
        }
        
        return nil
    }
    
    func forwardPage(){
        currentIndex += 1
        if currentIndex > 1 {
            currentIndex = 1
            return
        }
        if let nextFilterTableViewController = filterTableViewController(at: currentIndex){
            setViewControllers([nextFilterTableViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func backwardPage(){
        currentIndex -= 1
        if currentIndex < 0 {
            currentIndex = 0
            return
        }
        if let nextFilterTableViewController = filterTableViewController(at: currentIndex){
            setViewControllers([nextFilterTableViewController], direction: .reverse, animated: true, completion: nil)
        }
    }
}
