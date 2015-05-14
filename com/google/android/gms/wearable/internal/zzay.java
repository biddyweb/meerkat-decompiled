package com.google.android.gms.wearable.internal;

import com.google.android.gms.common.api.Status;
import com.google.android.gms.wearable.WearableStatusCodes;

public final class zzay
{
  public static Status zzep(int paramInt)
  {
    return new Status(paramInt, WearableStatusCodes.getStatusCodeString(paramInt));
  }
}