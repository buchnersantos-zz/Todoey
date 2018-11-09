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
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "TodoListArray") as! [Item]? {
            itemArray = items
        }
        
        let newItem = Item()
        newItem.title = "Bananas"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Popcorn"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Cards"
        itemArray.append(newItem3)
    }
    
    //
    //MARK -- Table view datasource methods
    //       what cells should display and how many rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRow called")
        
        //Resuable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
                
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        //ternary operator
        //cell.accessoryType = item.done ? .checkmark : .none
        
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
    
    //
    //  MARK - Add New Items
    //  UIAlert with textfield when this button is clicked and append to end of array
    //
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        print("addButtonPressed")
        var textField = UITextField()

        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what happens once user clicks AddItem
            print("Success!")

            let item = Item()
            item.title = textField.text!
            
            self.itemArray.append(item)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
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

