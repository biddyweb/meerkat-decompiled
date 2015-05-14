package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import java.util.ArrayList;
import java.util.List;

public final class AppContentSectionEntity
  implements SafeParcelable, AppContentSection
{
  public static final AppContentSectionEntityCreator CREATOR = new AppContentSectionEntityCreator();
  private final ArrayList<AppContentActionEntity> mActions;
  private final Bundle mExtras;
  private final String zzFA;
  private final int zzFG;
  private final String zzSy;
  private final ArrayList<AppContentCardEntity> zzadD;
  private final String zzadE;
  private final String zzadl;
  private final ArrayList<AppContentAnnotationEntity> zzadu;
  private final String zzadw;
  private final String zzxV;

  AppContentSectionEntity(int paramInt, ArrayList<AppContentActionEntity> paramArrayList, ArrayList<AppContentCardEntity> paramArrayList1, String paramString1, Bundle paramBundle, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, ArrayList<AppContentAnnotationEntity> paramArrayList2)
  {
    this.zzFG = paramInt;
    this.mActions = paramArrayList;
    this.zzadu = paramArrayList2;
    this.zzadD = paramArrayList1;
    this.zzadE = paramString6;
    this.zzadl = paramString1;
    this.mExtras = paramBundle;
    this.zzFA = paramString5;
    this.zzadw = paramString2;
    this.zzSy = paramString3;
    this.zzxV = paramString4;
  }

  public AppContentSectionEntity(AppContentSection paramAppContentSection)
  {
    this.zzFG = 5;
    this.zzadE = paramAppContentSection.zzne();
    this.zzadl = paramAppContentSection.zzmJ();
    this.mExtras = paramAppContentSection.getExtras();
    this.zzFA = paramAppContentSection.getId();
    this.zzadw = paramAppContentSection.zzmV();
    this.zzSy = paramAppContentSection.getTitle();
    this.zzxV = paramAppContentSection.getType();
    List localList1 = paramAppContentSection.getActions();
    int j = localList1.size();
    this.mActions = new ArrayList(j);
    for (int k = 0; k < j; k++)
      this.mActions.add((AppContentActionEntity)((AppContentAction)localList1.get(k)).freeze());
    List localList2 = paramAppContentSection.zznd();
    int m = localList2.size();
    this.zzadD = new ArrayList(m);
    for (int n = 0; n < m; n++)
      this.zzadD.add((AppContentCardEntity)((AppContentCard)localList2.get(n)).freeze());
    List localList3 = paramAppContentSection.zzmT();
    int i1 = localList3.size();
    this.zzadu = new ArrayList(i1);
    while (i < i1)
    {
      this.zzadu.add((AppContentAnnotationEntity)((AppContentAnnotation)localList3.get(i)).freeze());
      i++;
    }
  }

  static int zza(AppContentSection paramAppContentSection)
  {
    Object[] arrayOfObject = new Object[10];
    arrayOfObject[0] = paramAppContentSection.getActions();
    arrayOfObject[1] = paramAppContentSection.zzmT();
    arrayOfObject[2] = paramAppContentSection.zznd();
    arrayOfObject[3] = paramAppContentSection.zzne();
    arrayOfObject[4] = paramAppContentSection.zzmJ();
    arrayOfObject[5] = paramAppContentSection.getExtras();
    arrayOfObject[6] = paramAppContentSection.getId();
    arrayOfObject[7] = paramAppContentSection.zzmV();
    arrayOfObject[8] = paramAppContentSection.getTitle();
    arrayOfObject[9] = paramAppContentSection.getType();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(AppContentSection paramAppContentSection, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof AppContentSection))
      bool = false;
    AppContentSection localAppContentSection;
    do
    {
      do
        return bool;
      while (paramAppContentSection == paramObject);
      localAppContentSection = (AppContentSection)paramObject;
    }
    while ((zzw.equal(localAppContentSection.getActions(), paramAppContentSection.getActions())) && (zzw.equal(localAppContentSection.zzmT(), paramAppContentSection.zzmT())) && (zzw.equal(localAppContentSection.zznd(), paramAppContentSection.zznd())) && (zzw.equal(localAppContentSection.zzne(), paramAppContentSection.zzne())) && (zzw.equal(localAppContentSection.zzmJ(), paramAppContentSection.zzmJ())) && (zzw.equal(localAppContentSection.getExtras(), paramAppContentSection.getExtras())) && (zzw.equal(localAppContentSection.getId(), paramAppContentSection.getId())) && (zzw.equal(localAppContentSection.zzmV(), paramAppContentSection.zzmV())) && (zzw.equal(localAppContentSection.getTitle(), paramAppContentSection.getTitle())) && (zzw.equal(localAppContentSection.getType(), paramAppContentSection.getType())));
    return false;
  }

  static String zzb(AppContentSection paramAppContentSection)
  {
    return zzw.zzk(paramAppContentSection).zza("Actions", paramAppContentSection.getActions()).zza("Annotations", paramAppContentSection.zzmT()).zza("Cards", paramAppContentSection.zznd()).zza("CardType", paramAppContentSection.zzne()).zza("ContentDescription", paramAppContentSection.zzmJ()).zza("Extras", paramAppContentSection.getExtras()).zza("Id", paramAppContentSection.getId()).zza("Subtitle", paramAppContentSection.zzmV()).zza("Title", paramAppContentSection.getTitle()).zza("Type", paramAppContentSection.getType()).toString();
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
    AppContentSectionEntityCreator.zza(this, paramParcel, paramInt);
  }

  public String zzmJ()
  {
    return this.zzadl;
  }

  public List<AppContentAnnotation> zzmT()
  {
    return new ArrayList(this.zzadu);
  }

  public String zzmV()
  {
    return this.zzadw;
  }

  public List<AppContentCard> zznd()
  {
    return new ArrayList(this.zzadD);
  }

  public String zzne()
  {
    return this.zzadE;
  }

  public AppContentSection zznf()
  {
    return this;
  }
}