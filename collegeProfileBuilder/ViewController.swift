//
//  ViewController.swift
//  collegeProfileBuilder
//
//  Created by VLindsey on 1/20/16.
//  Copyright © 2016 Valerie. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var myTableView: UITableView!

    var college : [College] = []
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        editButton.tag = 0
        college.append(College(Name: "University of Chicago", Location: "Chicago IL", NumOfStudents: 2000, Image: UIImage(named: "chicago")!, WebPage: "uchicago.edu"))
        college.append(College(Name: "Harvard", Location: "Massechussets", NumOfStudents: 2000, Image: UIImage(named: "hharvard")!, WebPage: "harvard.edu"))
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //Creates a cell variable for table view
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        //Sets properties of a cell
        myCell.textLabel!.text = college[indexPath.row].name
        myCell.detailTextLabel!.text = college[indexPath.row].location
        return myCell
    }
    //Required function for table view protocol, Sets numbers of rows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return college.count
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        
        if editButton.tag == 0
        {
            myTableView.editing = true
            editButton.tag = 1
        }
        else
        {
            myTableView.editing = false
            editButton.tag = 0
        }

    }
   
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler { (nameTextfield) -> Void in
            nameTextfield.placeholder = "Add College Name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (locationTextField) -> Void in
            locationTextField.placeholder = "Add Location"
        }
        myAlert.addTextFieldWithConfigurationHandler { (locationTextField) -> Void in
            locationTextField.placeholder = "Add Number of Students"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let collegeTF = myAlert.textFields![0] as UITextField
            let locationTF = myAlert.textFields![1] as UITextField
            let numberTF = myAlert.textFields![2] as UITextField
            let webPageTF = myAlert.textFields![3] as UITextField
            self.college.append(College(Name: collegeTF.text!, Location: locationTF.text!, NumOfStudents: Int(numberTF.text!)!))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        //Presents alert view
        self.presentViewController(myAlert, animated: true, completion: nil)
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete
        {
            college.removeAtIndex(indexPath.row)
            //Reloads tableview data
            myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let collegeBuilder = college[sourceIndexPath.row]
        college.removeAtIndex(sourceIndexPath.row)
        college.insert(collegeBuilder, atIndex: destinationIndexPath.row)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailView = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        detailView.college = college[selectedRow!]
    }

}

