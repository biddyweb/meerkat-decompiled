package com.google.android.exoplayer.text;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Join;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.View.MeasureSpec;
import com.google.android.exoplayer.util.Util;

public class SubtitleView extends View
{
  private static final float INNER_PADDING_RATIO = 0.125F;
  private int backgroundColor;
  private final float cornerRadius;
  private int edgeColor;
  private int edgeType;
  private int foregroundColor;
  private boolean hasMeasurements;
  private int innerPaddingX;
  private int lastMeasuredWidth;
  private StaticLayout layout;
  private final RectF lineBounds = new RectF();
  private final float outlineWidth;
  private Paint paint;
  private final float shadowOffset;
  private final float shadowRadius;
  private float spacingAdd;
  private float spacingMult;
  private final StringBuilder textBuilder = new StringBuilder();
  private TextPaint textPaint;

  public SubtitleView(Context paramContext)
  {
    this(paramContext, null);
  }

  public SubtitleView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }

  public SubtitleView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, new int[] { 16843087, 16842901, 16843287, 16843288 }, paramInt, 0);
    CharSequence localCharSequence = localTypedArray.getText(0);
    int i = localTypedArray.getDimensionPixelSize(1, 15);
    this.spacingAdd = localTypedArray.getDimensionPixelSize(2, 0);
    this.spacingMult = localTypedArray.getFloat(3, 1.0F);
    localTypedArray.recycle();
    int j = Math.round(2.0F * getContext().getResources().getDisplayMetrics().densityDpi / 160.0F);
    this.cornerRadius = j;
    this.outlineWidth = j;
    this.shadowRadius = j;
    this.shadowOffset = j;
    this.textPaint = new TextPaint();
    this.textPaint.setAntiAlias(true);
    this.textPaint.setSubpixelText(true);
    this.paint = new Paint();
    this.paint.setAntiAlias(true);
    this.innerPaddingX = 0;
    setText(localCharSequence);
    setTextSize(i);
    setStyle(CaptionStyleCompat.DEFAULT);
  }

  private boolean computeMeasurements(int paramInt)
  {
    if ((this.hasMeasurements) && (paramInt == this.lastMeasuredWidth))
      return true;
    int i = paramInt - (getPaddingLeft() + getPaddingRight() + 2 * this.innerPaddingX);
    if (i <= 0)
      return false;
    this.hasMeasurements = true;
    this.lastMeasuredWidth = i;
    this.layout = new StaticLayout(this.textBuilder, this.textPaint, i, null, this.spacingMult, this.spacingAdd, true);
    return true;
  }

  private void forceUpdate(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.hasMeasurements = false;
      requestLayout();
    }
    invalidate();
  }

  @TargetApi(11)
  private void setTooSmallMeasureDimensionV11()
  {
    setMeasuredDimension(16777216, 16777216);
  }

  private void setTypeface(Typeface paramTypeface)
  {
    if (this.textPaint.getTypeface() != paramTypeface)
    {
      this.textPaint.setTypeface(paramTypeface);
      forceUpdate(true);
    }
  }

  protected void onDraw(Canvas paramCanvas)
  {
    StaticLayout localStaticLayout = this.layout;
    if (localStaticLayout == null)
      return;
    int i = paramCanvas.save();
    int j = this.innerPaddingX;
    paramCanvas.translate(j + getPaddingLeft(), getPaddingTop());
    int k = localStaticLayout.getLineCount();
    TextPaint localTextPaint = this.textPaint;
    Paint localPaint = this.paint;
    RectF localRectF = this.lineBounds;
    if (Color.alpha(this.backgroundColor) > 0)
    {
      float f2 = this.cornerRadius;
      float f3 = localStaticLayout.getLineTop(0);
      localPaint.setColor(this.backgroundColor);
      localPaint.setStyle(Paint.Style.FILL);
      for (int i2 = 0; i2 < k; i2++)
      {
        localRectF.left = (localStaticLayout.getLineLeft(i2) - j);
        localRectF.right = (localStaticLayout.getLineRight(i2) + j);
        localRectF.top = f3;
        localRectF.bottom = localStaticLayout.getLineBottom(i2);
        f3 = localRectF.bottom;
        paramCanvas.drawRoundRect(localRectF, f2, f2, localPaint);
      }
    }
    if (this.edgeType == 1)
    {
      localTextPaint.setStrokeJoin(Paint.Join.ROUND);
      localTextPaint.setStrokeWidth(this.outlineWidth);
      localTextPaint.setColor(this.edgeColor);
      localTextPaint.setStyle(Paint.Style.FILL_AND_STROKE);
      localStaticLayout.draw(paramCanvas);
    }
    do
      while (true)
      {
        localTextPaint.setColor(this.foregroundColor);
        localTextPaint.setStyle(Paint.Style.FILL);
        localStaticLayout.draw(paramCanvas);
        localTextPaint.setShadowLayer(0.0F, 0.0F, 0.0F, 0);
        paramCanvas.restoreToCount(i);
        return;
        if (this.edgeType != 2)
          break;
        localTextPaint.setShadowLayer(this.shadowRadius, this.shadowOffset, this.shadowOffset, this.edgeColor);
      }
    while ((this.edgeType != 3) && (this.edgeType != 4));
    int m;
    label330: int n;
    if (this.edgeType == 3)
    {
      m = 1;
      if (m == 0)
        break label420;
      n = -1;
      label338: if (m == 0)
        break label429;
    }
    label420: label429: for (int i1 = this.edgeColor; ; i1 = -1)
    {
      float f1 = this.shadowRadius / 2.0F;
      localTextPaint.setColor(this.foregroundColor);
      localTextPaint.setStyle(Paint.Style.FILL);
      localTextPaint.setShadowLayer(this.shadowRadius, -f1, -f1, n);
      localStaticLayout.draw(paramCanvas);
      localTextPaint.setShadowLayer(this.shadowRadius, f1, f1, i1);
      break;
      m = 0;
      break label330;
      n = this.edgeColor;
      break label338;
    }
  }

  public void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    computeMeasurements(paramInt3 - paramInt1);
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    if (computeMeasurements(View.MeasureSpec.getSize(paramInt1)))
    {
      StaticLayout localStaticLayout = this.layout;
      int i = getPaddingLeft() + getPaddingRight() + 2 * this.innerPaddingX;
      int j = localStaticLayout.getHeight() + getPaddingTop() + getPaddingBottom();
      int k = 0;
      int m = localStaticLayout.getLineCount();
      for (int n = 0; n < m; n++)
        k = Math.max((int)Math.ceil(localStaticLayout.getLineWidth(n)), k);
      setMeasuredDimension(k + i, j);
      return;
    }
    if (Util.SDK_INT >= 11)
    {
      setTooSmallMeasureDimensionV11();
      return;
    }
    setMeasuredDimension(0, 0);
  }

  public void setBackgroundColor(int paramInt)
  {
    this.backgroundColor = paramInt;
    forceUpdate(false);
  }

  public void setStyle(CaptionStyleCompat paramCaptionStyleCompat)
  {
    this.foregroundColor = paramCaptionStyleCompat.foregroundColor;
    this.backgroundColor = paramCaptionStyleCompat.backgroundColor;
    this.edgeType = paramCaptionStyleCompat.edgeType;
    this.edgeColor = paramCaptionStyleCompat.edgeColor;
    setTypeface(paramCaptionStyleCompat.typeface);
    super.setBackgroundColor(paramCaptionStyleCompat.windowColor);
    forceUpdate(true);
  }

  public void setText(CharSequence paramCharSequence)
  {
    this.textBuilder.setLength(0);
    this.textBuilder.append(paramCharSequence);
    forceUpdate(true);
  }

  public void setTextSize(float paramFloat)
  {
    if (this.textPaint.getTextSize() != paramFloat)
    {
      this.textPaint.setTextSize(paramFloat);
      this.innerPaddingX = ((int)(0.5F + 0.125F * paramFloat));
      forceUpdate(true);
    }
  }
}