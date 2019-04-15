//
//  ViewController.swift
//  LetsRunTasks
//
//  Created by noguchi-ryota on 2019/04/10.
//  Copyright © 2019 noguchi-ryota. All rights reserved.
//

import UIKit

class ViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,TodoTableViewCellDelegate {
    
    var todoList: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let image = UIImage(named: "black0003.png")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
        imageView.image = image
        tableView.backgroundView = imageView
        
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.title = "List"
        navigationItem.leftBarButtonItem = editButtonItem
        
        self.todoList = todoModel.get()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoModel.get().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell: TodoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        todoCell.delegate = self
        todoCell.textField.text = todoList[indexPath.row]
        todoCell.textField.textColor = UIColor.white
        todoCell.textField.isEnabled = false
        return todoCell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
        for cell in tableView!.visibleCells as! [TodoTableViewCell] {
            cell.textField.isEnabled = true
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            todoModel.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
        }
    }
    
    func textFieldDidEndEditing(cell: TodoTableViewCell, value: String) -> () {
        let path = tableView.indexPathForRow(at: cell.convert(cell.bounds.origin, to: tableView))
        todoModel.set(at: path!.row, value: value)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

