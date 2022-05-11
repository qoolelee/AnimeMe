//
//  FilterTableViewController.swift
//  AnimeMe
//
//  Created by macqoolelee on 2022/5/11.
//

import UIKit

class FilterTableViewController: UITableViewController {
    
    enum Section{
        case all
    }
    
    lazy var datasource = configureDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    func configureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        
        let cellIdentifier = "FilterCell"
        let dataSource = UITableViewDiffableDataSource<Section, String>(
            tableView: tableView,
            cellProvider: {
                tableView, indexPath, filterName in
                
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FilterTableViewCell
                cell.filterLable?.text = filterName
                cell.filterImageView?.image = UIImage(named: "restaurant")
                return cell
            }
        )
        return dataSource
    }

}
