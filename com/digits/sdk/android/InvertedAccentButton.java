package com.digits.sdk.android;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.Button;

public class InvertedAccentButton extends Button
{
  public InvertedAccentButton(Context paramContext)
  {
    this(paramContext, null);
  }

  public InvertedAccentButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 16842824);
  }

  public InvertedAccentButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init();
  }

  void init()
  {
    int i = ThemeUtils.getAccentColor(getResources(), getContext().getTheme());
    ButtonThemer localButtonThemer = new ButtonThemer(getResources());
    localButtonThemer.disableDropShadow(this);
    localButtonThemer.setBackgroundAccentColorInverse(this, i);
    localButtonThemer.setTextAccentColorInverse(this, i);
  }
}