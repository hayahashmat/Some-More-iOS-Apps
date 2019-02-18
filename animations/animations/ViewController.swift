//
//  ViewController.swift
//  animations
//
//  Created by Nano Degree on 21/09/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    var counter = 1
    @IBOutlet weak var button: UIButton!
    @IBAction func Grow(_ sender: AnyObject) {
     image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
       UIView.animate(withDuration: 2){
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200 )
            
            
        }
     
    }
    @IBAction func SlideIn(_ sender: AnyObject) {
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y )
        
        UIView.animate(withDuration: 0.1){
           self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        }
        
    }
    @IBAction func fadeIn(_ sender: AnyObject) {
        image.alpha = 0
        UIView.animate(withDuration: 2, animations :{
            self.image.alpha = 3
            
        })
    }
    var isAnimating = false
    var timer = Timer()
    func animate(){
        image.image = UIImage(named: "2.\(counter).jpg")
        counter += 1
        if counter == 4 {
            counter = 1
        }
        
    }
    

        
    
    @IBAction func next(_ sender: AnyObject) {
        if isAnimating{
            timer.invalidate()
            button.setTitle("start", for: [])
            isAnimating = false
        }
        else{
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            
            button.setTitle("stop", for: [])
            isAnimating = true
        }
};
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

