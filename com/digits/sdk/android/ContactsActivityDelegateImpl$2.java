package com.digits.sdk.android;

import android.app.Activity;
import android.view.View;
import android.view.View.OnClickListener;

class ContactsActivityDelegateImpl$2
  implements View.OnClickListener
{
  ContactsActivityDelegateImpl$2(ContactsActivityDelegateImpl paramContactsActivityDelegateImpl)
  {
  }

  public void onClick(View paramView)
  {
    this.this$0.controller.startUploadService(this.this$0.activity);
    this.this$0.activity.finish();
  }
}