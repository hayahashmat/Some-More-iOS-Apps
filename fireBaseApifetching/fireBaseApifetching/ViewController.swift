//
//  ViewController.swift
//  fireBaseApifetching
//
//  Created by Nano Degree on 01/08/2018.
//  Copyright © 2018 Nano Degree. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
let urlString = "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadJSONWithURL()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func downloadJSONWithURL(){
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as? URL)! , completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary{
                
                print(jsonObj?.value(forKey: "actors"))
                
            }
        })
        
        
        
        
        
    .resume()
    }

}

