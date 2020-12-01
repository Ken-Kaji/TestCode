//
//  SettingsViewController.swift
//  PresentationControllerSample
//  
//  Created by maeda.tasuku on 2019/07/01
//  Copyright © 2019 Classmethod. All rights reserved.
//

import UIKit

/// 設定画面の中身
///
/// この画面は普通の作りで特に変わったことはしてません
class DrawerViewController: UIViewController {
    
    var menuTexts: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("<DrawerViewController::viewDidLoad/>")
        menuTexts = [
            "Sample Menu 1",
            "Sample Menu 2",
            "Sample Menu 3"
        ]
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
        return menuTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("<DrawerViewController::tableView/>")
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("<DrawerViewController::tableView/>")
        tableView.deselectRow(at: indexPath, animated: true)
        print("menu selected!")
    }
}
