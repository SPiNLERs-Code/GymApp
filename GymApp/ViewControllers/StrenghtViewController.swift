//
//  StrenghtViewController.swift
//  GymApp
//
//  Created by Bryan Albrecht on 14.11.18.
//  Copyright © 2018 Bryan Albrecht. All rights reserved.
//

import UIKit
import AVFoundation

class StrenghtViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private let imageService = ImageService()
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func chooseImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "PhotoSource", message: "Choose a source", preferredStyle: .actionSheet)
        
        if AVCaptureDevice.authorizationStatus(for: .video) !=  .denied {
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler:  {(action:UIAlertAction) in
                
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    imagePickerController.sourceType = .camera
                    self.present(imagePickerController, animated: true,completion: nil)
                }
            }))
        }
        
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler:  {(action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true,completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let shrinkedImage = imageService.convertTosquare(image: image)
        imageView.image = shrinkedImage
        picker.dismiss(animated: true, completion: nil)
        
        }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }

}
