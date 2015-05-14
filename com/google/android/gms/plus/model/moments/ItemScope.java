package com.google.android.gms.plus.model.moments;

import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.internal.zztr;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public abstract interface ItemScope extends Freezable<ItemScope>
{
  public abstract ItemScope getAbout();

  public abstract List<String> getAdditionalName();

  public abstract ItemScope getAddress();

  public abstract String getAddressCountry();

  public abstract String getAddressLocality();

  public abstract String getAddressRegion();

  public abstract List<ItemScope> getAssociated_media();

  public abstract int getAttendeeCount();

  public abstract List<ItemScope> getAttendees();

  public abstract ItemScope getAudio();

  public abstract List<ItemScope> getAuthor();

  public abstract String getBestRating();

  public abstract String getBirthDate();

  public abstract ItemScope getByArtist();

  public abstract String getCaption();

  public abstract String getContentSize();

  public abstract String getContentUrl();

  public abstract List<ItemScope> getContributor();

  public abstract String getDateCreated();

  public abstract String getDateModified();

  public abstract String getDatePublished();

  public abstract String getDescription();

  public abstract String getDuration();

  public abstract String getEmbedUrl();

  public abstract String getEndDate();

  public abstract String getFamilyName();

  public abstract String getGender();

  public abstract ItemScope getGeo();

  public abstract String getGivenName();

  public abstract String getHeight();

  public abstract String getId();

  public abstract String getImage();

  public abstract ItemScope getInAlbum();

  public abstract double getLatitude();

  public abstract ItemScope getLocation();

  public abstract double getLongitude();

  public abstract String getName();

  public abstract ItemScope getPartOfTVSeries();

  public abstract List<ItemScope> getPerformers();

  public abstract String getPlayerType();

  public abstract String getPostOfficeBoxNumber();

  public abstract String getPostalCode();

  public abstract String getRatingValue();

  public abstract ItemScope getReviewRating();

  public abstract String getStartDate();

  public abstract String getStreetAddress();

  public abstract String getText();

  public abstract ItemScope getThumbnail();

  public abstract String getThumbnailUrl();

  public abstract String getTickerSymbol();

  public abstract String getType();

  public abstract String getUrl();

  public abstract String getWidth();

  public abstract String getWorstRating();

  public abstract boolean hasAbout();

  public abstract boolean hasAdditionalName();

  public abstract boolean hasAddress();

  public abstract boolean hasAddressCountry();

  public abstract boolean hasAddressLocality();

  public abstract boolean hasAddressRegion();

  public abstract boolean hasAssociated_media();

  public abstract boolean hasAttendeeCount();

  public abstract boolean hasAttendees();

  public abstract boolean hasAudio();

  public abstract boolean hasAuthor();

  public abstract boolean hasBestRating();

  public abstract boolean hasBirthDate();

  public abstract boolean hasByArtist();

  public abstract boolean hasCaption();

  public abstract boolean hasContentSize();

  public abstract boolean hasContentUrl();

  public abstract boolean hasContributor();

  public abstract boolean hasDateCreated();

  public abstract boolean hasDateModified();

  public abstract boolean hasDatePublished();

  public abstract boolean hasDescription();

  public abstract boolean hasDuration();

  public abstract boolean hasEmbedUrl();

  public abstract boolean hasEndDate();

  public abstract boolean hasFamilyName();

  public abstract boolean hasGender();

  public abstract boolean hasGeo();

  public abstract boolean hasGivenName();

  public abstract boolean hasHeight();

  public abstract boolean hasId();

  public abstract boolean hasImage();

  public abstract boolean hasInAlbum();

  public abstract boolean hasLatitude();

  public abstract boolean hasLocation();

  public abstract boolean hasLongitude();

  public abstract boolean hasName();

  public abstract boolean hasPartOfTVSeries();

  public abstract boolean hasPerformers();

  public abstract boolean hasPlayerType();

  public abstract boolean hasPostOfficeBoxNumber();

  public abstract boolean hasPostalCode();

  public abstract boolean hasRatingValue();

  public abstract boolean hasReviewRating();

  public abstract boolean hasStartDate();

  public abstract boolean hasStreetAddress();

  public abstract boolean hasText();

  public abstract boolean hasThumbnail();

  public abstract boolean hasThumbnailUrl();

  public abstract boolean hasTickerSymbol();

  public abstract boolean hasType();

  public abstract boolean hasUrl();

  public abstract boolean hasWidth();

  public abstract boolean hasWorstRating();

  public static class Builder
  {
    private String mName;
    private String zzFA;
    private String zzZO;
    private double zzalQ;
    private double zzalR;
    private final Set<Integer> zzauX = new HashSet();
    private zztr zzauY;
    private List<String> zzauZ;
    private String zzavA;
    private zztr zzavB;
    private zztr zzavC;
    private zztr zzavD;
    private List<zztr> zzavE;
    private String zzavF;
    private String zzavG;
    private String zzavH;
    private String zzavI;
    private zztr zzavJ;
    private String zzavK;
    private String zzavL;
    private String zzavM;
    private zztr zzavN;
    private String zzavO;
    private String zzavP;
    private String zzavQ;
    private String zzavR;
    private zztr zzava;
    private String zzavb;
    private String zzavc;
    private String zzavd;
    private List<zztr> zzave;
    private int zzavf;
    private List<zztr> zzavg;
    private zztr zzavh;
    private List<zztr> zzavi;
    private String zzavj;
    private String zzavk;
    private zztr zzavl;
    private String zzavm;
    private String zzavn;
    private List<zztr> zzavo;
    private String zzavp;
    private String zzavq;
    private String zzavr;
    private String zzavs;
    private String zzavt;
    private String zzavu;
    private String zzavv;
    private String zzavw;
    private zztr zzavx;
    private String zzavy;
    private String zzavz;
    private String zzpn;
    private String zzxV;
    private String zzxX;

    public ItemScope build()
    {
      return new zztr(this.zzauX, this.zzauY, this.zzauZ, this.zzava, this.zzavb, this.zzavc, this.zzavd, this.zzave, this.zzavf, this.zzavg, this.zzavh, this.zzavi, this.zzavj, this.zzavk, this.zzavl, this.zzavm, this.zzavn, this.zzpn, this.zzavo, this.zzavp, this.zzavq, this.zzavr, this.zzZO, this.zzavs, this.zzavt, this.zzavu, this.zzavv, this.zzavw, this.zzavx, this.zzavy, this.zzavz, this.zzFA, this.zzavA, this.zzavB, this.zzalQ, this.zzavC, this.zzalR, this.mName, this.zzavD, this.zzavE, this.zzavF, this.zzavG, this.zzavH, this.zzavI, this.zzavJ, this.zzavK, this.zzavL, this.zzavM, this.zzavN, this.zzavO, this.zzavP, this.zzxV, this.zzxX, this.zzavQ, this.zzavR);
    }

    public Builder setAbout(ItemScope paramItemScope)
    {
      this.zzauY = ((zztr)paramItemScope);
      this.zzauX.add(Integer.valueOf(2));
      return this;
    }

    public Builder setAdditionalName(List<String> paramList)
    {
      this.zzauZ = paramList;
      this.zzauX.add(Integer.valueOf(3));
      return this;
    }

    public Builder setAddress(ItemScope paramItemScope)
    {
      this.zzava = ((zztr)paramItemScope);
      this.zzauX.add(Integer.valueOf(4));
      return this;
    }

    public Builder setAddressCountry(String paramString)
    {
      this.zzavb = paramString;
      this.zzauX.add(Integer.valueOf(5));
      return this;
    }

    public Builder setAddressLocality(String paramString)
    {
      this.zzavc = paramString;
      this.zzauX.add(Integer.valueOf(6));
      return this;
    }

    public Builder setAddressRegion(String paramString)
    {
      this.zzavd = paramString;
      this.zzauX.add(Integer.valueOf(7));
      return this;
    }

    public Builder setAssociated_media(List<ItemScope> paramList)
    {
      this.zzave = paramList;
      this.zzauX.add(Integer.valueOf(8));
      return this;
    }

    public Builder setAttendeeCount(int paramInt)
    {
      this.zzavf = paramInt;
      this.zzauX.add(Integer.valueOf(9));
      return this;
    }

    public Builder setAttendees(List<ItemScope> paramList)
    {
      this.zzavg = paramList;
      this.zzauX.add(Integer.valueOf(10));
      return this;
    }

    public Builder setAudio(ItemScope paramItemScope)
    {
      this.zzavh = ((zztr)paramItemScope);
      this.zzauX.add(Integer.valueOf(11));
      return this;
    }

    public Builder setAuthor(List<ItemScope> paramList)
    {
      this.zzavi = paramList;
      this.zzauX.add(Integer.valueOf(12));
      return this;
    }

    public Builder setBestRating(String paramString)
    {
      this.zzavj = paramString;
      this.zzauX.add(Integer.valueOf(13));
      return this;
    }

    public Builder setBirthDate(String paramString)
    {
      this.zzavk = paramString;
      this.zzauX.add(Integer.valueOf(14));
      return this;
    }

    public Builder setByArtist(ItemScope paramItemScope)
    {
      this.zzavl = ((zztr)paramItemScope);
      this.zzauX.add(Integer.valueOf(15));
      return this;
    }

    public Builder setCaption(String paramString)
    {
      this.zzavm = paramString;
      this.zzauX.add(Integer.valueOf(16));
      return this;
    }

    public Builder setContentSize(String paramString)
    {
      this.zzavn = paramString;
      this.zzauX.add(Integer.valueOf(17));
      return this;
    }

    public Builder setContentUrl(String paramString)
    {
      this.zzpn = paramString;
      this.zzauX.add(Integer.valueOf(18));
      return this;
    }

    public Builder setContributor(List<ItemScope> paramList)
    {
      this.zzavo = paramList;
      this.zzauX.add(Integer.valueOf(19));
      return this;
    }

    public Builder setDateCreated(String paramString)
    {
      this.zzavp = paramString;
      this.zzauX.add(Integer.valueOf(20));
      return this;
    }

    public Builder setDateModified(String paramString)
    {
      this.zzavq = paramString;
      this.zzauX.add(Integer.valueOf(21));
      return this;
    }

    public Builder setDatePublished(String paramString)
    {
      this.zzavr = paramString;
      this.zzauX.add(Integer.valueOf(22));
      return this;
    }

    public Builder setDescription(String paramString)
    {
      this.zzZO = paramString;
      this.zzauX.add(Integer.valueOf(23));
      return this;
    }

    public Builder setDuration(String paramString)
    {
      this.zzavs = paramString;
      this.zzauX.add(Integer.valueOf(24));
      return this;
    }

    public Builder setEmbedUrl(String paramString)
    {
      this.zzavt = paramString;
      this.zzauX.add(Integer.valueOf(25));
      return this;
    }

    public Builder setEndDate(String paramString)
    {
      this.zzavu = paramString;
      this.zzauX.add(Integer.valueOf(26));
      return this;
    }

    public Builder setFamilyName(String paramString)
    {
      this.zzavv = paramString;
      this.zzauX.add(Integer.valueOf(27));
      return this;
    }

    public Builder setGender(String paramString)
    {
      this.zzavw = paramString;
      this.zzauX.add(Integer.valueOf(28));
      return this;
    }

    public Builder setGeo(ItemScope paramItemScope)
    {
      this.zzavx = ((zztr)paramItemScope);
      this.zzauX.add(Integer.valueOf(29));
      return this;
    }

    public Builder setGivenName(String paramString)
    {
      this.zzavy = paramString;
      this.zzauX.add(Integer.valueOf(30));
      return this;
    }

    public Builder setHeight(String paramString)
    {
      this.zzavz = paramString;
      this.zzauX.add(Integer.valueOf(31));
      return this;
    }

    public Builder setId(String paramString)
    {
      this.zzFA = paramString;
      this.zzauX.add(Integer.valueOf(32));
      return this;
    }

    public Builder setImage(String paramString)
    {
      this.zzavA = paramString;
      this.zzauX.add(Integer.valueOf(33));
      return this;
    }

    public Builder setInAlbum(ItemScope paramItemScope)
    {
      this.zzavB = ((zztr)paramItemScope);
      this.zzauX.add(Integer.valueOf(34));
      return this;
    }

    public Builder setLatitude(double paramDouble)
    {
      this.zzalQ = paramDouble;
      this.zzauX.add(Integer.valueOf(36));
      return this;
    }

    public Builder setLocation(ItemScope paramItemScope)
    {
      this.zzavC = ((zztr)paramItemScope);
      this.zzauX.add(Integer.valueOf(37));
      return this;
    }

    public Builder setLongitude(double paramDouble)
    {
      this.zzalR = paramDouble;
      this.zzauX.add(Integer.valueOf(38));
      return this;
    }

    public Builder setName(String paramString)
    {
      this.mName = paramString;
      this.zzauX.add(Integer.valueOf(39));
      return this;
    }

    public Builder setPartOfTVSeries(ItemScope paramItemScope)
    {
      this.zzavD = ((zztr)paramItemScope);
      this.zzauX.add(Integer.valueOf(40));
      return this;
    }

    public Builder setPerformers(List<ItemScope> paramList)
    {
      this.zzavE = paramList;
      this.zzauX.add(Integer.valueOf(41));
      return this;
    }

    public Builder setPlayerType(String paramString)
    {
      this.zzavF = paramString;
      this.zzauX.add(Integer.valueOf(42));
      return this;
    }

    public Builder setPostOfficeBoxNumber(String paramString)
    {
      this.zzavG = paramString;
      this.zzauX.add(Integer.valueOf(43));
      return this;
    }

    public Builder setPostalCode(String paramString)
    {
      this.zzavH = paramString;
      this.zzauX.add(Integer.valueOf(44));
      return this;
    }

    public Builder setRatingValue(String paramString)
    {
      this.zzavI = paramString;
      this.zzauX.add(Integer.valueOf(45));
      return this;
    }

    public Builder setReviewRating(ItemScope paramItemScope)
    {
      this.zzavJ = ((zztr)paramItemScope);
      this.zzauX.add(Integer.valueOf(46));
      return this;
    }

    public Builder setStartDate(String paramString)
    {
      this.zzavK = paramString;
      this.zzauX.add(Integer.valueOf(47));
      return this;
    }

    public Builder setStreetAddress(String paramString)
    {
      this.zzavL = paramString;
      this.zzauX.add(Integer.valueOf(48));
      return this;
    }

    public Builder setText(String paramString)
    {
      this.zzavM = paramString;
      this.zzauX.add(Integer.valueOf(49));
      return this;
    }

    public Builder setThumbnail(ItemScope paramItemScope)
    {
      this.zzavN = ((zztr)paramItemScope);
      this.zzauX.add(Integer.valueOf(50));
      return this;
    }

    public Builder setThumbnailUrl(String paramString)
    {
      this.zzavO = paramString;
      this.zzauX.add(Integer.valueOf(51));
      return this;
    }

    public Builder setTickerSymbol(String paramString)
    {
      this.zzavP = paramString;
      this.zzauX.add(Integer.valueOf(52));
      return this;
    }

    public Builder setType(String paramString)
    {
      this.zzxV = paramString;
      this.zzauX.add(Integer.valueOf(53));
      return this;
    }

    public Builder setUrl(String paramString)
    {
      this.zzxX = paramString;
      this.zzauX.add(Integer.valueOf(54));
      return this;
    }

    public Builder setWidth(String paramString)
    {
      this.zzavQ = paramString;
      this.zzauX.add(Integer.valueOf(55));
      return this;
    }

    public Builder setWorstRating(String paramString)
    {
      this.zzavR = paramString;
      this.zzauX.add(Integer.valueOf(56));
      return this;
    }
  }
}