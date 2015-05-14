package com.google.android.gms.internal;

import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;

class zzea$1
  implements DialogInterface.OnClickListener
{
  zzea$1(zzea paramzzea)
  {
  }

  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    Intent localIntent = this.zztf.createIntent();
    zzea.zza(this.zztf).startActivity(localIntent);
  }
}