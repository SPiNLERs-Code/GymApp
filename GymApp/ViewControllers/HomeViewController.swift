//
//  HomeViewController.swift
//  GymApp
//
//  Created by Bryan Albrecht on 14.11.18.
//  Copyright © 2018 Bryan Albrecht. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeImage: UIImageView!
    private let webService = WebService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        if let url = URL(string: "https://img.jobs.ch/www/img/organisation/profile_image_27786.jpg") {
            downloadImage(from: url)
        }
    }
    
    func downloadImage(from url: URL) {
        
        webService.getData(from: url) { data, response, error in
            guard let data = data, error == nil else {return}
            print(response?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() {
                self.homeImage.image = UIImage(data: data)
            }
        }
    }


}

