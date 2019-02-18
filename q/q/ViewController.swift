//
//  ViewController.swift
//  q
//
//  Created by Haya on 12/29/17.
//  Copyright © 2017 Haya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MainView: my!
    override func viewDidLoad() {
        super.viewDidLoad()
MainView.label.text = "hello "
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

