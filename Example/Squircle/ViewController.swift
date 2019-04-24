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
    
    @IBOutlet var view3: UIView!
    @IBOutlet var view2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        squircleView.squircle()
        view2.squircle()
        view3.squircle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

