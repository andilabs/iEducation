//
//  ViewController.swift
//  Checklists
//
//  Created by Andrzej Kostański on 04/02/15.
//  Copyright (c) 2015 Andrzej Kostański. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var itemsList: [(text:String, state:Bool)] = [
        (text:"Walk the dog", state:false),
        (text:"Brush teeth", state:true),
        (text:"Learn iOS development", state:true),
        (text:"Soccer practice", state:false),
        (text:"Eat ice cream", state:true)
    ]
    

    func configureCheckmarkForCell(cell: UITableViewCell, indexPath: NSIndexPath) {
        println("I was called with \(indexPath.row)")
        if itemsList[indexPath.row].state {
            cell.accessoryType = .Checkmark
        }
        else {
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
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem") as UITableViewCell
//        println(indexPath.row)
//        println(indexPath.section)
        
        let label  = cell.viewWithTag(7) as UILabel

        for index in 0...4 {
            if indexPath.row == index{
                label.text = itemsList[index].text
            }
        }
        configureCheckmarkForCell(cell, indexPath: indexPath)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath){

            for index in 0...4 {
                if indexPath.row == index {
                    itemsList[index].state = !itemsList[index].state
                }
            }
            
            configureCheckmarkForCell(cell, indexPath: indexPath)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    }
}

