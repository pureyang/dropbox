//
//  NewUserSettingsViewController.swift
//  dropbox
//
//  Created by Yang Tang on 10/10/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit

class NewUserSettingsViewController: UIViewController {



    @IBOutlet weak var newUserSettingsScrollView: UIScrollView!
    @IBOutlet weak var newUserSettingsImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        newUserSettingsScrollView.contentSize = CGSizeMake(887, newUserSettingsImageView.image!.size.height)
        newUserSettingsScrollView.contentSize = CGSizeMake(887, 887)

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
