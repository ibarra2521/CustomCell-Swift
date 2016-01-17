//
//  DetailViewController.swift
//  CustomCell Swift
//
//  Created by Nivardo Ibarra on 10/28/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!

    var name: String?
    var age: Int?
    var detailImageViewName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblName.text = name
        self.lblAge.text = String(age!)
        self.detailImageView.image = UIImage(named:detailImageViewName!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
