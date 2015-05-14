package com.google.android.gms.internal;

import android.accounts.Account;
import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzk;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.location.places.PlaceFilter;
import com.google.android.gms.location.places.PlaceReport;
import com.google.android.gms.location.places.PlacesOptions;
import com.google.android.gms.location.places.PlacesOptions.Builder;
import com.google.android.gms.location.places.zzi;
import java.util.Locale;

public class zzpx extends zzk<zzpt>
{
  private final zzqh zzaop;
  private final Locale zzaoq = Locale.getDefault();

  public zzpx(Context paramContext, Looper paramLooper, zzf paramzzf, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, String paramString1, String paramString2, PlacesOptions paramPlacesOptions)
  {
    super(paramContext, paramLooper, 67, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
    Account localAccount = paramzzf.getAccount();
    String str = null;
    if (localAccount != null)
      str = paramzzf.getAccount().name;
    this.zzaop = new zzqh(paramString1, this.zzaoq, str, paramPlacesOptions.zzaob, paramString2);
  }

  public void zza(zzi paramzzi, PlaceFilter paramPlaceFilter)
    throws RemoteException
  {
    if (paramPlaceFilter == null)
      paramPlaceFilter = PlaceFilter.zzpJ();
    ((zzpt)zzjb()).zza(paramPlaceFilter, this.zzaop, paramzzi);
  }

  public void zza(zzi paramzzi, PlaceReport paramPlaceReport)
    throws RemoteException
  {
    zzx.zzl(paramPlaceReport);
    ((zzpt)zzjb()).zza(paramPlaceReport, this.zzaop, paramzzi);
  }

  protected zzpt zzbq(IBinder paramIBinder)
  {
    return zzpt.zza.zzbn(paramIBinder);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.location.places.PlaceDetectionApi";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.location.places.internal.IGooglePlaceDetectionService";
  }

  public static class zza
    implements Api.zzb<zzpx, PlacesOptions>
  {
    private final String zzaor;
    private final String zzaos;

    public zza(String paramString1, String paramString2)
    {
      this.zzaor = paramString1;
      this.zzaos = paramString2;
    }

    public int getPriority()
    {
      return 2147483647;
    }

    public zzpx zzb(Context paramContext, Looper paramLooper, zzf paramzzf, PlacesOptions paramPlacesOptions, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      String str1;
      String str2;
      if (this.zzaor != null)
      {
        str1 = this.zzaor;
        if (this.zzaos == null)
          break label73;
        str2 = this.zzaos;
        label26: if (paramPlacesOptions != null)
          break label82;
      }
      label73: label82: for (PlacesOptions localPlacesOptions = new PlacesOptions.Builder().build(); ; localPlacesOptions = paramPlacesOptions)
      {
        return new zzpx(paramContext, paramLooper, paramzzf, paramConnectionCallbacks, paramOnConnectionFailedListener, str1, str2, localPlacesOptions);
        str1 = paramContext.getPackageName();
        break;
        str2 = paramContext.getPackageName();
        break label26;
      }
    }
  }
}