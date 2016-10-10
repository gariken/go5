//
//  questionsViewController.swift
//  go5
//
//  Created by Александр on 08.10.16.
//  Copyright © 2016 Александр. All rights reserved.
//

import UIKit

class questionsViewController: UITableViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

 
    

}
