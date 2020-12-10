import Foundation

class TestFunction {
    var addShape = true            //図形追加
    var addText = true             //テキスト入力
    var addImage = true            //画像追加
    var drawLine = true            //手書き線作成
    var makeMask = false            //マスク作成
    //--------------------
    var printData = true               //データ印刷
    var saveData = true                //データ保存
    //--------------------
    //図形ツールバー
    var changeShapeLineColor = true     //図形-線色変更
    var changeShapePaintColor = true    //図形-塗り潰し色変更
    //--------------------
    //テキストツールバー
    var changeTextColor = true           //テキスト-色変更
    var changeTextFont = true            //テキスト-フォント変更
    var changeTextDecoration = true      //テキスト-装飾変更
    var changeTextTransform = true       //テキスト-変形
    //--------------------
    //線ツールバー
    var changeLine = true                //線-色変更
    //--------------------
    //メニュー
    var setImageEffect = true          //画処理設定		
    var changeCupSize = false           //カップサイズ変更		
    var resetData = true               //リセット		
    var shootTray = true               //トレイ撮影		
    var setMaskInfo = true             //プリント範囲の手動設定		
    var loadData = true                //保存データロード		
    var setPaperType = false            //用紙タイプダイアログ
    var setPrintQuarity = false        //印刷クオリティ

}