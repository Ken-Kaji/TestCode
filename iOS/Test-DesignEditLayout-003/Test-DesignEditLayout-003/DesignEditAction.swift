import Foundation



enum DesignEditAction:Int {
    //メインツールバー
    case addShape            //図形追加
    case addText             //テキスト入力
    case addImage            //画像追加
    case drawLine            //手書き線作成
    case makeMask            //マスク作成
    //--------------------
    case printData               //データ印刷
    case saveData                //データ保存
    //--------------------
    //図形ツールバー
    case changeShapeLineColor     //図形-線色変更
    case changeShapePaintColor    //図形-塗り潰し色変更
    //--------------------
    //テキストツールバー
    case changeTextColor           //テキスト-色変更
    case changeTextFont            //テキスト-フォント変更
    case changeTextDecoration      //テキスト-装飾変更
    case changeTextTransform       //テキスト-変形
    //--------------------
    //線ツールバー
    case changeLine                //線-色変更
    //--------------------
    //メニュー
    case setImageEffect          //画処理設定
    case changeCupSize           //カップサイズ変更
    case resetData               //リセット
    case shootTray               //トレイ撮影
    case setMaskInfo             //プリント範囲の手動設定
    case loadData                //保存データロード
    case setPaperType            //用紙タイプダイアログ
    case setPrintQuarity         //印刷クオリティ

    case notFunction
}

let DesignEditToolBarIcon: Dictionary<DesignEditAction, String> = [
    .addShape: "icon_shape",
    .addText: "icon_text",             //テキスト入力
    .addImage: "number3_1",            //画像追加
    .drawLine: "number3_2",            //手書き線作成
    .makeMask: "number3_3",            //マスク作成
    .printData: "icon_print",               //データ印刷
    .saveData: "icon_save",                //データ保存
    .changeShapeLineColor: "icon_contour_1",     //図形-線色変更
    .changeShapePaintColor: "icon_paint_1",    //図形-塗り潰し色変更
    .changeTextColor: "number3_4",           //テキスト-色変更
    .changeTextFont: "icon_font_1",            //テキスト-フォント変更
    .changeTextDecoration: "number3_5",      //テキスト-装飾変更
    .changeTextTransform: "number3_6",       //テキスト-変形
    .changeLine: "icon_contour_1",                //線-色変更
    .setImageEffect: "number3_7",          //画処理設定
    .changeCupSize: "number3_8",           //カップサイズ変更
    .resetData:"reset-2",               //リセット
    .shootTray: "icon_camera",               //トレイ撮影
    .setMaskInfo: "number3_1",             //プリント範囲の手動設定
    .loadData: "number3_2",                //保存データロード
    .setPaperType: "number3_3",            //用紙タイプダイアログ
    .setPrintQuarity: "number3_4"         //印刷クオリティ
]
