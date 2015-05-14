package com.digits.sdk.android;

import android.content.Context;
import android.graphics.PorterDuff.Mode;
import android.util.AttributeSet;
import android.widget.ImageView;

public class AccentImageView extends ImageView
{
  public AccentImageView(Context paramContext)
  {
    super(paramContext);
    init(paramContext);
  }

  public AccentImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }

  public AccentImageView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext);
  }

  private void init(Context paramContext)
  {
    setColorFilter(ThemeUtils.getAccentColor(getResources(), paramContext.getTheme()), PorterDuff.Mode.SRC_IN);
  }
}