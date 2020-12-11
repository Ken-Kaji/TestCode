//
//  DrawerMenuPresentationController.swift
//  PresentationControllerSample
//  
//  Created by maeda.tasuku on 2019/07/01
//  Copyright © 2019 Classmethod. All rights reserved.
//

import UIKit

class DrawerMenuPresentationController: UIPresentationController {
    
    // 半透明の背景カバー
    private var coverBackgroundView: UIView!
    private var coverBackgroundTapGesture: UITapGestureRecognizer!
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        print("<DrawerMenuPresentationController::presentationTransitionWillBegin/>")
        
        coverBackgroundView = UIView()
        coverBackgroundView.alpha = 0
        coverBackgroundView?.backgroundColor = UIColor.black
        containerView?.insertSubview(coverBackgroundView, at: 0)
        
        coverBackgroundTapGesture = UITapGestureRecognizer(target: self, action: #selector(coverBackgroundDidTap))
        coverBackgroundView.addGestureRecognizer(coverBackgroundTapGesture)
        
        print("  presentingViewController=\(presentingViewController)")
        let transitionCoordinator = presentingViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: { [weak self] context in
            self?.coverBackgroundView.alpha = 0.7
        }, completion: nil)
    }
    
    // 半透明の背景を押したら閉じる
    @objc func coverBackgroundDidTap() {
        print("<DrawerMenuPresentationController::coverBackgroundDidTap/>")
        presentingViewController.dismiss(animated: true) {
            
        }
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        print("<DrawerMenuPresentationController::presentationTransitionDidEnd/>")
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        print("<DrawerMenuPresentationController::dismissalTransitionWillBegin/>")
        coverBackgroundView.removeGestureRecognizer(coverBackgroundTapGesture)
        
        let transitionCoordinator = presentingViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: { [weak self] context in
            self?.coverBackgroundView.alpha = 0
        }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
        print("<DrawerMenuPresentationController::dismissalTransitionDidEnd/>")
        
        if completed {
            coverBackgroundView.removeFromSuperview()
        }
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerSize = containerView?.frame.size else {
            return CGRect.zero
        }
        let width = containerSize.width * 0.5 //0.85
        return CGRect(x: containerSize.width * 0.5, y: 0, width: width, height: containerSize.height)
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        print("<DrawerMenuPresentationController::containerViewWillLayoutSubviews/>")
        coverBackgroundView.frame = containerView!.bounds
        presentedView!.frame = frameOfPresentedViewInContainerView
    }
}
