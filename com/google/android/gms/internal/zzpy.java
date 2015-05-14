package com.google.android.gms.internal;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.location.places.Place;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

public final class zzpy
  implements SafeParcelable, Place
{
  public static final zzpz CREATOR = new zzpz();
  private final String mName;
  private final String zzFA;
  final int zzFG;
  private final String zzYy;
  private final LatLng zzant;
  private final List<Integer> zzanu;
  private final String zzanv;
  private final Uri zzanw;
  private final String zzaoA;
  private final boolean zzaoB;
  private final float zzaoC;
  private final int zzaoD;
  private final long zzaoE;
  private final List<Integer> zzaoF;
  private final String zzaoG;
  private final List<String> zzaoH;
  final boolean zzaoI;
  private final Map<Integer, String> zzaoJ;
  private final TimeZone zzaoK;
  private zzqf zzaoL;
  private Locale zzaoq;
  private final Bundle zzaow;

  @Deprecated
  private final zzqd zzaox;
  private final float zzaoy;
  private final LatLngBounds zzaoz;

  zzpy(int paramInt1, String paramString1, List<Integer> paramList1, List<Integer> paramList2, Bundle paramBundle, String paramString2, String paramString3, String paramString4, String paramString5, List<String> paramList, LatLng paramLatLng, float paramFloat1, LatLngBounds paramLatLngBounds, String paramString6, Uri paramUri, boolean paramBoolean1, float paramFloat2, int paramInt2, long paramLong, boolean paramBoolean2, zzqd paramzzqd)
  {
    this.zzFG = paramInt1;
    this.zzFA = paramString1;
    this.zzanu = Collections.unmodifiableList(paramList1);
    this.zzaoF = paramList2;
    if (paramBundle != null)
    {
      this.zzaow = paramBundle;
      this.mName = paramString2;
      this.zzYy = paramString3;
      this.zzanv = paramString4;
      this.zzaoG = paramString5;
      if (paramList == null)
        break label182;
      label68: this.zzaoH = paramList;
      this.zzant = paramLatLng;
      this.zzaoy = paramFloat1;
      this.zzaoz = paramLatLngBounds;
      if (paramString6 == null)
        break label190;
    }
    while (true)
    {
      this.zzaoA = paramString6;
      this.zzanw = paramUri;
      this.zzaoB = paramBoolean1;
      this.zzaoC = paramFloat2;
      this.zzaoD = paramInt2;
      this.zzaoE = paramLong;
      this.zzaoJ = Collections.unmodifiableMap(new HashMap());
      this.zzaoK = null;
      this.zzaoq = null;
      this.zzaoI = paramBoolean2;
      this.zzaox = paramzzqd;
      return;
      paramBundle = new Bundle();
      break;
      label182: paramList = Collections.emptyList();
      break label68;
      label190: paramString6 = "UTC";
    }
  }

  private void zzcn(String paramString)
  {
    if ((this.zzaoI) && (this.zzaoL != null))
      this.zzaoL.zzy(this.zzFA, paramString);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    zzpy localzzpy;
    do
    {
      return true;
      if (!(paramObject instanceof zzpy))
        return false;
      localzzpy = (zzpy)paramObject;
    }
    while ((this.zzFA.equals(localzzpy.zzFA)) && (zzw.equal(this.zzaoq, localzzpy.zzaoq)) && (this.zzaoE == localzzpy.zzaoE));
    return false;
  }

  public String getAddress()
  {
    zzcn("getAddress");
    return this.zzYy;
  }

  public String getId()
  {
    zzcn("getId");
    return this.zzFA;
  }

  public LatLng getLatLng()
  {
    zzcn("getLatLng");
    return this.zzant;
  }

  public Locale getLocale()
  {
    zzcn("getLocale");
    return this.zzaoq;
  }

  public String getName()
  {
    zzcn("getName");
    return this.mName;
  }

  public String getPhoneNumber()
  {
    zzcn("getPhoneNumber");
    return this.zzanv;
  }

  public List<Integer> getPlaceTypes()
  {
    zzcn("getPlaceTypes");
    return this.zzanu;
  }

  public int getPriceLevel()
  {
    zzcn("getPriceLevel");
    return this.zzaoD;
  }

  public float getRating()
  {
    zzcn("getRating");
    return this.zzaoC;
  }

  public LatLngBounds getViewport()
  {
    zzcn("getViewport");
    return this.zzaoz;
  }

  public Uri getWebsiteUri()
  {
    zzcn("getWebsiteUri");
    return this.zzanw;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this.zzFA;
    arrayOfObject[1] = this.zzaoq;
    arrayOfObject[2] = Long.valueOf(this.zzaoE);
    return zzw.hashCode(arrayOfObject);
  }

  public boolean isDataValid()
  {
    return true;
  }

  public void setLocale(Locale paramLocale)
  {
    this.zzaoq = paramLocale;
  }

  public String toString()
  {
    return zzw.zzk(this).zza("id", this.zzFA).zza("placeTypes", this.zzanu).zza("locale", this.zzaoq).zza("name", this.mName).zza("address", this.zzYy).zza("phoneNumber", this.zzanv).zza("latlng", this.zzant).zza("viewport", this.zzaoz).zza("websiteUri", this.zzanw).zza("isPermanentlyClosed", Boolean.valueOf(this.zzaoB)).zza("priceLevel", Integer.valueOf(this.zzaoD)).zza("timestampSecs", Long.valueOf(this.zzaoE)).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzpz.zza(this, paramParcel, paramInt);
  }

  public void zza(zzqf paramzzqf)
  {
    this.zzaoL = paramzzqf;
  }

  public boolean zzpI()
  {
    zzcn("isPermanentlyClosed");
    return this.zzaoB;
  }

  public List<Integer> zzpN()
  {
    zzcn("getTypesDeprecated");
    return this.zzaoF;
  }

  public float zzpO()
  {
    zzcn("getLevelNumber");
    return this.zzaoy;
  }

  public String zzpP()
  {
    zzcn("getRegularOpenHours");
    return this.zzaoG;
  }

  public List<String> zzpQ()
  {
    zzcn("getAttributions");
    return this.zzaoH;
  }

  public long zzpR()
  {
    return this.zzaoE;
  }

  public Bundle zzpS()
  {
    return this.zzaow;
  }

  public String zzpT()
  {
    return this.zzaoA;
  }

  @Deprecated
  public zzqd zzpU()
  {
    zzcn("getLocalization");
    return this.zzaox;
  }

  public Place zzpV()
  {
    return this;
  }

  public static class zza
  {
    private String mName;
    private String zzFA;
    private int zzFG = 0;
    private String zzYy;
    private LatLng zzant;
    private String zzanv;
    private Uri zzanw;
    private String zzaoA;
    private boolean zzaoB;
    private float zzaoC;
    private int zzaoD;
    private long zzaoE;
    private String zzaoG;
    private List<String> zzaoH;
    private boolean zzaoI;
    private Bundle zzaoM;
    private List<Integer> zzaoN;
    private float zzaoy;
    private LatLngBounds zzaoz;

    public zza zzX(boolean paramBoolean)
    {
      this.zzaoB = paramBoolean;
      return this;
    }

    public zza zzY(boolean paramBoolean)
    {
      this.zzaoI = paramBoolean;
      return this;
    }

    public zza zza(LatLng paramLatLng)
    {
      this.zzant = paramLatLng;
      return this;
    }

    public zza zza(LatLngBounds paramLatLngBounds)
    {
      this.zzaoz = paramLatLngBounds;
      return this;
    }

    public zza zzc(float paramFloat)
    {
      this.zzaoy = paramFloat;
      return this;
    }

    public zza zzco(String paramString)
    {
      this.zzFA = paramString;
      return this;
    }

    public zza zzcp(String paramString)
    {
      this.mName = paramString;
      return this;
    }

    public zza zzcq(String paramString)
    {
      this.zzYy = paramString;
      return this;
    }

    public zza zzcr(String paramString)
    {
      this.zzanv = paramString;
      return this;
    }

    public zza zzd(float paramFloat)
    {
      this.zzaoC = paramFloat;
      return this;
    }

    public zza zzfH(int paramInt)
    {
      this.zzaoD = paramInt;
      return this;
    }

    public zza zzk(Uri paramUri)
    {
      this.zzanw = paramUri;
      return this;
    }

    public zza zzo(List<Integer> paramList)
    {
      this.zzaoN = paramList;
      return this;
    }

    public zza zzp(List<String> paramList)
    {
      this.zzaoH = paramList;
      return this;
    }

    public zzpy zzpW()
    {
      return new zzpy(this.zzFG, this.zzFA, this.zzaoN, Collections.emptyList(), this.zzaoM, this.mName, this.zzYy, this.zzanv, this.zzaoG, this.zzaoH, this.zzant, this.zzaoy, this.zzaoz, this.zzaoA, this.zzanw, this.zzaoB, this.zzaoC, this.zzaoD, this.zzaoE, this.zzaoI, zzqd.zza(this.mName, this.zzYy, this.zzanv, this.zzaoG, this.zzaoH));
    }
  }
}