//
//  FilterDiffableDataSource.swift
//  AnimeMe
//
//  Created by macqoolelee on 2022/5/17.
//

import UIKit

enum Section{
    case all
}

class FilterDiffableDataSource: UITableViewDiffableDataSource<Section, Filter> {
    var index: Int = 0

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if index == 0 {
            return false
        }
        
        return true
    }
    
    /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            if let filter = self.itemIdentifier(for: indexPath){
                var snapshot = self.snapshot()
                snapshot.deleteItems([filter])
                self.apply(snapshot, animatingDifferences: true)
                
                Constant.filters1.remove(at: indexPath.row)
            }
        
            
        }
        
    }
     */
}
