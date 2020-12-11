//
//  ViewController.swift
//  
//  
//  Created by maeda.tasuku on 2019/07/06
//  Copyright © 2019 Classmethod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let menu:[DrawerMenu] = [
        DrawerMenu(enable: true, text:  "Menu1", image:"number3_1.png"),
        DrawerMenu(enable: false, text: "Menu2", image:"number3_2.png"),
        DrawerMenu(enable: true, text:  "Menu3", image:"number3_3.png"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("  self=\(self)")
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDrawerEvent(notification:)), name: .drawerEvent, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        presentingViewController?.beginAppearanceTransition(false, animated: animated)
        super.viewWillAppear(animated)
        print("<ViewController::viewWillAppear />")
        print("  self=\(self)")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("<ViewController::viewDidAppear />")
        print("  self=\(self)")
        presentingViewController?.endAppearanceTransition()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("<ViewController::viewWillDisappear />")
        print("  self=\(self)")
        presentingViewController?.beginAppearanceTransition(true, animated: animated)
        presentingViewController?.endAppearanceTransition()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("<ViewController::viewDidDisappear />")
        print("  self=\(self)")
    }


    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        print("<ViewController::willMove />")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        print("<ViewController::prepare />")
    }

    @IBAction func didTapShowMenuButton() {
        print("<ViewController::didTapShowMenuButton/>")
        let storyboad = UIStoryboard(name: "DrawerViewController", bundle: nil)
        let settingsNavi = storyboad.instantiateInitialViewController() as! UINavigationController
        // 表示開始はモーダルと同じく present
//        settingsNavi.menu = menu
        present(settingsNavi, animated: true, completion: nil)
    }

    @IBAction func unwindFromDrawer(segue: UIStoryboardSegue) {
        print("<ViewController::unwindFromDrawer />")

    }
    
    @objc func receiveDrawerEvent(notification: NotificationCenter) {
        print("<ViewController::receiveDrawerEvent />")
    }
}

