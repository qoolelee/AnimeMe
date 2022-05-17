//
//  MainPageViewController.swift
//  AnimeMe
//
//  Created by macqoolelee on 2022/5/13.
//

import UIKit
protocol MainPageViewControllerDelegate: AnyObject {
    func didUpdatePageIndex(currentIndex: Int)
}

class MainPageViewController: UIPageViewController {
    
    var filterNames0 = ["Anime", "Titan", "Arcane"]
    
    var filterNames1 = [String]()
    
    var currentIndex = 0
    
    weak var mainDelegate: MainPageViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        delegate = self
        
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

extension MainPageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    
        if completed {
            if let filterTableViewController = pageViewController.viewControllers?.first as? FilterTableViewController {
                    currentIndex = filterTableViewController.index
                    mainDelegate?.didUpdatePageIndex(currentIndex: filterTableViewController.index)
            }
    } }
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
            
            filterTableViewController.index = index
                
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
