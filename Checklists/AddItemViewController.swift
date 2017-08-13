//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Андрей Питеров on 09/08/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var doneBarBtn: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
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
        print("Content of the text field: \(textField.text!)")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
}
