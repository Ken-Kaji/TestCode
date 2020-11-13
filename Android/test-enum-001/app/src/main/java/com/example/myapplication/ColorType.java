package com.example.myapplication;

import android.graphics.Color;

/**
 *  色を定義した列挙対
 */
public enum ColorType {
    NONE,
    BLACK,
    RED,
    BLUE,
    YELLOW,
    GREEN,
    LIGHTBLUE,
    PURPLE,
    BROWN,
    ORANGE;


    /**
     *  文字列リソースを返す
     *  @return 
     */
    public int getName(Boolean selected) {
        switch (this) {
        case NONE:
        default:
            return selected ? R.drawable.icon_color_none_1: R.drawable.icon_color_none_2;
        case BLACK:
            return selected ? R.drawable.icon_color_black_1: R.drawable.icon_color_black_2;
        case RED:
            return selected ? R.drawable.icon_color_red_1: R.drawable.icon_color_red_2;
        case BLUE:
            return selected ? R.drawable.icon_color_blue_1: R.drawable.icon_color_blue_2;
        case YELLOW:
            return selected ? R.drawable.icon_color_yellow_1: R.drawable.icon_color_yellow_2;
        case GREEN:
            return selected ? R.drawable.icon_color_green_1: R.drawable.icon_color_green_2;
        case LIGHTBLUE:
            return selected ? R.drawable.icon_color_lightblue_1: R.drawable.icon_color_lightblue_2;
        case PURPLE:
            return selected ? R.drawable.icon_color_purple_1: R.drawable.icon_color_purple_2;
        case BROWN:
            return selected ? R.drawable.icon_color_brown_1: R.drawable.icon_color_brown_2;
        case ORANGE:
            return selected ? R.drawable.icon_color_orange_1: R.drawable.icon_color_orange_2;
        }
    }

    /**
     *  色のARGB値を返す
     *  @param  selected : true=選択状態 / false=非選択状態
     *  @return ARGB
     */
    public int getImage(Boolean selected) {
        switch (this) {
        case NONE:
        default:
            return selected ? R.drawable.icon_color_none_2 : R.drawable.icon_color_none_1;
        case BLACK:
            return selected ? R.drawable.icon_color_black_2 : R.drawable.icon_color_black_1;
        case RED:
            return selected ? R.drawable.icon_color_red_2 : R.drawable.icon_color_red_1;
        case BLUE:
            return selected ? R.drawable.icon_color_blue_2 : R.drawable.icon_color_blue_1;
        case YELLOW:
            return selected ? R.drawable.icon_color_yellow_2 : R.drawable.icon_color_yellow_1;
        case GREEN:
            return selected ? R.drawable.icon_color_green_2 : R.drawable.icon_color_green_1;
        case LIGHTBLUE:
            return selected ? R.drawable.icon_color_lightblue_2 : R.drawable.icon_color_lightblue_1;
        case PURPLE:
            return selected ? R.drawable.icon_color_purple_2 : R.drawable.icon_color_purple_1;
        case BROWN:
            return selected ? R.drawable.icon_color_brown_2 : R.drawable.icon_color_brown_1;
        case ORANGE:
            return selected ? R.drawable.icon_color_orange_2 : R.drawable.icon_color_orange_1;
        }
    }

    /**
     *  ARGBの値を返す
     *  @return ARGB
     */
    public int getColor()  {
        switch (this) {
        case NONE: default:
            return Color.TRANSPARENT;
        case BLACK:
            return Color.argb(255,0,0,0);
        case RED:
            return Color.argb(255, 255, 0, 0);
        case BLUE:
            return Color.argb(255,0,0,255);
        case YELLOW:
            return Color.argb(255,0,255,255);
        case GREEN:
            return Color.argb(255,0,255,0);
        case LIGHTBLUE:
            return Color.argb(255,173,216,230);
        case PURPLE:
            return Color.argb(255,128,0,128);
        case BROWN:
            return Color.argb(255,165,42,42);
        case ORANGE:
            return Color.argb(255,255,165,0);
        }
    }

}