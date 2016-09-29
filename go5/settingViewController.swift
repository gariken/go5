//
//  settingViewController.swift
//  go5
//
//  Created by Александр on 29.09.16.
//  Copyright © 2016 Александр. All rights reserved.
//

import UIKit

class settingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    internal var first = ["NAME", "SURNAME", "EMAIL", "...", "PASSWORD"]
    internal var second = ["USER", "SURNAME", "USER@USER.com", "***"]
    var array = [ ["Moscow", "Saint Petersburg", "Novosibirsk", "Novosibirsk", "Nizhny Novgorod", "Samara", "Omsk" ],
                  
                  ["Kiyv", "Odessa", "Donetsk", "Harkiv", "Lviv", "Uzhgorod", "Zhytomyr", "Luhansk", "Mikolayv", "Kherson"],
                  
                  ["Berlin", "Hamburg", "Munich", "Cologne", "Frankfurt", "Stuttgart", "Düsseldorf", "Dortmund", "Essen", "Bremen"]]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.reloadData()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! settingCell
        
        cell.labelOne?.text = array[indexPath.section][indexPath.row]
        
        return cell
    }

 




}
