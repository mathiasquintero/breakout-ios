//
//  SidebarMenuTableViewController.swift
//  BreakOut
//
//  Created by Leo Käßner on 07.01.16.
//  Copyright © 2016 BreakOut. All rights reserved.
//

import UIKit

class SidebarMenuTableViewController: UITableViewController {
    
    @IBOutlet weak var userPictureImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userDistanceRemainingTimeLabel: UILabel!
    @IBOutlet weak var addUserpictureButton: UIButton!
    
// MARK: - Screen Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.addUserpictureButton.backgroundColor = UIColor.whiteColor()
        self.addUserpictureButton.layer.cornerRadius = self.addUserpictureButton.frame.size.width / 2.0
        
        if self.userPictureImageView.image == nil {
            self.addUserpictureButton.hidden = false
        }else{
            self.addUserpictureButton.hidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        // Tracking
        //Flurry.logEvent("/user/profile", withParameters: nil, timed: true)
    }
    
    override func viewDidDisappear(animated: Bool) {
        // Tracking
        //Flurry.endTimedEvent("/user/profile", withParameters: nil)
    }
    
    
// MARK: - TableView Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if let slideMenuController = self.slideMenuController() {
            let controller = self.storyboard?.instantiateViewControllerWithIdentifier(cell.reuseIdentifier!)
            slideMenuController.changeMainViewController(controller!, close: true)
            
            if cell.reuseIdentifier == "InternalWebViewController" {
                let internalWebViewController = controller as! InternalWebViewController
                internalWebViewController.openWebpageWithUrl("http://break-out.org/worum-gehts/")
            }
        }
    }
    
// MARK: - Button Actions

    @IBAction func addUserpictureButtonPressed(sender: UIButton) {
    }
}
