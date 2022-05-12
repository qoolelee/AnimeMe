//
//  FilterTableViewController.swift
//  AnimeMe
//
//  Created by macqoolelee on 2022/5/11.
//

import UIKit

class FilterTableViewController: UITableViewController {
    
    var filterNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oy ster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "RoyalOak", "CASK Pub and Kitchen"]
    
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
        return 210
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
