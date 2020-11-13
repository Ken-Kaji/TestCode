//
//  ViewController.swift
//  test-menulist-001
//
//  Created by 塚田誠司 on 2020/11/12.
//  Copyright © 2020 say. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("<ViewController::viewDidLoad>")
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        print("<ViewController::buttonTapped />")
        self.performSegue(withIdentifier: "toMenuList", sender: nil)
    }
    

}

