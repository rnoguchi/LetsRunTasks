//
//  AddController.swift
//  LetsRunTasks
//
//  Created by noguchi-ryota on 2019/04/10.
//  Copyright © 2019 noguchi-ryota. All rights reserved.
//

import UIKit

class AddController: BaseViewController {
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBAction func addButton(_ sender: UIButton) {
        todoModel.add(text: titleField.text)
        titleField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
