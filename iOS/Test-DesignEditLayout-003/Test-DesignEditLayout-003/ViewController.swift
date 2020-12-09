//
//  ViewController.swift
//  Test-DesignEditLayout-003
//
//  Created by 塚田誠司 on 2020/12/05.
//  Copyright © 2020 say. All rights reserved.
//

import UIKit

enum ToolBarMode {
    case main
    case line
    case shape
    case text
    case image
}

class ViewController: UIViewController {
    @IBOutlet weak var mainTool1Button: UIButton!
    @IBOutlet weak var mainTool2Button: UIButton!
    @IBOutlet weak var mainTool3Button: UIButton!
    @IBOutlet weak var mainTool4Button: UIButton!
    @IBOutlet weak var shapeTool1Button: UIButton!
    @IBOutlet weak var shapeTool2Button: UIButton!
    @IBOutlet weak var shapeTool3Button: UIButton!
    @IBOutlet weak var shapeTool4Button: UIButton!
    @IBOutlet weak var shapeTool5Button: UIButton!
    @IBOutlet weak var textTool1Button: UIButton!
    @IBOutlet weak var textTool2Button: UIButton!
    @IBOutlet weak var textTool3Button: UIButton!
    @IBOutlet weak var textTool4Button: UIButton!
    @IBOutlet weak var textTool5Button: UIButton!
    @IBOutlet weak var imageTool1Button: UIButton!
    @IBOutlet weak var imageTool2Button: UIButton!
    @IBOutlet weak var imageTool3Button: UIButton!
    @IBOutlet weak var imageTool4Button: UIButton!
    @IBOutlet weak var imageTool5Button: UIButton!
    @IBOutlet weak var lineTool1Button: UIButton!
    @IBOutlet weak var lineTool2Button: UIButton!
    @IBOutlet weak var lineTool3Button: UIButton!
    @IBOutlet weak var lineTool4Button: UIButton!
    @IBOutlet weak var lineTool5Button: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var printButton: UIButton!


    @IBOutlet weak var mainToolBar: UIView!
    @IBOutlet weak var shapeToolBar: UIView!
    @IBOutlet weak var textToolBar: UIView!
    @IBOutlet weak var imageToolBar: UIView!
    @IBOutlet weak var lineToolBar: UIView!
    var mainToolButtons:[UIButton] = []
    
    var toolBarMode: ToolBarMode = .main
    
    let functions = TestFunction()  //for test
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("<viewDidLoad />")
        initToolBar()
    }

    @IBAction func tappedToolBarButton(_ sender: Any) {
        print("<tappedButton />")
        print("sender=\(sender)")
    }
    
    func initToolBar() {
        initMainToolBar() //MainToolBar
        initTextToolBar() //TextToolBar
        initLineToolBar() //LineToolBar
        initShapeToolBar() //ShapeToolBar
        initImageToolBar() //ImageToolBar
    }

    func initMainToolBar() {
        var toolButtons:[UIButton] = []
        toolButtons.append(mainTool1Button)
        toolButtons.append(mainTool2Button)
        toolButtons.append(mainTool3Button)
        toolButtons.append(mainTool4Button)
        var position = 0
        for button in toolButtons {
            button.isHidden = true
        }
        saveButton.isHidden = true
        printButton.isHidden = true
        if functions.addShape == true {
            toolButtons[position].addTarget(self,action: #selector(self.addShape(_ :)),for: .touchUpInside)
            toolButtons[position].setImage(UIImage(named: DesignEditToolBarIcon[.addShape]!), for: .normal)
            toolButtons[position].isHidden = false
            position += 1
        }
        if functions.addText == true {
            toolButtons[position].addTarget(self,action: #selector(self.addText(_ :)),for: .touchUpInside)
            toolButtons[position].setImage(UIImage(named: DesignEditToolBarIcon[.addText]!), for: .normal)
            toolButtons[position].isHidden = false
            position += 1
        }
        if functions.addImage == true {
            toolButtons[position].addTarget(self,action: #selector(self.addImage(_ :)),for: .touchUpInside)
            toolButtons[position].setImage(UIImage(named: DesignEditToolBarIcon[.addImage]!), for: .normal)
            toolButtons[position].isHidden = false
            position += 1
        }
        if functions.drawLine == true {
            toolButtons[position].addTarget(self,action: #selector(self.drawLine(_ :)),for: .touchUpInside)
            toolButtons[position].setImage(UIImage(named: DesignEditToolBarIcon[.drawLine]!), for: .normal)
            toolButtons[position].isHidden = false
            position += 1
        }
        if functions.saveData == true {
            saveButton.addTarget(self,action: #selector(self.saveData(_ :)),for: .touchUpInside)
            saveButton.setImage(UIImage(named: DesignEditToolBarIcon[.saveData]!), for: .normal)
            saveButton.isHidden = false
        }
        if functions.printData == true {
            printButton.addTarget(self,action: #selector(self.printData(_ :)),for: .touchUpInside)
            printButton.setImage(UIImage(named: DesignEditToolBarIcon[.printData]!), for: .normal)
            printButton.isHidden = false
        }
    }

    func initTextToolBar() {
        
    }

    func initLineToolBar() {
        
    }

    func initShapeToolBar() {
        
    }

    func initImageToolBar() {
        
    }
    
    //タップイベント処理
    @objc func addShape(_ sender: UIButton) {
        mainToolBar.isHidden = true
        shapeToolBar.isHidden = false
    }
    
    @objc func addText(_ sender: UIButton) {
        mainToolBar.isHidden = true
        
    }
    
    @objc func drawLine(_ sender: UIButton) {
        mainToolBar.isHidden = true

    }

    @objc func addImage(_ sender: UIButton) {
        
    }
    
    @objc func saveData(_ sender: UIButton) {
        
    }
    
    @objc func printData(_ sender: UIButton) {
        
    }
}

