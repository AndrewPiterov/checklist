//
//  File.swift
//  Checklists
//
//  Created by Андрей Питеров on 07/08/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, NSCoding {
    var text = ""
    var checked = false
    
    override init(){
        super.init()
    }
    
    convenience init(_ withText: String) {
        self.init(withText, checked: false)
    }
    
    init(_ withText: String, checked: Bool) {
        self.text = withText
        self.checked = checked
    }
    
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "Text") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
    }
    
    func toggleChecker(){
        checked = !checked
    }
}
