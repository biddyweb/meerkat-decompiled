package com.digits.sdk.android;

import android.app.Activity;
import android.view.View;
import android.view.View.OnClickListener;

class FailureActivityDelegateImpl$2
  implements View.OnClickListener
{
  FailureActivityDelegateImpl$2(FailureActivityDelegateImpl paramFailureActivityDelegateImpl)
  {
  }

  public void onClick(View paramView)
  {
    this.this$0.controller.tryAnotherNumber(this.this$0.activity, FailureActivityDelegateImpl.access$000(this.this$0));
    this.this$0.activity.finish();
  }
}