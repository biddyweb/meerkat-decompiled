package com.google.ads.mediation;

import android.location.Location;
import com.google.ads.AdRequest.Gender;
import java.util.Calendar;
import java.util.Date;
import java.util.Set;

@Deprecated
public class MediationAdRequest
{
  private final Date zzd;
  private final AdRequest.Gender zze;
  private final Set<String> zzf;
  private final boolean zzg;
  private final Location zzh;

  public MediationAdRequest(Date paramDate, AdRequest.Gender paramGender, Set<String> paramSet, boolean paramBoolean, Location paramLocation)
  {
    this.zzd = paramDate;
    this.zze = paramGender;
    this.zzf = paramSet;
    this.zzg = paramBoolean;
    this.zzh = paramLocation;
  }

  public Integer getAgeInYears()
  {
    if (this.zzd != null)
    {
      Calendar localCalendar1 = Calendar.getInstance();
      Calendar localCalendar2 = Calendar.getInstance();
      localCalendar1.setTime(this.zzd);
      Integer localInteger = Integer.valueOf(localCalendar2.get(1) - localCalendar1.get(1));
      if ((localCalendar2.get(2) < localCalendar1.get(2)) || ((localCalendar2.get(2) == localCalendar1.get(2)) && (localCalendar2.get(5) < localCalendar1.get(5))))
        localInteger = Integer.valueOf(-1 + localInteger.intValue());
      return localInteger;
    }
    return null;
  }

  public Date getBirthday()
  {
    return this.zzd;
  }

  public AdRequest.Gender getGender()
  {
    return this.zze;
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
}