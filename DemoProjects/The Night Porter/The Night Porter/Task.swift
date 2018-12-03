//
//  Task.swift
//  The Night Porter
//
//  Created by Bryan Albrecht on 13.11.18.
//  Copyright © 2018 Zuehlke. All rights reserved.
//

import Foundation

enum TaskType {
    case daily, weekly, monthly
}

struct Task {
    var name : String
    var type : TaskType
    var completed : Bool
    var lastCompleted : NSData?
}
