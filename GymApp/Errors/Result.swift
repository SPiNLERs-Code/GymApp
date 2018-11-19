//
//  Result.swift
//  GymApp
//
//  Created by Bryan Albrecht on 19.11.18.
//  Copyright © 2018 Bryan Albrecht. All rights reserved.
//

enum Result<T>{
    case success(T)
    case failure(Error)
}
