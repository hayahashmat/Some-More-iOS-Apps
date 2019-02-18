//
//  my.swift
//  q
//
//  Created by Haya on 12/29/17.
//  Copyright © 2017 Haya. All rights reserved.
//

import UIKit

class my: UIView {
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var label: UILabel!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        Bundle.main.loadNibNamed("my", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight , .flexibleWidth]
        
    }
}


