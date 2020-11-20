//
//  ViewController.swift
//  test-menulist-002
//
//  Created by 塚田誠司 on 2020/11/20.
//  Copyright © 2020 say. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var mBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("<ViewController::viewDidLoad />")
    }

    @IBAction func tappedButton(_ sender: UIButton) {
        print("<ViewController::tappedButton />")
        let frame = sender.frame
        presentPopoverView(frame: frame)
    }

    func presentPopoverView(frame: CGRect){
        print("<ViewController::presentPopoverView />")
        let contentVC = ContentViewController()

//        contentVC.modalPresentationStyle = .popover   //  adaptivePresentationStyleで.noneを返すと表示される
//        contentVC.modalPresentationStyle = .custom  //表示されない
//        contentVC.modalPresentationStyle = .automatic  //iOS13以上
//        contentVC.modalPresentationStyle = .none  //表示されない
//        contentVC.modalPresentationStyle = .fullScreen  //表示されない
//        contentVC.modalPresentationStyle = .pageSheet  //表示されない
//        contentVC.modalPresentationStyle = .formSheet  //表示されない
//        contentVC.modalPresentationStyle = .currentContext  //表示されない
//        contentVC.modalPresentationStyle = .overFullScreen  //表示されない
        contentVC.modalPresentationStyle = .overCurrentContext  //
//        contentVC.modalPresentationStyle = .blurOverFullScreen  //iOSでは指定不可
        contentVC.preferredContentSize = CGSize(width: 100, height: 200)

        guard let popoverPresentationController = contentVC.popoverPresentationController else { return }

        popoverPresentationController.sourceView = view
        popoverPresentationController.sourceRect = frame
        popoverPresentationController.permittedArrowDirections = .any
        popoverPresentationController.delegate = self

        present(contentVC, animated: true, completion: nil)
    }

    // iPhoneで表示させる場合に必要
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
//        return .none
//        return .pageSheet
        return .fullScreen
//        return .automatic
//        return .formSheet
//        return .currentContext
//        return .custom
//        return .overFullScreen
//        return .overCurrentContext
//        return .popover
    }
}

