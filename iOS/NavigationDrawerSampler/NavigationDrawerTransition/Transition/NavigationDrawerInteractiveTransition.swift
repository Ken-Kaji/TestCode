//
//  NavigationDrawerInteractiveTransition.swift
//  NavigationDrawerTransition
//
//  Created by 須藤将史 on 2018/12/05.
//  Copyright © 2018 須藤将史. All rights reserved.
//

import UIKit

final class NavigationDrawerInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    var isStart = false
    var isFinish: Bool {
        return percentComplete >= percentCompleteThreshold
    }
    
    private let percentCompleteThreshold: CGFloat = 0.2
    
    override init() {
        super.init()
        print("<NavigationDrawerInteractiveTransition::init/>")
        completionCurve = .easeOut
    }
    
    override func cancel() {
        print("<NavigationDrawerInteractiveTransition::cancel/>")
        completionSpeed = percentCompleteThreshold
        super.cancel()
    }
    
    override func finish() {
        print("<NavigationDrawerInteractiveTransition::finish/>")
        completionSpeed = 1 - percentCompleteThreshold
        super.finish()
    }
}

