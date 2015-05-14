package com.digits.sdk.android;

import android.app.Activity;

class ActivityClassManagerImp
  implements ActivityClassManager
{
  public Class<? extends Activity> getConfirmationActivity()
  {
    return ConfirmationCodeActivity.class;
  }

  public Class<? extends Activity> getContactsActivity()
  {
    return ContactsActivity.class;
  }

  public Class<? extends Activity> getFailureActivity()
  {
    return FailureActivity.class;
  }

  public Class<? extends Activity> getLoginCodeActivity()
  {
    return LoginCodeActivity.class;
  }

  public Class<? extends Activity> getPhoneNumberActivity()
  {
    return PhoneNumberActivity.class;
  }

  public Class<? extends Activity> getPinCodeActivity()
  {
    return PinCodeActivity.class;
  }
}