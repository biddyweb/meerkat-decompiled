package com.digits.sdk.android;

import android.app.Activity;
import android.view.View;
import android.view.View.OnClickListener;

class DigitsActivityDelegateImpl$3
  implements View.OnClickListener
{
  DigitsActivityDelegateImpl$3(DigitsActivityDelegateImpl paramDigitsActivityDelegateImpl, DigitsController paramDigitsController, Activity paramActivity)
  {
  }

  public void onClick(View paramView)
  {
    this.val$controller.clearError();
    this.val$controller.showTOS(this.val$activity);
  }
}