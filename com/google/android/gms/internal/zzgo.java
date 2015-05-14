package com.google.android.gms.internal;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.os.Messenger;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.List;

@zzgi
public final class zzgo
  implements SafeParcelable
{
  public static final zzgp CREATOR = new zzgp();
  public final ApplicationInfo applicationInfo;
  public final int versionCode;
  public final String zzlM;
  public final zzhy zzlP;
  public final zzba zzlV;
  public final List<String> zzmf;
  public final String zzwA;
  public final boolean zzwB;
  public final int zzwC;
  public final String zzwD;
  public final long zzwE;
  public final String zzwF;
  public final Bundle zzwm;
  public final zzax zzwn;
  public final PackageInfo zzwo;
  public final String zzwp;
  public final String zzwq;
  public final String zzwr;
  public final Bundle zzws;
  public final int zzwt;
  public final Bundle zzwu;
  public final boolean zzwv;
  public final Messenger zzww;
  public final int zzwx;
  public final int zzwy;
  public final float zzwz;

  zzgo(int paramInt1, Bundle paramBundle1, zzax paramzzax, zzba paramzzba, String paramString1, ApplicationInfo paramApplicationInfo, PackageInfo paramPackageInfo, String paramString2, String paramString3, String paramString4, zzhy paramzzhy, Bundle paramBundle2, int paramInt2, List<String> paramList, Bundle paramBundle3, boolean paramBoolean1, Messenger paramMessenger, int paramInt3, int paramInt4, float paramFloat, String paramString5, boolean paramBoolean2, int paramInt5, String paramString6, long paramLong, String paramString7)
  {
    this.versionCode = paramInt1;
    this.zzwm = paramBundle1;
    this.zzwn = paramzzax;
    this.zzlV = paramzzba;
    this.zzlM = paramString1;
    this.applicationInfo = paramApplicationInfo;
    this.zzwo = paramPackageInfo;
    this.zzwp = paramString2;
    this.zzwq = paramString3;
    this.zzwr = paramString4;
    this.zzlP = paramzzhy;
    this.zzws = paramBundle2;
    this.zzwt = paramInt2;
    this.zzmf = paramList;
    this.zzwu = paramBundle3;
    this.zzwv = paramBoolean1;
    this.zzww = paramMessenger;
    this.zzwx = paramInt3;
    this.zzwy = paramInt4;
    this.zzwz = paramFloat;
    this.zzwA = paramString5;
    this.zzwB = paramBoolean2;
    this.zzwC = paramInt5;
    this.zzwD = paramString6;
    this.zzwE = paramLong;
    this.zzwF = paramString7;
  }

  public zzgo(Bundle paramBundle1, zzax paramzzax, zzba paramzzba, String paramString1, ApplicationInfo paramApplicationInfo, PackageInfo paramPackageInfo, String paramString2, String paramString3, String paramString4, zzhy paramzzhy, Bundle paramBundle2, int paramInt1, List<String> paramList, Bundle paramBundle3, boolean paramBoolean1, Messenger paramMessenger, int paramInt2, int paramInt3, float paramFloat, String paramString5, boolean paramBoolean2, int paramInt4, String paramString6, long paramLong, String paramString7)
  {
    this(7, paramBundle1, paramzzax, paramzzba, paramString1, paramApplicationInfo, paramPackageInfo, paramString2, paramString3, paramString4, paramzzhy, paramBundle2, paramInt1, paramList, paramBundle3, paramBoolean1, paramMessenger, paramInt2, paramInt3, paramFloat, paramString5, paramBoolean2, paramInt4, paramString6, paramLong, paramString7);
  }

  public zzgo(zza paramzza, String paramString1, String paramString2)
  {
    this(paramzza.zzwm, paramzza.zzwn, paramzza.zzlV, paramzza.zzlM, paramzza.applicationInfo, paramzza.zzwo, paramString1, paramzza.zzwq, paramzza.zzwr, paramzza.zzlP, paramzza.zzws, paramzza.zzwt, paramzza.zzmf, paramzza.zzwu, paramzza.zzwv, paramzza.zzww, paramzza.zzwx, paramzza.zzwy, paramzza.zzwz, paramzza.zzwA, paramzza.zzwB, paramzza.zzwC, paramString2, paramzza.zzwE, paramzza.zzwF);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzgp.zza(this, paramParcel, paramInt);
  }

  @zzgi
  public static final class zza
  {
    public final ApplicationInfo applicationInfo;
    public final String zzlM;
    public final zzhy zzlP;
    public final zzba zzlV;
    public final List<String> zzmf;
    public final String zzwA;
    public final boolean zzwB;
    public final int zzwC;
    public final long zzwE;
    public final String zzwF;
    public final Bundle zzwm;
    public final zzax zzwn;
    public final PackageInfo zzwo;
    public final String zzwq;
    public final String zzwr;
    public final Bundle zzws;
    public final int zzwt;
    public final Bundle zzwu;
    public final boolean zzwv;
    public final Messenger zzww;
    public final int zzwx;
    public final int zzwy;
    public final float zzwz;

    public zza(Bundle paramBundle1, zzax paramzzax, zzba paramzzba, String paramString1, ApplicationInfo paramApplicationInfo, PackageInfo paramPackageInfo, String paramString2, String paramString3, zzhy paramzzhy, Bundle paramBundle2, List<String> paramList, Bundle paramBundle3, boolean paramBoolean1, Messenger paramMessenger, int paramInt1, int paramInt2, float paramFloat, String paramString4, boolean paramBoolean2, int paramInt3, long paramLong, String paramString5)
    {
      this.zzwm = paramBundle1;
      this.zzwn = paramzzax;
      this.zzlV = paramzzba;
      this.zzlM = paramString1;
      this.applicationInfo = paramApplicationInfo;
      this.zzwo = paramPackageInfo;
      this.zzwq = paramString2;
      this.zzwr = paramString3;
      this.zzlP = paramzzhy;
      this.zzws = paramBundle2;
      this.zzwv = paramBoolean1;
      this.zzww = paramMessenger;
      this.zzwx = paramInt1;
      this.zzwy = paramInt2;
      this.zzwz = paramFloat;
      if ((paramList != null) && (paramList.size() > 0))
        this.zzwt = 2;
      for (this.zzmf = paramList; ; this.zzmf = null)
      {
        this.zzwu = paramBundle3;
        this.zzwA = paramString4;
        this.zzwB = paramBoolean2;
        this.zzwC = paramInt3;
        this.zzwE = paramLong;
        this.zzwF = paramString5;
        return;
        this.zzwt = 0;
      }
    }
  }
}