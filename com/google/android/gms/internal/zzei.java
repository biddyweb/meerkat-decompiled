package com.google.android.gms.internal;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;

@zzgi
public class zzei
{
  public boolean zza(Context paramContext, zzek paramzzek, zzes paramzzes)
  {
    if (paramzzek == null)
    {
      zzhx.zzac("No intent data for launcher overlay.");
      return false;
    }
    Intent localIntent = new Intent();
    if (TextUtils.isEmpty(paramzzek.zztR))
    {
      zzhx.zzac("Open GMSG did not contain a URL.");
      return false;
    }
    if (!TextUtils.isEmpty(paramzzek.mimeType))
      localIntent.setDataAndType(Uri.parse(paramzzek.zztR), paramzzek.mimeType);
    String[] arrayOfString;
    while (true)
    {
      localIntent.setAction("android.intent.action.VIEW");
      if (!TextUtils.isEmpty(paramzzek.packageName))
        localIntent.setPackage(paramzzek.packageName);
      if (TextUtils.isEmpty(paramzzek.zztS))
        break label178;
      arrayOfString = paramzzek.zztS.split("/", 2);
      if (arrayOfString.length >= 2)
        break;
      zzhx.zzac("Could not parse component name from open GMSG: " + paramzzek.zztS);
      return false;
      localIntent.setData(Uri.parse(paramzzek.zztR));
    }
    localIntent.setClassName(arrayOfString[0], arrayOfString[1]);
    label178: String str = paramzzek.zztT;
    if (!TextUtils.isEmpty(str));
    try
    {
      int j = Integer.parseInt(str);
      i = j;
      localIntent.addFlags(i);
    }
    catch (NumberFormatException localNumberFormatException)
    {
      try
      {
        zzhx.zzab("Launching an intent: " + localIntent.toURI());
        paramContext.startActivity(localIntent);
        if (paramzzes != null)
          paramzzes.zzae();
        return true;
        localNumberFormatException = localNumberFormatException;
        zzhx.zzac("Could not parse intent flags.");
        int i = 0;
      }
      catch (ActivityNotFoundException localActivityNotFoundException)
      {
        zzhx.zzac(localActivityNotFoundException.getMessage());
      }
    }
    return false;
  }
}