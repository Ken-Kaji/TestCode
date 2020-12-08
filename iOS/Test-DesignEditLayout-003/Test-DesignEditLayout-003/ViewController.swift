//
//  ViewController.swift
//  Test-DesignEditLayout-003
//
//  Created by 塚田誠司 on 2020/12/05.
//  Copyright © 2020 say. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var MainTool1Button: UIButton!
    @IBOutlet weak var MainTool2Button: UIButton!
    @IBOutlet weak var MainTool3Button: UIButton!
    @IBOutlet weak var MainTool4Button: UIButton!
    @IBOutlet weak var MainToolBarView: UIView!
    
    var MainToolButtons:[UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MainToolButtons.append(MainTool1Button)
        MainToolButtons.append(MainTool2Button)
        MainToolButtons.append(MainTool3Button)
        MainToolButtons.append(MainTool4Button)
        MainToolButtons[0].setImage(UIImage(named: "number3_1"), for: .normal)
        MainTool2Button.setImage(UIImage(imageLiteralResourceName: "number3_2"), for: .normal)
        MainToolButtons[3].setImage(UIImage(named: "number3_3"), for: .normal)

    }

    @IBAction func tappedButton(_ sender: Any) {
    }
    
}

