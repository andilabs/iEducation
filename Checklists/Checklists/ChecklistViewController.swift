//
//  ViewController.swift
//  Checklists
//
//  Created by Andrzej Kostański on 04/02/15.
//  Copyright (c) 2015 Andrzej Kostański. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items: [ChecklistItem]
    
    required init(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        
        let row0item = ChecklistItem()
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item)
        
        let row1item = ChecklistItem()
        row1item.text = "Brush my teeth"
        row1item.checked = true
        items.append(row1item)
        
        let row2item = ChecklistItem()
        row2item.text = "Learn iOS development"
        row2item.checked = true
        items.append(row2item)

        let row3item = ChecklistItem()
        row3item.text = "Soccer practice"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = ChecklistItem()
        row4item.text = "Eat ice cream"
        row4item.checked = true
        items.append(row4item)
        
        super.init(coder: aDecoder)
    }
        
//    var row0item: ChecklistItem
//    var row1item: ChecklistItem
//    var row2item: ChecklistItem
//    var row3item: ChecklistItem
//    var row4item: ChecklistItem

    func configureCheckmarkForCell(cell: UITableViewCell, indexPath: NSIndexPath) {

        let item = items[indexPath.row]
        
//        var isChecked = false
        
//        if indexPath.row == 0 { isChecked = row0item.checked
//        } else if indexPath.row == 1 { isChecked = row1item.checked
//        } else if indexPath.row == 2 { isChecked = row2item.checked
//        } else if indexPath.row == 3 { isChecked = row3item.checked
//        } else if indexPath.row == 4 { isChecked = row4item.checked
//        }
        if item.checked {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 44
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem") as UITableViewCell
        
        let item = items[indexPath.row]
        
        let label  = cell.viewWithTag(7) as UILabel

        label.text = item.text
//        if indexPath.row == 0 { label.text = row0item.text
//        } else if indexPath.row == 1 { label.text = row1item.text
//        } else if indexPath.row == 2 { label.text = row2item.text
//        } else if indexPath.row == 3 { label.text = row3item.text
//        } else if indexPath.row == 4 { label.text = row4item.text
//        }
        
        configureCheckmarkForCell(cell, indexPath: indexPath)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath){

            let item = items[indexPath.row]
            item.checked = !item.checked
            
//            if indexPath.row == 0 { row0item.checked = !row0item.checked
//    } else if indexPath.row == 1 { row1item.checked = !row1item.checked
//    } else if indexPath.row == 2 { row2item.checked = !row2item.checked
//    } else if indexPath.row == 3 { row3item.checked = !row3item.checked
//    } else if indexPath.row == 4 { row4item.checked = !row4item.checked
//            }
            
            configureCheckmarkForCell(cell, indexPath: indexPath)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    }
}

