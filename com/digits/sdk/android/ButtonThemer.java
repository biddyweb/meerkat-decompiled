package com.digits.sdk.android;

import android.annotation.TargetApi;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build.VERSION;
import android.util.StateSet;
import android.util.TypedValue;
import android.view.View;
import android.widget.TextView;

class ButtonThemer
{
  final Resources resources;

  public ButtonThemer(Resources paramResources)
  {
    this.resources = paramResources;
  }

  @TargetApi(21)
  void disableDropShadow(View paramView)
  {
    if (Build.VERSION.SDK_INT >= 21)
    {
      paramView.setStateListAnimator(null);
      paramView.setElevation(0.0F);
    }
  }

  int getPressedColor(int paramInt)
  {
    if (ThemeUtils.isLightColor(paramInt))
      return ThemeUtils.calculateOpacityTransform(0.2D, -16777216, paramInt);
    return ThemeUtils.calculateOpacityTransform(0.2D, -1, paramInt);
  }

  int getTextColor(int paramInt)
  {
    if (ThemeUtils.isLightColor(paramInt))
      return this.resources.getColor(R.color.dgts__text_dark);
    return this.resources.getColor(R.color.dgts__text_light);
  }

  @TargetApi(16)
  void setBackgroundAccentColor(View paramView, int paramInt)
  {
    StateListDrawable localStateListDrawable = new StateListDrawable();
    float f = TypedValue.applyDimension(1, 5.0F, this.resources.getDisplayMetrics());
    GradientDrawable localGradientDrawable1 = new GradientDrawable();
    localGradientDrawable1.setCornerRadius(f);
    localGradientDrawable1.setColor(getPressedColor(paramInt));
    localStateListDrawable.addState(new int[] { 16842908, 16842919 }, localGradientDrawable1);
    localStateListDrawable.addState(new int[] { -16842908, 16842919 }, localGradientDrawable1);
    localStateListDrawable.addState(new int[] { 16842908 }, localGradientDrawable1);
    GradientDrawable localGradientDrawable2 = new GradientDrawable();
    localGradientDrawable2.setColor(paramInt);
    localGradientDrawable2.setCornerRadius(f);
    localStateListDrawable.addState(StateSet.WILD_CARD, localGradientDrawable2);
    if (Build.VERSION.SDK_INT >= 16)
    {
      paramView.setBackground(localStateListDrawable);
      return;
    }
    paramView.setBackgroundDrawable(localStateListDrawable);
  }

  @TargetApi(16)
  void setBackgroundAccentColorInverse(View paramView, int paramInt)
  {
    StateListDrawable localStateListDrawable = new StateListDrawable();
    float f1 = TypedValue.applyDimension(1, 5.0F, this.resources.getDisplayMetrics());
    float f2 = TypedValue.applyDimension(1, 2.0F, this.resources.getDisplayMetrics());
    GradientDrawable localGradientDrawable1 = new GradientDrawable();
    localGradientDrawable1.setCornerRadius(f1);
    localGradientDrawable1.setStroke((int)f2, getPressedColor(paramInt));
    localStateListDrawable.addState(new int[] { 16842908, 16842919 }, localGradientDrawable1);
    localStateListDrawable.addState(new int[] { -16842908, 16842919 }, localGradientDrawable1);
    localStateListDrawable.addState(new int[] { 16842908 }, localGradientDrawable1);
    GradientDrawable localGradientDrawable2 = new GradientDrawable();
    localGradientDrawable2.setCornerRadius(f1);
    localGradientDrawable2.setStroke((int)f2, paramInt);
    localStateListDrawable.addState(StateSet.WILD_CARD, localGradientDrawable2);
    if (Build.VERSION.SDK_INT >= 16)
    {
      paramView.setBackground(localStateListDrawable);
      return;
    }
    paramView.setBackgroundDrawable(localStateListDrawable);
  }

  void setTextAccentColor(TextView paramTextView, int paramInt)
  {
    paramTextView.setTextColor(getTextColor(paramInt));
  }

  void setTextAccentColorInverse(TextView paramTextView, int paramInt)
  {
    int i = getPressedColor(paramInt);
    int[][] arrayOfInt = new int[4][];
    arrayOfInt[0] = { 16842908, -16842919 };
    arrayOfInt[1] = { 16842908, 16842919 };
    arrayOfInt[2] = { -16842908, 16842919 };
    arrayOfInt[3] = StateSet.WILD_CARD;
    paramTextView.setTextColor(new ColorStateList(arrayOfInt, new int[] { paramInt, i, i, paramInt }));
  }
}