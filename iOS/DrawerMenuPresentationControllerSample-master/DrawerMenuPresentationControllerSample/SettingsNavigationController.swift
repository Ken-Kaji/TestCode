//
//  SettingsNavigationController.swift
//  DrawerMenuPresentationControllerSample
//  
//  Created by maeda.tasuku on 2019/07/06
//  Copyright © 2019 Classmethod. All rights reserved.
//

import UIKit

class SettingsNavigationController: UINavigationController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print("<SettingsNavigationController::init/>")
        /// 表示のされかたをセット
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
}

/// どうやって表示するか
extension SettingsNavigationController:  UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        print("<SettingsNavigationController::presentationController/>")
        return DrawerMenuPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("<SettingsNavigationController::animationController>")
        return DrawerMenuTransition(type: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("<SettingsNavigationController::animationController/>")
        return DrawerMenuTransition(type: .dismiss)
    }
}

