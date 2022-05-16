//
//  FilterTableViewController.swift
//  AnimeMe
//
//  Created by macqoolelee on 2022/5/11.
//

import UIKit

class FilterTableViewController: UITableViewController {
    var index = 0
    
    var filterNames: [String]!
    
    enum Section{
        case all
    }
    
    lazy var datasource = configureDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = datasource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.all])
        snapshot.appendItems(filterNames, toSection: .all)
        
        datasource.apply(snapshot, animatingDifferences: false)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
