//
//  ArgumentError.swift
//  GymApp
//
//  Created by Bryan Albrecht on 16.11.18.
//  Copyright © 2018 Bryan Albrecht. All rights reserved.
//

enum ArgumentError : Error{
    case argumentNullError(argumentName: String)
    case invalidArgumentError(errorMessage: String)
}
