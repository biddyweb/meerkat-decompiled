package com.digits.sdk.android;

import android.content.Context;
import android.telephony.PhoneNumberUtils;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import io.fabric.sdk.android.services.common.CommonUtils;
import java.util.Locale;

class SimManager
{
  private final boolean canReadPhoneState;
  private final TelephonyManager telephonyManager;

  protected SimManager(TelephonyManager paramTelephonyManager, boolean paramBoolean)
  {
    this.telephonyManager = paramTelephonyManager;
    this.canReadPhoneState = paramBoolean;
  }

  public static SimManager createSimManager(Context paramContext)
  {
    return new SimManager((TelephonyManager)paramContext.getSystemService("phone"), CommonUtils.checkPermission(paramContext, "android.permission.READ_PHONE_STATE"));
  }

  private boolean isCdma()
  {
    return this.telephonyManager.getPhoneType() == 2;
  }

  private boolean isIso2(String paramString)
  {
    return (paramString != null) && (paramString.length() == 2);
  }

  private String normalizeNumber(String paramString)
  {
    if (TextUtils.isEmpty(paramString))
      return "";
    StringBuilder localStringBuilder = new StringBuilder();
    int i = paramString.length();
    int j = 0;
    if (j < i)
    {
      char c = paramString.charAt(j);
      int k = Character.digit(c, 10);
      if (k != -1)
        localStringBuilder.append(k);
      label90: 
      do
        while (true)
        {
          j++;
          break;
          if ((j != 0) || (c != '+'))
            break label90;
          localStringBuilder.append(c);
        }
      while (((c < 'a') || (c > 'z')) && ((c < 'A') || (c > 'Z')));
      return normalizeNumber(PhoneNumberUtils.convertKeypadLettersToDigits(paramString));
    }
    return localStringBuilder.toString();
  }

  protected String getCountryIso()
  {
    if (this.telephonyManager != null)
    {
      String str1 = this.telephonyManager.getSimCountryIso();
      if (isIso2(str1))
        return str1.toUpperCase(Locale.getDefault());
      if (!isCdma())
      {
        String str2 = this.telephonyManager.getNetworkCountryIso();
        if (isIso2(str2))
          return str2.toUpperCase(Locale.getDefault());
      }
    }
    return "";
  }

  protected String getRawPhoneNumber()
  {
    if ((this.telephonyManager == null) || (!this.canReadPhoneState))
      return "";
    return normalizeNumber(this.telephonyManager.getLine1Number());
  }
}