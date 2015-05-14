package com.google.android.gms.location.places;

import android.content.Context;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.Api.zza;
import com.google.android.gms.common.api.Api.zzc;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zza;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzmg;
import com.google.android.gms.internal.zzpv.zza;
import com.google.android.gms.internal.zzqr;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class zzi extends zzpv.zza
{
  private static final String TAG = zzi.class.getSimpleName();
  private final Context mContext;
  private final zzd zzanV;
  private final zza zzanW;
  private final zze zzanX;
  private final zzf zzanY;
  private final zzg zzanZ;
  private final zzc zzaoa;

  public zzi(zza paramzza)
  {
    this.zzanV = null;
    this.zzanX = null;
    this.zzanW = paramzza;
    this.zzanY = null;
    this.zzanZ = null;
    this.zzaoa = null;
    this.mContext = null;
  }

  public zzi(zzc paramzzc, Context paramContext)
  {
    this.zzanV = null;
    this.zzanX = null;
    this.zzanW = null;
    this.zzanY = null;
    this.zzanZ = null;
    this.zzaoa = paramzzc;
    this.mContext = paramContext;
  }

  public zzi(zzd paramzzd, Context paramContext)
  {
    this.zzanV = paramzzd;
    this.zzanX = null;
    this.zzanW = null;
    this.zzanY = null;
    this.zzanZ = null;
    this.zzaoa = null;
    this.mContext = paramContext;
  }

  public zzi(zzg paramzzg)
  {
    this.zzanV = null;
    this.zzanX = null;
    this.zzanW = null;
    this.zzanY = null;
    this.zzanZ = paramzzg;
    this.zzaoa = null;
    this.mContext = null;
  }

  public void zzX(DataHolder paramDataHolder)
    throws RemoteException
  {
    boolean bool1 = true;
    int i;
    int j;
    label21: boolean bool2;
    if (this.zzanV != null)
    {
      i = bool1;
      if (this.zzanX == null)
        break label107;
      j = bool1;
      if (i == j)
        break label113;
      bool2 = bool1;
      label30: zzx.zza(bool2, "Only one of placeEstimator or placeReturner can be null");
      if (this.zzanV == null)
        break label119;
    }
    while (true)
      if (paramDataHolder == null)
      {
        if (Log.isLoggable(TAG, 6))
          Log.e(TAG, "onPlaceEstimated received null DataHolder: " + zzmg.zzkm());
        if (bool1)
        {
          this.zzanV.zzk(Status.zzNq);
          return;
          i = 0;
          break;
          label107: j = 0;
          break label21;
          label113: bool2 = false;
          break label30;
          label119: bool1 = false;
          continue;
        }
        this.zzanX.zzk(Status.zzNq);
        return;
      }
    PlaceLikelihoodBuffer localPlaceLikelihoodBuffer = new PlaceLikelihoodBuffer(paramDataHolder, 100, this.mContext);
    if (bool1)
    {
      this.zzanV.setResult(localPlaceLikelihoodBuffer);
      return;
    }
    Status localStatus = localPlaceLikelihoodBuffer.getStatus();
    ArrayList localArrayList = new ArrayList(localPlaceLikelihoodBuffer.getCount());
    Iterator localIterator = localPlaceLikelihoodBuffer.iterator();
    while (localIterator.hasNext())
      localArrayList.add(((PlaceLikelihood)localIterator.next()).getPlace().freeze());
    localPlaceLikelihoodBuffer.release();
    this.zzanX.setResult(new zzh(localStatus, localArrayList));
  }

  public void zzY(DataHolder paramDataHolder)
    throws RemoteException
  {
    if (paramDataHolder == null)
    {
      if (Log.isLoggable(TAG, 6))
        Log.e(TAG, "onAutocompletePrediction received null DataHolder: " + zzmg.zzkm());
      this.zzanW.zzk(Status.zzNq);
      return;
    }
    this.zzanW.setResult(new AutocompletePredictionBuffer(paramDataHolder));
  }

  public void zzZ(DataHolder paramDataHolder)
    throws RemoteException
  {
    if (paramDataHolder == null)
    {
      if (Log.isLoggable(TAG, 6))
        Log.e(TAG, "onPlaceUserDataFetched received null DataHolder: " + zzmg.zzkm());
      this.zzanY.zzk(Status.zzNq);
      return;
    }
    this.zzanY.setResult(new zzqr(paramDataHolder));
  }

  public void zzaa(DataHolder paramDataHolder)
    throws RemoteException
  {
    PlaceBuffer localPlaceBuffer = new PlaceBuffer(paramDataHolder, this.mContext);
    this.zzaoa.setResult(localPlaceBuffer);
  }

  public void zzay(Status paramStatus)
    throws RemoteException
  {
    this.zzanZ.setResult(paramStatus);
  }

  public static abstract class zza<A extends Api.zza> extends zzi.zzb<AutocompletePredictionBuffer, A>
  {
    public zza(Api.zzc<A> paramzzc, GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }

    protected AutocompletePredictionBuffer zzaz(Status paramStatus)
    {
      return new AutocompletePredictionBuffer(DataHolder.zzay(paramStatus.getStatusCode()));
    }
  }

  public static abstract class zzb<R extends Result, A extends Api.zza> extends zza.zza<R, A>
  {
    public zzb(Api.zzc<A> paramzzc, GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }
  }

  public static abstract class zzc<A extends Api.zza> extends zzi.zzb<PlaceBuffer, A>
  {
    public zzc(Api.zzc<A> paramzzc, GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }

    protected PlaceBuffer zzaA(Status paramStatus)
    {
      return new PlaceBuffer(DataHolder.zzay(paramStatus.getStatusCode()), null);
    }
  }

  public static abstract class zzd<A extends Api.zza> extends zzi.zzb<PlaceLikelihoodBuffer, A>
  {
    public zzd(Api.zzc<A> paramzzc, GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }

    protected PlaceLikelihoodBuffer zzaB(Status paramStatus)
    {
      return new PlaceLikelihoodBuffer(DataHolder.zzay(paramStatus.getStatusCode()), 100, null);
    }
  }

  public static abstract class zze<A extends Api.zza> extends zzi.zzb<zzh, A>
  {
    protected zzh zzaC(Status paramStatus)
    {
      return new zzh(paramStatus, Collections.emptyList());
    }
  }

  public static abstract class zzf<A extends Api.zza> extends zzi.zzb<zzqr, A>
  {
    protected zzqr zzaD(Status paramStatus)
    {
      return zzqr.zzaE(paramStatus);
    }
  }

  public static abstract class zzg<A extends Api.zza> extends zzi.zzb<Status, A>
  {
    public zzg(Api.zzc<A> paramzzc, GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }

    protected Status zzb(Status paramStatus)
    {
      return paramStatus;
    }
  }
}