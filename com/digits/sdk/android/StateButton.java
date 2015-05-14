package com.digits.sdk.android;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class StateButton extends RelativeLayout
{
  int accentColor;
  ButtonThemer buttonThemer;
  CharSequence finishText;
  ImageView imageView;
  ProgressBar progressBar;
  CharSequence progressText;
  CharSequence startText;
  TextView textView;

  public StateButton(Context paramContext)
  {
    this(paramContext, null);
  }

  public StateButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }

  public StateButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.StateButton);
    init(localTypedArray);
    localTypedArray.recycle();
    this.accentColor = ThemeUtils.getAccentColor(getResources(), paramContext.getTheme());
    this.buttonThemer = new ButtonThemer(getResources());
    this.buttonThemer.setBackgroundAccentColor(this, this.accentColor);
    this.buttonThemer.setTextAccentColor(this.textView, this.accentColor);
    setImageAccentColor();
    setSpinnerAccentColor();
  }

  private void initView()
  {
    inflate(getContext(), R.layout.dgts__state_button, this);
    this.textView = ((TextView)findViewById(R.id.dgts__state_button));
    this.progressBar = ((ProgressBar)findViewById(R.id.dgts__state_progress));
    this.imageView = ((ImageView)findViewById(R.id.dgts__state_success));
    showStart();
  }

  Drawable getProgressDrawable()
  {
    if (ThemeUtils.isLightColor(this.accentColor))
      return getResources().getDrawable(R.drawable.progress_dark);
    return getResources().getDrawable(R.drawable.progress_light);
  }

  int getTextColor()
  {
    return this.buttonThemer.getTextColor(this.accentColor);
  }

  void init(TypedArray paramTypedArray)
  {
    this.startText = paramTypedArray.getText(R.styleable.StateButton_startStateText);
    this.progressText = paramTypedArray.getText(R.styleable.StateButton_progressStateText);
    this.finishText = paramTypedArray.getText(R.styleable.StateButton_finishStateText);
    initView();
  }

  void setImageAccentColor()
  {
    this.imageView.setColorFilter(getTextColor(), PorterDuff.Mode.SRC_IN);
  }

  void setSpinnerAccentColor()
  {
    this.progressBar.setIndeterminateDrawable(getProgressDrawable());
  }

  public void setStatesText(int paramInt1, int paramInt2, int paramInt3)
  {
    Context localContext = getContext();
    this.startText = localContext.getString(paramInt1);
    this.progressText = localContext.getString(paramInt2);
    this.finishText = localContext.getString(paramInt3);
  }

  public void showError()
  {
    showStart();
  }

  public void showFinish()
  {
    this.textView.setText(this.finishText);
    this.progressBar.setVisibility(8);
    this.imageView.setVisibility(0);
  }

  public void showProgress()
  {
    this.textView.setText(this.progressText);
    this.progressBar.setVisibility(0);
    this.imageView.setVisibility(8);
  }

  public void showStart()
  {
    this.textView.setText(this.startText);
    this.progressBar.setVisibility(8);
    this.imageView.setVisibility(8);
  }
}