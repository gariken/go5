//
//  tabBar.swift
//  go5
//
//  Created by Александр on 27.09.16.
//  Copyright © 2016 Александр. All rights reserved.
//

import UIKit


class tabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 10.0, *) {
            self.tabBar.unselectedItemTintColor = UIColor(red: 0.290, green: 0.725, blue: 0.137, alpha: 1.000)
            self.tabBar.backgroundColor = UIColor.white
            self.tabBar.barTintColor = UIColor.white
            self.tabBar.tintColor = UIColor(red: 0.290, green: 0.725, blue: 0.137, alpha: 1.000)
        } else {
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.barTintColor = UIColor.white
        self.tabBar.tintColor = UIColor(red: 0.290, green: 0.725, blue: 0.137, alpha: 1.000)
        }
    }
}
