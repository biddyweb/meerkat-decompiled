package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.RemoteException;
import com.google.android.gms.appindexing.Action;
import com.google.android.gms.appindexing.AppIndexApi;
import com.google.android.gms.appindexing.AppIndexApi.ActionResult;
import com.google.android.gms.appindexing.AppIndexApi.AppIndexingLink;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zza;
import com.google.android.gms.common.api.zza.zzb;
import java.util.Iterator;
import java.util.List;

public final class zzjj
  implements AppIndexApi, zzjd
{
  public static Intent zza(String paramString, Uri paramUri)
  {
    zzb(paramString, paramUri);
    List localList = paramUri.getPathSegments();
    String str = (String)localList.get(0);
    Uri.Builder localBuilder = new Uri.Builder();
    localBuilder.scheme(str);
    if (localList.size() > 1)
    {
      localBuilder.authority((String)localList.get(1));
      for (int i = 2; i < localList.size(); i++)
        localBuilder.appendPath((String)localList.get(i));
    }
    localBuilder.encodedQuery(paramUri.getEncodedQuery());
    localBuilder.encodedFragment(paramUri.getEncodedFragment());
    return new Intent("android.intent.action.VIEW", localBuilder.build());
  }

  private PendingResult<Status> zza(GoogleApiClient paramGoogleApiClient, Action paramAction, int paramInt)
  {
    String str = paramGoogleApiClient.getContext().getPackageName();
    return zza(paramGoogleApiClient, new zzjb[] { zzji.zza(paramAction, System.currentTimeMillis(), str, paramInt) });
  }

  private static void zzb(String paramString, Uri paramUri)
  {
    if (!"android-app".equals(paramUri.getScheme()))
      throw new IllegalArgumentException("AppIndex: The URI scheme must be 'android-app' and follow the format (android-app://<package_name>/<scheme>/[host_path]). Provided URI: " + paramUri);
    String str = paramUri.getHost();
    if ((paramString != null) && (!paramString.equals(str)))
      throw new IllegalArgumentException("AppIndex: The URI host must match the package name and follow the format (android-app://<package_name>/<scheme>/[host_path]). Provided URI: " + paramUri);
    List localList = paramUri.getPathSegments();
    if ((localList.isEmpty()) || (((String)localList.get(0)).isEmpty()))
      throw new IllegalArgumentException("AppIndex: The app URI scheme must exist and follow the format android-app://<package_name>/<scheme>/[host_path]). Provided URI: " + paramUri);
  }

  public static void zze(List<AppIndexApi.AppIndexingLink> paramList)
  {
    if (paramList == null);
    while (true)
    {
      return;
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
        zzb(null, ((AppIndexApi.AppIndexingLink)localIterator.next()).appIndexingUrl);
    }
  }

  public AppIndexApi.ActionResult action(GoogleApiClient paramGoogleApiClient, Action paramAction)
  {
    return new zzjj.zza(this, zza(paramGoogleApiClient, paramAction, 0), paramAction);
  }

  public PendingResult<Status> end(GoogleApiClient paramGoogleApiClient, Action paramAction)
  {
    return zza(paramGoogleApiClient, paramAction, 3);
  }

  public PendingResult<Status> start(GoogleApiClient paramGoogleApiClient, Action paramAction)
  {
    return zza(paramGoogleApiClient, paramAction, 0);
  }

  public PendingResult<Status> view(GoogleApiClient paramGoogleApiClient, Activity paramActivity, Intent paramIntent, String paramString, Uri paramUri, List<AppIndexApi.AppIndexingLink> paramList)
  {
    String str = paramGoogleApiClient.getContext().getPackageName();
    zze(paramList);
    zzjb[] arrayOfzzjb = new zzjb[1];
    arrayOfzzjb[0] = new zzjb(str, paramIntent, paramString, paramUri, null, paramList);
    return zza(paramGoogleApiClient, arrayOfzzjb);
  }

  public PendingResult<Status> view(GoogleApiClient paramGoogleApiClient, Activity paramActivity, Uri paramUri1, String paramString, Uri paramUri2, List<AppIndexApi.AppIndexingLink> paramList)
  {
    String str = paramGoogleApiClient.getContext().getPackageName();
    zzb(str, paramUri1);
    return view(paramGoogleApiClient, paramActivity, zza(str, paramUri1), paramString, paramUri2, paramList);
  }

  public PendingResult<Status> viewEnd(GoogleApiClient paramGoogleApiClient, Activity paramActivity, Intent paramIntent)
  {
    return zza(paramGoogleApiClient, new zzjb[] { new zzjb(zzjb.zza(paramGoogleApiClient.getContext().getPackageName(), paramIntent), System.currentTimeMillis(), 3) });
  }

  public PendingResult<Status> viewEnd(GoogleApiClient paramGoogleApiClient, Activity paramActivity, Uri paramUri)
  {
    return viewEnd(paramGoogleApiClient, paramActivity, zza(paramGoogleApiClient.getContext().getPackageName(), paramUri));
  }

  public PendingResult<Status> zza(GoogleApiClient paramGoogleApiClient, final zzjb[] paramArrayOfzzjb)
  {
    return paramGoogleApiClient.zza(new zzc(paramGoogleApiClient)
    {
      protected void zza(zzje paramAnonymouszzje)
        throws RemoteException
      {
        paramAnonymouszzje.zza(new zzjj.zzd(this), this.zzGD, paramArrayOfzzjb);
      }
    });
  }

  private static abstract class zzb<T extends Result> extends zza.zza<T, zzjh>
  {
    public zzb(GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }

    protected abstract void zza(zzje paramzzje)
      throws RemoteException;

    protected final void zza(zzjh paramzzjh)
      throws RemoteException
    {
      zza(paramzzjh.zzgY());
    }
  }

  private static abstract class zzc<T extends Result> extends zzjj.zzb<Status>
  {
    zzc(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    protected Status zzb(Status paramStatus)
    {
      return paramStatus;
    }
  }

  private static final class zzd extends zzjg<Status>
  {
    public zzd(zza.zzb<Status> paramzzb)
    {
      super();
    }

    public void zza(Status paramStatus)
    {
      this.zzGC.zzd(paramStatus);
    }
  }
}