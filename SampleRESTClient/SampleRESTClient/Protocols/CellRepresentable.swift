//
//  CellRepresentable.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 09/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import UIKit

protocol CellRepresentable {
    
    /**
     Registers a nib for table view cell
     */
    static func registerCell(tableView: UITableView)
    
    /**
     Dequeues an already allocated cell or allocates a new one.
     
     - Returns: Table View Cell Instance.
     */
    func dequeueCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    
    /**
     Gets Data Model for the selected cell.
     
     - Returns: Data Model object of Any type.
     */
    func modelForSelectedCell() -> Any
}
