package com.example.myapplication;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;

import java.io.Serializable;
import java.util.ArrayList;

class ShapeView extends View  {
    int fillColor = ColorType.NONE.getColor();
    int lineColor = ColorType.BLACK.getColor();
    float lineWidth = 2.0f;
    ShapeType shapeType = null;
    RectF position = new RectF(0, 0, 0, 0);
    float bpiScale =1.0F;
    Paint paint = null;

    public ShapeView(Context context) {
        this(context, null);
    }
    public ShapeView(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.ShapeViewViewStyle);
    }

    public ShapeView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        //todo 初期化
        fillColor = ColorType.NONE.getColor();
        lineColor = ColorType.BLACK.getColor();
        lineWidth = 2.0f;
        shapeType = null;
        position = new RectF(0, 0, 0, 0);
        bpiScale =1.0F;
        paint = null;
    }

 /*
    public ShapeView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {

    } // API Level 21から

    public ShapeView(int inFillColor, int inLineColor, float inLineWidth, ShapeType inShapeType) {
        fillColor = inFillColor;
        lineColor = inLineColor;
        lineWidth = inLineWidth;
        shapeType = inShapeType;
    }
*/
    public void setFillColor(int inColor) { fillColor = inColor; }
    public void setLineColor(int inColor) { lineColor = inColor; }
    public void setLineWidth(float inWidth) {lineWidth = inWidth; }
    public void setShapeType(ShapeType inType) { shapeType = inType; }
    public void setPosition(RectF inPosition) { position = inPosition; }
    public void setBpiScale(float inBpi) { bpiScale = inBpi; }
    public void setPaint(Paint inPaint) { paint = inPaint; }

    public int getFillColor() { return fillColor; }
    public int getLineColor() { return lineColor; }
    public float getLineWidth() {return lineWidth; }
    public ShapeType getShapeType() { return shapeType; }
    public RectF getPosition() { return position; }
    public float getBpiScale() { return bpiScale; }
    public Paint getPaint() { return paint; }

    protected void onDraw(Canvas canvas) {
        super.draw(canvas);
        switch(shapeType) {
            case STAR:
                drawStar(canvas);
                break;
            case HEART:
                drawHeart(canvas);
                break;
            case DIAMOND:
                drawDiamond(canvas);
                break;
            case CLOVER:
                drawClover(canvas);
                break;
            case SPADE:
                drawSpade(canvas);
                break;
            case CIRCLE:
                drawCircle(canvas);
                break;
            case TRIANGLE:
                drawTriangle(canvas);
                break;
            case SQUARE:
                drawSquare(canvas);
                break;
            case PENTAGON:
                drawPentagon(canvas);
                break;
            case HEXAGON:
                drawHexagon(canvas);
                break;
            case OCTAGON:
                drawOctagon(canvas);
                break;
        }
    }

    public void drawStar(Canvas canvas) {
        RectF position = new RectF(this.position.left * bpiScale, this.position.top * bpiScale, this.position.right * bpiScale, this.position.bottom * bpiScale);
        PointF size = new PointF(position.right - position.left, position.bottom - position.top);
        PointF center = new PointF((position.right + position.left) / 2, (position.bottom + position.top) / 2);
        float radX = (size.x / 2) - lineWidth;
        float radY = (size.y / 2) - lineWidth;

        ArrayList<PointF> outPoint = new ArrayList<PointF>();
        for (int i = 0; i < 5; i++) {
            double rad = (Math.PI * 2 / 5 * i) - (Math.PI / 2);
            PointF point = new PointF((float) (center.x + radX * Math.cos(rad)), (float) (center.y + radY * Math.sin(rad)));
            outPoint.add(point);
        }

        PointF point0214 = calcCrossPoint(outPoint.get(0), outPoint.get(2), outPoint.get(1), outPoint.get(4));
        PointF point0213 = calcCrossPoint(outPoint.get(0), outPoint.get(2), outPoint.get(1), outPoint.get(3));
        PointF point0314 = calcCrossPoint(outPoint.get(0), outPoint.get(3), outPoint.get(1), outPoint.get(4));
        PointF point0324 = calcCrossPoint(outPoint.get(0), outPoint.get(3), outPoint.get(2), outPoint.get(4));
        PointF point1324 = calcCrossPoint(outPoint.get(1), outPoint.get(3), outPoint.get(2), outPoint.get(4));

        Path path = new Path();
        path.reset();

        path.moveTo(outPoint.get(0).x, outPoint.get(0).y);
        path.lineTo(point0214.x, point0214.y);
        path.lineTo(outPoint.get(1).x, outPoint.get(1).y);
        path.lineTo(point0213.x, point0213.y);
        path.lineTo(outPoint.get(2).x, outPoint.get(2).y);
        path.lineTo(point1324.x, point1324.y);
        path.lineTo(outPoint.get(3).x, outPoint.get(3).y);
        path.lineTo(point0324.x, point0324.y);
        path.lineTo(outPoint.get(4).x, outPoint.get(4).y);
        path.lineTo(point0314.x, point0314.y);

        path.close();

        paint.setAntiAlias(true);
        paint.setStrokeWidth(lineWidth);

            paint.setColor(lineColor);
            paint.setStyle(Paint.Style.FILL);
            canvas.drawPath(path, paint);

/*
ここ必要？(2020-11-09)
            // 枠
            paint.setColor(lineColor);
            paint.setStyle(Paint.Style.STROKE);
            canvas.drawPath(path, paint);

 */
    }

    public void drawHeart(Canvas canvas) {
        RectF rect = new RectF(position.left * bpiScale, position.top * bpiScale, position.right * bpiScale, position.bottom * bpiScale);
        PointF center = new PointF((rect.left + rect.right) / 2, (rect.top + rect.bottom) / 2);
        PointF size = new PointF((rect.right - rect.left), (rect.bottom - rect.top));

        RectF lCir = new RectF(size.x * 0.5f + rect.left, size.y * 0.1f + rect.top, size.x * 0.9f + rect.left, size.y * 0.5f + rect.top);
        RectF rCir = new RectF(size.x * 0.1f + rect.left, size.y * 0.1f + rect.top, size.x * 0.5f + rect.left, size.y * 0.5f + rect.top);

        PointF lcp1 = new PointF(size.x * 0.05f + rect.left, size.y * 0.6f + rect.top);
        PointF lcp2 = new PointF(size.x * 0.5f + rect.left, size.y * 0.8f + rect.top);
        PointF lcp3 = new PointF(size.x * 0.5f + rect.left, size.y * 0.9f + rect.top);
        PointF rcp1 = new PointF(size.x * 0.95f + rect.left, size.y * 0.6f + rect.top);
        PointF rcp2 = new PointF(size.x * 0.5f + rect.left, size.y * 0.8f + rect.top);
        PointF rcp3 = new PointF(size.x * 0.9f + rect.left, size.y * 0.3f + rect.top);

        Path path = new Path();
        path.reset();
        path.arcTo(lCir, 0, -180, true);
        path.arcTo(rCir, 0, -180);
        path.cubicTo(lcp1.x, lcp1.y, lcp2.x, lcp2.y, lcp3.x, lcp3.y);
        path.cubicTo(rcp2.x, rcp2.y, rcp1.x, rcp1.y, rcp3.x, rcp3.y);
        path.close();

        paint.setStrokeWidth(lineWidth);
        paint.setAntiAlias(true);

            paint.setColor(fillColor);
            paint.setStyle(Paint.Style.FILL);
            canvas.drawPath(path, paint);

            paint.setColor(lineColor);
            paint.setStyle(Paint.Style.STROKE);
            canvas.drawPath(path, paint);
    }

    public void drawDiamond(Canvas canvas) {
        float ow = 200f;
        float oh = 200f;
        RectF rect = new RectF(position.left * bpiScale,
                position.top * bpiScale,
                position.right * bpiScale,
                position.bottom * bpiScale);

        float od = (rect.width() / ow < rect.height() / oh) ? rect.width() / ow : rect.height() / oh;
        r();
        Path path = new Path();
        canvas.save();
        canvas.translate(rect.left, rect.top);
        Matrix matrix = new Matrix();
        matrix.reset();
        matrix.setScale(od, od);
        canvas.save();
//        paint.setColor(Color.argb(0,0,0,0));
//        paint.setStrokeCap(Paint.Cap.BUTT);
//        paint.setStrokeJoin(Paint.Join.MITER);
//        paint.setStrokeMiter(4.0f*od);
        canvas.scale(0.39f, 0.39f);
        canvas.save();
        canvas.save();
        canvas.save();
        path.reset();
        path.moveTo(256.0f, 0.0f);
        path.lineTo(59.83f, 256.0f);
        path.lineTo(256.0f, 512.0f);
        path.lineTo(452.17f, 256.0f);
        path.lineTo(256.0f, 0.0f);

        path.transform(matrix);
        paint.setAntiAlias(true);

        paint.setStyle(Paint.Style.FILL);
        paint.setColor(fillColor);
        canvas.restore();

            paint.setColor(fillColor);
            paint.setStyle(Paint.Style.FILL);
            canvas.drawPath(path, paint);
            paint.setStrokeWidth(lineWidth * 2);
            paint.setColor(lineColor);
            paint.setStyle(Paint.Style.STROKE);
            canvas.drawPath(path, paint);

        canvas.restore();
        r(3, 0, 1, 2);
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.restore();
        r();
        canvas.save();
        canvas.restore();
    }

    public void drawClover(Canvas canvas) {
        float od;
        final Matrix matrix = new Matrix();
        Path path = new Path();
        float ow = 200f;
        float oh = 200f;
        RectF rect = new RectF(position.left * bpiScale,
                position.top * bpiScale, position.right * bpiScale,
                position.bottom * bpiScale);

        od = (rect.width() / ow < rect.height() / oh) ? rect.width() / ow : rect.height() / oh;

        r();
        canvas.save();
        canvas.translate(rect.left, rect.top);

        matrix.reset();
        matrix.setScale(od, od);

        canvas.save();
        paint.setColor(Color.argb(0, 0, 0, 0));
        paint.setStrokeCap(Paint.Cap.BUTT);
        paint.setStrokeJoin(Paint.Join.MITER);
        paint.setStrokeMiter(4.0f * od);
        canvas.scale(0.93f, 0.93f);
        canvas.save();
        path.reset();
        path.moveTo(161.67f, 75.2f);
        path.cubicTo(163.55f, 69.52f, 164.5f, 63.6f, 164.5f, 57.5f);
        path.cubicTo(164.5f, 26.35f, 139.15f, 1.0f, 108.0f, 1.0f);
        path.cubicTo(76.85f, 1.0f, 51.5f, 26.35f, 51.5f, 57.5f);
        path.cubicTo(51.5f, 63.6f, 52.45f, 69.52f, 54.33f, 75.2f);
        path.cubicTo(24.18f, 76.34f, 0.0f, 101.23f, 0.0f, 131.66f);
        path.cubicTo(0.0f, 162.81f, 25.35f, 188.16f, 56.5f, 188.16f);
        path.cubicTo(70.94f, 188.16f, 84.13f, 182.71f, 94.13f, 173.76f);
        path.lineTo(81.96f, 215.0f);
        path.lineTo(133.69f, 215.0f);
        path.lineTo(121.4f, 173.34f);
        path.cubicTo(131.46f, 182.53f, 144.83f, 188.16f, 159.5f, 188.16f);
        path.cubicTo(190.65f, 188.16f, 216.0f, 162.81f, 216.0f, 131.66f);
        path.cubicTo(216.0f, 101.23f, 191.82f, 76.34f, 161.67f, 75.2f);
        paint.setAntiAlias(true);

        paint.setStyle(Paint.Style.FILL);
        paint.setColor(lineColor);
        //r(1,0,4,2);
        canvas.restore();
        //  r(1,0,4,2);

            paint.setStrokeWidth(lineWidth);
            paint.setStyle(Paint.Style.STROKE);
            paint.setColor(lineColor);

            path.transform(matrix);

            canvas.drawPath(path, paint);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(fillColor);

            canvas.drawPath(path, paint);

        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.save();
        canvas.restore();
        r(3, 0, 1, 2);
        canvas.restore();
        r();
        canvas.save();
        canvas.restore();
    }

    public void drawSpade(Canvas canvas) {
        float od;
        final Matrix matrix = new Matrix();
        Path path = new Path();
        float ow = 200f;
        float oh = 200f;
        RectF rect = new RectF(position.left * bpiScale,
                position.top * bpiScale,
                position.right * bpiScale,
                position.bottom * bpiScale);

        od = (rect.width() / ow < rect.height() / oh) ? rect.width() / ow : rect.height() / oh;

        r();
        canvas.save();
        canvas.translate(rect.left, rect.top);

        matrix.reset();
        matrix.setScale(od, od);

        canvas.save();

        canvas.scale(3.45f, 3.45f);
        canvas.save();
        canvas.save();
        path.reset();
        path.moveTo(54.82f, 24.94f);
        path.cubicTo(51.09f, 18.33f, 43.44f, 8.83f, 29.15f, 0.05f);
        path.cubicTo(29.04f, -0.02f, 28.9f, -0.02f, 28.79f, 0.05f);
        path.cubicTo(14.5f, 8.83f, 6.85f, 18.05f, 3.12f, 24.65f);
        path.cubicTo(-1.28f, 32.42f, 1.23f, 41.8f, 9.22f, 45.77f);
        path.cubicTo(11.3f, 46.8f, 12.82f, 46.94f, 14.62f, 46.94f);
        path.cubicTo(14.62f, 46.94f, 15.06f, 46.92f, 15.78f, 46.82f);
        path.cubicTo(18.99f, 46.34f, 21.95f, 44.77f, 24.23f, 42.47f);
        path.lineTo(24.55f, 42.14f);
        path.cubicTo(25.03f, 41.66f, 25.84f, 42.04f, 25.78f, 42.71f);
        path.cubicTo(25.44f, 46.35f, 24.78f, 51.82f, 21.99f, 55.3f);
        path.cubicTo(21.14f, 56.37f, 21.84f, 57.94f, 23.21f, 57.94f);
        path.lineTo(34.74f, 57.94f);
        path.cubicTo(36.1f, 57.94f, 36.8f, 56.37f, 35.95f, 55.31f);
        path.cubicTo(33.12f, 51.79f, 32.48f, 46.24f, 32.14f, 42.59f);
        path.cubicTo(32.08f, 42.02f, 32.79f, 41.72f, 33.17f, 42.14f);
        path.lineTo(33.17f, 42.14f);
        path.cubicTo(35.16f, 44.33f, 37.73f, 45.94f, 40.6f, 46.7f);
        path.cubicTo(42.19f, 47.12f, 43.32f, 47.23f, 43.32f, 47.23f);
        path.cubicTo(45.12f, 47.23f, 46.63f, 47.09f, 48.72f, 46.06f);
        path.cubicTo(56.71f, 42.09f, 59.22f, 32.7f, 54.82f, 24.94f);
        paint.setStrokeWidth(lineWidth / 3.45f);
        paint.setAntiAlias(true);
        paint.setStrokeCap(Paint.Cap.BUTT);
        paint.setStrokeJoin(Paint.Join.MITER);
        paint.setStrokeMiter(4.0f * od);

        //r(1,0,4,2);
        canvas.restore();
        //  r(1,0,4,2);

            paint.setStyle(Paint.Style.STROKE);
            paint.setColor(lineColor);
            path.transform(matrix);
            canvas.drawPath(path, paint);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(fillColor);
            canvas.drawPath(path, paint);
            canvas.restore();

        paint.reset();
        paint.reset();

        canvas.save();
        canvas.restore();
        //     r(1,0,4,2,3);
        canvas.save();
        canvas.restore();
        //  r(1,0,4,2,3);
        canvas.save();
        canvas.restore();
        //  r(1,0,4,2,3);
        canvas.save();
        canvas.restore();
        //(1,0,4,2,3);
        canvas.save();
        canvas.restore();
        //r(1,0,4,2,3);
        canvas.save();
        canvas.restore();
        //   r(1,0,4,2,3);
        canvas.save();
        canvas.restore();
        //  r(1,0,4,2,3);
        canvas.save();
        canvas.restore();
        // r(1,0,4,2,3);
        canvas.save();
        canvas.restore();
        // r(1,0,4,2,3);
        canvas.save();
        canvas.restore();
        //  r(1,0,4,2,3);
        canvas.save();
        canvas.restore();
        //   r(1,0,4,2,3);
        canvas.save();
        canvas.restore();
        //   r(1,0,4,2,3);
        canvas.save();
        canvas.restore();
        //     r(1,0,4,2,3);
        canvas.save();
        canvas.restore();
        //   r(1,0,4,2,3);
        canvas.save();
        canvas.restore();
        canvas.restore();
        r();
        canvas.restore();
    }

    public void drawCircle(Canvas canvas) {
        RectF drawRect = new RectF(position.left * bpiScale,
                position.top * bpiScale,
                position.right * bpiScale,
                position.bottom * bpiScale);

        Path path = new Path();
        path.addOval(drawRect, Path.Direction.CW);

        paint.setStrokeWidth(lineWidth);
        paint.setAntiAlias(true);

            paint.setColor(fillColor);
            paint.setStyle(Paint.Style.FILL);

            canvas.drawPath(path, paint);

            paint.setColor(lineColor);
            paint.setStyle(Paint.Style.STROKE);

            canvas.drawPath(path, paint);
    }

    public void drawTriangle(Canvas canvas) {
        RectF rect = new RectF(position.left * bpiScale, position.top * bpiScale, position.right * bpiScale, position.bottom * bpiScale);
        PointF pos1 = new PointF((rect.left + rect.right) / 2, rect.top);
        PointF pos2 = new PointF(rect.left, rect.bottom);
        PointF pos3 = new PointF(rect.right, rect.bottom);

        Path path = new Path();
        path.reset();
        path.moveTo(pos1.x, pos1.y);
        path.lineTo(pos2.x, pos2.y);
        path.lineTo(pos3.x, pos3.y);
        path.close();

        paint.setStrokeWidth(lineWidth);
        paint.setAntiAlias(true);

            paint.setColor(fillColor);
            paint.setStyle(Paint.Style.FILL);
            canvas.drawPath(path, paint);

            paint.setColor(lineColor);
            paint.setStyle(Paint.Style.STROKE);
            canvas.drawPath(path, paint);
    }

    public void drawSquare(Canvas canvas) {
        RectF drawRect = new RectF((position.left+ 20) * bpiScale ,( position.top + 20) * bpiScale,
                (position.right- 20) * bpiScale , (position.bottom - 20)* bpiScale );

        paint.setStrokeWidth(lineWidth);
        paint.setAntiAlias(true);

            paint.setColor(fillColor);
            paint.setStyle(Paint.Style.FILL);
            canvas.drawRect(drawRect, paint);

            paint.setColor(lineColor);
            paint.setStyle(Paint.Style.STROKE);
            canvas.drawRect(drawRect, paint);
    }
    public void drawPentagon(Canvas canvas) {
        drawPoligon(canvas, 5);
    }
    public void drawHexagon(Canvas canvas) {
        drawPoligon(canvas, 6);
    }
    public void drawOctagon(Canvas canvas) {
        drawPoligon(canvas, 8);
    }

    private PointF calcCrossPoint(PointF point1, PointF point2, PointF point3, PointF point4) {
        float r1 = (point2.y - point1.y) / (point2.x - point1.x);
        float r2 = (point4.y - point3.y) / (point4.x - point3.x);

        float x = (r1 * point1.x - point1.y - r2 * point3.x + point3.y) / (r1 - r2);
        float y = (point2.y - point1.y) / (point2.x - point1.x) * (x - point1.x) + point1.y;

        return new PointF(x, y);
    }

    // 多角形描画
    private void drawPoligon(Canvas canvas, int pNum) {
        RectF drawRect = new RectF(position.left * bpiScale, position.top * bpiScale, position.right * bpiScale, position.bottom * bpiScale);

        Path path = new Path();
        path.reset();
        ArrayList<PointF> point = createPoligonPoint(drawRect, pNum);
        path.moveTo(point.get(0).x, point.get(0).y);
        for (int i = 1; i < point.size(); i++) {
            PointF pos = point.get(i);
            path.lineTo(pos.x, pos.y);
        }
        path.close();

        paint.setStrokeWidth(lineWidth);
        paint.setAntiAlias(true);

            paint.setColor(fillColor);
            paint.setStyle(Paint.Style.FILL);
            canvas.drawPath(path, paint);

            paint.setColor(lineColor);
            paint.setStyle(Paint.Style.STROKE);
            canvas.drawPath(path, paint);
    }


    private ArrayList<PointF> createPoligonPoint(RectF rect, int pNum) {
        ArrayList<PointF> pointArray = new ArrayList<PointF>();
        PointF center = new PointF((rect.left + rect.right) / 2, (rect.top + rect.bottom) / 2);
        float r = Math.min(rect.right - center.x, rect.bottom - center.y);

        for (int i = 0; i < pNum; i++) {
            double rad = (Math.PI * 2 / pNum * i) - (Math.PI / 2);
            PointF point = new PointF((float) (center.x + (r * Math.cos(rad))), (float) (center.y + (r * Math.sin(rad))));
            pointArray.add(point);
        }

        return pointArray;
    }

    private void r(Integer... o) {
        paint.reset();
        paint.setAntiAlias(true);
        paint.setStyle(Paint.Style.FILL);
        paint.setStyle(Paint.Style.STROKE);
    }
}
