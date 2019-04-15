//
//  TodoTableViewCell.swift
//  LetsRunTasks
//
//  Created by noguchi-ryota on 2019/04/11.
//  Copyright © 2019 noguchi-ryota. All rights reserved.
//

import UIKit

protocol TodoTableViewCellDelegate {
    func textFieldDidEndEditing(cell: TodoTableViewCell, value: String) -> ()
}

class TodoTableViewCell: UITableViewCell, UITextFieldDelegate {

    var delegate: TodoTableViewCellDelegate! = nil
    
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField?.delegate = self
        textField?.returnKeyType = .done
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func height() -> CGFloat {
        return 75.0
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        self.delegate.textFieldDidEndEditing(cell: self, value: textField.text!)
    }
}
