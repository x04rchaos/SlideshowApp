//
//  ViewController.swift
//  test
//
//  Created by KEI MOUE on 2016/07/09.
//  Copyright © 2016年 KEI MOUE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dispImageNo = 0
    var timerRunning = false
    var timer: NSTimer?
    var imageNameArray:NSMutableArray?

    
    // 遷移先から戻る設定
    @IBAction func imagewind(segue: UIStoryboardSegue) {
    }
    
    // imageView
    @IBOutlet weak var imageView1: UIImageView!

    
    // 画像をタップして画面遷移
    @IBAction func tapImage(sender: AnyObject) {
        performSegueWithIdentifier("scaleup", sender: nil)
    }
    
    // 前へボタン
    @IBAction func prevButton(sender: AnyObject) {
        dispImageNo -= 1
        displayImage()
    }
    
    // 次へボタン
    @IBAction func nextButton(sender: AnyObject) {
        dispImageNo += 1
        displayImage()
    }
    
    // 再生ボタン
    @IBAction func playButton(sender: AnyObject) {
        if timerRunning == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(ViewController.onTimer(_:)), userInfo: nil, repeats: true)
            timerRunning = true
            dispImageNo += 1
            displayImage()
            stopButton.setTitle("Stop", forState: .Normal)
            nextmuko.enabled = false
            prevmuko.enabled = false
            
        } else {

        // ボタンのテキストを元に戻す
            timer?.invalidate()
            stopButton.setTitle("Play", forState: .Normal)
            nextmuko.enabled = true
            prevmuko.enabled = true
            timerRunning = false
            
        }
    
    }
 

    @IBOutlet weak var nextmuko: UIButton!
    @IBOutlet weak var prevmuko: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    func displayImage() {

        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        let name = imageNameArray![dispImageNo]
        let image = UIImage(named: name as! String)
        imageView1.image = image
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageNameArray = [
            "img1",
            "img2",
            "img3",
        ]
        
        let image = UIImage(named: "img1")
        imageView1.image = image
        

        
    }
    
    func onTimer(timer: NSTimer) {
        
        print("onTimer")
        
        dispImageNo += 1
        displayImage()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let name = imageNameArray![dispImageNo]
        let image = UIImage(named: name as! String)
        
        print("\(name)")
        print(image)
        
        let viewController:ScaleViewController = segue.destinationViewController as! ScaleViewController
        viewController.image = image
        
        
    }
    
    
}
