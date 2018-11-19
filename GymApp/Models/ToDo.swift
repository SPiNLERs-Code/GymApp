//
//  ToDo.swift
//  GymApp
//
//  Created by Bryan Albrecht on 19.11.18.
//  Copyright © 2018 Bryan Albrecht. All rights reserved.
//

import Foundation

struct ToDo : Decodable{
    var id: Int
    var userId: Int
    var title: String
    var completed: Bool
}
