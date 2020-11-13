package com.example.myapplication;

public enum ShapeType {
    STAR,
    HEART,
    DIAMOND,
    CLOVER,
    SPADE,
    CIRCLE,
    TRIANGLE,
    SQUARE,
    PENTAGON,
    HEXAGON,
    OCTAGON;

    public int getImage(Boolean selected) {
        switch(this) {
            case STAR:
                return selected? R.drawable.icon_shape_star: R.drawable.icon_shape_star_bk;
            case HEART:
                return selected? R.drawable.icon_shape_heart: R.drawable.icon_shape_heart_bk;
            case DIAMOND:
                return selected? R.drawable.icon_shape_diamond: R.drawable.icon_shape_diamond_bk;
            case CLOVER:
                return selected? R.drawable.icon_shape_clover: R.drawable.icon_shape_clover_bk;
            case SPADE:
                return selected? R.drawable.icon_shape_spade: R.drawable.icon_shape_spade_bk;
            case CIRCLE:
                return selected? R.drawable.icon_shape_circle: R.drawable.icon_shape_circle_bk;
            case TRIANGLE:
                return selected? R.drawable.icon_shape_triangle: R.drawable.icon_shape_triangle_bk;
            case SQUARE:
                return selected? R.drawable.icon_shape_square: R.drawable.icon_shape_square_bk;
            case PENTAGON:
                return selected? R.drawable.icon_shape_pentagon: R.drawable.icon_shape_pentagon_bk;
            case HEXAGON:
                return selected? R.drawable.icon_shape_hexagon: R.drawable.icon_shape_hexagon_bk;
            case OCTAGON:
                return selected? R.drawable.icon_shape_octagon: R.drawable.icon_shape_octagon_bk;
        }
        return 0;   //エラーを表すリソースIDってない？
    }
}