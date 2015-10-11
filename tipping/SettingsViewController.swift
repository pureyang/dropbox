//
//  SettingsViewController.swift
//  dropbox
//
//  Created by Yang Tang on 10/9/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIScrollViewDelegate {



    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        //scrollView.contentSize = CGSizeMake(772, imageView.image!.size.height)
        scrollView.contentSize = CGSizeMake(887, 887)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
