package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.Person.AgeRange;
import com.google.android.gms.plus.model.people.Person.Cover;
import com.google.android.gms.plus.model.people.Person.Cover.CoverInfo;
import com.google.android.gms.plus.model.people.Person.Cover.CoverPhoto;
import com.google.android.gms.plus.model.people.Person.Image;
import com.google.android.gms.plus.model.people.Person.Name;
import com.google.android.gms.plus.model.people.Person.Organizations;
import com.google.android.gms.plus.model.people.Person.PlacesLived;
import com.google.android.gms.plus.model.people.Person.Urls;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public final class zztw extends zzle
  implements Person
{
  public static final zztx CREATOR = new zztx();
  private static final HashMap<String, zzld.zza<?, ?>> zzauW = new HashMap();
  String zzFA;
  final int zzFG;
  String zzIO;
  String zzSJ;
  final Set<Integer> zzauX;
  String zzavV;
  zza zzavW;
  String zzavX;
  String zzavY;
  int zzavZ;
  zzb zzawa;
  String zzawb;
  zzc zzawc;
  boolean zzawd;
  zzd zzawe;
  String zzawf;
  int zzawg;
  List<zzf> zzawh;
  List<zzg> zzawi;
  int zzawj;
  int zzawk;
  String zzawl;
  List<zzh> zzawm;
  boolean zzawn;
  int zzpo;
  String zzxX;

  static
  {
    zzauW.put("aboutMe", zzld.zza.zzl("aboutMe", 2));
    zzauW.put("ageRange", zzld.zza.zza("ageRange", 3, zza.class));
    zzauW.put("birthday", zzld.zza.zzl("birthday", 4));
    zzauW.put("braggingRights", zzld.zza.zzl("braggingRights", 5));
    zzauW.put("circledByCount", zzld.zza.zzi("circledByCount", 6));
    zzauW.put("cover", zzld.zza.zza("cover", 7, zzb.class));
    zzauW.put("currentLocation", zzld.zza.zzl("currentLocation", 8));
    zzauW.put("displayName", zzld.zza.zzl("displayName", 9));
    zzauW.put("gender", zzld.zza.zza("gender", 12, new zzla().zzh("male", 0).zzh("female", 1).zzh("other", 2), false));
    zzauW.put("id", zzld.zza.zzl("id", 14));
    zzauW.put("image", zzld.zza.zza("image", 15, zzc.class));
    zzauW.put("isPlusUser", zzld.zza.zzk("isPlusUser", 16));
    zzauW.put("language", zzld.zza.zzl("language", 18));
    zzauW.put("name", zzld.zza.zza("name", 19, zzd.class));
    zzauW.put("nickname", zzld.zza.zzl("nickname", 20));
    zzauW.put("objectType", zzld.zza.zza("objectType", 21, new zzla().zzh("person", 0).zzh("page", 1), false));
    zzauW.put("organizations", zzld.zza.zzb("organizations", 22, zzf.class));
    zzauW.put("placesLived", zzld.zza.zzb("placesLived", 23, zzg.class));
    zzauW.put("plusOneCount", zzld.zza.zzi("plusOneCount", 24));
    zzauW.put("relationshipStatus", zzld.zza.zza("relationshipStatus", 25, new zzla().zzh("single", 0).zzh("in_a_relationship", 1).zzh("engaged", 2).zzh("married", 3).zzh("its_complicated", 4).zzh("open_relationship", 5).zzh("widowed", 6).zzh("in_domestic_partnership", 7).zzh("in_civil_union", 8), false));
    zzauW.put("tagline", zzld.zza.zzl("tagline", 26));
    zzauW.put("url", zzld.zza.zzl("url", 27));
    zzauW.put("urls", zzld.zza.zzb("urls", 28, zzh.class));
    zzauW.put("verified", zzld.zza.zzk("verified", 29));
  }

  public zztw()
  {
    this.zzFG = 1;
    this.zzauX = new HashSet();
  }

  public zztw(String paramString1, String paramString2, zzc paramzzc, int paramInt, String paramString3)
  {
    this.zzFG = 1;
    this.zzauX = new HashSet();
    this.zzSJ = paramString1;
    this.zzauX.add(Integer.valueOf(9));
    this.zzFA = paramString2;
    this.zzauX.add(Integer.valueOf(14));
    this.zzawc = paramzzc;
    this.zzauX.add(Integer.valueOf(15));
    this.zzawg = paramInt;
    this.zzauX.add(Integer.valueOf(21));
    this.zzxX = paramString3;
    this.zzauX.add(Integer.valueOf(27));
  }

  zztw(Set<Integer> paramSet, int paramInt1, String paramString1, zza paramzza, String paramString2, String paramString3, int paramInt2, zzb paramzzb, String paramString4, String paramString5, int paramInt3, String paramString6, zzc paramzzc, boolean paramBoolean1, String paramString7, zzd paramzzd, String paramString8, int paramInt4, List<zzf> paramList, List<zzg> paramList1, int paramInt5, int paramInt6, String paramString9, String paramString10, List<zzh> paramList2, boolean paramBoolean2)
  {
    this.zzauX = paramSet;
    this.zzFG = paramInt1;
    this.zzavV = paramString1;
    this.zzavW = paramzza;
    this.zzavX = paramString2;
    this.zzavY = paramString3;
    this.zzavZ = paramInt2;
    this.zzawa = paramzzb;
    this.zzawb = paramString4;
    this.zzSJ = paramString5;
    this.zzpo = paramInt3;
    this.zzFA = paramString6;
    this.zzawc = paramzzc;
    this.zzawd = paramBoolean1;
    this.zzIO = paramString7;
    this.zzawe = paramzzd;
    this.zzawf = paramString8;
    this.zzawg = paramInt4;
    this.zzawh = paramList;
    this.zzawi = paramList1;
    this.zzawj = paramInt5;
    this.zzawk = paramInt6;
    this.zzawl = paramString9;
    this.zzxX = paramString10;
    this.zzawm = paramList2;
    this.zzawn = paramBoolean2;
  }

  public static zztw zzj(byte[] paramArrayOfByte)
  {
    Parcel localParcel = Parcel.obtain();
    localParcel.unmarshall(paramArrayOfByte, 0, paramArrayOfByte.length);
    localParcel.setDataPosition(0);
    zztw localzztw = CREATOR.zzeB(localParcel);
    localParcel.recycle();
    return localzztw;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof zztw))
      return false;
    if (this == paramObject)
      return true;
    zztw localzztw = (zztw)paramObject;
    Iterator localIterator = zzauW.values().iterator();
    while (localIterator.hasNext())
    {
      zzld.zza localzza = (zzld.zza)localIterator.next();
      if (zza(localzza))
      {
        if (localzztw.zza(localzza))
        {
          if (!zzb(localzza).equals(localzztw.zzb(localzza)))
            return false;
        }
        else
          return false;
      }
      else if (localzztw.zza(localzza))
        return false;
    }
    return true;
  }

  public String getAboutMe()
  {
    return this.zzavV;
  }

  public Person.AgeRange getAgeRange()
  {
    return this.zzavW;
  }

  public String getBirthday()
  {
    return this.zzavX;
  }

  public String getBraggingRights()
  {
    return this.zzavY;
  }

  public int getCircledByCount()
  {
    return this.zzavZ;
  }

  public Person.Cover getCover()
  {
    return this.zzawa;
  }

  public String getCurrentLocation()
  {
    return this.zzawb;
  }

  public String getDisplayName()
  {
    return this.zzSJ;
  }

  public int getGender()
  {
    return this.zzpo;
  }

  public String getId()
  {
    return this.zzFA;
  }

  public Person.Image getImage()
  {
    return this.zzawc;
  }

  public String getLanguage()
  {
    return this.zzIO;
  }

  public Person.Name getName()
  {
    return this.zzawe;
  }

  public String getNickname()
  {
    return this.zzawf;
  }

  public int getObjectType()
  {
    return this.zzawg;
  }

  public List<Person.Organizations> getOrganizations()
  {
    return (ArrayList)this.zzawh;
  }

  public List<Person.PlacesLived> getPlacesLived()
  {
    return (ArrayList)this.zzawi;
  }

  public int getPlusOneCount()
  {
    return this.zzawj;
  }

  public int getRelationshipStatus()
  {
    return this.zzawk;
  }

  public String getTagline()
  {
    return this.zzawl;
  }

  public String getUrl()
  {
    return this.zzxX;
  }

  public List<Person.Urls> getUrls()
  {
    return (ArrayList)this.zzawm;
  }

  public boolean hasAboutMe()
  {
    return this.zzauX.contains(Integer.valueOf(2));
  }

  public boolean hasAgeRange()
  {
    return this.zzauX.contains(Integer.valueOf(3));
  }

  public boolean hasBirthday()
  {
    return this.zzauX.contains(Integer.valueOf(4));
  }

  public boolean hasBraggingRights()
  {
    return this.zzauX.contains(Integer.valueOf(5));
  }

  public boolean hasCircledByCount()
  {
    return this.zzauX.contains(Integer.valueOf(6));
  }

  public boolean hasCover()
  {
    return this.zzauX.contains(Integer.valueOf(7));
  }

  public boolean hasCurrentLocation()
  {
    return this.zzauX.contains(Integer.valueOf(8));
  }

  public boolean hasDisplayName()
  {
    return this.zzauX.contains(Integer.valueOf(9));
  }

  public boolean hasGender()
  {
    return this.zzauX.contains(Integer.valueOf(12));
  }

  public boolean hasId()
  {
    return this.zzauX.contains(Integer.valueOf(14));
  }

  public boolean hasImage()
  {
    return this.zzauX.contains(Integer.valueOf(15));
  }

  public boolean hasIsPlusUser()
  {
    return this.zzauX.contains(Integer.valueOf(16));
  }

  public boolean hasLanguage()
  {
    return this.zzauX.contains(Integer.valueOf(18));
  }

  public boolean hasName()
  {
    return this.zzauX.contains(Integer.valueOf(19));
  }

  public boolean hasNickname()
  {
    return this.zzauX.contains(Integer.valueOf(20));
  }

  public boolean hasObjectType()
  {
    return this.zzauX.contains(Integer.valueOf(21));
  }

  public boolean hasOrganizations()
  {
    return this.zzauX.contains(Integer.valueOf(22));
  }

  public boolean hasPlacesLived()
  {
    return this.zzauX.contains(Integer.valueOf(23));
  }

  public boolean hasPlusOneCount()
  {
    return this.zzauX.contains(Integer.valueOf(24));
  }

  public boolean hasRelationshipStatus()
  {
    return this.zzauX.contains(Integer.valueOf(25));
  }

  public boolean hasTagline()
  {
    return this.zzauX.contains(Integer.valueOf(26));
  }

  public boolean hasUrl()
  {
    return this.zzauX.contains(Integer.valueOf(27));
  }

  public boolean hasUrls()
  {
    return this.zzauX.contains(Integer.valueOf(28));
  }

  public boolean hasVerified()
  {
    return this.zzauX.contains(Integer.valueOf(29));
  }

  public int hashCode()
  {
    Iterator localIterator = zzauW.values().iterator();
    int i = 0;
    zzld.zza localzza;
    if (localIterator.hasNext())
    {
      localzza = (zzld.zza)localIterator.next();
      if (!zza(localzza))
        break label66;
    }
    label66: for (int j = i + localzza.zzjG() + zzb(localzza).hashCode(); ; j = i)
    {
      i = j;
      break;
      return i;
    }
  }

  public boolean isDataValid()
  {
    return true;
  }

  public boolean isPlusUser()
  {
    return this.zzawd;
  }

  public boolean isVerified()
  {
    return this.zzawn;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zztx.zza(this, paramParcel, paramInt);
  }

  protected boolean zza(zzld.zza paramzza)
  {
    return this.zzauX.contains(Integer.valueOf(paramzza.zzjG()));
  }

  protected Object zzb(zzld.zza paramzza)
  {
    switch (paramzza.zzjG())
    {
    case 10:
    case 11:
    case 13:
    case 17:
    default:
      throw new IllegalStateException("Unknown safe parcelable id=" + paramzza.zzjG());
    case 2:
      return this.zzavV;
    case 3:
      return this.zzavW;
    case 4:
      return this.zzavX;
    case 5:
      return this.zzavY;
    case 6:
      return Integer.valueOf(this.zzavZ);
    case 7:
      return this.zzawa;
    case 8:
      return this.zzawb;
    case 9:
      return this.zzSJ;
    case 12:
      return Integer.valueOf(this.zzpo);
    case 14:
      return this.zzFA;
    case 15:
      return this.zzawc;
    case 16:
      return Boolean.valueOf(this.zzawd);
    case 18:
      return this.zzIO;
    case 19:
      return this.zzawe;
    case 20:
      return this.zzawf;
    case 21:
      return Integer.valueOf(this.zzawg);
    case 22:
      return this.zzawh;
    case 23:
      return this.zzawi;
    case 24:
      return Integer.valueOf(this.zzawj);
    case 25:
      return Integer.valueOf(this.zzawk);
    case 26:
      return this.zzawl;
    case 27:
      return this.zzxX;
    case 28:
      return this.zzawm;
    case 29:
    }
    return Boolean.valueOf(this.zzawn);
  }

  public HashMap<String, zzld.zza<?, ?>> zzsb()
  {
    return zzauW;
  }

  public zztw zzsf()
  {
    return this;
  }

  public static final class zza extends zzle
    implements Person.AgeRange
  {
    public static final zzty CREATOR = new zzty();
    private static final HashMap<String, zzld.zza<?, ?>> zzauW = new HashMap();
    final int zzFG;
    final Set<Integer> zzauX;
    int zzawo;
    int zzawp;

    static
    {
      zzauW.put("max", zzld.zza.zzi("max", 2));
      zzauW.put("min", zzld.zza.zzi("min", 3));
    }

    public zza()
    {
      this.zzFG = 1;
      this.zzauX = new HashSet();
    }

    zza(Set<Integer> paramSet, int paramInt1, int paramInt2, int paramInt3)
    {
      this.zzauX = paramSet;
      this.zzFG = paramInt1;
      this.zzawo = paramInt2;
      this.zzawp = paramInt3;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zza))
        return false;
      if (this == paramObject)
        return true;
      zza localzza = (zza)paramObject;
      Iterator localIterator = zzauW.values().iterator();
      while (localIterator.hasNext())
      {
        zzld.zza localzza1 = (zzld.zza)localIterator.next();
        if (zza(localzza1))
        {
          if (localzza.zza(localzza1))
          {
            if (!zzb(localzza1).equals(localzza.zzb(localzza1)))
              return false;
          }
          else
            return false;
        }
        else if (localzza.zza(localzza1))
          return false;
      }
      return true;
    }

    public int getMax()
    {
      return this.zzawo;
    }

    public int getMin()
    {
      return this.zzawp;
    }

    public boolean hasMax()
    {
      return this.zzauX.contains(Integer.valueOf(2));
    }

    public boolean hasMin()
    {
      return this.zzauX.contains(Integer.valueOf(3));
    }

    public int hashCode()
    {
      Iterator localIterator = zzauW.values().iterator();
      int i = 0;
      zzld.zza localzza;
      if (localIterator.hasNext())
      {
        localzza = (zzld.zza)localIterator.next();
        if (!zza(localzza))
          break label66;
      }
      label66: for (int j = i + localzza.zzjG() + zzb(localzza).hashCode(); ; j = i)
      {
        i = j;
        break;
        return i;
      }
    }

    public boolean isDataValid()
    {
      return true;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzty.zza(this, paramParcel, paramInt);
    }

    protected boolean zza(zzld.zza paramzza)
    {
      return this.zzauX.contains(Integer.valueOf(paramzza.zzjG()));
    }

    protected Object zzb(zzld.zza paramzza)
    {
      switch (paramzza.zzjG())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + paramzza.zzjG());
      case 2:
        return Integer.valueOf(this.zzawo);
      case 3:
      }
      return Integer.valueOf(this.zzawp);
    }

    public HashMap<String, zzld.zza<?, ?>> zzsb()
    {
      return zzauW;
    }

    public zza zzsg()
    {
      return this;
    }
  }

  public static final class zzb extends zzle
    implements Person.Cover
  {
    public static final zztz CREATOR = new zztz();
    private static final HashMap<String, zzld.zza<?, ?>> zzauW = new HashMap();
    final int zzFG;
    final Set<Integer> zzauX;
    zza zzawq;
    zzb zzawr;
    int zzaws;

    static
    {
      zzauW.put("coverInfo", zzld.zza.zza("coverInfo", 2, zza.class));
      zzauW.put("coverPhoto", zzld.zza.zza("coverPhoto", 3, zzb.class));
      zzauW.put("layout", zzld.zza.zza("layout", 4, new zzla().zzh("banner", 0), false));
    }

    public zzb()
    {
      this.zzFG = 1;
      this.zzauX = new HashSet();
    }

    zzb(Set<Integer> paramSet, int paramInt1, zza paramzza, zzb paramzzb, int paramInt2)
    {
      this.zzauX = paramSet;
      this.zzFG = paramInt1;
      this.zzawq = paramzza;
      this.zzawr = paramzzb;
      this.zzaws = paramInt2;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zzb))
        return false;
      if (this == paramObject)
        return true;
      zzb localzzb = (zzb)paramObject;
      Iterator localIterator = zzauW.values().iterator();
      while (localIterator.hasNext())
      {
        zzld.zza localzza = (zzld.zza)localIterator.next();
        if (zza(localzza))
        {
          if (localzzb.zza(localzza))
          {
            if (!zzb(localzza).equals(localzzb.zzb(localzza)))
              return false;
          }
          else
            return false;
        }
        else if (localzzb.zza(localzza))
          return false;
      }
      return true;
    }

    public Person.Cover.CoverInfo getCoverInfo()
    {
      return this.zzawq;
    }

    public Person.Cover.CoverPhoto getCoverPhoto()
    {
      return this.zzawr;
    }

    public int getLayout()
    {
      return this.zzaws;
    }

    public boolean hasCoverInfo()
    {
      return this.zzauX.contains(Integer.valueOf(2));
    }

    public boolean hasCoverPhoto()
    {
      return this.zzauX.contains(Integer.valueOf(3));
    }

    public boolean hasLayout()
    {
      return this.zzauX.contains(Integer.valueOf(4));
    }

    public int hashCode()
    {
      Iterator localIterator = zzauW.values().iterator();
      int i = 0;
      zzld.zza localzza;
      if (localIterator.hasNext())
      {
        localzza = (zzld.zza)localIterator.next();
        if (!zza(localzza))
          break label66;
      }
      label66: for (int j = i + localzza.zzjG() + zzb(localzza).hashCode(); ; j = i)
      {
        i = j;
        break;
        return i;
      }
    }

    public boolean isDataValid()
    {
      return true;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zztz.zza(this, paramParcel, paramInt);
    }

    protected boolean zza(zzld.zza paramzza)
    {
      return this.zzauX.contains(Integer.valueOf(paramzza.zzjG()));
    }

    protected Object zzb(zzld.zza paramzza)
    {
      switch (paramzza.zzjG())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + paramzza.zzjG());
      case 2:
        return this.zzawq;
      case 3:
        return this.zzawr;
      case 4:
      }
      return Integer.valueOf(this.zzaws);
    }

    public HashMap<String, zzld.zza<?, ?>> zzsb()
    {
      return zzauW;
    }

    public zzb zzsh()
    {
      return this;
    }

    public static final class zza extends zzle
      implements Person.Cover.CoverInfo
    {
      public static final zzua CREATOR = new zzua();
      private static final HashMap<String, zzld.zza<?, ?>> zzauW = new HashMap();
      final int zzFG;
      final Set<Integer> zzauX;
      int zzawt;
      int zzawu;

      static
      {
        zzauW.put("leftImageOffset", zzld.zza.zzi("leftImageOffset", 2));
        zzauW.put("topImageOffset", zzld.zza.zzi("topImageOffset", 3));
      }

      public zza()
      {
        this.zzFG = 1;
        this.zzauX = new HashSet();
      }

      zza(Set<Integer> paramSet, int paramInt1, int paramInt2, int paramInt3)
      {
        this.zzauX = paramSet;
        this.zzFG = paramInt1;
        this.zzawt = paramInt2;
        this.zzawu = paramInt3;
      }

      public int describeContents()
      {
        return 0;
      }

      public boolean equals(Object paramObject)
      {
        if (!(paramObject instanceof zza))
          return false;
        if (this == paramObject)
          return true;
        zza localzza = (zza)paramObject;
        Iterator localIterator = zzauW.values().iterator();
        while (localIterator.hasNext())
        {
          zzld.zza localzza1 = (zzld.zza)localIterator.next();
          if (zza(localzza1))
          {
            if (localzza.zza(localzza1))
            {
              if (!zzb(localzza1).equals(localzza.zzb(localzza1)))
                return false;
            }
            else
              return false;
          }
          else if (localzza.zza(localzza1))
            return false;
        }
        return true;
      }

      public int getLeftImageOffset()
      {
        return this.zzawt;
      }

      public int getTopImageOffset()
      {
        return this.zzawu;
      }

      public boolean hasLeftImageOffset()
      {
        return this.zzauX.contains(Integer.valueOf(2));
      }

      public boolean hasTopImageOffset()
      {
        return this.zzauX.contains(Integer.valueOf(3));
      }

      public int hashCode()
      {
        Iterator localIterator = zzauW.values().iterator();
        int i = 0;
        zzld.zza localzza;
        if (localIterator.hasNext())
        {
          localzza = (zzld.zza)localIterator.next();
          if (!zza(localzza))
            break label66;
        }
        label66: for (int j = i + localzza.zzjG() + zzb(localzza).hashCode(); ; j = i)
        {
          i = j;
          break;
          return i;
        }
      }

      public boolean isDataValid()
      {
        return true;
      }

      public void writeToParcel(Parcel paramParcel, int paramInt)
      {
        zzua.zza(this, paramParcel, paramInt);
      }

      protected boolean zza(zzld.zza paramzza)
      {
        return this.zzauX.contains(Integer.valueOf(paramzza.zzjG()));
      }

      protected Object zzb(zzld.zza paramzza)
      {
        switch (paramzza.zzjG())
        {
        default:
          throw new IllegalStateException("Unknown safe parcelable id=" + paramzza.zzjG());
        case 2:
          return Integer.valueOf(this.zzawt);
        case 3:
        }
        return Integer.valueOf(this.zzawu);
      }

      public HashMap<String, zzld.zza<?, ?>> zzsb()
      {
        return zzauW;
      }

      public zza zzsi()
      {
        return this;
      }
    }

    public static final class zzb extends zzle
      implements Person.Cover.CoverPhoto
    {
      public static final zzub CREATOR = new zzub();
      private static final HashMap<String, zzld.zza<?, ?>> zzauW = new HashMap();
      final int zzFG;
      final Set<Integer> zzauX;
      int zzli;
      int zzlj;
      String zzxX;

      static
      {
        zzauW.put("height", zzld.zza.zzi("height", 2));
        zzauW.put("url", zzld.zza.zzl("url", 3));
        zzauW.put("width", zzld.zza.zzi("width", 4));
      }

      public zzb()
      {
        this.zzFG = 1;
        this.zzauX = new HashSet();
      }

      zzb(Set<Integer> paramSet, int paramInt1, int paramInt2, String paramString, int paramInt3)
      {
        this.zzauX = paramSet;
        this.zzFG = paramInt1;
        this.zzlj = paramInt2;
        this.zzxX = paramString;
        this.zzli = paramInt3;
      }

      public int describeContents()
      {
        return 0;
      }

      public boolean equals(Object paramObject)
      {
        if (!(paramObject instanceof zzb))
          return false;
        if (this == paramObject)
          return true;
        zzb localzzb = (zzb)paramObject;
        Iterator localIterator = zzauW.values().iterator();
        while (localIterator.hasNext())
        {
          zzld.zza localzza = (zzld.zza)localIterator.next();
          if (zza(localzza))
          {
            if (localzzb.zza(localzza))
            {
              if (!zzb(localzza).equals(localzzb.zzb(localzza)))
                return false;
            }
            else
              return false;
          }
          else if (localzzb.zza(localzza))
            return false;
        }
        return true;
      }

      public int getHeight()
      {
        return this.zzlj;
      }

      public String getUrl()
      {
        return this.zzxX;
      }

      public int getWidth()
      {
        return this.zzli;
      }

      public boolean hasHeight()
      {
        return this.zzauX.contains(Integer.valueOf(2));
      }

      public boolean hasUrl()
      {
        return this.zzauX.contains(Integer.valueOf(3));
      }

      public boolean hasWidth()
      {
        return this.zzauX.contains(Integer.valueOf(4));
      }

      public int hashCode()
      {
        Iterator localIterator = zzauW.values().iterator();
        int i = 0;
        zzld.zza localzza;
        if (localIterator.hasNext())
        {
          localzza = (zzld.zza)localIterator.next();
          if (!zza(localzza))
            break label66;
        }
        label66: for (int j = i + localzza.zzjG() + zzb(localzza).hashCode(); ; j = i)
        {
          i = j;
          break;
          return i;
        }
      }

      public boolean isDataValid()
      {
        return true;
      }

      public void writeToParcel(Parcel paramParcel, int paramInt)
      {
        zzub.zza(this, paramParcel, paramInt);
      }

      protected boolean zza(zzld.zza paramzza)
      {
        return this.zzauX.contains(Integer.valueOf(paramzza.zzjG()));
      }

      protected Object zzb(zzld.zza paramzza)
      {
        switch (paramzza.zzjG())
        {
        default:
          throw new IllegalStateException("Unknown safe parcelable id=" + paramzza.zzjG());
        case 2:
          return Integer.valueOf(this.zzlj);
        case 3:
          return this.zzxX;
        case 4:
        }
        return Integer.valueOf(this.zzli);
      }

      public HashMap<String, zzld.zza<?, ?>> zzsb()
      {
        return zzauW;
      }

      public zzb zzsj()
      {
        return this;
      }
    }
  }

  public static final class zzc extends zzle
    implements Person.Image
  {
    public static final zzuc CREATOR = new zzuc();
    private static final HashMap<String, zzld.zza<?, ?>> zzauW = new HashMap();
    final int zzFG;
    final Set<Integer> zzauX;
    String zzxX;

    static
    {
      zzauW.put("url", zzld.zza.zzl("url", 2));
    }

    public zzc()
    {
      this.zzFG = 1;
      this.zzauX = new HashSet();
    }

    public zzc(String paramString)
    {
      this.zzauX = new HashSet();
      this.zzFG = 1;
      this.zzxX = paramString;
      this.zzauX.add(Integer.valueOf(2));
    }

    zzc(Set<Integer> paramSet, int paramInt, String paramString)
    {
      this.zzauX = paramSet;
      this.zzFG = paramInt;
      this.zzxX = paramString;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zzc))
        return false;
      if (this == paramObject)
        return true;
      zzc localzzc = (zzc)paramObject;
      Iterator localIterator = zzauW.values().iterator();
      while (localIterator.hasNext())
      {
        zzld.zza localzza = (zzld.zza)localIterator.next();
        if (zza(localzza))
        {
          if (localzzc.zza(localzza))
          {
            if (!zzb(localzza).equals(localzzc.zzb(localzza)))
              return false;
          }
          else
            return false;
        }
        else if (localzzc.zza(localzza))
          return false;
      }
      return true;
    }

    public String getUrl()
    {
      return this.zzxX;
    }

    public boolean hasUrl()
    {
      return this.zzauX.contains(Integer.valueOf(2));
    }

    public int hashCode()
    {
      Iterator localIterator = zzauW.values().iterator();
      int i = 0;
      zzld.zza localzza;
      if (localIterator.hasNext())
      {
        localzza = (zzld.zza)localIterator.next();
        if (!zza(localzza))
          break label66;
      }
      label66: for (int j = i + localzza.zzjG() + zzb(localzza).hashCode(); ; j = i)
      {
        i = j;
        break;
        return i;
      }
    }

    public boolean isDataValid()
    {
      return true;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzuc.zza(this, paramParcel, paramInt);
    }

    protected boolean zza(zzld.zza paramzza)
    {
      return this.zzauX.contains(Integer.valueOf(paramzza.zzjG()));
    }

    protected Object zzb(zzld.zza paramzza)
    {
      switch (paramzza.zzjG())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + paramzza.zzjG());
      case 2:
      }
      return this.zzxX;
    }

    public HashMap<String, zzld.zza<?, ?>> zzsb()
    {
      return zzauW;
    }

    public zzc zzsk()
    {
      return this;
    }
  }

  public static final class zzd extends zzle
    implements Person.Name
  {
    public static final zzud CREATOR = new zzud();
    private static final HashMap<String, zzld.zza<?, ?>> zzauW = new HashMap();
    final int zzFG;
    final Set<Integer> zzauX;
    String zzavv;
    String zzavy;
    String zzawv;
    String zzaww;
    String zzawx;
    String zzawy;

    static
    {
      zzauW.put("familyName", zzld.zza.zzl("familyName", 2));
      zzauW.put("formatted", zzld.zza.zzl("formatted", 3));
      zzauW.put("givenName", zzld.zza.zzl("givenName", 4));
      zzauW.put("honorificPrefix", zzld.zza.zzl("honorificPrefix", 5));
      zzauW.put("honorificSuffix", zzld.zza.zzl("honorificSuffix", 6));
      zzauW.put("middleName", zzld.zza.zzl("middleName", 7));
    }

    public zzd()
    {
      this.zzFG = 1;
      this.zzauX = new HashSet();
    }

    zzd(Set<Integer> paramSet, int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6)
    {
      this.zzauX = paramSet;
      this.zzFG = paramInt;
      this.zzavv = paramString1;
      this.zzawv = paramString2;
      this.zzavy = paramString3;
      this.zzaww = paramString4;
      this.zzawx = paramString5;
      this.zzawy = paramString6;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zzd))
        return false;
      if (this == paramObject)
        return true;
      zzd localzzd = (zzd)paramObject;
      Iterator localIterator = zzauW.values().iterator();
      while (localIterator.hasNext())
      {
        zzld.zza localzza = (zzld.zza)localIterator.next();
        if (zza(localzza))
        {
          if (localzzd.zza(localzza))
          {
            if (!zzb(localzza).equals(localzzd.zzb(localzza)))
              return false;
          }
          else
            return false;
        }
        else if (localzzd.zza(localzza))
          return false;
      }
      return true;
    }

    public String getFamilyName()
    {
      return this.zzavv;
    }

    public String getFormatted()
    {
      return this.zzawv;
    }

    public String getGivenName()
    {
      return this.zzavy;
    }

    public String getHonorificPrefix()
    {
      return this.zzaww;
    }

    public String getHonorificSuffix()
    {
      return this.zzawx;
    }

    public String getMiddleName()
    {
      return this.zzawy;
    }

    public boolean hasFamilyName()
    {
      return this.zzauX.contains(Integer.valueOf(2));
    }

    public boolean hasFormatted()
    {
      return this.zzauX.contains(Integer.valueOf(3));
    }

    public boolean hasGivenName()
    {
      return this.zzauX.contains(Integer.valueOf(4));
    }

    public boolean hasHonorificPrefix()
    {
      return this.zzauX.contains(Integer.valueOf(5));
    }

    public boolean hasHonorificSuffix()
    {
      return this.zzauX.contains(Integer.valueOf(6));
    }

    public boolean hasMiddleName()
    {
      return this.zzauX.contains(Integer.valueOf(7));
    }

    public int hashCode()
    {
      Iterator localIterator = zzauW.values().iterator();
      int i = 0;
      zzld.zza localzza;
      if (localIterator.hasNext())
      {
        localzza = (zzld.zza)localIterator.next();
        if (!zza(localzza))
          break label66;
      }
      label66: for (int j = i + localzza.zzjG() + zzb(localzza).hashCode(); ; j = i)
      {
        i = j;
        break;
        return i;
      }
    }

    public boolean isDataValid()
    {
      return true;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzud.zza(this, paramParcel, paramInt);
    }

    protected boolean zza(zzld.zza paramzza)
    {
      return this.zzauX.contains(Integer.valueOf(paramzza.zzjG()));
    }

    protected Object zzb(zzld.zza paramzza)
    {
      switch (paramzza.zzjG())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + paramzza.zzjG());
      case 2:
        return this.zzavv;
      case 3:
        return this.zzawv;
      case 4:
        return this.zzavy;
      case 5:
        return this.zzaww;
      case 6:
        return this.zzawx;
      case 7:
      }
      return this.zzawy;
    }

    public HashMap<String, zzld.zza<?, ?>> zzsb()
    {
      return zzauW;
    }

    public zzd zzsl()
    {
      return this;
    }
  }

  public static class zze
  {
    public static int zzcF(String paramString)
    {
      if (paramString.equals("person"))
        return 0;
      if (paramString.equals("page"))
        return 1;
      throw new IllegalArgumentException("Unknown objectType string: " + paramString);
    }
  }

  public static final class zzf extends zzle
    implements Person.Organizations
  {
    public static final zzue CREATOR = new zzue();
    private static final HashMap<String, zzld.zza<?, ?>> zzauW = new HashMap();
    String mName;
    final int zzFG;
    int zzJp;
    String zzSy;
    String zzZO;
    final Set<Integer> zzauX;
    String zzavK;
    String zzavu;
    String zzawA;
    boolean zzawB;
    String zzawz;

    static
    {
      zzauW.put("department", zzld.zza.zzl("department", 2));
      zzauW.put("description", zzld.zza.zzl("description", 3));
      zzauW.put("endDate", zzld.zza.zzl("endDate", 4));
      zzauW.put("location", zzld.zza.zzl("location", 5));
      zzauW.put("name", zzld.zza.zzl("name", 6));
      zzauW.put("primary", zzld.zza.zzk("primary", 7));
      zzauW.put("startDate", zzld.zza.zzl("startDate", 8));
      zzauW.put("title", zzld.zza.zzl("title", 9));
      zzauW.put("type", zzld.zza.zza("type", 10, new zzla().zzh("work", 0).zzh("school", 1), false));
    }

    public zzf()
    {
      this.zzFG = 1;
      this.zzauX = new HashSet();
    }

    zzf(Set<Integer> paramSet, int paramInt1, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, boolean paramBoolean, String paramString6, String paramString7, int paramInt2)
    {
      this.zzauX = paramSet;
      this.zzFG = paramInt1;
      this.zzawz = paramString1;
      this.zzZO = paramString2;
      this.zzavu = paramString3;
      this.zzawA = paramString4;
      this.mName = paramString5;
      this.zzawB = paramBoolean;
      this.zzavK = paramString6;
      this.zzSy = paramString7;
      this.zzJp = paramInt2;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zzf))
        return false;
      if (this == paramObject)
        return true;
      zzf localzzf = (zzf)paramObject;
      Iterator localIterator = zzauW.values().iterator();
      while (localIterator.hasNext())
      {
        zzld.zza localzza = (zzld.zza)localIterator.next();
        if (zza(localzza))
        {
          if (localzzf.zza(localzza))
          {
            if (!zzb(localzza).equals(localzzf.zzb(localzza)))
              return false;
          }
          else
            return false;
        }
        else if (localzzf.zza(localzza))
          return false;
      }
      return true;
    }

    public String getDepartment()
    {
      return this.zzawz;
    }

    public String getDescription()
    {
      return this.zzZO;
    }

    public String getEndDate()
    {
      return this.zzavu;
    }

    public String getLocation()
    {
      return this.zzawA;
    }

    public String getName()
    {
      return this.mName;
    }

    public String getStartDate()
    {
      return this.zzavK;
    }

    public String getTitle()
    {
      return this.zzSy;
    }

    public int getType()
    {
      return this.zzJp;
    }

    public boolean hasDepartment()
    {
      return this.zzauX.contains(Integer.valueOf(2));
    }

    public boolean hasDescription()
    {
      return this.zzauX.contains(Integer.valueOf(3));
    }

    public boolean hasEndDate()
    {
      return this.zzauX.contains(Integer.valueOf(4));
    }

    public boolean hasLocation()
    {
      return this.zzauX.contains(Integer.valueOf(5));
    }

    public boolean hasName()
    {
      return this.zzauX.contains(Integer.valueOf(6));
    }

    public boolean hasPrimary()
    {
      return this.zzauX.contains(Integer.valueOf(7));
    }

    public boolean hasStartDate()
    {
      return this.zzauX.contains(Integer.valueOf(8));
    }

    public boolean hasTitle()
    {
      return this.zzauX.contains(Integer.valueOf(9));
    }

    public boolean hasType()
    {
      return this.zzauX.contains(Integer.valueOf(10));
    }

    public int hashCode()
    {
      Iterator localIterator = zzauW.values().iterator();
      int i = 0;
      zzld.zza localzza;
      if (localIterator.hasNext())
      {
        localzza = (zzld.zza)localIterator.next();
        if (!zza(localzza))
          break label66;
      }
      label66: for (int j = i + localzza.zzjG() + zzb(localzza).hashCode(); ; j = i)
      {
        i = j;
        break;
        return i;
      }
    }

    public boolean isDataValid()
    {
      return true;
    }

    public boolean isPrimary()
    {
      return this.zzawB;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzue.zza(this, paramParcel, paramInt);
    }

    protected boolean zza(zzld.zza paramzza)
    {
      return this.zzauX.contains(Integer.valueOf(paramzza.zzjG()));
    }

    protected Object zzb(zzld.zza paramzza)
    {
      switch (paramzza.zzjG())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + paramzza.zzjG());
      case 2:
        return this.zzawz;
      case 3:
        return this.zzZO;
      case 4:
        return this.zzavu;
      case 5:
        return this.zzawA;
      case 6:
        return this.mName;
      case 7:
        return Boolean.valueOf(this.zzawB);
      case 8:
        return this.zzavK;
      case 9:
        return this.zzSy;
      case 10:
      }
      return Integer.valueOf(this.zzJp);
    }

    public HashMap<String, zzld.zza<?, ?>> zzsb()
    {
      return zzauW;
    }

    public zzf zzsm()
    {
      return this;
    }
  }

  public static final class zzg extends zzle
    implements Person.PlacesLived
  {
    public static final zzuf CREATOR = new zzuf();
    private static final HashMap<String, zzld.zza<?, ?>> zzauW = new HashMap();
    String mValue;
    final int zzFG;
    final Set<Integer> zzauX;
    boolean zzawB;

    static
    {
      zzauW.put("primary", zzld.zza.zzk("primary", 2));
      zzauW.put("value", zzld.zza.zzl("value", 3));
    }

    public zzg()
    {
      this.zzFG = 1;
      this.zzauX = new HashSet();
    }

    zzg(Set<Integer> paramSet, int paramInt, boolean paramBoolean, String paramString)
    {
      this.zzauX = paramSet;
      this.zzFG = paramInt;
      this.zzawB = paramBoolean;
      this.mValue = paramString;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zzg))
        return false;
      if (this == paramObject)
        return true;
      zzg localzzg = (zzg)paramObject;
      Iterator localIterator = zzauW.values().iterator();
      while (localIterator.hasNext())
      {
        zzld.zza localzza = (zzld.zza)localIterator.next();
        if (zza(localzza))
        {
          if (localzzg.zza(localzza))
          {
            if (!zzb(localzza).equals(localzzg.zzb(localzza)))
              return false;
          }
          else
            return false;
        }
        else if (localzzg.zza(localzza))
          return false;
      }
      return true;
    }

    public String getValue()
    {
      return this.mValue;
    }

    public boolean hasPrimary()
    {
      return this.zzauX.contains(Integer.valueOf(2));
    }

    public boolean hasValue()
    {
      return this.zzauX.contains(Integer.valueOf(3));
    }

    public int hashCode()
    {
      Iterator localIterator = zzauW.values().iterator();
      int i = 0;
      zzld.zza localzza;
      if (localIterator.hasNext())
      {
        localzza = (zzld.zza)localIterator.next();
        if (!zza(localzza))
          break label66;
      }
      label66: for (int j = i + localzza.zzjG() + zzb(localzza).hashCode(); ; j = i)
      {
        i = j;
        break;
        return i;
      }
    }

    public boolean isDataValid()
    {
      return true;
    }

    public boolean isPrimary()
    {
      return this.zzawB;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzuf.zza(this, paramParcel, paramInt);
    }

    protected boolean zza(zzld.zza paramzza)
    {
      return this.zzauX.contains(Integer.valueOf(paramzza.zzjG()));
    }

    protected Object zzb(zzld.zza paramzza)
    {
      switch (paramzza.zzjG())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + paramzza.zzjG());
      case 2:
        return Boolean.valueOf(this.zzawB);
      case 3:
      }
      return this.mValue;
    }

    public HashMap<String, zzld.zza<?, ?>> zzsb()
    {
      return zzauW;
    }

    public zzg zzsn()
    {
      return this;
    }
  }

  public static final class zzh extends zzle
    implements Person.Urls
  {
    public static final zzug CREATOR = new zzug();
    private static final HashMap<String, zzld.zza<?, ?>> zzauW = new HashMap();
    String mValue;
    final int zzFG;
    int zzJp;
    final Set<Integer> zzauX;
    String zzawC;
    private final int zzawD = 4;

    static
    {
      zzauW.put("label", zzld.zza.zzl("label", 5));
      zzauW.put("type", zzld.zza.zza("type", 6, new zzla().zzh("home", 0).zzh("work", 1).zzh("blog", 2).zzh("profile", 3).zzh("other", 4).zzh("otherProfile", 5).zzh("contributor", 6).zzh("website", 7), false));
      zzauW.put("value", zzld.zza.zzl("value", 4));
    }

    public zzh()
    {
      this.zzFG = 1;
      this.zzauX = new HashSet();
    }

    zzh(Set<Integer> paramSet, int paramInt1, String paramString1, int paramInt2, String paramString2, int paramInt3)
    {
      this.zzauX = paramSet;
      this.zzFG = paramInt1;
      this.zzawC = paramString1;
      this.zzJp = paramInt2;
      this.mValue = paramString2;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zzh))
        return false;
      if (this == paramObject)
        return true;
      zzh localzzh = (zzh)paramObject;
      Iterator localIterator = zzauW.values().iterator();
      while (localIterator.hasNext())
      {
        zzld.zza localzza = (zzld.zza)localIterator.next();
        if (zza(localzza))
        {
          if (localzzh.zza(localzza))
          {
            if (!zzb(localzza).equals(localzzh.zzb(localzza)))
              return false;
          }
          else
            return false;
        }
        else if (localzzh.zza(localzza))
          return false;
      }
      return true;
    }

    public String getLabel()
    {
      return this.zzawC;
    }

    public int getType()
    {
      return this.zzJp;
    }

    public String getValue()
    {
      return this.mValue;
    }

    public boolean hasLabel()
    {
      return this.zzauX.contains(Integer.valueOf(5));
    }

    public boolean hasType()
    {
      return this.zzauX.contains(Integer.valueOf(6));
    }

    public boolean hasValue()
    {
      return this.zzauX.contains(Integer.valueOf(4));
    }

    public int hashCode()
    {
      Iterator localIterator = zzauW.values().iterator();
      int i = 0;
      zzld.zza localzza;
      if (localIterator.hasNext())
      {
        localzza = (zzld.zza)localIterator.next();
        if (!zza(localzza))
          break label66;
      }
      label66: for (int j = i + localzza.zzjG() + zzb(localzza).hashCode(); ; j = i)
      {
        i = j;
        break;
        return i;
      }
    }

    public boolean isDataValid()
    {
      return true;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzug.zza(this, paramParcel, paramInt);
    }

    protected boolean zza(zzld.zza paramzza)
    {
      return this.zzauX.contains(Integer.valueOf(paramzza.zzjG()));
    }

    protected Object zzb(zzld.zza paramzza)
    {
      switch (paramzza.zzjG())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + paramzza.zzjG());
      case 5:
        return this.zzawC;
      case 6:
        return Integer.valueOf(this.zzJp);
      case 4:
      }
      return this.mValue;
    }

    public HashMap<String, zzld.zza<?, ?>> zzsb()
    {
      return zzauW;
    }

    @Deprecated
    public int zzso()
    {
      return 4;
    }

    public zzh zzsp()
    {
      return this;
    }
  }
}