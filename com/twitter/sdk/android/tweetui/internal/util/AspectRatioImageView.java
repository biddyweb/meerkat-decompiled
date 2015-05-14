package com.twitter.sdk.android.tweetui.internal.util;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.twitter.sdk.android.tweetui.R.styleable;

public class AspectRatioImageView extends ImageView
{
  static final int ADJUST_DIMENSION_HEIGHT = 0;
  static final int ADJUST_DIMENSION_WIDTH = 1;
  private static final int DEFAULT_ADJUST_DIMENSION = 0;
  private static final float DEFAULT_ASPECT_RATIO = 1.0F;
  private float aspectRatio;
  private int dimensionToAdjust;

  public AspectRatioImageView(Context paramContext)
  {
    this(paramContext, null);
  }

  public AspectRatioImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.tw__AspectRatioImageView);
    try
    {
      this.aspectRatio = localTypedArray.getFloat(R.styleable.tw__AspectRatioImageView_tw__image_aspect_ratio, 1.0F);
      this.dimensionToAdjust = localTypedArray.getInt(R.styleable.tw__AspectRatioImageView_tw__image_dimension_to_adjust, 0);
      return;
    }
    finally
    {
      localTypedArray.recycle();
    }
  }

  public float getAspectRatio()
  {
    return this.aspectRatio;
  }

  public int getDimensionToAdjust()
  {
    return this.dimensionToAdjust;
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    int i = getMeasuredWidth();
    int j = getMeasuredHeight();
    if (this.dimensionToAdjust == 0)
      j = (int)(i / this.aspectRatio);
    while (true)
    {
      setMeasuredDimension(i, j);
      return;
      i = (int)(j * this.aspectRatio);
    }
  }
}