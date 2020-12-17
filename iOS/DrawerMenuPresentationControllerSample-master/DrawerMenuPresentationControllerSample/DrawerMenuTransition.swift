//
//  DrawerMenuTransition.swift
//  PresentationControllerSample
//  
//  Created by maeda.tasuku on 2019/07/01
//  Copyright © 2019 Classmethod. All rights reserved.
//

import UIKit

class DrawerMenuTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    enum TransitionType {
        case present
        case dismiss
    }
    
    var animator: UIViewPropertyAnimator?
    var transitionType: TransitionType
    
    init(type: TransitionType) {
        self.transitionType = type
        print("<DrawerMenuTransition::init/>")
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        print("<DrawerMenuTransition::transitionDuration/>")
        switch transitionType {
        case .present:
            return 0.4
        case .dismiss:
            return 0.3
        }
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print("<DrawerMenuTransition::animateTransition/>")
        switch transitionType {
        case .present:
            startPresentTransition(using: transitionContext)
        case .dismiss:
            startDismissTransition(using: transitionContext)
        }
    }
    
    private func startPresentTransition(using context: UIViewControllerContextTransitioning) {
        print("<DrawerMenuTransition::startPresentTransition/>")
        let timing = CubicTimingParametersCreator.createParameters(timingType: .quartOut)
        let animatorNotNil = UIViewPropertyAnimator(duration: transitionDuration(using: context), timingParameters: timing)

        // This block shows Tableview
        let containerView = context.containerView
        guard let toView = context.view(forKey: .to) else { return }
        containerView.addSubview(toView)

        let originalToViewTrans = toView.transform
        var newToViewTrans = originalToViewTrans
        newToViewTrans = newToViewTrans.translatedBy(x: containerView.bounds.width, y: 0)
        
        toView.transform = newToViewTrans
        toView.setNeedsLayout()
        
        animatorNotNil.addAnimations {
            toView.transform = originalToViewTrans
            toView.setNeedsLayout()
        }
        animatorNotNil.addCompletion { [weak self] _ in
            self?.animator = nil
            context.completeTransition(!context.transitionWasCancelled)
        }
        animator = animatorNotNil
        // Need below line to implement "tap gray area and close"
        animatorNotNil.startAnimation()
    }
    
    private func startDismissTransition(using context: UIViewControllerContextTransitioning) {
        print("<DrawerMenuTransition::startDismissTransition/>")
        let timing = CubicTimingParametersCreator.createParameters(timingType: .quartIn)
        let animatorNotNil = UIViewPropertyAnimator(duration: transitionDuration(using: context), timingParameters: timing)
        
        let containerView = context.containerView
        guard let fromView = context.view(forKey: .from) else { return }
        
        let originalToViewTrans = fromView.transform
        var newFromViewTrans = originalToViewTrans
        newFromViewTrans = newFromViewTrans.translatedBy(x: containerView.bounds.width, y: 0)
        
        fromView.setNeedsLayout()
        
        animatorNotNil.addAnimations {
            fromView.transform = newFromViewTrans
            fromView.setNeedsLayout()
        }
        animatorNotNil.addCompletion { [weak self] _ in
            self?.animator = nil
            context.completeTransition(!context.transitionWasCancelled)
        }
        animator = animatorNotNil
        animatorNotNil.startAnimation()
    }
}
