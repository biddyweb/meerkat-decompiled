package com.digits.sdk.android;

import android.view.View;
import android.view.View.OnClickListener;
import io.fabric.sdk.android.services.common.CommonUtils;

class FailureActivityDelegateImpl$1
  implements View.OnClickListener
{
  FailureActivityDelegateImpl$1(FailureActivityDelegateImpl paramFailureActivityDelegateImpl)
  {
  }

  public void onClick(View paramView)
  {
    CommonUtils.finishAffinity(this.this$0.activity, 200);
    this.this$0.controller.sendFailure(FailureActivityDelegateImpl.access$000(this.this$0), FailureActivityDelegateImpl.access$100(this.this$0));
  }
}