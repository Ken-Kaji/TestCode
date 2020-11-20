//
//  ContentViewController.swift
//  test-menulist-002
//
//  Created by 塚田誠司 on 2020/11/20.
//  Copyright © 2020 say. All rights reserved.
//

import Foundation
import UIKit

class ContentViewController: UIViewController {

    let cellHeight: CGFloat = 50
    let array = ["1", "10", "100", "1000", "10000", "100000"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("<ContentViewController::viewDidLoad>")

    }

    override func viewDidLayoutSubviews() {
        print("<ContentViewController::viewDidLayoutSubviews>")
        setTableView(view: view)
    }

    func setTableView(view: UIView){
        print("<ContentViewController::setTableView>")
        let posX: CGFloat = 0
        let posY: CGFloat = 0

        let width: CGFloat = view.frame.width
        let height: CGFloat = view.frame.height

        let tableView = UITableView(frame: CGRect(x: posX, y: posY, width: width, height: height))

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false

        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
    }

}

extension ContentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(array[indexPath.row])
    }
}

extension ContentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)

        cell.textLabel?.text = array[indexPath.row]
        cell.textLabel?.textAlignment = .center

        return cell
    }
}
