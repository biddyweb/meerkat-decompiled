package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import java.util.ArrayList;
import java.util.List;

public final class AppContentActionEntity
  implements SafeParcelable, AppContentAction
{
  public static final AppContentActionEntityCreator CREATOR = new AppContentActionEntityCreator();
  private final Bundle mExtras;
  private final String zzFA;
  private final int zzFG;
  private final ArrayList<AppContentConditionEntity> zzadk;
  private final String zzadl;
  private final AppContentAnnotationEntity zzadm;
  private final String zzadn;
  private final String zzxV;

  AppContentActionEntity(int paramInt, ArrayList<AppContentConditionEntity> paramArrayList, String paramString1, Bundle paramBundle, String paramString2, String paramString3, AppContentAnnotationEntity paramAppContentAnnotationEntity, String paramString4)
  {
    this.zzFG = paramInt;
    this.zzadm = paramAppContentAnnotationEntity;
    this.zzadk = paramArrayList;
    this.zzadl = paramString1;
    this.mExtras = paramBundle;
    this.zzFA = paramString3;
    this.zzadn = paramString4;
    this.zzxV = paramString2;
  }

  public AppContentActionEntity(AppContentAction paramAppContentAction)
  {
    this.zzFG = 5;
    this.zzadm = ((AppContentAnnotationEntity)paramAppContentAction.zzmH().freeze());
    this.zzadl = paramAppContentAction.zzmJ();
    this.mExtras = paramAppContentAction.getExtras();
    this.zzFA = paramAppContentAction.getId();
    this.zzadn = paramAppContentAction.zzmK();
    this.zzxV = paramAppContentAction.getType();
    List localList = paramAppContentAction.zzmI();
    int i = localList.size();
    this.zzadk = new ArrayList(i);
    for (int j = 0; j < i; j++)
      this.zzadk.add((AppContentConditionEntity)((AppContentCondition)localList.get(j)).freeze());
  }

  static int zza(AppContentAction paramAppContentAction)
  {
    Object[] arrayOfObject = new Object[7];
    arrayOfObject[0] = paramAppContentAction.zzmH();
    arrayOfObject[1] = paramAppContentAction.zzmI();
    arrayOfObject[2] = paramAppContentAction.zzmJ();
    arrayOfObject[3] = paramAppContentAction.getExtras();
    arrayOfObject[4] = paramAppContentAction.getId();
    arrayOfObject[5] = paramAppContentAction.zzmK();
    arrayOfObject[6] = paramAppContentAction.getType();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(AppContentAction paramAppContentAction, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof AppContentAction))
      bool = false;
    AppContentAction localAppContentAction;
    do
    {
      do
        return bool;
      while (paramAppContentAction == paramObject);
      localAppContentAction = (AppContentAction)paramObject;
    }
    while ((zzw.equal(localAppContentAction.zzmH(), paramAppContentAction.zzmH())) && (zzw.equal(localAppContentAction.zzmI(), paramAppContentAction.zzmI())) && (zzw.equal(localAppContentAction.zzmJ(), paramAppContentAction.zzmJ())) && (zzw.equal(localAppContentAction.getExtras(), paramAppContentAction.getExtras())) && (zzw.equal(localAppContentAction.getId(), paramAppContentAction.getId())) && (zzw.equal(localAppContentAction.zzmK(), paramAppContentAction.zzmK())) && (zzw.equal(localAppContentAction.getType(), paramAppContentAction.getType())));
    return false;
  }

  static String zzb(AppContentAction paramAppContentAction)
  {
    return zzw.zzk(paramAppContentAction).zza("Annotation", paramAppContentAction.zzmH()).zza("Conditions", paramAppContentAction.zzmI()).zza("ContentDescription", paramAppContentAction.zzmJ()).zza("Extras", paramAppContentAction.getExtras()).zza("Id", paramAppContentAction.getId()).zza("OverflowText", paramAppContentAction.zzmK()).zza("Type", paramAppContentAction.getType()).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public Bundle getExtras()
  {
    return this.mExtras;
  }

  public String getId()
  {
    return this.zzFA;
  }

  public String getType()
  {
    return this.zzxV;
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
    AppContentActionEntityCreator.zza(this, paramParcel, paramInt);
  }

  public AppContentAnnotation zzmH()
  {
    return this.zzadm;
  }

  public List<AppContentCondition> zzmI()
  {
    return new ArrayList(this.zzadk);
  }

  public String zzmJ()
  {
    return this.zzadl;
  }

  public String zzmK()
  {
    return this.zzadn;
  }

  public AppContentAction zzmL()
  {
    return this;
  }
}