//
//  scaleViewController.swift
//  SlideshowApp
//
//  Created by KEI MOUE on 2016/07/10.
//  Copyright © 2016年 KEI MOUE. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {



    @IBOutlet weak var imageView2: UIImageView!
    var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView2.image = image


        // Do any additional setup after loading the view.
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
