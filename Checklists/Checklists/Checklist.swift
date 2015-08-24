//
//  Checklist.swift
//  Checklists
//
//  Created by Andrzej Kostański on 04/03/15.
//  Copyright (c) 2015 Andrzej Kostański. All rights reserved.
//

import UIKit

class Checklist: NSObject {
   var name = ""

    init(name: String) {
        self.name = name
        super.init()
    }
}
