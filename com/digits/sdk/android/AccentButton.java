package com.digits.sdk.android;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.Button;

public class AccentButton extends Button
{
  public AccentButton(Context paramContext)
  {
    this(paramContext, null);
  }

  public AccentButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 16842824);
  }

  public AccentButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init();
  }

  void init()
  {
    int i = ThemeUtils.getAccentColor(getResources(), getContext().getTheme());
    ButtonThemer localButtonThemer = new ButtonThemer(getResources());
    localButtonThemer.disableDropShadow(this);
    localButtonThemer.setBackgroundAccentColor(this, i);
    localButtonThemer.setTextAccentColor(this, i);
  }
}