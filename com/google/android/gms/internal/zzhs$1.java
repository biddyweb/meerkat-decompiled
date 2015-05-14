package com.google.android.gms.internal;

import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;

class zzhs$1
  implements DialogInterface.OnClickListener
{
  zzhs$1(zzhs paramzzhs, String paramString)
  {
  }

  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    zzhs.zza(this.zzzA).startActivity(Intent.createChooser(new Intent("android.intent.action.SEND").setType("text/plain").putExtra("android.intent.extra.TEXT", this.zzzz), "Share via"));
  }
}