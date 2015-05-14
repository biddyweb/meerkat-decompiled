package com.mixpanel.android.surveys;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.animation.Animation;
import android.view.animation.Transformation;
import android.widget.CheckedTextView;

public class SurveyChoiceView extends CheckedTextView
{
  private static final int ANIMATION_DURATION = 300;
  private static final int BOX_PADDING_LEFT_DP = 22;
  private static final int BOX_PADDING_TOP_DP = 12;
  private static final int CHECKMARK_HEIGHT_DP = 14;
  private float mCheckmarkLeftOffset;
  private Drawable mSurveyChoiceCheckMark;
  private float mTextLeftOffset;

  public SurveyChoiceView(Context paramContext)
  {
    super(paramContext);
    initSurveyChoiceView();
  }

  public SurveyChoiceView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    initSurveyChoiceView();
  }

  public SurveyChoiceView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    initSurveyChoiceView();
  }

  private void initSurveyChoiceView()
  {
    this.mCheckmarkLeftOffset = 0.0F;
    this.mTextLeftOffset = 1.5F;
  }

  protected void onDraw(Canvas paramCanvas)
  {
    Drawable localDrawable = this.mSurveyChoiceCheckMark;
    float f = getResources().getDisplayMetrics().density;
    int i = 0;
    if (localDrawable != null)
    {
      boolean bool = isChecked();
      i = 0;
      if (bool)
        i = (int)(14.0F * f);
    }
    int j = i;
    int k = (int)(12.0F * f);
    int m = (int)(22.0F * f);
    setCheckMarkDrawable(null);
    setPadding((int)(m + this.mTextLeftOffset * i), k, m, k);
    super.onDraw(paramCanvas);
    int n = (int)(m + this.mCheckmarkLeftOffset * i);
    setPadding(n, k, m, k);
    setCheckMarkDrawable(localDrawable);
    int i2;
    if (localDrawable != null)
    {
      int i1 = 0x70 & getGravity();
      i2 = 0;
      switch (i1)
      {
      default:
      case 80:
      case 16:
      }
    }
    while (true)
    {
      int i3 = i2;
      int i4 = i3 + j;
      int i5 = n + i;
      localDrawable.setBounds(n + getScrollX(), i3, i5 + getScrollX(), i4);
      localDrawable.draw(paramCanvas);
      setPadding(m, k, m, k);
      return;
      i2 = getHeight() - j;
      continue;
      i2 = (getHeight() - j) / 2;
    }
  }

  public void setCheckMarkDrawable(Drawable paramDrawable)
  {
    super.setCheckMarkDrawable(paramDrawable);
    this.mSurveyChoiceCheckMark = paramDrawable;
  }

  public void setChecked(boolean paramBoolean)
  {
    boolean bool = isChecked();
    super.setChecked(paramBoolean);
    if ((isChecked()) && (!bool))
    {
      SetCheckAnimation localSetCheckAnimation = new SetCheckAnimation(null);
      localSetCheckAnimation.setDuration(300L);
      startAnimation(localSetCheckAnimation);
    }
  }

  private class SetCheckAnimation extends Animation
  {
    private SetCheckAnimation()
    {
    }

    protected void applyTransformation(float paramFloat, Transformation paramTransformation)
    {
      float f1 = 1.0F;
      if (paramFloat <= 0.5F);
      for (float f2 = paramFloat - 0.5F; ; f2 = 0.0F)
      {
        SurveyChoiceView.access$102(SurveyChoiceView.this, f2);
        SurveyChoiceView.access$202(SurveyChoiceView.this, f1);
        SurveyChoiceView.this.requestLayout();
        return;
        f1 += 2.0F * (paramFloat - 0.5F);
      }
    }

    public boolean willChangeBounds()
    {
      return false;
    }

    public boolean willChangeTransformationMatrix()
    {
      return false;
    }
  }
}