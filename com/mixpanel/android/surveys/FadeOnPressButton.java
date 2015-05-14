package com.mixpanel.android.surveys;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.Button;

@TargetApi(16)
public class FadeOnPressButton extends Button
{
  private boolean mIsFaded;

  public FadeOnPressButton(Context paramContext)
  {
    super(paramContext);
  }

  public FadeOnPressButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }

  public FadeOnPressButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }

  private void setAlphaBySDK(float paramFloat)
  {
    setAlpha(paramFloat);
  }

  protected void drawableStateChanged()
  {
    int[] arrayOfInt = getDrawableState();
    int i = arrayOfInt.length;
    for (int j = 0; ; j++)
    {
      int k = 0;
      if (j < i)
      {
        if (arrayOfInt[j] == 16842919)
        {
          if (!this.mIsFaded)
            setAlphaBySDK(0.5F);
          k = 1;
        }
      }
      else
      {
        if ((this.mIsFaded) && (k == 0))
        {
          setAlphaBySDK(1.0F);
          this.mIsFaded = true;
        }
        super.drawableStateChanged();
        return;
      }
    }
  }
}