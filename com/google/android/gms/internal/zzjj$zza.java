package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.appindexing.Action;
import com.google.android.gms.appindexing.AppIndexApi.ActionResult;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;

@Deprecated
final class zzjj$zza
  implements AppIndexApi.ActionResult
{
  private zzjj zzGG;
  private PendingResult<Status> zzGH;
  private Action zzGI;

  zzjj$zza(zzjj paramzzjj, PendingResult<Status> paramPendingResult, Action paramAction)
  {
    this.zzGG = paramzzjj;
    this.zzGH = paramPendingResult;
    this.zzGI = paramAction;
  }

  public PendingResult<Status> end(GoogleApiClient paramGoogleApiClient)
  {
    String str = paramGoogleApiClient.getContext().getPackageName();
    long l = System.currentTimeMillis();
    zzjb localzzjb = zzji.zza(this.zzGI, l, str, 3);
    return this.zzGG.zza(paramGoogleApiClient, new zzjb[] { localzzjb });
  }

  public PendingResult<Status> getPendingResult()
  {
    return this.zzGH;
  }
}