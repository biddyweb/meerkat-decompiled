package com.digits.sdk.android;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.widget.Button;
import android.widget.TextView;

class FailureActivityDelegateImpl
  implements FailureActivityDelegate
{
  final Activity activity;
  final FailureController controller;

  public FailureActivityDelegateImpl(Activity paramActivity)
  {
    this(paramActivity, new FailureControllerImpl());
  }

  public FailureActivityDelegateImpl(Activity paramActivity, FailureController paramFailureController)
  {
    this.activity = paramActivity;
    this.controller = paramFailureController;
  }

  private DigitsException getBundleException()
  {
    return (DigitsException)this.activity.getIntent().getExtras().getSerializable("fallback_reason");
  }

  private ResultReceiver getBundleResultReceiver()
  {
    return (ResultReceiver)this.activity.getIntent().getExtras().getParcelable("receiver");
  }

  public void init()
  {
    if (isBundleValid(this.activity.getIntent().getExtras()))
    {
      setContentView();
      setUpViews();
      setErrorText();
      return;
    }
    throw new IllegalAccessError("This activity can only be started from Digits");
  }

  protected boolean isBundleValid(Bundle paramBundle)
  {
    return BundleManager.assertContains(paramBundle, new String[] { "receiver" });
  }

  protected void setContentView()
  {
    this.activity.setContentView(R.layout.dgts__activity_failure);
  }

  protected void setErrorText()
  {
    if (getBundleException().getErrorCode() == 269)
      setErrorText(R.string.dgts__associated_with_twitter_error, R.string.dgts__associated_with_twitter_error_alternative);
  }

  protected void setErrorText(int paramInt1, int paramInt2)
  {
    TextView localTextView1 = (TextView)this.activity.findViewById(R.id.dgts__error_title);
    TextView localTextView2 = (TextView)this.activity.findViewById(R.id.dgts__error_text);
    localTextView1.setText(paramInt1);
    localTextView2.setText(paramInt2);
  }

  protected void setUpDismissButton(Button paramButton)
  {
    paramButton.setOnClickListener(new FailureActivityDelegateImpl.1(this));
  }

  protected void setUpTryAnotherPhoneButton(TextView paramTextView)
  {
    paramTextView.setOnClickListener(new FailureActivityDelegateImpl.2(this));
  }

  protected void setUpViews()
  {
    Button localButton = (Button)this.activity.findViewById(R.id.dgts__dismiss_button);
    TextView localTextView = (TextView)this.activity.findViewById(R.id.dgts__try_another_phone);
    setUpDismissButton(localButton);
    setUpTryAnotherPhoneButton(localTextView);
  }
}