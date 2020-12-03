//
//  ViewController.swift
//  Test-DesignEditLayout-001
//
//  Created by 塚田誠司 on 2020/12/02.
//  Copyright © 2020 say. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var toolBarView: UIView!
    @IBOutlet weak var shapeToolView: UIView!
    @IBOutlet weak var textToolView: UIView!
    @IBOutlet weak var lineToolView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        toolBarView.isHidden = true
        shapeToolView.isHidden = true
        //textToolView.isHidden = true
        lineToolView.isHidden = true
    }


}

