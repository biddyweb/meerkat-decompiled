package com.digits.sdk.android;

import android.app.Activity;
import android.view.KeyEvent;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;

class DigitsActivityDelegateImpl$2
  implements TextView.OnEditorActionListener
{
  DigitsActivityDelegateImpl$2(DigitsActivityDelegateImpl paramDigitsActivityDelegateImpl, DigitsController paramDigitsController, Activity paramActivity)
  {
  }

  public boolean onEditorAction(TextView paramTextView, int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 5)
    {
      this.val$controller.clearError();
      this.val$controller.executeRequest(this.val$activity);
      return true;
    }
    return false;
  }
}