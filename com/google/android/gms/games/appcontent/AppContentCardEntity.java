package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import java.util.ArrayList;
import java.util.List;

public final class AppContentCardEntity
  implements SafeParcelable, AppContentCard
{
  public static final AppContentCardEntityCreator CREATOR = new AppContentCardEntityCreator();
  private final ArrayList<AppContentActionEntity> mActions;
  private final Bundle mExtras;
  private final String zzFA;
  private final int zzFG;
  private final String zzSy;
  private final String zzZO;
  private final ArrayList<AppContentConditionEntity> zzadk;
  private final String zzadl;
  private final ArrayList<AppContentAnnotationEntity> zzadu;
  private final int zzadv;
  private final String zzadw;
  private final int zzadx;
  private final String zzxV;

  AppContentCardEntity(int paramInt1, ArrayList<AppContentActionEntity> paramArrayList, ArrayList<AppContentAnnotationEntity> paramArrayList1, ArrayList<AppContentConditionEntity> paramArrayList2, String paramString1, int paramInt2, String paramString2, Bundle paramBundle, String paramString3, String paramString4, int paramInt3, String paramString5, String paramString6)
  {
    this.zzFG = paramInt1;
    this.mActions = paramArrayList;
    this.zzadu = paramArrayList1;
    this.zzadk = paramArrayList2;
    this.zzadl = paramString1;
    this.zzadv = paramInt2;
    this.zzZO = paramString2;
    this.mExtras = paramBundle;
    this.zzFA = paramString6;
    this.zzadw = paramString3;
    this.zzSy = paramString4;
    this.zzadx = paramInt3;
    this.zzxV = paramString5;
  }

  public AppContentCardEntity(AppContentCard paramAppContentCard)
  {
    this.zzFG = 4;
    this.zzadl = paramAppContentCard.zzmJ();
    this.zzadv = paramAppContentCard.zzmU();
    this.zzZO = paramAppContentCard.getDescription();
    this.mExtras = paramAppContentCard.getExtras();
    this.zzFA = paramAppContentCard.getId();
    this.zzSy = paramAppContentCard.getTitle();
    this.zzadw = paramAppContentCard.zzmV();
    this.zzadx = paramAppContentCard.zzmW();
    this.zzxV = paramAppContentCard.getType();
    List localList1 = paramAppContentCard.getActions();
    int j = localList1.size();
    this.mActions = new ArrayList(j);
    for (int k = 0; k < j; k++)
      this.mActions.add((AppContentActionEntity)((AppContentAction)localList1.get(k)).freeze());
    List localList2 = paramAppContentCard.zzmT();
    int m = localList2.size();
    this.zzadu = new ArrayList(m);
    for (int n = 0; n < m; n++)
      this.zzadu.add((AppContentAnnotationEntity)((AppContentAnnotation)localList2.get(n)).freeze());
    List localList3 = paramAppContentCard.zzmI();
    int i1 = localList3.size();
    this.zzadk = new ArrayList(i1);
    while (i < i1)
    {
      this.zzadk.add((AppContentConditionEntity)((AppContentCondition)localList3.get(i)).freeze());
      i++;
    }
  }

  static int zza(AppContentCard paramAppContentCard)
  {
    Object[] arrayOfObject = new Object[12];
    arrayOfObject[0] = paramAppContentCard.getActions();
    arrayOfObject[1] = paramAppContentCard.zzmT();
    arrayOfObject[2] = paramAppContentCard.zzmI();
    arrayOfObject[3] = paramAppContentCard.zzmJ();
    arrayOfObject[4] = Integer.valueOf(paramAppContentCard.zzmU());
    arrayOfObject[5] = paramAppContentCard.getDescription();
    arrayOfObject[6] = paramAppContentCard.getExtras();
    arrayOfObject[7] = paramAppContentCard.getId();
    arrayOfObject[8] = paramAppContentCard.zzmV();
    arrayOfObject[9] = paramAppContentCard.getTitle();
    arrayOfObject[10] = Integer.valueOf(paramAppContentCard.zzmW());
    arrayOfObject[11] = paramAppContentCard.getType();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(AppContentCard paramAppContentCard, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof AppContentCard))
      bool = false;
    AppContentCard localAppContentCard;
    do
    {
      do
        return bool;
      while (paramAppContentCard == paramObject);
      localAppContentCard = (AppContentCard)paramObject;
    }
    while ((zzw.equal(localAppContentCard.getActions(), paramAppContentCard.getActions())) && (zzw.equal(localAppContentCard.zzmT(), paramAppContentCard.zzmT())) && (zzw.equal(localAppContentCard.zzmI(), paramAppContentCard.zzmI())) && (zzw.equal(localAppContentCard.zzmJ(), paramAppContentCard.zzmJ())) && (zzw.equal(Integer.valueOf(localAppContentCard.zzmU()), Integer.valueOf(paramAppContentCard.zzmU()))) && (zzw.equal(localAppContentCard.getDescription(), paramAppContentCard.getDescription())) && (zzw.equal(localAppContentCard.getExtras(), paramAppContentCard.getExtras())) && (zzw.equal(localAppContentCard.getId(), paramAppContentCard.getId())) && (zzw.equal(localAppContentCard.zzmV(), paramAppContentCard.zzmV())) && (zzw.equal(localAppContentCard.getTitle(), paramAppContentCard.getTitle())) && (zzw.equal(Integer.valueOf(localAppContentCard.zzmW()), Integer.valueOf(paramAppContentCard.zzmW()))) && (zzw.equal(localAppContentCard.getType(), paramAppContentCard.getType())));
    return false;
  }

  static String zzb(AppContentCard paramAppContentCard)
  {
    return zzw.zzk(paramAppContentCard).zza("Actions", paramAppContentCard.getActions()).zza("Annotations", paramAppContentCard.zzmT()).zza("Conditions", paramAppContentCard.zzmI()).zza("ContentDescription", paramAppContentCard.zzmJ()).zza("CurrentSteps", Integer.valueOf(paramAppContentCard.zzmU())).zza("Description", paramAppContentCard.getDescription()).zza("Extras", paramAppContentCard.getExtras()).zza("Id", paramAppContentCard.getId()).zza("Subtitle", paramAppContentCard.zzmV()).zza("Title", paramAppContentCard.getTitle()).zza("TotalSteps", Integer.valueOf(paramAppContentCard.zzmW())).zza("Type", paramAppContentCard.getType()).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public List<AppContentAction> getActions()
  {
    return new ArrayList(this.mActions);
  }

  public String getDescription()
  {
    return this.zzZO;
  }

  public Bundle getExtras()
  {
    return this.mExtras;
  }

  public String getId()
  {
    return this.zzFA;
  }

  public String getTitle()
  {
    return this.zzSy;
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
    AppContentCardEntityCreator.zza(this, paramParcel, paramInt);
  }

  public List<AppContentCondition> zzmI()
  {
    return new ArrayList(this.zzadk);
  }

  public String zzmJ()
  {
    return this.zzadl;
  }

  public List<AppContentAnnotation> zzmT()
  {
    return new ArrayList(this.zzadu);
  }

  public int zzmU()
  {
    return this.zzadv;
  }

  public String zzmV()
  {
    return this.zzadw;
  }

  public int zzmW()
  {
    return this.zzadx;
  }

  public AppContentCard zzmX()
  {
    return this;
  }
}