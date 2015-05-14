package com.digits.sdk.android;

import android.app.Activity;

class AppCompatClassManagerImp
  implements ActivityClassManager
{
  public Class<? extends Activity> getConfirmationActivity()
  {
    return ConfirmationCodeActionBarActivity.class;
  }

  public Class<? extends Activity> getContactsActivity()
  {
    return ContactsActionBarActivity.class;
  }

  public Class<? extends Activity> getFailureActivity()
  {
    return FailureActionBarActivity.class;
  }

  public Class<? extends Activity> getLoginCodeActivity()
  {
    return LoginCodeActionBarActivity.class;
  }

  public Class<? extends Activity> getPhoneNumberActivity()
  {
    return PhoneNumberActionBarActivity.class;
  }

  public Class<? extends Activity> getPinCodeActivity()
  {
    return PinCodeActionBarActivity.class;
  }
}