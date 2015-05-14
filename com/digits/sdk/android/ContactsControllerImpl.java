package com.digits.sdk.android;

import android.content.Context;
import android.content.Intent;

class ContactsControllerImpl
  implements ContactsController
{
  public void startUploadService(Context paramContext)
  {
    paramContext.startService(new Intent(paramContext, ContactsUploadService.class));
  }
}