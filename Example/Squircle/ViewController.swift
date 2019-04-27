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

    @IBOutlet weak var squircle1View: UIView!
    @IBOutlet weak var squircle2View: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        squircle1View.squircle()
        squircle2View.squircleWithBorder(width: 5.0, color: .orange)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

