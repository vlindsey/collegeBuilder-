//
//  DetailViewController.swift
//  collegeProfileBuilder
//
//  Created by VLindsey on 1/20/16.
//  Copyright © 2016 Valerie. All rights reserved.
//

import UIKit

import SafariServices
class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var webPageTextField: UITextField!
    @IBOutlet weak var mapText: UITextField!
    
    @IBOutlet weak var buttonTapped: UIButton!
    @IBOutlet weak var goToWebsiteButton: UIButton!
    
    var college : College!
    var image = UIImagePickerController()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        numberOfStudentsTextField.text = String(college.numOfStudents)
        myImage.image = college.image
        webPageTextField.text = college.webPage
        
        image.delegate = self
        image.allowsEditing = true

    }

    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numOfStudents = Int(numberOfStudentsTextField.text!)!
        college.webPage = webPageTextField.text!
        

    }
    
    @IBAction func goToWebsiteButtonTapped(sender: UIButton)
    {
        let myURL = NSURL(string: "https://www." + webPageTextField.text!)
        let SVC = SFSafariViewController(URL: myURL!)
        SVC.delegate = self
        presentViewController(SVC, animated: true, completion: nil)
    }
    func safariViewControllerDidFinish(controller: SFSafariViewController)
                {
                    controller.dismissViewControllerAnimated(true, completion: nil)
                }
    
    @IBAction func addImageButtonTapped(sender: UIButton)
    {
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(image, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
          image.dismissViewControllerAnimated(true)
            { () -> Void in
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.myImage.image = selectedImage
            }
    }

    
    

}
