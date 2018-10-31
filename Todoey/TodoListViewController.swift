//
//  ViewController.swift
//  Todoey
//
//  Created by Patricia Buchner on 8/28/18.
//  Copyright © 2018 Patricia Buchner. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Bananas","Apples","Pears"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //
    //MARK -- Table view datasource methods
    //       what cells should display and how many rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Resuable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    
    //
    // MARK - TableView delegate methods
    //
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row) // print number when clicked
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
}

