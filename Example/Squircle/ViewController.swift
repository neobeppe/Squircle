//
//  ViewController.swift
//  Squircle
//
//  Created by neobeppe on 04/10/2018.
//  Copyright (c) 2018 neobeppe. All rights reserved.
//

import UIKit
import Squircle

class ViewController: UIViewController {

    @IBOutlet weak var squircleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squircleView.squircle(with: 10)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

