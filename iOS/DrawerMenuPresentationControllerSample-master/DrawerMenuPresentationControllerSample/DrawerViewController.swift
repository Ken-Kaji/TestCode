//
//  SettingsViewController.swift
//  PresentationControllerSample
//  
//  Created by maeda.tasuku on 2019/07/01
//  Copyright © 2019 Classmethod. All rights reserved.
//

import UIKit

public struct DrawerMenu {
    var enable: Bool    //有効/無効フラグ
    var text: String    //メニューに表示するテキスト
    var image: String   //画像リソース名
}

enum CellSelectionType {
    case notShow
    case grayOut
}

/// 設定画面の中身
///
/// この画面は普通の作りで特に変わったことはしてません
class DrawerViewController: UIViewController {
    var menuTexts: [String]!
    var menuImages: [UIImage]!
    let cellReuseIdentifier = "DrawerViewCell"
    @IBOutlet weak var mTableView: UITableView!
    let selectionType: CellSelectionType = .grayOut

    var menu: [DrawerMenu] = []
    
    /// 有効なメニューの数を返す
    private func getCountOfMenu() -> Int {
        var retval = 0
        if selectionType == .notShow {
            for item in menu {
                if item.enable == true {
                    retval += 1
                }
            }
            return retval
        }
        return menu.count
    }
    
    /// index番目のメニューアイテムを返す
    private func getItemOfIndex(_ index: Int) -> DrawerMenu? {
        if index < 0 || index >= menu.count {
            return nil
        }
        if selectionType == .notShow {
            var count = 0
            for item in menu {
                if item.enable == true {
                    if index == count {
                        return item
                    }
                    count += 1
                }
            }
            return nil
        }
        return menu[index]
    }
    
    //NavigationBArを非表示にする
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         print("<DrawerViewController::viewWillAppear/>")
         self.navigationController?.setNavigationBarHidden(true, animated: animated)
     }
     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         print("<DrawerViewController::viewWillDisappear/>")
         self.navigationController?.setNavigationBarHidden(false, animated: animated)
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("<DrawerViewController::viewDidLoad/>")
        print("  self=\(self)")
        print("  self.presentedViewController=\(self.presentedViewController)")
        print("  self.presentingViewController=\(self.presentingViewController)")

        mTableView.register(UINib(nibName:"DrawerCell", bundle: nil), forCellReuseIdentifier:cellReuseIdentifier)
    }
    
    @IBAction func closeButtonTapped() {
        dismiss(animated: true) {
        print("<DrawerViewController::closeButtonTapped/>")
            
        }
    }
}

extension DrawerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("<DrawerViewController::numberOfSections/>")
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("<DrawerViewController::tableView/>")
        //return menuTexts.count
        return getCountOfMenu()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("<DrawerViewController::tableView/>")
        if true {
            //let cellId = "CellId"
            let cellId = cellReuseIdentifier
            var cellOpt = tableView.dequeueReusableCell(withIdentifier: cellId) as! DrawerCell
            if cellOpt == nil {
                cellOpt = DrawerCell()
            }
            let item = getItemOfIndex(indexPath.row)
            if item != nil {
                cellOpt.icon?.image = UIImage(imageLiteralResourceName: item!.image)
                cellOpt.label?.text = item?.text
                if selectionType == .grayOut {
                    if item?.enable == true {
                        cellOpt.selectionStyle = .default
                    } else {
                        cellOpt.selectionStyle = .none
                        cellOpt.label?.textColor = .lightGray
                    }
                } else {
                    cellOpt.selectionStyle = .default
                }
            }
            
            return cellOpt
        } else {
            let cellId = "CellId"
            var cellOpt = tableView.dequeueReusableCell(withIdentifier: cellId)
            if cellOpt == nil {
                cellOpt = UITableViewCell(style: .default, reuseIdentifier: cellId)
            }
            let cell = cellOpt!
            let menu = menuTexts[indexPath.row]
            cell.textLabel?.text = menu
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("<DrawerViewController::tableView/>")
        tableView.deselectRow(at: indexPath, animated: true)
        NotificationCenter.default.post(name: .drawerEvent, object: nil)
        print("menu selected!")
        self.closeButtonTapped()
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if selectionType == .grayOut {
            let item = getItemOfIndex(indexPath.row)
            if item?.enable == true {
                return indexPath
            } else {
                return nil
            }
        } else {
            return indexPath
        }
    }

}
