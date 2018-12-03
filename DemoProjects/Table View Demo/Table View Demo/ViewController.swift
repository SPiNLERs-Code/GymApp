//
//  ViewController.swift
//  Table View Demo
//
//  Created by Bryan Albrecht on 13.11.18.
//  Copyright © 2018 Zuehlke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        cell.textLabel?.text = "This is the cell for \(indexPath.row)"
        
        cell.imageView?.image = UIImage(named: "panda")
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.text = "Detail Text"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

