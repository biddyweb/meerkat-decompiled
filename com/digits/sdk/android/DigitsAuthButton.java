package com.digits.sdk.android;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class DigitsAuthButton extends Button
  implements View.OnClickListener
{
  private AuthCallback callback;
  volatile DigitsClient digitsClient;
  private View.OnClickListener onClickListener;

  public DigitsAuthButton(Context paramContext)
  {
    this(paramContext, null);
  }

  public DigitsAuthButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 16842824);
  }

  public DigitsAuthButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    setUpButton();
    super.setOnClickListener(this);
  }

  private void setUpButton()
  {
    Resources localResources = getResources();
    setCompoundDrawablePadding(localResources.getDimensionPixelSize(R.dimen.tw__login_btn_drawable_padding));
    setText(R.string.dgts__login_digits_text);
    setTextColor(localResources.getColor(R.color.tw__solid_white));
    setTextSize(0, localResources.getDimensionPixelSize(R.dimen.tw__login_btn_text_size));
    setTypeface(Typeface.DEFAULT_BOLD);
    setPadding(localResources.getDimensionPixelSize(R.dimen.tw__login_btn_right_padding), 0, localResources.getDimensionPixelSize(R.dimen.tw__login_btn_right_padding), 0);
    setBackgroundResource(R.drawable.dgts__digits_btn);
  }

  protected Digits getDigits()
  {
    return Digits.getInstance();
  }

  protected DigitsClient getDigitsClient()
  {
    if (this.digitsClient == null);
    try
    {
      if (this.digitsClient == null)
        this.digitsClient = getDigits().getDigitsClient();
      return this.digitsClient;
    }
    finally
    {
    }
  }

  public void onClick(View paramView)
  {
    if (this.callback == null)
      throw new IllegalArgumentException("AuthCallback must not be null");
    getDigitsClient().startSignUp(this.callback);
    if (this.onClickListener != null)
      this.onClickListener.onClick(paramView);
  }

  public void setAuthTheme(int paramInt)
  {
    getDigits().setTheme(paramInt);
  }

  public void setCallback(AuthCallback paramAuthCallback)
  {
    this.callback = paramAuthCallback;
  }

  public void setOnClickListener(View.OnClickListener paramOnClickListener)
  {
    this.onClickListener = paramOnClickListener;
  }
}