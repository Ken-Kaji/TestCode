//
//  ViewController.swift
//  
//  
//  Created by maeda.tasuku on 2019/07/06
//  Copyright © 2019 Classmethod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDrawerEvent(notification:)), name: .drawerEvent, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        presentingViewController?.beginAppearanceTransition(false, animated: animated)
        super.viewWillAppear(animated)
        print("<ViewController::viewWillAppear />")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("<ViewController::viewDidAppear />")
        presentingViewController?.endAppearanceTransition()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("<ViewController::viewWillDisappear />")
        presentingViewController?.beginAppearanceTransition(true, animated: animated)
        presentingViewController?.endAppearanceTransition()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("<ViewController::viewDidDisappear />")
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
        present(settingsNavi, animated: true, completion: nil)
    }

    @IBAction func unwindFromDrawer(segue: UIStoryboardSegue) {
        print("<ViewController::unwindFromDrawer />")

    }
    
    @objc func receiveDrawerEvent(notification: NotificationCenter) {
        print("<ViewController::receiveDrawerEvent />")
    }
}

