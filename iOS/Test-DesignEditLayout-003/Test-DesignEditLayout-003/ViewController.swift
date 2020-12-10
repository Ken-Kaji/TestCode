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
        showToolBar()
    }

    @IBAction func tappedToolBarButton(_ sender: Any) {
        print("<tappedButton />")
        print("sender=\(sender)")
    }
    
    func showToolBar() {
        switch toolBarMode {
        case .main:
            mainToolBar.isHidden = false
            shapeToolBar.isHidden = true
            textToolBar.isHidden = true
            imageToolBar.isHidden = true
            lineToolBar.isHidden = true
        case .line:
            mainToolBar.isHidden = true
            shapeToolBar.isHidden = true
            textToolBar.isHidden = true
            imageToolBar.isHidden = true
            lineToolBar.isHidden = false
        case .shape:
            mainToolBar.isHidden = true
            shapeToolBar.isHidden = false
            textToolBar.isHidden = true
            imageToolBar.isHidden = true
            lineToolBar.isHidden = true
        case .text:
            mainToolBar.isHidden = true
            shapeToolBar.isHidden = true
            textToolBar.isHidden = false
            imageToolBar.isHidden = true
            lineToolBar.isHidden = true
        case .image:
            mainToolBar.isHidden = true
            shapeToolBar.isHidden = true
            textToolBar.isHidden = true
            imageToolBar.isHidden = false
            lineToolBar.isHidden = true
        }
    }
    
    /// ツールバーの初期化を行う
    func initToolBar() {
        initMainToolBar() //MainToolBar
        initTextToolBar() //TextToolBar
        initLineToolBar() //LineToolBar
        initShapeToolBar() //ShapeToolBar
        initImageToolBar() //ImageToolBar
    }

    /// MainToolBarの初期化を行う
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

    /// TextToolBarの初期化を行う
    func initTextToolBar() {
        var toolButtons:[UIButton] = []
        toolButtons.append(textTool1Button)
        toolButtons.append(textTool2Button)
        toolButtons.append(textTool3Button)
        toolButtons.append(textTool4Button)
        toolButtons.append(textTool5Button)
        var position = 0
        for button in toolButtons {
            button.isHidden = true
        }
        if functions.changeTextColor == true {
            toolButtons[position].addTarget(self,action: #selector(self.changeTextColor),for: .touchUpInside)
            toolButtons[position].setImage(UIImage(named: DesignEditToolBarIcon[.changeTextColor]!), for: .normal)
            toolButtons[position].isHidden = false
            position += 1
        }
        if functions.changeTextFont == true {
            toolButtons[position].addTarget(self,action: #selector(self.changeTextFont),for: .touchUpInside)
            toolButtons[position].setImage(UIImage(named: DesignEditToolBarIcon[.changeTextFont]!), for: .normal)
            toolButtons[position].isHidden = false
            position += 1
        }
        if functions.changeTextDecoration == true {
            toolButtons[position].addTarget(self,action: #selector(self.changeTextDecoration),for: .touchUpInside)
            toolButtons[position].setImage(UIImage(named: DesignEditToolBarIcon[.changeTextDecoration]!), for: .normal)
            toolButtons[position].isHidden = false
            position += 1
        }
        if functions.changeTextTransform == true {
            toolButtons[position].addTarget(self,action: #selector(self.changeTextTransform),for: .touchUpInside)
            toolButtons[position].setImage(UIImage(named: DesignEditToolBarIcon[.changeTextTransform]!), for: .normal)
            toolButtons[position].isHidden = false
            position += 1
        }
    }

    /// LineToolBarの初期化を行う
    func initLineToolBar() {
        var toolButtons:[UIButton] = []
        toolButtons.append(lineTool1Button)
        toolButtons.append(lineTool2Button)
        toolButtons.append(lineTool3Button)
        toolButtons.append(lineTool4Button)
        toolButtons.append(lineTool5Button)
        var position = 0
        for button in toolButtons {
            button.isHidden = true
        }
        if functions.changeLine == true {
            toolButtons[position].addTarget(self,action: #selector(self.changeLine),for: .touchUpInside)
            toolButtons[position].setImage(UIImage(named: DesignEditToolBarIcon[.changeLine]!), for: .normal)
            toolButtons[position].isHidden = false
            position += 1
        }

    }

    /// ShapeToolBarの初期化を行う
    func initShapeToolBar() {
        var toolButtons:[UIButton] = []
        toolButtons.append(shapeTool1Button)
        toolButtons.append(shapeTool2Button)
        toolButtons.append(shapeTool3Button)
        toolButtons.append(shapeTool4Button)
        toolButtons.append(shapeTool5Button)
        var position = 0
        for button in toolButtons {
            button.isHidden = true
        }
        if functions.changeShapeLineColor == true {
            toolButtons[position].addTarget(self,action: #selector(self.changeShapeLineColor),for: .touchUpInside)
            toolButtons[position].setImage(UIImage(named: DesignEditToolBarIcon[.changeShapeLineColor]!), for: .normal)
            toolButtons[position].isHidden = false
            position += 1
        }
        if functions.changeShapePaintColor == true {
            toolButtons[position].addTarget(self,action: #selector(self.changeShapePaintColor),for: .touchUpInside)
            toolButtons[position].setImage(UIImage(named: DesignEditToolBarIcon[.changeShapePaintColor]!), for: .normal)
            toolButtons[position].isHidden = false
            position += 1
        }

    }

    /// ImageToolBarの初期化を行う
    func initImageToolBar() {
        var toolButtons:[UIButton] = []
        toolButtons.append(shapeTool1Button)
        toolButtons.append(shapeTool2Button)
        toolButtons.append(shapeTool3Button)
        toolButtons.append(shapeTool4Button)
        toolButtons.append(shapeTool5Button)
        var position = 0
        for button in toolButtons {
            button.isHidden = true
        }

    }
    
    //タップイベント処理
    /// 図形追加ボタン押下イベント処理
    @objc func addShape(_ sender: UIButton) {
        mainToolBar.isHidden = true
        shapeToolBar.isHidden = false
    }
    
    /// テキスト追加ボタン押下イベント処理
    @objc func addText(_ sender: UIButton) {
        mainToolBar.isHidden = true
        
    }
    
    /// 描き線追加ボタン押下イベント処理
    @objc func drawLine(_ sender: UIButton) {
        mainToolBar.isHidden = true

    }

    /// 画像追加ボタン押下イベント処理
    @objc func addImage(_ sender: UIButton) {
        
    }
    
    /// データ保存ボタン押下イベント処理
    @objc func saveData(_ sender: UIButton) {
        
    }
    
    /// 印刷ボタン押下イベント処理
    @objc func printData(_ sender: UIButton) {
        
    }
    
    // TextToolBar
    @objc func changeTextColor(_ sender: UIButton) {
    
    }
    @objc func changeTextFont(_ sender: UIButton) {
    
    }
    @objc func changeTextDecoration(_ sender: UIButton) {
    
    }
    @objc func changeTextTransform(_ sender: UIButton) {
    
    }
    
    // ShapeToolBar
    @objc func changeShapeLineColor(_ sender: UIButton) {
    
    }
    @objc func changeShapePaintColor(_ sender: UIButton) {
    
    }
    
    //LineToolBar
    @objc func changeLine(_ sender: UIButton) {
    
    }

    //メニュー
    @objc func setImageEffect(_ sender: UIButton) {
    
    }
    @objc func changeCupSize(_ sender: UIButton) {
    
    }
    @objc func resetData(_ sender: UIButton) {
    
    }
    @objc func shootTray(_ sender: UIButton) {
    
    }
    @objc func setMaskInfo(_ sender: UIButton) {
    
    }
    @objc func loadData(_ sender: UIButton) {
    
    }
    @objc func setPaperType(_ sender: UIButton) {
    
    }
    @objc func setPrintQuarity(_ sender: UIButton) {
    
    }


}

