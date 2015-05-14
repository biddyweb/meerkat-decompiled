package com.google.android.exoplayer;

import android.content.Context;
import android.util.AttributeSet;
import android.view.SurfaceView;

public class VideoSurfaceView extends SurfaceView
{
  private static final float MAX_ASPECT_RATIO_DEFORMATION_PERCENT = 0.01F;
  private float videoAspectRatio;

  public VideoSurfaceView(Context paramContext)
  {
    super(paramContext);
  }

  public VideoSurfaceView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    int i = getMeasuredWidth();
    int j = getMeasuredHeight();
    float f2;
    if (this.videoAspectRatio != 0.0F)
    {
      float f1 = i / j;
      f2 = this.videoAspectRatio / f1 - 1.0F;
      if (f2 <= 0.01F)
        break label71;
      j = (int)(i / this.videoAspectRatio);
    }
    while (true)
    {
      setMeasuredDimension(i, j);
      return;
      label71: if (f2 < -0.01F)
        i = (int)(j * this.videoAspectRatio);
    }
  }

  public void setVideoWidthHeightRatio(float paramFloat)
  {
    if (this.videoAspectRatio != paramFloat)
    {
      this.videoAspectRatio = paramFloat;
      requestLayout();
    }
  }
}