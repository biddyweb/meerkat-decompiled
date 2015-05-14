package com.google.android.gms.internal;

import android.location.Location;
import com.google.android.gms.ads.mediation.MediationAdRequest;
import java.util.Date;
import java.util.Set;

@zzgi
public final class zzdu
  implements MediationAdRequest
{
  private final Date zzd;
  private final Set<String> zzf;
  private final boolean zzg;
  private final Location zzh;
  private final int zzpo;
  private final int zzsQ;

  public zzdu(Date paramDate, int paramInt1, Set<String> paramSet, Location paramLocation, boolean paramBoolean, int paramInt2)
  {
    this.zzd = paramDate;
    this.zzpo = paramInt1;
    this.zzf = paramSet;
    this.zzh = paramLocation;
    this.zzg = paramBoolean;
    this.zzsQ = paramInt2;
  }

  public Date getBirthday()
  {
    return this.zzd;
  }

  public int getGender()
  {
    return this.zzpo;
  }

  public Set<String> getKeywords()
  {
    return this.zzf;
  }

  public Location getLocation()
  {
    return this.zzh;
  }

  public boolean isTesting()
  {
    return this.zzg;
  }

  public int taggedForChildDirectedTreatment()
  {
    return this.zzsQ;
  }
}