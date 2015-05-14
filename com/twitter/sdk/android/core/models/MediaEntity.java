package com.twitter.sdk.android.core.models;

import com.google.gson.annotations.SerializedName;

public class MediaEntity extends UrlEntity
{

  @SerializedName("id")
  public final long id;

  @SerializedName("id_str")
  public final String idStr;

  @SerializedName("media_url")
  public final String mediaUrl;

  @SerializedName("media_url_https")
  public final String mediaUrlHttps;

  @SerializedName("sizes")
  public final Sizes sizes;

  @SerializedName("source_status_id")
  public final long sourceStatusId;

  @SerializedName("source_status_id_str")
  public final String sourceStatusIdStr;

  @SerializedName("type")
  public final String type;

  public MediaEntity(String paramString1, String paramString2, String paramString3, int paramInt1, int paramInt2, long paramLong1, String paramString4, String paramString5, String paramString6, Sizes paramSizes, long paramLong2, String paramString7, String paramString8)
  {
    super(paramString1, paramString2, paramString3, paramInt1, paramInt2);
    this.id = paramLong1;
    this.idStr = paramString4;
    this.mediaUrl = paramString5;
    this.mediaUrlHttps = paramString6;
    this.sizes = paramSizes;
    this.sourceStatusId = paramLong2;
    this.sourceStatusIdStr = paramString7;
    this.type = paramString8;
  }

  public static class Size
  {

    @SerializedName("h")
    public final int h;

    @SerializedName("resize")
    public final String resize;

    @SerializedName("w")
    public final int w;

    public Size(int paramInt1, int paramInt2, String paramString)
    {
      this.w = paramInt1;
      this.h = paramInt2;
      this.resize = paramString;
    }
  }

  public static class Sizes
  {

    @SerializedName("large")
    public final MediaEntity.Size large;

    @SerializedName("medium")
    public final MediaEntity.Size medium;

    @SerializedName("small")
    public final MediaEntity.Size small;

    @SerializedName("thumb")
    public final MediaEntity.Size thumb;

    public Sizes(MediaEntity.Size paramSize1, MediaEntity.Size paramSize2, MediaEntity.Size paramSize3, MediaEntity.Size paramSize4)
    {
      this.thumb = paramSize1;
      this.small = paramSize2;
      this.medium = paramSize3;
      this.large = paramSize4;
    }
  }
}