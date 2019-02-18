//
//  ViewController.swift
//  t3
//
//  Created by Haya on 12/28/17.
//  Copyright © 2017 Haya. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   // @IBOutlet weak var cell: Mycell!
    var array = [UIImage(named : "1") , UIImage(named :"2") ,UIImage(named: "3"),UIImage(named : "4")]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.automaticallyAdjustsScrollViewInsets = false
        
//        collectionView?.register(Mycell.self, forCellWithReuseIdentifier: firstCellid)
//        collectionView?.register(Mycell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: firstFooterCellid)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return array.count // instead of returnin dataSource.count
    
    }

        
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Mycell
      
        cell.image.image = array[indexPath.row % array.count]
      
        
        return cell
        

    }}
    


    


