package com.digits.sdk.android;

import android.app.Activity;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.widget.EditText;
import android.widget.TextView;
import io.fabric.sdk.android.services.common.CommonUtils;

class ConfirmationCodeActivityDelegate extends DigitsActivityDelegateImpl
{
  Activity activity;
  DigitsController controller;
  EditText editText;
  SmsBroadcastReceiver receiver;
  TextView resendText;
  StateButton stateButton;
  TextView termsText;

  public int getLayoutId()
  {
    return R.layout.dgts__activity_confirmation;
  }

  public void init(Activity paramActivity, Bundle paramBundle)
  {
    this.activity = paramActivity;
    this.editText = ((EditText)paramActivity.findViewById(R.id.dgts__confirmationEditText));
    this.stateButton = ((StateButton)paramActivity.findViewById(R.id.dgts__createAccount));
    this.termsText = ((TextView)paramActivity.findViewById(R.id.dgts__termsTextCreateAccount));
    this.resendText = ((TextView)paramActivity.findViewById(R.id.dgts__resendConfirmation));
    this.controller = initController(paramBundle);
    setUpEditText(paramActivity, this.controller, this.editText);
    setUpSendButton(paramActivity, this.controller, this.stateButton);
    setUpTermsText(paramActivity, this.controller, this.termsText);
    setUpResendText(paramActivity, this.resendText);
    setUpSmsIntercept(paramActivity, this.editText);
    CommonUtils.openKeyboard(paramActivity, this.editText);
  }

  DigitsController initController(Bundle paramBundle)
  {
    return new ConfirmationCodeController((ResultReceiver)paramBundle.getParcelable("receiver"), this.stateButton, this.editText, paramBundle.getString("phone_number"));
  }

  public boolean isValid(Bundle paramBundle)
  {
    return BundleManager.assertContains(paramBundle, new String[] { "receiver", "phone_number" });
  }

  public void onDestroy()
  {
    if (this.receiver != null)
      this.activity.unregisterReceiver(this.receiver);
  }

  public void onResume()
  {
    this.controller.onResume();
  }

  protected void setUpResendText(Activity paramActivity, TextView paramTextView)
  {
    paramTextView.setOnClickListener(new ConfirmationCodeActivityDelegate.1(this, paramActivity));
  }

  protected void setUpSmsIntercept(Activity paramActivity, EditText paramEditText)
  {
    if (CommonUtils.checkPermission(paramActivity, "android.permission.RECEIVE_SMS"))
    {
      IntentFilter localIntentFilter = new IntentFilter("android.provider.Telephony.SMS_RECEIVED");
      this.receiver = new SmsBroadcastReceiver(paramEditText);
      paramActivity.registerReceiver(this.receiver, localIntentFilter);
    }
  }

  public void setUpTermsText(Activity paramActivity, DigitsController paramDigitsController, TextView paramTextView)
  {
    paramTextView.setText(getFormattedTerms(paramActivity, R.string.dgts__terms_text_create));
    super.setUpTermsText(paramActivity, paramDigitsController, paramTextView);
  }
}