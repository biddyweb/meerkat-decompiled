package com.instabug.library.view;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Cap;
import android.graphics.Paint.Join;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.widget.ImageView;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;

public class AnnotationView extends ImageView
{
  private Canvas a;
  private Path b;
  private Paint c;
  private int d;
  private boolean e = false;
  private LinkedHashMap f = new LinkedHashMap();
  private float g;
  private float h;

  public AnnotationView(Context paramContext)
  {
    super(paramContext);
    setFocusable(true);
    setFocusableInTouchMode(true);
    b();
  }

  public AnnotationView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    setFocusable(true);
    setFocusableInTouchMode(true);
    b();
  }

  public AnnotationView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    setFocusable(true);
    setFocusableInTouchMode(true);
    b();
  }

  private void b()
  {
    this.c = new Paint();
    this.c.setAntiAlias(true);
    this.c.setDither(true);
    if (!isInEditMode());
    for (this.d = getResources().getColor(getResources().getIdentifier("instabug_annotation_color_default", "color", getContext().getPackageName())); ; this.d = -16733521)
    {
      this.c.setColor(this.d);
      this.c.setStyle(Paint.Style.STROKE);
      this.c.setStrokeJoin(Paint.Join.ROUND);
      this.c.setStrokeCap(Paint.Cap.ROUND);
      this.c.setStrokeWidth(2.0F * getContext().getResources().getDisplayMetrics().density);
      this.a = new Canvas();
      return;
    }
  }

  public final void a()
  {
    this.f.clear();
    invalidate();
  }

  public final void a(int paramInt)
  {
    this.d = getResources().getColor(paramInt);
  }

  public void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if (!this.f.isEmpty())
    {
      Iterator localIterator = this.f.entrySet().iterator();
      do
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        this.c.setColor(((Integer)localEntry.getValue()).intValue());
        paramCanvas.drawPath((Path)localEntry.getKey(), this.c);
      }
      while (localIterator.hasNext());
    }
  }

  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    float f1 = paramMotionEvent.getX();
    float f2 = paramMotionEvent.getY();
    switch (paramMotionEvent.getAction())
    {
    default:
      return true;
    case 0:
      this.e = false;
      this.b = new Path();
      this.f.put(this.b, Integer.valueOf(this.d));
      this.b.reset();
      this.b.moveTo(f1, f2);
      this.g = f1;
      this.h = f2;
      return true;
    case 2:
      this.e = true;
      float f3 = Math.abs(f1 - this.g);
      float f4 = Math.abs(f2 - this.h);
      if ((f3 >= 4.0F) || (f4 >= 4.0F))
      {
        this.b.quadTo(this.g, this.h, (f1 + this.g) / 2.0F, (f2 + this.h) / 2.0F);
        this.g = f1;
        this.h = f2;
      }
      invalidate();
      return true;
    case 1:
    }
    this.b.lineTo(this.g, this.h);
    this.a.drawPath(this.b, this.c);
    if (!this.e)
      performClick();
    invalidate();
    return true;
  }
}