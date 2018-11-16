//
//  BMIService.swift
//  GymApp
//
//  Created by Bryan Albrecht on 16.11.18.
//  Copyright © 2018 Bryan Albrecht. All rights reserved.
//

struct BMIService{
    
    func calculateBMI(height: Int, weight: Int) throws -> Double{
        if height == 0{ throw ArgumentError.invalidArgumentError(errorMessage: "The height can not be 0")}
        if weight == 0{ throw ArgumentError.invalidArgumentError(errorMessage: "The weight can not be 0")}
        
        let heightDouble = Double(height) / 100
        let weightDouble = Double(weight)
        
        let calculated = weightDouble / (heightDouble * heightDouble)
        
        return calculated
    }
}
