//
//  ViewController.swift
//  Todoey
//
//  Created by Patricia Buchner on 8/28/18.
//  Copyright © 2018 Patricia Buchner. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    var defaults = UserDefaults.standard
    
    let defaultsKey = "TodoListArray"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = Item()
        item1.title = "Apples"
        itemArray.append(item1)
        
        let item2 = Item()
        item2.title = "Bananas"
        itemArray.append(item2)
        
        let item3 = Item()
        item3.title = "Pijamas"
        itemArray.append(item3)
        
        //if let items = defaults.array(forKey: defaultsKey) as? [Item] {
        //    itemArray = items
        //}
    }
    
    
    // MARK - TableView datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.accessoryType = item.done == true ? .checkmark : .none

        cell.textLabel?.text = item.title
        
        return cell
    }
    
    // MARK - TableView delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //  MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()

        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
          
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            //self.defaults.set(self.itemArray, forKey: self.defaultsKey)
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

