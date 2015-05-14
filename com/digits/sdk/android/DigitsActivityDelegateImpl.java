package com.digits.sdk.android;

import android.app.Activity;
import android.widget.EditText;
import android.widget.TextView;

abstract class DigitsActivityDelegateImpl
  implements DigitsActivityDelegate
{
  protected String getFormattedTerms(Activity paramActivity, int paramInt)
  {
    return paramActivity.getString(paramInt, new Object[] { "\"" });
  }

  public void onDestroy()
  {
  }

  public void setUpEditText(Activity paramActivity, DigitsController paramDigitsController, EditText paramEditText)
  {
    paramEditText.setOnEditorActionListener(new DigitsActivityDelegateImpl.2(this, paramDigitsController, paramActivity));
    paramEditText.addTextChangedListener(paramDigitsController.getTextWatcher());
  }

  public void setUpSendButton(Activity paramActivity, DigitsController paramDigitsController, StateButton paramStateButton)
  {
    paramStateButton.setOnClickListener(new DigitsActivityDelegateImpl.1(this, paramDigitsController, paramActivity));
  }

  public void setUpTermsText(Activity paramActivity, DigitsController paramDigitsController, TextView paramTextView)
  {
    paramTextView.setOnClickListener(new DigitsActivityDelegateImpl.3(this, paramDigitsController, paramActivity));
  }
}