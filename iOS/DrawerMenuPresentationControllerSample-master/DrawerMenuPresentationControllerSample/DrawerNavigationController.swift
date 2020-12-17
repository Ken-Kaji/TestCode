//
//  SettingsNavigationController.swift
//  DrawerMenuPresentationControllerSample
//  
//  Created by maeda.tasuku on 2019/07/06
//  Copyright © 2019 Classmethod. All rights reserved.
//

import UIKit

class DrawerNavigationController: UINavigationController {
//    var menu: [DrawerMenu] = []

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print("<DrawerNavigationController::init/>")
        /// 表示のされかたをセット
        modalPresentationStyle = .custom
        transitioningDelegate = self
//
//        // set contents to TableView
//        let drawerContentsViewController = self.children[0] as! DrawerViewController
//        drawerContentsViewController.menu = self.menu
    }
}

/// どうやって表示するか
extension DrawerNavigationController:  UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        print("<DrawerNavigationController::presentationController>")
        print("  presented=\(presented)")
        print("  presenting=\(presenting)")
        print("  source=\(source)")
        print("</DrawerNavigationController::presentationController>")
        return DrawerMenuPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("<DrawerNavigationController::animationController(forPresented)>")
        print("  presented=\(presented)")
        print("  presenting=\(presenting)")
        print("  source=\(source)")
        print("</DrawerNavigationController::animationController(forPresented)>")
        return DrawerMenuTransition(type: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("<DrawerNavigationController::animationController(forDismissed)/>")
        return DrawerMenuTransition(type: .dismiss)
    }
}

