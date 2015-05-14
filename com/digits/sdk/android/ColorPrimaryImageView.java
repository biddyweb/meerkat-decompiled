package com.digits.sdk.android;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.PorterDuff.Mode;
import android.util.AttributeSet;
import android.widget.ImageView;

public class ColorPrimaryImageView extends ImageView
{
  public ColorPrimaryImageView(Context paramContext)
  {
    super(paramContext);
    init(paramContext);
  }

  public ColorPrimaryImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }

  public ColorPrimaryImageView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext);
  }

  private int getTextColorPrimary(Context paramContext)
  {
    TypedArray localTypedArray = paramContext.getTheme().obtainStyledAttributes(new int[] { 16842806 });
    int i = localTypedArray.getColor(0, getResources().getColor(R.color.dgts__default_logo_name));
    localTypedArray.recycle();
    return i;
  }

  private void init(Context paramContext)
  {
    setColorFilter(getTextColorPrimary(paramContext), PorterDuff.Mode.SRC_IN);
  }
}