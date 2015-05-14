package com.digits.sdk.android;

import android.content.Context;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.widget.TextView;

public class LinkTextView extends TextView
{
  public LinkTextView(Context paramContext)
  {
    super(paramContext);
    init(paramContext);
  }

  public LinkTextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext);
  }

  public LinkTextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext);
  }

  private int getLinkColor(Context paramContext)
  {
    TypedValue localTypedValue = ThemeUtils.getTypedValueColor(paramContext.getTheme(), 16842907);
    if (localTypedValue == null)
      return ThemeUtils.getAccentColor(paramContext.getResources(), paramContext.getTheme());
    return localTypedValue.data;
  }

  private void init(Context paramContext)
  {
    setTextColor(getLinkColor(paramContext));
  }
}