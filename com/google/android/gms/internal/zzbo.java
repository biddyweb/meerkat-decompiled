package com.google.android.gms.internal;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.mediation.admob.AdMobExtras;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;
import com.google.android.gms.ads.search.SearchAdRequest;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@zzgi
public final class zzbo
{
  public static final String DEVICE_ID_EMULATOR = zzbe.zzbD().zzX("emulator");
  private final Date zzd;
  private final Set<String> zzf;
  private final Location zzh;
  private final String zzpn;
  private final int zzpo;
  private final boolean zzpp;
  private final Bundle zzpq;
  private final Map<Class<? extends NetworkExtras>, NetworkExtras> zzpr;
  private final String zzps;
  private final String zzpt;
  private final SearchAdRequest zzpu;
  private final int zzpv;
  private final Set<String> zzpw;
  private final Bundle zzpx;
  private final Set<String> zzpy;

  public zzbo(zza paramzza)
  {
    this(paramzza, null);
  }

  public zzbo(zza paramzza, SearchAdRequest paramSearchAdRequest)
  {
    this.zzd = zza.zza(paramzza);
    this.zzpn = zza.zzb(paramzza);
    this.zzpo = zza.zzc(paramzza);
    this.zzf = Collections.unmodifiableSet(zza.zzd(paramzza));
    this.zzh = zza.zze(paramzza);
    this.zzpp = zza.zzf(paramzza);
    this.zzpq = zza.zzg(paramzza);
    this.zzpr = Collections.unmodifiableMap(zza.zzh(paramzza));
    this.zzps = zza.zzi(paramzza);
    this.zzpt = zza.zzj(paramzza);
    this.zzpu = paramSearchAdRequest;
    this.zzpv = zza.zzk(paramzza);
    this.zzpw = Collections.unmodifiableSet(zza.zzl(paramzza));
    this.zzpx = zza.zzm(paramzza);
    this.zzpy = Collections.unmodifiableSet(zza.zzn(paramzza));
  }

  public static void updateCorrelator()
  {
    zzbe.zzbF().zzbG();
  }

  public Date getBirthday()
  {
    return this.zzd;
  }

  public String getContentUrl()
  {
    return this.zzpn;
  }

  public Bundle getCustomEventExtrasBundle(Class<? extends CustomEvent> paramClass)
  {
    Bundle localBundle = this.zzpq.getBundle("com.google.android.gms.ads.mediation.customevent.CustomEventAdapter");
    if (localBundle != null)
      return localBundle.getBundle(paramClass.getClass().getName());
    return null;
  }

  public Bundle getCustomTargeting()
  {
    return this.zzpx;
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

  public boolean getManualImpressionsEnabled()
  {
    return this.zzpp;
  }

  @Deprecated
  public <T extends NetworkExtras> T getNetworkExtras(Class<T> paramClass)
  {
    return (NetworkExtras)this.zzpr.get(paramClass);
  }

  public Bundle getNetworkExtrasBundle(Class<? extends MediationAdapter> paramClass)
  {
    return this.zzpq.getBundle(paramClass.getName());
  }

  public String getPublisherProvidedId()
  {
    return this.zzps;
  }

  public boolean isTestDevice(Context paramContext)
  {
    return this.zzpw.contains(zzbe.zzbD().zzz(paramContext));
  }

  public String zzbH()
  {
    return this.zzpt;
  }

  public SearchAdRequest zzbI()
  {
    return this.zzpu;
  }

  public Map<Class<? extends NetworkExtras>, NetworkExtras> zzbJ()
  {
    return this.zzpr;
  }

  public Bundle zzbK()
  {
    return this.zzpq;
  }

  public int zzbL()
  {
    return this.zzpv;
  }

  public Set<String> zzbM()
  {
    return this.zzpy;
  }

  public static final class zza
  {
    private Date zzd;
    private Location zzh;
    private final HashMap<Class<? extends NetworkExtras>, NetworkExtras> zzpA = new HashMap();
    private final HashSet<String> zzpB = new HashSet();
    private final HashSet<String> zzpC = new HashSet();
    private String zzpn;
    private int zzpo = -1;
    private boolean zzpp = false;
    private final Bundle zzpq = new Bundle();
    private String zzps;
    private String zzpt;
    private int zzpv = -1;
    private final Bundle zzpx = new Bundle();
    private final HashSet<String> zzpz = new HashSet();

    public void zza(Location paramLocation)
    {
      this.zzh = paramLocation;
    }

    @Deprecated
    public void zza(NetworkExtras paramNetworkExtras)
    {
      if ((paramNetworkExtras instanceof AdMobExtras))
      {
        zza(AdMobAdapter.class, ((AdMobExtras)paramNetworkExtras).getExtras());
        return;
      }
      this.zzpA.put(paramNetworkExtras.getClass(), paramNetworkExtras);
    }

    public void zza(Class<? extends MediationAdapter> paramClass, Bundle paramBundle)
    {
      this.zzpq.putBundle(paramClass.getName(), paramBundle);
    }

    public void zza(Date paramDate)
    {
      this.zzd = paramDate;
    }

    public void zzb(Class<? extends CustomEvent> paramClass, Bundle paramBundle)
    {
      if (this.zzpq.getBundle("com.google.android.gms.ads.mediation.customevent.CustomEventAdapter") == null)
        this.zzpq.putBundle("com.google.android.gms.ads.mediation.customevent.CustomEventAdapter", new Bundle());
      this.zzpq.getBundle("com.google.android.gms.ads.mediation.customevent.CustomEventAdapter").putBundle(paramClass.getName(), paramBundle);
    }

    public void zzc(String paramString1, String paramString2)
    {
      this.zzpx.putString(paramString1, paramString2);
    }

    public void zzh(int paramInt)
    {
      this.zzpo = paramInt;
    }

    public void zzj(boolean paramBoolean)
    {
      this.zzpp = paramBoolean;
    }

    public void zzk(boolean paramBoolean)
    {
      if (paramBoolean);
      for (int i = 1; ; i = 0)
      {
        this.zzpv = i;
        return;
      }
    }

    public void zzr(String paramString)
    {
      this.zzpz.add(paramString);
    }

    public void zzs(String paramString)
    {
      this.zzpB.add(paramString);
    }

    public void zzt(String paramString)
    {
      this.zzpB.remove(paramString);
    }

    public void zzu(String paramString)
    {
      this.zzpn = paramString;
    }

    public void zzv(String paramString)
    {
      this.zzps = paramString;
    }

    public void zzw(String paramString)
    {
      this.zzpt = paramString;
    }

    public void zzx(String paramString)
    {
      this.zzpC.add(paramString);
    }
  }
}