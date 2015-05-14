package com.google.android.gms.games.appcontent;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public final class AppContentAnnotationEntity
  implements SafeParcelable, AppContentAnnotation
{
  public static final AppContentAnnotationEntityCreator CREATOR = new AppContentAnnotationEntityCreator();
  private final String zzFA;
  private final int zzFG;
  private final String zzSy;
  private final String zzZO;
  private final Uri zzado;
  private final String zzadp;
  private final String zzadq;
  private final int zzadr;
  private final int zzads;
  private final Bundle zzadt;

  AppContentAnnotationEntity(int paramInt1, String paramString1, Uri paramUri, String paramString2, String paramString3, String paramString4, String paramString5, int paramInt2, int paramInt3, Bundle paramBundle)
  {
    this.zzFG = paramInt1;
    this.zzZO = paramString1;
    this.zzFA = paramString3;
    this.zzadq = paramString5;
    this.zzadr = paramInt2;
    this.zzado = paramUri;
    this.zzads = paramInt3;
    this.zzadp = paramString4;
    this.zzadt = paramBundle;
    this.zzSy = paramString2;
  }

  public AppContentAnnotationEntity(AppContentAnnotation paramAppContentAnnotation)
  {
    this.zzFG = 4;
    this.zzZO = paramAppContentAnnotation.getDescription();
    this.zzFA = paramAppContentAnnotation.getId();
    this.zzadq = paramAppContentAnnotation.zzmM();
    this.zzadr = paramAppContentAnnotation.zzmN();
    this.zzado = paramAppContentAnnotation.zzmO();
    this.zzads = paramAppContentAnnotation.zzmQ();
    this.zzadp = paramAppContentAnnotation.zzmR();
    this.zzadt = paramAppContentAnnotation.zzmP();
    this.zzSy = paramAppContentAnnotation.getTitle();
  }

  static int zza(AppContentAnnotation paramAppContentAnnotation)
  {
    Object[] arrayOfObject = new Object[9];
    arrayOfObject[0] = paramAppContentAnnotation.getDescription();
    arrayOfObject[1] = paramAppContentAnnotation.getId();
    arrayOfObject[2] = paramAppContentAnnotation.zzmM();
    arrayOfObject[3] = Integer.valueOf(paramAppContentAnnotation.zzmN());
    arrayOfObject[4] = paramAppContentAnnotation.zzmO();
    arrayOfObject[5] = Integer.valueOf(paramAppContentAnnotation.zzmQ());
    arrayOfObject[6] = paramAppContentAnnotation.zzmR();
    arrayOfObject[7] = paramAppContentAnnotation.zzmP();
    arrayOfObject[8] = paramAppContentAnnotation.getTitle();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(AppContentAnnotation paramAppContentAnnotation, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof AppContentAnnotation))
      bool = false;
    AppContentAnnotation localAppContentAnnotation;
    do
    {
      do
        return bool;
      while (paramAppContentAnnotation == paramObject);
      localAppContentAnnotation = (AppContentAnnotation)paramObject;
    }
    while ((zzw.equal(localAppContentAnnotation.getDescription(), paramAppContentAnnotation.getDescription())) && (zzw.equal(localAppContentAnnotation.getId(), paramAppContentAnnotation.getId())) && (zzw.equal(localAppContentAnnotation.zzmM(), paramAppContentAnnotation.zzmM())) && (zzw.equal(Integer.valueOf(localAppContentAnnotation.zzmN()), Integer.valueOf(paramAppContentAnnotation.zzmN()))) && (zzw.equal(localAppContentAnnotation.zzmO(), paramAppContentAnnotation.zzmO())) && (zzw.equal(Integer.valueOf(localAppContentAnnotation.zzmQ()), Integer.valueOf(paramAppContentAnnotation.zzmQ()))) && (zzw.equal(localAppContentAnnotation.zzmR(), paramAppContentAnnotation.zzmR())) && (zzw.equal(localAppContentAnnotation.zzmP(), paramAppContentAnnotation.zzmP())) && (zzw.equal(localAppContentAnnotation.getTitle(), paramAppContentAnnotation.getTitle())));
    return false;
  }

  static String zzb(AppContentAnnotation paramAppContentAnnotation)
  {
    return zzw.zzk(paramAppContentAnnotation).zza("Description", paramAppContentAnnotation.getDescription()).zza("Id", paramAppContentAnnotation.getId()).zza("ImageDefaultId", paramAppContentAnnotation.zzmM()).zza("ImageHeight", Integer.valueOf(paramAppContentAnnotation.zzmN())).zza("ImageUri", paramAppContentAnnotation.zzmO()).zza("ImageWidth", Integer.valueOf(paramAppContentAnnotation.zzmQ())).zza("LayoutSlot", paramAppContentAnnotation.zzmR()).zza("Modifiers", paramAppContentAnnotation.zzmP()).zza("Title", paramAppContentAnnotation.getTitle()).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public String getDescription()
  {
    return this.zzZO;
  }

  public String getId()
  {
    return this.zzFA;
  }

  public String getTitle()
  {
    return this.zzSy;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    return zza(this);
  }

  public boolean isDataValid()
  {
    return true;
  }

  public String toString()
  {
    return zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    AppContentAnnotationEntityCreator.zza(this, paramParcel, paramInt);
  }

  public String zzmM()
  {
    return this.zzadq;
  }

  public int zzmN()
  {
    return this.zzadr;
  }

  public Uri zzmO()
  {
    return this.zzado;
  }

  public Bundle zzmP()
  {
    return this.zzadt;
  }

  public int zzmQ()
  {
    return this.zzads;
  }

  public String zzmR()
  {
    return this.zzadp;
  }

  public AppContentAnnotation zzmS()
  {
    return this;
  }
}