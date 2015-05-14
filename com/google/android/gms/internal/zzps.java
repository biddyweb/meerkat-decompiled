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
import com.google.android.gms.location.places.AddPlaceRequest;
import com.google.android.gms.location.places.AutocompleteFilter;
import com.google.android.gms.location.places.PlacesOptions;
import com.google.android.gms.location.places.PlacesOptions.Builder;
import com.google.android.gms.location.places.zzi;
import com.google.android.gms.maps.model.LatLngBounds;
import java.util.List;
import java.util.Locale;

public class zzps extends zzk<zzpu>
{
  private final zzqh zzaop;
  private final Locale zzaoq = Locale.getDefault();

  public zzps(Context paramContext, Looper paramLooper, zzf paramzzf, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, String paramString1, String paramString2, PlacesOptions paramPlacesOptions)
  {
    super(paramContext, paramLooper, 65, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
    Account localAccount = paramzzf.getAccount();
    String str = null;
    if (localAccount != null)
      str = paramzzf.getAccount().name;
    this.zzaop = new zzqh(paramString1, this.zzaoq, str, paramPlacesOptions.zzaob, paramString2);
  }

  public void zza(zzi paramzzi, AddPlaceRequest paramAddPlaceRequest)
    throws RemoteException
  {
    zzx.zzb(paramAddPlaceRequest, "userAddedPlace == null");
    ((zzpu)zzjb()).zza(paramAddPlaceRequest, this.zzaop, paramzzi);
  }

  public void zza(zzi paramzzi, String paramString, LatLngBounds paramLatLngBounds, AutocompleteFilter paramAutocompleteFilter)
    throws RemoteException
  {
    zzx.zzb(paramString, "query == null");
    zzx.zzb(paramLatLngBounds, "bounds == null");
    zzx.zzb(paramzzi, "callback == null");
    if (paramAutocompleteFilter == null);
    for (AutocompleteFilter localAutocompleteFilter = AutocompleteFilter.create(null); ; localAutocompleteFilter = paramAutocompleteFilter)
    {
      ((zzpu)zzjb()).zza(paramString, paramLatLngBounds, localAutocompleteFilter, this.zzaop, paramzzi);
      return;
    }
  }

  public void zza(zzi paramzzi, List<String> paramList)
    throws RemoteException
  {
    ((zzpu)zzjb()).zzb(paramList, this.zzaop, paramzzi);
  }

  protected zzpu zzbm(IBinder paramIBinder)
  {
    return zzpu.zza.zzbo(paramIBinder);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.location.places.GeoDataApi";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.location.places.internal.IGooglePlacesService";
  }

  public static class zza
    implements Api.zzb<zzps, PlacesOptions>
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

    public zzps zza(Context paramContext, Looper paramLooper, zzf paramzzf, PlacesOptions paramPlacesOptions, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
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
        return new zzps(paramContext, paramLooper, paramzzf, paramConnectionCallbacks, paramOnConnectionFailedListener, str1, str2, localPlacesOptions);
        str1 = paramContext.getPackageName();
        break;
        str2 = paramContext.getPackageName();
        break label26;
      }
    }
  }
}