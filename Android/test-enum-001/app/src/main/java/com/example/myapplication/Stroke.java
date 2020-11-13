//  @todo シリアライズ要対応
package com.example.myapplication;

import android.graphics.Color;
import android.graphics.Point;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.ArrayList;

/**
 *  手書き線クラス
 */
class Stroke implements Serializable {
    private static final long serialVersionUID = -8283056221050657035L;

    ArrayList<Point> points = new ArrayList<Point>();
    int color;
    float width;

    Stroke() {
        points = new ArrayList<Point>();
        color = ColorType.NONE.getColor();
        width = 2.0F;
    }

    Stroke(Stroke inStroke) {
        points = inStroke.getPath();
        color = inStroke.getColor();
        width = inStroke.getWidth();
    }

    /**
     *  手書き線のパスを返す
     *  @return 手書き線のパス
     */
    Stroke(ArrayList<Point> inPoints, int inColor, float inWidth) {
        points = inPoints;
        color = inColor;
        width = inWidth;
    }

    public ArrayList<Point> getPath() {
        return points;
    }

    public void addPath(Point inPoint) {
        points.add(inPoint);
    }

    public void setColor(int inCol) {
        color = inCol;
    }

    public int getColor() {
        return color;
    }

    public void setWidth(float inWidth) {
        width = inWidth;
    }

    public float getWidth() {
        return width;
    }

    public Point getPoint(int index) {
        if ((index < 0) || (index >= points.size())) {
            return null;
        }
        return points.get(index);
    }

}