package com.digits.sdk.android;

import android.app.Activity;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.widget.EditText;
import android.widget.TextView;
import io.fabric.sdk.android.services.common.CommonUtils;

class PinCodeActivityDelegate extends DigitsActivityDelegateImpl
{
  DigitsController controller;
  EditText editText;
  StateButton stateButton;
  TextView termsText;

  public int getLayoutId()
  {
    return R.layout.dgts__activity_pin_code;
  }

  public void init(Activity paramActivity, Bundle paramBundle)
  {
    this.editText = ((EditText)paramActivity.findViewById(R.id.dgts__confirmationEditText));
    this.stateButton = ((StateButton)paramActivity.findViewById(R.id.dgts__createAccount));
    this.termsText = ((TextView)paramActivity.findViewById(R.id.dgts__termsTextCreateAccount));
    this.controller = initController(paramBundle);
    setUpEditText(paramActivity, this.controller, this.editText);
    setUpSendButton(paramActivity, this.controller, this.stateButton);
    setUpTermsText(paramActivity, this.controller, this.termsText);
    CommonUtils.openKeyboard(paramActivity, this.editText);
  }

  DigitsController initController(Bundle paramBundle)
  {
    return new PinCodeController((ResultReceiver)paramBundle.getParcelable("receiver"), this.stateButton, this.editText, paramBundle.getString("request_id"), paramBundle.getLong("user_id"), paramBundle.getString("phone_number"));
  }

  public boolean isValid(Bundle paramBundle)
  {
    return BundleManager.assertContains(paramBundle, new String[] { "receiver", "phone_number", "request_id", "user_id" });
  }

  public void onResume()
  {
    this.controller.onResume();
  }
}