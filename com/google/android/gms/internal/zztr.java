package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.plus.model.moments.ItemScope;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public final class zztr extends zzle
  implements ItemScope
{
  public static final zzts CREATOR = new zzts();
  private static final HashMap<String, zzld.zza<?, ?>> zzauW = new HashMap();
  String mName;
  String zzFA;
  final int zzFG;
  String zzZO;
  double zzalQ;
  double zzalR;
  final Set<Integer> zzauX;
  zztr zzauY;
  List<String> zzauZ;
  String zzavA;
  zztr zzavB;
  zztr zzavC;
  zztr zzavD;
  List<zztr> zzavE;
  String zzavF;
  String zzavG;
  String zzavH;
  String zzavI;
  zztr zzavJ;
  String zzavK;
  String zzavL;
  String zzavM;
  zztr zzavN;
  String zzavO;
  String zzavP;
  String zzavQ;
  String zzavR;
  zztr zzava;
  String zzavb;
  String zzavc;
  String zzavd;
  List<zztr> zzave;
  int zzavf;
  List<zztr> zzavg;
  zztr zzavh;
  List<zztr> zzavi;
  String zzavj;
  String zzavk;
  zztr zzavl;
  String zzavm;
  String zzavn;
  List<zztr> zzavo;
  String zzavp;
  String zzavq;
  String zzavr;
  String zzavs;
  String zzavt;
  String zzavu;
  String zzavv;
  String zzavw;
  zztr zzavx;
  String zzavy;
  String zzavz;
  String zzpn;
  String zzxV;
  String zzxX;

  static
  {
    zzauW.put("about", zzld.zza.zza("about", 2, zztr.class));
    zzauW.put("additionalName", zzld.zza.zzm("additionalName", 3));
    zzauW.put("address", zzld.zza.zza("address", 4, zztr.class));
    zzauW.put("addressCountry", zzld.zza.zzl("addressCountry", 5));
    zzauW.put("addressLocality", zzld.zza.zzl("addressLocality", 6));
    zzauW.put("addressRegion", zzld.zza.zzl("addressRegion", 7));
    zzauW.put("associated_media", zzld.zza.zzb("associated_media", 8, zztr.class));
    zzauW.put("attendeeCount", zzld.zza.zzi("attendeeCount", 9));
    zzauW.put("attendees", zzld.zza.zzb("attendees", 10, zztr.class));
    zzauW.put("audio", zzld.zza.zza("audio", 11, zztr.class));
    zzauW.put("author", zzld.zza.zzb("author", 12, zztr.class));
    zzauW.put("bestRating", zzld.zza.zzl("bestRating", 13));
    zzauW.put("birthDate", zzld.zza.zzl("birthDate", 14));
    zzauW.put("byArtist", zzld.zza.zza("byArtist", 15, zztr.class));
    zzauW.put("caption", zzld.zza.zzl("caption", 16));
    zzauW.put("contentSize", zzld.zza.zzl("contentSize", 17));
    zzauW.put("contentUrl", zzld.zza.zzl("contentUrl", 18));
    zzauW.put("contributor", zzld.zza.zzb("contributor", 19, zztr.class));
    zzauW.put("dateCreated", zzld.zza.zzl("dateCreated", 20));
    zzauW.put("dateModified", zzld.zza.zzl("dateModified", 21));
    zzauW.put("datePublished", zzld.zza.zzl("datePublished", 22));
    zzauW.put("description", zzld.zza.zzl("description", 23));
    zzauW.put("duration", zzld.zza.zzl("duration", 24));
    zzauW.put("embedUrl", zzld.zza.zzl("embedUrl", 25));
    zzauW.put("endDate", zzld.zza.zzl("endDate", 26));
    zzauW.put("familyName", zzld.zza.zzl("familyName", 27));
    zzauW.put("gender", zzld.zza.zzl("gender", 28));
    zzauW.put("geo", zzld.zza.zza("geo", 29, zztr.class));
    zzauW.put("givenName", zzld.zza.zzl("givenName", 30));
    zzauW.put("height", zzld.zza.zzl("height", 31));
    zzauW.put("id", zzld.zza.zzl("id", 32));
    zzauW.put("image", zzld.zza.zzl("image", 33));
    zzauW.put("inAlbum", zzld.zza.zza("inAlbum", 34, zztr.class));
    zzauW.put("latitude", zzld.zza.zzj("latitude", 36));
    zzauW.put("location", zzld.zza.zza("location", 37, zztr.class));
    zzauW.put("longitude", zzld.zza.zzj("longitude", 38));
    zzauW.put("name", zzld.zza.zzl("name", 39));
    zzauW.put("partOfTVSeries", zzld.zza.zza("partOfTVSeries", 40, zztr.class));
    zzauW.put("performers", zzld.zza.zzb("performers", 41, zztr.class));
    zzauW.put("playerType", zzld.zza.zzl("playerType", 42));
    zzauW.put("postOfficeBoxNumber", zzld.zza.zzl("postOfficeBoxNumber", 43));
    zzauW.put("postalCode", zzld.zza.zzl("postalCode", 44));
    zzauW.put("ratingValue", zzld.zza.zzl("ratingValue", 45));
    zzauW.put("reviewRating", zzld.zza.zza("reviewRating", 46, zztr.class));
    zzauW.put("startDate", zzld.zza.zzl("startDate", 47));
    zzauW.put("streetAddress", zzld.zza.zzl("streetAddress", 48));
    zzauW.put("text", zzld.zza.zzl("text", 49));
    zzauW.put("thumbnail", zzld.zza.zza("thumbnail", 50, zztr.class));
    zzauW.put("thumbnailUrl", zzld.zza.zzl("thumbnailUrl", 51));
    zzauW.put("tickerSymbol", zzld.zza.zzl("tickerSymbol", 52));
    zzauW.put("type", zzld.zza.zzl("type", 53));
    zzauW.put("url", zzld.zza.zzl("url", 54));
    zzauW.put("width", zzld.zza.zzl("width", 55));
    zzauW.put("worstRating", zzld.zza.zzl("worstRating", 56));
  }

  public zztr()
  {
    this.zzFG = 1;
    this.zzauX = new HashSet();
  }

  zztr(Set<Integer> paramSet, int paramInt1, zztr paramzztr1, List<String> paramList, zztr paramzztr2, String paramString1, String paramString2, String paramString3, List<zztr> paramList1, int paramInt2, List<zztr> paramList2, zztr paramzztr3, List<zztr> paramList3, String paramString4, String paramString5, zztr paramzztr4, String paramString6, String paramString7, String paramString8, List<zztr> paramList4, String paramString9, String paramString10, String paramString11, String paramString12, String paramString13, String paramString14, String paramString15, String paramString16, String paramString17, zztr paramzztr5, String paramString18, String paramString19, String paramString20, String paramString21, zztr paramzztr6, double paramDouble1, zztr paramzztr7, double paramDouble2, String paramString22, zztr paramzztr8, List<zztr> paramList5, String paramString23, String paramString24, String paramString25, String paramString26, zztr paramzztr9, String paramString27, String paramString28, String paramString29, zztr paramzztr10, String paramString30, String paramString31, String paramString32, String paramString33, String paramString34, String paramString35)
  {
    this.zzauX = paramSet;
    this.zzFG = paramInt1;
    this.zzauY = paramzztr1;
    this.zzauZ = paramList;
    this.zzava = paramzztr2;
    this.zzavb = paramString1;
    this.zzavc = paramString2;
    this.zzavd = paramString3;
    this.zzave = paramList1;
    this.zzavf = paramInt2;
    this.zzavg = paramList2;
    this.zzavh = paramzztr3;
    this.zzavi = paramList3;
    this.zzavj = paramString4;
    this.zzavk = paramString5;
    this.zzavl = paramzztr4;
    this.zzavm = paramString6;
    this.zzavn = paramString7;
    this.zzpn = paramString8;
    this.zzavo = paramList4;
    this.zzavp = paramString9;
    this.zzavq = paramString10;
    this.zzavr = paramString11;
    this.zzZO = paramString12;
    this.zzavs = paramString13;
    this.zzavt = paramString14;
    this.zzavu = paramString15;
    this.zzavv = paramString16;
    this.zzavw = paramString17;
    this.zzavx = paramzztr5;
    this.zzavy = paramString18;
    this.zzavz = paramString19;
    this.zzFA = paramString20;
    this.zzavA = paramString21;
    this.zzavB = paramzztr6;
    this.zzalQ = paramDouble1;
    this.zzavC = paramzztr7;
    this.zzalR = paramDouble2;
    this.mName = paramString22;
    this.zzavD = paramzztr8;
    this.zzavE = paramList5;
    this.zzavF = paramString23;
    this.zzavG = paramString24;
    this.zzavH = paramString25;
    this.zzavI = paramString26;
    this.zzavJ = paramzztr9;
    this.zzavK = paramString27;
    this.zzavL = paramString28;
    this.zzavM = paramString29;
    this.zzavN = paramzztr10;
    this.zzavO = paramString30;
    this.zzavP = paramString31;
    this.zzxV = paramString32;
    this.zzxX = paramString33;
    this.zzavQ = paramString34;
    this.zzavR = paramString35;
  }

  public zztr(Set<Integer> paramSet, zztr paramzztr1, List<String> paramList, zztr paramzztr2, String paramString1, String paramString2, String paramString3, List<zztr> paramList1, int paramInt, List<zztr> paramList2, zztr paramzztr3, List<zztr> paramList3, String paramString4, String paramString5, zztr paramzztr4, String paramString6, String paramString7, String paramString8, List<zztr> paramList4, String paramString9, String paramString10, String paramString11, String paramString12, String paramString13, String paramString14, String paramString15, String paramString16, String paramString17, zztr paramzztr5, String paramString18, String paramString19, String paramString20, String paramString21, zztr paramzztr6, double paramDouble1, zztr paramzztr7, double paramDouble2, String paramString22, zztr paramzztr8, List<zztr> paramList5, String paramString23, String paramString24, String paramString25, String paramString26, zztr paramzztr9, String paramString27, String paramString28, String paramString29, zztr paramzztr10, String paramString30, String paramString31, String paramString32, String paramString33, String paramString34, String paramString35)
  {
    this.zzauX = paramSet;
    this.zzFG = 1;
    this.zzauY = paramzztr1;
    this.zzauZ = paramList;
    this.zzava = paramzztr2;
    this.zzavb = paramString1;
    this.zzavc = paramString2;
    this.zzavd = paramString3;
    this.zzave = paramList1;
    this.zzavf = paramInt;
    this.zzavg = paramList2;
    this.zzavh = paramzztr3;
    this.zzavi = paramList3;
    this.zzavj = paramString4;
    this.zzavk = paramString5;
    this.zzavl = paramzztr4;
    this.zzavm = paramString6;
    this.zzavn = paramString7;
    this.zzpn = paramString8;
    this.zzavo = paramList4;
    this.zzavp = paramString9;
    this.zzavq = paramString10;
    this.zzavr = paramString11;
    this.zzZO = paramString12;
    this.zzavs = paramString13;
    this.zzavt = paramString14;
    this.zzavu = paramString15;
    this.zzavv = paramString16;
    this.zzavw = paramString17;
    this.zzavx = paramzztr5;
    this.zzavy = paramString18;
    this.zzavz = paramString19;
    this.zzFA = paramString20;
    this.zzavA = paramString21;
    this.zzavB = paramzztr6;
    this.zzalQ = paramDouble1;
    this.zzavC = paramzztr7;
    this.zzalR = paramDouble2;
    this.mName = paramString22;
    this.zzavD = paramzztr8;
    this.zzavE = paramList5;
    this.zzavF = paramString23;
    this.zzavG = paramString24;
    this.zzavH = paramString25;
    this.zzavI = paramString26;
    this.zzavJ = paramzztr9;
    this.zzavK = paramString27;
    this.zzavL = paramString28;
    this.zzavM = paramString29;
    this.zzavN = paramzztr10;
    this.zzavO = paramString30;
    this.zzavP = paramString31;
    this.zzxV = paramString32;
    this.zzxX = paramString33;
    this.zzavQ = paramString34;
    this.zzavR = paramString35;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof zztr))
      return false;
    if (this == paramObject)
      return true;
    zztr localzztr = (zztr)paramObject;
    Iterator localIterator = zzauW.values().iterator();
    while (localIterator.hasNext())
    {
      zzld.zza localzza = (zzld.zza)localIterator.next();
      if (zza(localzza))
      {
        if (localzztr.zza(localzza))
        {
          if (!zzb(localzza).equals(localzztr.zzb(localzza)))
            return false;
        }
        else
          return false;
      }
      else if (localzztr.zza(localzza))
        return false;
    }
    return true;
  }

  public ItemScope getAbout()
  {
    return this.zzauY;
  }

  public List<String> getAdditionalName()
  {
    return this.zzauZ;
  }

  public ItemScope getAddress()
  {
    return this.zzava;
  }

  public String getAddressCountry()
  {
    return this.zzavb;
  }

  public String getAddressLocality()
  {
    return this.zzavc;
  }

  public String getAddressRegion()
  {
    return this.zzavd;
  }

  public List<ItemScope> getAssociated_media()
  {
    return (ArrayList)this.zzave;
  }

  public int getAttendeeCount()
  {
    return this.zzavf;
  }

  public List<ItemScope> getAttendees()
  {
    return (ArrayList)this.zzavg;
  }

  public ItemScope getAudio()
  {
    return this.zzavh;
  }

  public List<ItemScope> getAuthor()
  {
    return (ArrayList)this.zzavi;
  }

  public String getBestRating()
  {
    return this.zzavj;
  }

  public String getBirthDate()
  {
    return this.zzavk;
  }

  public ItemScope getByArtist()
  {
    return this.zzavl;
  }

  public String getCaption()
  {
    return this.zzavm;
  }

  public String getContentSize()
  {
    return this.zzavn;
  }

  public String getContentUrl()
  {
    return this.zzpn;
  }

  public List<ItemScope> getContributor()
  {
    return (ArrayList)this.zzavo;
  }

  public String getDateCreated()
  {
    return this.zzavp;
  }

  public String getDateModified()
  {
    return this.zzavq;
  }

  public String getDatePublished()
  {
    return this.zzavr;
  }

  public String getDescription()
  {
    return this.zzZO;
  }

  public String getDuration()
  {
    return this.zzavs;
  }

  public String getEmbedUrl()
  {
    return this.zzavt;
  }

  public String getEndDate()
  {
    return this.zzavu;
  }

  public String getFamilyName()
  {
    return this.zzavv;
  }

  public String getGender()
  {
    return this.zzavw;
  }

  public ItemScope getGeo()
  {
    return this.zzavx;
  }

  public String getGivenName()
  {
    return this.zzavy;
  }

  public String getHeight()
  {
    return this.zzavz;
  }

  public String getId()
  {
    return this.zzFA;
  }

  public String getImage()
  {
    return this.zzavA;
  }

  public ItemScope getInAlbum()
  {
    return this.zzavB;
  }

  public double getLatitude()
  {
    return this.zzalQ;
  }

  public ItemScope getLocation()
  {
    return this.zzavC;
  }

  public double getLongitude()
  {
    return this.zzalR;
  }

  public String getName()
  {
    return this.mName;
  }

  public ItemScope getPartOfTVSeries()
  {
    return this.zzavD;
  }

  public List<ItemScope> getPerformers()
  {
    return (ArrayList)this.zzavE;
  }

  public String getPlayerType()
  {
    return this.zzavF;
  }

  public String getPostOfficeBoxNumber()
  {
    return this.zzavG;
  }

  public String getPostalCode()
  {
    return this.zzavH;
  }

  public String getRatingValue()
  {
    return this.zzavI;
  }

  public ItemScope getReviewRating()
  {
    return this.zzavJ;
  }

  public String getStartDate()
  {
    return this.zzavK;
  }

  public String getStreetAddress()
  {
    return this.zzavL;
  }

  public String getText()
  {
    return this.zzavM;
  }

  public ItemScope getThumbnail()
  {
    return this.zzavN;
  }

  public String getThumbnailUrl()
  {
    return this.zzavO;
  }

  public String getTickerSymbol()
  {
    return this.zzavP;
  }

  public String getType()
  {
    return this.zzxV;
  }

  public String getUrl()
  {
    return this.zzxX;
  }

  public String getWidth()
  {
    return this.zzavQ;
  }

  public String getWorstRating()
  {
    return this.zzavR;
  }

  public boolean hasAbout()
  {
    return this.zzauX.contains(Integer.valueOf(2));
  }

  public boolean hasAdditionalName()
  {
    return this.zzauX.contains(Integer.valueOf(3));
  }

  public boolean hasAddress()
  {
    return this.zzauX.contains(Integer.valueOf(4));
  }

  public boolean hasAddressCountry()
  {
    return this.zzauX.contains(Integer.valueOf(5));
  }

  public boolean hasAddressLocality()
  {
    return this.zzauX.contains(Integer.valueOf(6));
  }

  public boolean hasAddressRegion()
  {
    return this.zzauX.contains(Integer.valueOf(7));
  }

  public boolean hasAssociated_media()
  {
    return this.zzauX.contains(Integer.valueOf(8));
  }

  public boolean hasAttendeeCount()
  {
    return this.zzauX.contains(Integer.valueOf(9));
  }

  public boolean hasAttendees()
  {
    return this.zzauX.contains(Integer.valueOf(10));
  }

  public boolean hasAudio()
  {
    return this.zzauX.contains(Integer.valueOf(11));
  }

  public boolean hasAuthor()
  {
    return this.zzauX.contains(Integer.valueOf(12));
  }

  public boolean hasBestRating()
  {
    return this.zzauX.contains(Integer.valueOf(13));
  }

  public boolean hasBirthDate()
  {
    return this.zzauX.contains(Integer.valueOf(14));
  }

  public boolean hasByArtist()
  {
    return this.zzauX.contains(Integer.valueOf(15));
  }

  public boolean hasCaption()
  {
    return this.zzauX.contains(Integer.valueOf(16));
  }

  public boolean hasContentSize()
  {
    return this.zzauX.contains(Integer.valueOf(17));
  }

  public boolean hasContentUrl()
  {
    return this.zzauX.contains(Integer.valueOf(18));
  }

  public boolean hasContributor()
  {
    return this.zzauX.contains(Integer.valueOf(19));
  }

  public boolean hasDateCreated()
  {
    return this.zzauX.contains(Integer.valueOf(20));
  }

  public boolean hasDateModified()
  {
    return this.zzauX.contains(Integer.valueOf(21));
  }

  public boolean hasDatePublished()
  {
    return this.zzauX.contains(Integer.valueOf(22));
  }

  public boolean hasDescription()
  {
    return this.zzauX.contains(Integer.valueOf(23));
  }

  public boolean hasDuration()
  {
    return this.zzauX.contains(Integer.valueOf(24));
  }

  public boolean hasEmbedUrl()
  {
    return this.zzauX.contains(Integer.valueOf(25));
  }

  public boolean hasEndDate()
  {
    return this.zzauX.contains(Integer.valueOf(26));
  }

  public boolean hasFamilyName()
  {
    return this.zzauX.contains(Integer.valueOf(27));
  }

  public boolean hasGender()
  {
    return this.zzauX.contains(Integer.valueOf(28));
  }

  public boolean hasGeo()
  {
    return this.zzauX.contains(Integer.valueOf(29));
  }

  public boolean hasGivenName()
  {
    return this.zzauX.contains(Integer.valueOf(30));
  }

  public boolean hasHeight()
  {
    return this.zzauX.contains(Integer.valueOf(31));
  }

  public boolean hasId()
  {
    return this.zzauX.contains(Integer.valueOf(32));
  }

  public boolean hasImage()
  {
    return this.zzauX.contains(Integer.valueOf(33));
  }

  public boolean hasInAlbum()
  {
    return this.zzauX.contains(Integer.valueOf(34));
  }

  public boolean hasLatitude()
  {
    return this.zzauX.contains(Integer.valueOf(36));
  }

  public boolean hasLocation()
  {
    return this.zzauX.contains(Integer.valueOf(37));
  }

  public boolean hasLongitude()
  {
    return this.zzauX.contains(Integer.valueOf(38));
  }

  public boolean hasName()
  {
    return this.zzauX.contains(Integer.valueOf(39));
  }

  public boolean hasPartOfTVSeries()
  {
    return this.zzauX.contains(Integer.valueOf(40));
  }

  public boolean hasPerformers()
  {
    return this.zzauX.contains(Integer.valueOf(41));
  }

  public boolean hasPlayerType()
  {
    return this.zzauX.contains(Integer.valueOf(42));
  }

  public boolean hasPostOfficeBoxNumber()
  {
    return this.zzauX.contains(Integer.valueOf(43));
  }

  public boolean hasPostalCode()
  {
    return this.zzauX.contains(Integer.valueOf(44));
  }

  public boolean hasRatingValue()
  {
    return this.zzauX.contains(Integer.valueOf(45));
  }

  public boolean hasReviewRating()
  {
    return this.zzauX.contains(Integer.valueOf(46));
  }

  public boolean hasStartDate()
  {
    return this.zzauX.contains(Integer.valueOf(47));
  }

  public boolean hasStreetAddress()
  {
    return this.zzauX.contains(Integer.valueOf(48));
  }

  public boolean hasText()
  {
    return this.zzauX.contains(Integer.valueOf(49));
  }

  public boolean hasThumbnail()
  {
    return this.zzauX.contains(Integer.valueOf(50));
  }

  public boolean hasThumbnailUrl()
  {
    return this.zzauX.contains(Integer.valueOf(51));
  }

  public boolean hasTickerSymbol()
  {
    return this.zzauX.contains(Integer.valueOf(52));
  }

  public boolean hasType()
  {
    return this.zzauX.contains(Integer.valueOf(53));
  }

  public boolean hasUrl()
  {
    return this.zzauX.contains(Integer.valueOf(54));
  }

  public boolean hasWidth()
  {
    return this.zzauX.contains(Integer.valueOf(55));
  }

  public boolean hasWorstRating()
  {
    return this.zzauX.contains(Integer.valueOf(56));
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
    zzts.zza(this, paramParcel, paramInt);
  }

  protected boolean zza(zzld.zza paramzza)
  {
    return this.zzauX.contains(Integer.valueOf(paramzza.zzjG()));
  }

  protected Object zzb(zzld.zza paramzza)
  {
    switch (paramzza.zzjG())
    {
    case 35:
    default:
      throw new IllegalStateException("Unknown safe parcelable id=" + paramzza.zzjG());
    case 2:
      return this.zzauY;
    case 3:
      return this.zzauZ;
    case 4:
      return this.zzava;
    case 5:
      return this.zzavb;
    case 6:
      return this.zzavc;
    case 7:
      return this.zzavd;
    case 8:
      return this.zzave;
    case 9:
      return Integer.valueOf(this.zzavf);
    case 10:
      return this.zzavg;
    case 11:
      return this.zzavh;
    case 12:
      return this.zzavi;
    case 13:
      return this.zzavj;
    case 14:
      return this.zzavk;
    case 15:
      return this.zzavl;
    case 16:
      return this.zzavm;
    case 17:
      return this.zzavn;
    case 18:
      return this.zzpn;
    case 19:
      return this.zzavo;
    case 20:
      return this.zzavp;
    case 21:
      return this.zzavq;
    case 22:
      return this.zzavr;
    case 23:
      return this.zzZO;
    case 24:
      return this.zzavs;
    case 25:
      return this.zzavt;
    case 26:
      return this.zzavu;
    case 27:
      return this.zzavv;
    case 28:
      return this.zzavw;
    case 29:
      return this.zzavx;
    case 30:
      return this.zzavy;
    case 31:
      return this.zzavz;
    case 32:
      return this.zzFA;
    case 33:
      return this.zzavA;
    case 34:
      return this.zzavB;
    case 36:
      return Double.valueOf(this.zzalQ);
    case 37:
      return this.zzavC;
    case 38:
      return Double.valueOf(this.zzalR);
    case 39:
      return this.mName;
    case 40:
      return this.zzavD;
    case 41:
      return this.zzavE;
    case 42:
      return this.zzavF;
    case 43:
      return this.zzavG;
    case 44:
      return this.zzavH;
    case 45:
      return this.zzavI;
    case 46:
      return this.zzavJ;
    case 47:
      return this.zzavK;
    case 48:
      return this.zzavL;
    case 49:
      return this.zzavM;
    case 50:
      return this.zzavN;
    case 51:
      return this.zzavO;
    case 52:
      return this.zzavP;
    case 53:
      return this.zzxV;
    case 54:
      return this.zzxX;
    case 55:
      return this.zzavQ;
    case 56:
    }
    return this.zzavR;
  }

  public HashMap<String, zzld.zza<?, ?>> zzsb()
  {
    return zzauW;
  }

  public zztr zzsc()
  {
    return this;
  }
}