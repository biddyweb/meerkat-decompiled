package com.google.android.gms.fitness;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.zzc;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.Session;
import com.google.android.gms.fitness.request.SessionInsertRequest;
import com.google.android.gms.fitness.request.SessionReadRequest;
import com.google.android.gms.fitness.result.SessionReadResult;
import com.google.android.gms.fitness.result.SessionStopResult;

public abstract interface SessionsApi
{
  public abstract PendingResult<Status> insertSession(GoogleApiClient paramGoogleApiClient, SessionInsertRequest paramSessionInsertRequest);

  public abstract PendingResult<SessionReadResult> readSession(GoogleApiClient paramGoogleApiClient, SessionReadRequest paramSessionReadRequest);

  public abstract PendingResult<Status> registerForSessions(GoogleApiClient paramGoogleApiClient, PendingIntent paramPendingIntent);

  public abstract PendingResult<Status> startSession(GoogleApiClient paramGoogleApiClient, Session paramSession);

  public abstract PendingResult<SessionStopResult> stopSession(GoogleApiClient paramGoogleApiClient, String paramString);

  public abstract PendingResult<Status> unregisterForSessions(GoogleApiClient paramGoogleApiClient, PendingIntent paramPendingIntent);

  public static class ViewIntentBuilder
  {
    private final Context mContext;
    private String zzYr;
    private Session zzYs;
    private boolean zzYt = false;

    public ViewIntentBuilder(Context paramContext)
    {
      this.mContext = paramContext;
    }

    private Intent zzi(Intent paramIntent)
    {
      if (this.zzYr == null);
      Intent localIntent;
      ResolveInfo localResolveInfo;
      do
      {
        return paramIntent;
        localIntent = new Intent(paramIntent).setPackage(this.zzYr);
        localResolveInfo = this.mContext.getPackageManager().resolveActivity(localIntent, 0);
      }
      while (localResolveInfo == null);
      String str = localResolveInfo.activityInfo.name;
      localIntent.setComponent(new ComponentName(this.zzYr, str));
      return localIntent;
    }

    public Intent build()
    {
      if (this.zzYs != null);
      for (boolean bool = true; ; bool = false)
      {
        zzx.zza(bool, "Session must be set");
        Intent localIntent = new Intent("vnd.google.fitness.VIEW");
        localIntent.setType(Session.getMimeType(this.zzYs.getActivity()));
        zzc.zza(this.zzYs, localIntent, "vnd.google.fitness.session");
        if (!this.zzYt)
          this.zzYr = this.zzYs.getAppPackageName();
        return zzi(localIntent);
      }
    }

    public ViewIntentBuilder setPreferredApplication(String paramString)
    {
      this.zzYr = paramString;
      this.zzYt = true;
      return this;
    }

    public ViewIntentBuilder setSession(Session paramSession)
    {
      this.zzYs = paramSession;
      return this;
    }
  }
}