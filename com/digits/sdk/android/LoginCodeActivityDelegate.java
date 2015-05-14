package com.digits.sdk.android;

import android.app.Activity;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.widget.EditText;
import android.widget.TextView;
import io.fabric.sdk.android.services.common.CommonUtils;

class LoginCodeActivityDelegate extends DigitsActivityDelegateImpl
{
  Activity activity;
  DigitsController controller;
  EditText editText;
  SmsBroadcastReceiver receiver;
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
    TextView localTextView = (TextView)paramActivity.findViewById(R.id.dgts__resendConfirmation);
    this.controller = initController(paramBundle);
    setUpEditText(paramActivity, this.controller, this.editText);
    setUpSendButton(paramActivity, this.controller, this.stateButton);
    setUpTermsText(paramActivity, this.controller, this.termsText);
    setUpResendText(paramActivity, localTextView);
    setUpSmsIntercept(paramActivity, this.editText);
    CommonUtils.openKeyboard(paramActivity, this.editText);
  }

  DigitsController initController(Bundle paramBundle)
  {
    return new LoginCodeController((ResultReceiver)paramBundle.getParcelable("receiver"), this.stateButton, this.editText, paramBundle.getString("request_id"), paramBundle.getLong("user_id"), paramBundle.getString("phone_number"));
  }

  public boolean isValid(Bundle paramBundle)
  {
    return BundleManager.assertContains(paramBundle, new String[] { "receiver", "phone_number", "request_id", "user_id" });
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
    paramTextView.setOnClickListener(new LoginCodeActivityDelegate.1(this, paramActivity));
  }

  public void setUpSendButton(Activity paramActivity, DigitsController paramDigitsController, StateButton paramStateButton)
  {
    paramStateButton.setStatesText(R.string.dgts__sign_in, R.string.dgts__signing_in, R.string.dgts__sign_in);
    paramStateButton.showStart();
    super.setUpSendButton(paramActivity, paramDigitsController, paramStateButton);
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
    paramTextView.setVisibility(8);
  }
}