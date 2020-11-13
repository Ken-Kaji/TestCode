//
//  MenuListViewController.swift
//  test-menulist-001
//
//  Created by 塚田誠司 on 2020/11/13.
//  Copyright © 2020 say. All rights reserved.
//

import Foundation
import UIKit

class MenuListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("<MenuListViewController::viewDidLoad />")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("<MenuListViewController::viewDidAppear />")
    }
}
