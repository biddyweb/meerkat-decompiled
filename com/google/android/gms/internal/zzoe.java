package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.fitness.RecordingApi;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.fitness.data.Subscription;
import com.google.android.gms.fitness.data.Subscription.zza;
import com.google.android.gms.fitness.request.zzat;
import com.google.android.gms.fitness.request.zzax;
import com.google.android.gms.fitness.request.zzw;
import com.google.android.gms.fitness.result.ListSubscriptionsResult;

public class zzoe
  implements RecordingApi
{
  private PendingResult<Status> zza(GoogleApiClient paramGoogleApiClient, final Subscription paramSubscription)
  {
    return paramGoogleApiClient.zza(new zznd.zzc(paramGoogleApiClient)
    {
      protected void zza(zznd paramAnonymouszznd)
        throws RemoteException
      {
        zzoh localzzoh = new zzoh(this);
        String str = paramAnonymouszznd.getContext().getPackageName();
        ((zznn)paramAnonymouszznd.zzjb()).zza(new zzat(paramSubscription, false, localzzoh, str));
      }
    });
  }

  public PendingResult<ListSubscriptionsResult> listSubscriptions(GoogleApiClient paramGoogleApiClient)
  {
    return paramGoogleApiClient.zza(new zznd.zza(paramGoogleApiClient)
    {
      protected void zza(zznd paramAnonymouszznd)
        throws RemoteException
      {
        zzoe.zza localzza = new zzoe.zza(this, null);
        String str = paramAnonymouszznd.getContext().getPackageName();
        ((zznn)paramAnonymouszznd.zzjb()).zza(new zzw(null, localzza, str));
      }

      protected ListSubscriptionsResult zzx(Status paramAnonymousStatus)
      {
        return ListSubscriptionsResult.zzE(paramAnonymousStatus);
      }
    });
  }

  public PendingResult<ListSubscriptionsResult> listSubscriptions(GoogleApiClient paramGoogleApiClient, final DataType paramDataType)
  {
    return paramGoogleApiClient.zza(new zznd.zza(paramGoogleApiClient)
    {
      protected void zza(zznd paramAnonymouszznd)
        throws RemoteException
      {
        zzoe.zza localzza = new zzoe.zza(this, null);
        String str = paramAnonymouszznd.getContext().getPackageName();
        ((zznn)paramAnonymouszznd.zzjb()).zza(new zzw(paramDataType, localzza, str));
      }

      protected ListSubscriptionsResult zzx(Status paramAnonymousStatus)
      {
        return ListSubscriptionsResult.zzE(paramAnonymousStatus);
      }
    });
  }

  public PendingResult<Status> subscribe(GoogleApiClient paramGoogleApiClient, DataSource paramDataSource)
  {
    return zza(paramGoogleApiClient, new Subscription.zza().zzb(paramDataSource).zzlK());
  }

  public PendingResult<Status> subscribe(GoogleApiClient paramGoogleApiClient, DataType paramDataType)
  {
    return zza(paramGoogleApiClient, new Subscription.zza().zzb(paramDataType).zzlK());
  }

  public PendingResult<Status> unsubscribe(GoogleApiClient paramGoogleApiClient, final DataSource paramDataSource)
  {
    return paramGoogleApiClient.zzb(new zznd.zzc(paramGoogleApiClient)
    {
      protected void zza(zznd paramAnonymouszznd)
        throws RemoteException
      {
        zzoh localzzoh = new zzoh(this);
        String str = paramAnonymouszznd.getContext().getPackageName();
        ((zznn)paramAnonymouszznd.zzjb()).zza(new zzax(null, paramDataSource, localzzoh, str));
      }
    });
  }

  public PendingResult<Status> unsubscribe(GoogleApiClient paramGoogleApiClient, final DataType paramDataType)
  {
    return paramGoogleApiClient.zzb(new zznd.zzc(paramGoogleApiClient)
    {
      protected void zza(zznd paramAnonymouszznd)
        throws RemoteException
      {
        zzoh localzzoh = new zzoh(this);
        String str = paramAnonymouszznd.getContext().getPackageName();
        ((zznn)paramAnonymouszznd.zzjb()).zza(new zzax(paramDataType, null, localzzoh, str));
      }
    });
  }

  public PendingResult<Status> unsubscribe(GoogleApiClient paramGoogleApiClient, Subscription paramSubscription)
  {
    if (paramSubscription.getDataType() == null)
      return unsubscribe(paramGoogleApiClient, paramSubscription.getDataSource());
    return unsubscribe(paramGoogleApiClient, paramSubscription.getDataType());
  }

  private static class zza extends zznq.zza
  {
    private final zza.zzb<ListSubscriptionsResult> zzHa;

    private zza(zza.zzb<ListSubscriptionsResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(ListSubscriptionsResult paramListSubscriptionsResult)
    {
      this.zzHa.zzd(paramListSubscriptionsResult);
    }
  }
}