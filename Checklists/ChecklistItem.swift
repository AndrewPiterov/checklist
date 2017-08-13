//
//  File.swift
//  Checklists
//
//  Created by Андрей Питеров on 07/08/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    override init(){
        
    }
    
    convenience init(_ withText: String) {
        self.init(withText, checked: false)
    }
    
    init(_ withText: String, checked: Bool) {
        self.text = withText
        self.checked = checked
    }
    
    func toggleChecker(){
        checked = !checked
    }
}
