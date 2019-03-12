//
//  ColorSelectionTableViewController.swift
//  ExtensionsPOC
//
//  Created by Deepak Thakur on 10/03/19.
//  Copyright © 2019 Deepak Thakur. All rights reserved.
//

import UIKit

@objc(ColorSelectionViewControllerDelegate)
protocol ColorSelectionViewControllerDelegate {
    @objc optional func colorSelection(sender: ColorSelectionTableViewController, selectedValue: String)
}

class ColorSelectionTableViewController: UITableViewController {
    //https://www.youtube.com/watch?v=TBC2m8BbcCE
    
    let colorSelections = ["Default", "Red", "Blue"]
    let tableViewCellIdentifier = "colorSelectionCell"
    var selectedColorName: String = "Default"
    var delegate: ColorSelectionViewControllerDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: tableViewCellIdentifier);
        title = "Choose Color";
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as UITableViewCell
        let text = colorSelections[indexPath.row];
        cell.textLabel?.text = text;
        
        if text == selectedColorName {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let theDelegate = delegate {
            selectedColorName = colorSelections[indexPath.row]
            theDelegate.colorSelection!(sender: self, selectedValue: selectedColorName);
        }
    }
 

    
}
