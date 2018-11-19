//
//  ToDoViewController.swift
//  GymApp
//
//  Created by Bryan Albrecht on 19.11.18.
//  Copyright © 2018 Bryan Albrecht. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController, UITableViewDataSource{
    private var tasks: [ToDo] = []
    
    @IBOutlet weak var taskListTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = tasks[indexPath.row].title
        
        return cell
    }
    

    private let webService = WebService();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ToDo"
        
        let jsonURL = "https://jsonplaceholder.typicode.com/todos"
        let myUrl = URL(string: jsonURL)
        URLSession.shared.dataTask(with: myUrl!) { (data, response, error) in
            guard let mydata = data else { return}
            
            do {
                let todos = try JSONDecoder().decode([ToDo].self, from: mydata)
                self.tasks = todos
                self.taskListTableView.reloadData()
                
            }
            catch{
                
            }
            }.resume()
    }
}
