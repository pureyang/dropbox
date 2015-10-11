//
//  WelcomePagedViewController.swift
//  dropbox
//
//  Created by Yang Tang on 10/10/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit

class WelcomePagedViewController: UIViewController {

    @IBOutlet weak var welcome1: UIImageView!
    @IBOutlet weak var welcome2: UIImageView!
    @IBOutlet weak var welcome3: UIImageView!
    
    @IBOutlet weak var signIN1Button: UIButton!
    
    @IBOutlet weak var signIN2Button: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var pagedWelcomeScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.pagedWelcomeScrollView.frame = CGRectMake(0,0,self.view.frame.width, self.view.frame.height)
        welcome1.addSubview(signIN1Button)
        welcome3.addSubview(signIN2Button)
            welcome3.addSubview(signUpButton)
        
        pagedWelcomeScrollView.addSubview(welcome1)
        pagedWelcomeScrollView.addSubview(welcome2)
        pagedWelcomeScrollView.addSubview(welcome3)
        pagedWelcomeScrollView.contentSize = CGSizeMake(self.pagedWelcomeScrollView.frame.width*3, self.pagedWelcomeScrollView.frame.height)
        
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
