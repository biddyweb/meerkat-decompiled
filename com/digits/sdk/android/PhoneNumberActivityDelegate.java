package com.digits.sdk.android;

import android.app.Activity;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.widget.EditText;
import android.widget.TextView;
import io.fabric.sdk.android.services.common.CommonUtils;

class PhoneNumberActivityDelegate extends DigitsActivityDelegateImpl
  implements PhoneNumberTask.Listener
{
  PhoneNumberController controller;
  CountryListSpinner countryCodeSpinner;
  EditText phoneEditText;
  StateButton sendButton;
  TextView termsTextView;

  private void executePhoneNumberTask(PhoneNumberUtils paramPhoneNumberUtils)
  {
    new PhoneNumberTask(paramPhoneNumberUtils, this).executeOnExecutor(Digits.getInstance().getExecutorService(), new Void[0]);
  }

  public int getLayoutId()
  {
    return R.layout.dgts__activity_phone_number;
  }

  public void init(Activity paramActivity, Bundle paramBundle)
  {
    this.countryCodeSpinner = ((CountryListSpinner)paramActivity.findViewById(R.id.dgts__countryCode));
    this.sendButton = ((StateButton)paramActivity.findViewById(R.id.dgts__sendCodeButton));
    this.phoneEditText = ((EditText)paramActivity.findViewById(R.id.dgts__phoneNumberEditText));
    this.termsTextView = ((TextView)paramActivity.findViewById(R.id.dgts__termsText));
    this.controller = initController(paramBundle);
    setUpEditText(paramActivity, this.controller, this.phoneEditText);
    setUpSendButton(paramActivity, this.controller, this.sendButton);
    setUpTermsText(paramActivity, this.controller, this.termsTextView);
    setUpCountrySpinner(this.countryCodeSpinner);
    executePhoneNumberTask(new PhoneNumberUtils(SimManager.createSimManager(paramActivity)));
    CommonUtils.openKeyboard(paramActivity, this.phoneEditText);
  }

  PhoneNumberController initController(Bundle paramBundle)
  {
    return new PhoneNumberController((ResultReceiver)paramBundle.getParcelable("receiver"), this.sendButton, this.phoneEditText, this.countryCodeSpinner);
  }

  public boolean isValid(Bundle paramBundle)
  {
    return BundleManager.assertContains(paramBundle, new String[] { "receiver" });
  }

  public void onLoadComplete(PhoneNumber paramPhoneNumber)
  {
    this.controller.setPhoneNumber(paramPhoneNumber);
  }

  public void onResume()
  {
    this.controller.onResume();
  }

  protected void setUpCountrySpinner(CountryListSpinner paramCountryListSpinner)
  {
    paramCountryListSpinner.setOnClickListener(new PhoneNumberActivityDelegate.1(this));
  }

  public void setUpTermsText(Activity paramActivity, DigitsController paramDigitsController, TextView paramTextView)
  {
    paramTextView.setText(getFormattedTerms(paramActivity, R.string.dgts__terms_text));
    super.setUpTermsText(paramActivity, paramDigitsController, paramTextView);
  }
}