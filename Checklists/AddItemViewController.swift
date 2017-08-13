//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Андрей Питеров on 09/08/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
    func addItemViewController(_ controller: AddItemViewController, didFinishEdeting item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var doneBarBtn: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: AddItemViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    
    override func viewDidLoad() {
        if let item = itemToEdit{
            title = "Edit Item"
            textField.text = item.text
            doneBarBtn.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        doneBarBtn.isEnabled = newText.length > 3
        return true
    }
    
    @IBAction func done(_ sender: Any) {
        if let item = itemToEdit{
            item.text = textField.text!
            delegate?.addItemViewController(self, didFinishEdeting: item)
        } else{
            let item = ChecklistItem(textField.text!)
            delegate?.addItemViewController(self, didFinishAdding: item)
        }
    }
    
    @IBAction func cancel(_ sender: Any){
        delegate?.addItemViewControllerDidCancel(self)
    }
}
