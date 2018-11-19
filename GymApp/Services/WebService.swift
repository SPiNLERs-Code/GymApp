//
//  WebService.swift
//  GymApp
//
//  Created by Bryan Albrecht on 19.11.18.
//  Copyright © 2018 Bryan Albrecht. All rights reserved.
//

import Foundation

struct WebService{
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
