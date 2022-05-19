//
//  FilterTableViewController.swift
//  AnimeMe
//
//  Created by macqoolelee on 2022/5/11.
//

import UIKit

class FilterTableViewController: UITableViewController {
    var index = 0
    var mainPageVewController: MainPageViewController!
    
    var filters: [Filter]!

    lazy var datasource = configureDataSource(index)

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = UIColor.white
        tableView.dataSource = datasource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Filter>()
        snapshot.appendSections([.all])
        snapshot.appendItems(filters, toSection: .all)
        
        datasource.apply(snapshot, animatingDifferences: false)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // if new filter table view, add to history list
        if index == 0 {
            let filter = filters[indexPath.row]
            Constant.filters1.append(filter)
        }
        else{
            
        }
        
    }

    // MARK: - Table view data source

    func configureDataSource(_ i: Int) -> FilterDiffableDataSource {
        
        let cellIdentifier = "FilterCell"
        let dataSource = FilterDiffableDataSource(
            tableView: tableView,
            cellProvider: {
                tableView, indexPath, filter in
                
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FilterTableViewCell
                cell.filterLable?.text = filter.name
                let picName = "icon_filter_" + filter.name
                cell.filterImageView?.image = UIImage(named: picName)
                
                return cell
            }
        )
        
        dataSource.index = i
        
        return dataSource
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // get selected filter
        guard let filter = self.datasource.itemIdentifier(for: indexPath) else{
            return UISwipeActionsConfiguration()
        }
        
        // delete action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, sourceView, completionHandler) in
            
            var snapshot = self.datasource.snapshot()
            snapshot.deleteItems([filter])
            self.datasource.apply(snapshot, animatingDifferences: true)
            
            Constant.filters1.remove(at: indexPath.row)
        
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = UIColor.systemRed
        deleteAction.image = UIImage(systemName: "trash")
        
        let swipeActionConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return swipeActionConfiguration

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFilterDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationNavigationController = segue.destination as! UINavigationController
                let filterGifViewController = destinationNavigationController.topViewController as! FilterGifViewController
                filterGifViewController.filter = filters[indexPath.row]
            }
        }
    }

}
