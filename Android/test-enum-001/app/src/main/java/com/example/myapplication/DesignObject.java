package com.example.myapplication;

import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.os.Build;
import android.util.Size;
import android.view.View;
import android.widget.ImageView;

import androidx.annotation.RequiresApi;

import java.io.Serializable;
import java.net.URI;
import java.util.ArrayList;

//  @todo: シリアライズに対応する必要あり
@RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
class DesignObject implements Serializable {
    private static final long serialVersionUID = -4215437130607023292L;

    private ObjectType        type      = ObjectType.NONE;
    private transient ShapeView         shapeView = null;
    private transient ImageView         imageView = null;
    private transient View              textView  = null;
    private URI               imageUri = null;
    private String            text = "";
    private float             rotate    = 0.0F;
    private float             scale     = 1.0F;
    private Boolean           flip      = false;
    private Rect              frame     = new Rect(0,0,0,0);
    private Size              size      = new Size(0,0);
    private Point             center    = new Point(0,0);
    private ShapeType         shape     = ShapeType.SQUARE;
    private ColorType         fillColor = ColorType.NONE;
    private ColorType         color     = ColorType.BLACK;
    private Typeface          font      = Typeface.create(Typeface.DEFAULT, Typeface.NORMAL);
    private float             fontScale = 1.0F;
    private Boolean           bold      = false;
    private Boolean           italic    = false;
    private ArrayList<Stroke> strokes   = new ArrayList<Stroke>();

    private Bitmap image      = null; //! imageをそのままシリアライズする？ URLにする？
    private int    saturation = 3;
    private int    line       = 3;

    public void setType (ObjectType inType)            { type      = inType; }
    public void setShapeView(ShapeView inShape)        { shapeView = inShape; }
    public void setImageView(ImageView inImage)        { imageView = inImage; }
    public void setTextView(View inText)               { textView  = inText; }
    public void setRotate(float inRotate)              { rotate    = inRotate; }
    public void setScale(float inScale)                { scale     = inScale; }
    public void setFlip(Boolean inFlip)                { flip      = inFlip; }
    public void setFrame(Rect inFrame)                 { frame     = inFrame; }
    public void setSize(Size inSize)                   { size      = inSize; }
    public void setCenter(Point inCenter)              { center    = inCenter; }
    public void setShape(ShapeType inShape)            { shape     = inShape; }
    public void setFillColor(ColorType inFillColor)    { fillColor = inFillColor; }
    public void setColor(ColorType inColor)            { color     = inColor; }
    public void setFont(Typeface inFont)               { font      = inFont; }
    public void setFontScale(float inFontScale)        { fontScale = inFontScale; }
    public void setBold(Boolean inBold)                { bold      = inBold; }
    public void setItalic(Boolean inItalic)            { italic    = inItalic; }
    public void setStrokes(ArrayList<Stroke> inStroke) { strokes   = inStroke; }

    public void setImage(Bitmap inImage) { image      = inImage;  } //! imageをそのままシリアライズする？ URLにする？
    public void setSaturation(int inSaturation) { saturation = inSaturation; }
    public void setLine(int inLine)     { line = inLine; }

    public ObjectType getType ( )            { return type     ; }
    public ShapeView getShapeView( )        { return shapeView ; }
    public ImageView getImageView( )        { return imageView ; }
    public View getTextView( )               { return textView ; }
    public float getRotate( )              { return rotate    ; }
    public float getScale( )                { return scale    ; }
    public Boolean getFlip( )                { return flip    ; }
    public Rect getFrame( )                 { return frame    ; }
    public Size getSize( )                   { return size    ; }
    public Point getCenter( )              { return center    ; }
    public ShapeType getShape( )            { return shape    ; }
    public ColorType getFillColor( )    { return fillColor ; }
    public ColorType getColor( )            { return color ; }
    public Typeface getFont( )               { return font ; }
    public float getFontScale( )        { return fontScale ; }
    public Boolean getBold( )                { return bold ; }
    public Boolean getItalic( )            { return italic ; }
    public ArrayList<Stroke> getStrokes( ) { return strokes; }

    public Bitmap getImage( ) { return image;  } //! imageをそのままシリアライズする？ URLにする？
    public int getSaturation( ) { return saturation; }
    public int getLine( )     { return line; }
}
