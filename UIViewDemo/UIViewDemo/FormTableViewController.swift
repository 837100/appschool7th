//
//  FormTableTableViewController.swift
//  UIViewDemo
//
//  Created by NO SEONGGYEONG on 3/13/25.
//

import UIKit

class FormTableTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = .black
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 3:
            return 3
        default:
            return 2
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        var config = cell.defaultContentConfiguration()
        config.text = "section: \(indexPath.section), Row: \(indexPath.row)"
        cell.contentConfiguration = config
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        case 1:
            return 200
        default:
            return 50
        }
    }
}


#Preview {
    FormTableTableViewController(style: .insetGrouped)
}
