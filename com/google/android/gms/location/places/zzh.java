package com.google.android.gms.location.places;

import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import java.util.List;

public class zzh
  implements Result
{
  private final Status zzHb;
  private final List<Place> zzanQ;

  public zzh(Status paramStatus, List<Place> paramList)
  {
    this.zzHb = paramStatus;
    this.zzanQ = paramList;
  }

  public Status getStatus()
  {
    return this.zzHb;
  }
}