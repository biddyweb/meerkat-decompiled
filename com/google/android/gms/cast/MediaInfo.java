package com.google.android.gms.cast;

import android.text.TextUtils;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.internal.zzjv;
import com.google.android.gms.internal.zzma;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class MediaInfo
{
  public static final int STREAM_TYPE_BUFFERED = 1;
  public static final int STREAM_TYPE_INVALID = -1;
  public static final int STREAM_TYPE_LIVE = 2;
  public static final int STREAM_TYPE_NONE = 0;
  public static final long UNKNOWN_DURATION = -1L;
  private final String zzIQ;
  private int zzIR;
  private String zzIS;
  private MediaMetadata zzIT;
  private long zzIU;
  private List<MediaTrack> zzIV;
  private TextTrackStyle zzIW;
  private JSONObject zzIX;

  MediaInfo(String paramString)
    throws IllegalArgumentException
  {
    if (TextUtils.isEmpty(paramString))
      throw new IllegalArgumentException("content ID cannot be null or empty");
    this.zzIQ = paramString;
    this.zzIR = -1;
    this.zzIU = -1L;
  }

  MediaInfo(JSONObject paramJSONObject)
    throws JSONException
  {
    this.zzIQ = paramJSONObject.getString("contentId");
    String str = paramJSONObject.getString("streamType");
    if ("NONE".equals(str))
      this.zzIR = 0;
    while (true)
    {
      this.zzIS = paramJSONObject.getString("contentType");
      if (paramJSONObject.has("metadata"))
      {
        JSONObject localJSONObject2 = paramJSONObject.getJSONObject("metadata");
        this.zzIT = new MediaMetadata(localJSONObject2.getInt("metadataType"));
        this.zzIT.zzd(localJSONObject2);
      }
      this.zzIU = -1L;
      if ((paramJSONObject.has("duration")) && (!paramJSONObject.isNull("duration")))
      {
        double d = paramJSONObject.optDouble("duration", 0.0D);
        if ((!Double.isNaN(d)) && (!Double.isInfinite(d)))
          this.zzIU = zzjv.zzb(d);
      }
      if (!paramJSONObject.has("tracks"))
        break;
      this.zzIV = new ArrayList();
      JSONArray localJSONArray = paramJSONObject.getJSONArray("tracks");
      while (i < localJSONArray.length())
      {
        MediaTrack localMediaTrack = new MediaTrack(localJSONArray.getJSONObject(i));
        this.zzIV.add(localMediaTrack);
        i++;
      }
      if ("BUFFERED".equals(str))
        this.zzIR = 1;
      else if ("LIVE".equals(str))
        this.zzIR = 2;
      else
        this.zzIR = -1;
    }
    this.zzIV = null;
    TextTrackStyle localTextTrackStyle;
    if (paramJSONObject.has("textTrackStyle"))
    {
      JSONObject localJSONObject1 = paramJSONObject.getJSONObject("textTrackStyle");
      localTextTrackStyle = new TextTrackStyle();
      localTextTrackStyle.zzd(localJSONObject1);
    }
    for (this.zzIW = localTextTrackStyle; ; this.zzIW = null)
    {
      this.zzIX = paramJSONObject.optJSONObject("customData");
      return;
    }
  }

  public boolean equals(Object paramObject)
  {
    boolean bool1 = true;
    boolean bool3;
    if (this == paramObject)
      bool3 = bool1;
    MediaInfo localMediaInfo;
    boolean bool4;
    boolean bool5;
    label52: boolean bool6;
    do
    {
      do
      {
        boolean bool2;
        do
        {
          return bool3;
          bool2 = paramObject instanceof MediaInfo;
          bool3 = false;
        }
        while (!bool2);
        localMediaInfo = (MediaInfo)paramObject;
        if (this.zzIX != null)
          break;
        bool4 = bool1;
        if (localMediaInfo.zzIX != null)
          break label177;
        bool5 = bool1;
        bool3 = false;
      }
      while (bool4 != bool5);
      if ((this.zzIX == null) || (localMediaInfo.zzIX == null))
        break;
      bool6 = zzma.zzd(this.zzIX, localMediaInfo.zzIX);
      bool3 = false;
    }
    while (!bool6);
    if ((zzjv.zza(this.zzIQ, localMediaInfo.zzIQ)) && (this.zzIR == localMediaInfo.zzIR) && (zzjv.zza(this.zzIS, localMediaInfo.zzIS)) && (zzjv.zza(this.zzIT, localMediaInfo.zzIT)) && (this.zzIU == localMediaInfo.zzIU));
    while (true)
    {
      return bool1;
      bool4 = false;
      break;
      label177: bool5 = false;
      break label52;
      bool1 = false;
    }
  }

  public String getContentId()
  {
    return this.zzIQ;
  }

  public String getContentType()
  {
    return this.zzIS;
  }

  public JSONObject getCustomData()
  {
    return this.zzIX;
  }

  public List<MediaTrack> getMediaTracks()
  {
    return this.zzIV;
  }

  public MediaMetadata getMetadata()
  {
    return this.zzIT;
  }

  public long getStreamDuration()
  {
    return this.zzIU;
  }

  public int getStreamType()
  {
    return this.zzIR;
  }

  public TextTrackStyle getTextTrackStyle()
  {
    return this.zzIW;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[6];
    arrayOfObject[0] = this.zzIQ;
    arrayOfObject[1] = Integer.valueOf(this.zzIR);
    arrayOfObject[2] = this.zzIS;
    arrayOfObject[3] = this.zzIT;
    arrayOfObject[4] = Long.valueOf(this.zzIU);
    arrayOfObject[5] = String.valueOf(this.zzIX);
    return zzw.hashCode(arrayOfObject);
  }

  void setContentType(String paramString)
    throws IllegalArgumentException
  {
    if (TextUtils.isEmpty(paramString))
      throw new IllegalArgumentException("content type cannot be null or empty");
    this.zzIS = paramString;
  }

  void setCustomData(JSONObject paramJSONObject)
  {
    this.zzIX = paramJSONObject;
  }

  void setStreamType(int paramInt)
    throws IllegalArgumentException
  {
    if ((paramInt < -1) || (paramInt > 2))
      throw new IllegalArgumentException("invalid stream type");
    this.zzIR = paramInt;
  }

  public void setTextTrackStyle(TextTrackStyle paramTextTrackStyle)
  {
    this.zzIW = paramTextTrackStyle;
  }

  public JSONObject toJson()
  {
    JSONObject localJSONObject = new JSONObject();
    while (true)
    {
      try
      {
        localJSONObject.put("contentId", this.zzIQ);
        switch (this.zzIR)
        {
        default:
          localJSONObject.put("streamType", localObject);
          if (this.zzIS != null)
            localJSONObject.put("contentType", this.zzIS);
          if (this.zzIT != null)
            localJSONObject.put("metadata", this.zzIT.toJson());
          JSONArray localJSONArray;
          if (this.zzIU <= -1L)
          {
            localJSONObject.put("duration", JSONObject.NULL);
            if (this.zzIV == null)
              continue;
            localJSONArray = new JSONArray();
            Iterator localIterator = this.zzIV.iterator();
            if (localIterator.hasNext())
            {
              localJSONArray.put(((MediaTrack)localIterator.next()).toJson());
              continue;
            }
          }
          else
          {
            localJSONObject.put("duration", zzjv.zzp(this.zzIU));
            continue;
          }
          localJSONObject.put("tracks", localJSONArray);
          if (this.zzIW != null)
            localJSONObject.put("textTrackStyle", this.zzIW.toJson());
          if (this.zzIX != null)
          {
            localJSONObject.put("customData", this.zzIX);
            return localJSONObject;
            localObject = "NONE";
            continue;
          }
          break;
        case 1:
        case 2:
        }
      }
      catch (JSONException localJSONException)
      {
      }
      return localJSONObject;
      Object localObject = "BUFFERED";
      continue;
      localObject = "LIVE";
    }
  }

  void zza(MediaMetadata paramMediaMetadata)
  {
    this.zzIT = paramMediaMetadata;
  }

  void zzg(List<MediaTrack> paramList)
  {
    this.zzIV = paramList;
  }

  void zzhi()
    throws IllegalArgumentException
  {
    if (TextUtils.isEmpty(this.zzIQ))
      throw new IllegalArgumentException("content ID cannot be null or empty");
    if (TextUtils.isEmpty(this.zzIS))
      throw new IllegalArgumentException("content type cannot be null or empty");
    if (this.zzIR == -1)
      throw new IllegalArgumentException("a valid stream type must be specified");
  }

  void zzm(long paramLong)
    throws IllegalArgumentException
  {
    if ((paramLong < 0L) && (paramLong != -1L))
      throw new IllegalArgumentException("Invalid stream duration");
    this.zzIU = paramLong;
  }

  public static class Builder
  {
    private final MediaInfo zzIY;

    public Builder(String paramString)
      throws IllegalArgumentException
    {
      if (TextUtils.isEmpty(paramString))
        throw new IllegalArgumentException("Content ID cannot be empty");
      this.zzIY = new MediaInfo(paramString);
    }

    public MediaInfo build()
      throws IllegalArgumentException
    {
      this.zzIY.zzhi();
      return this.zzIY;
    }

    public Builder setContentType(String paramString)
      throws IllegalArgumentException
    {
      this.zzIY.setContentType(paramString);
      return this;
    }

    public Builder setCustomData(JSONObject paramJSONObject)
    {
      this.zzIY.setCustomData(paramJSONObject);
      return this;
    }

    public Builder setMediaTracks(List<MediaTrack> paramList)
    {
      this.zzIY.zzg(paramList);
      return this;
    }

    public Builder setMetadata(MediaMetadata paramMediaMetadata)
    {
      this.zzIY.zza(paramMediaMetadata);
      return this;
    }

    public Builder setStreamDuration(long paramLong)
      throws IllegalArgumentException
    {
      this.zzIY.zzm(paramLong);
      return this;
    }

    public Builder setStreamType(int paramInt)
      throws IllegalArgumentException
    {
      this.zzIY.setStreamType(paramInt);
      return this;
    }

    public Builder setTextTrackStyle(TextTrackStyle paramTextTrackStyle)
    {
      this.zzIY.setTextTrackStyle(paramTextTrackStyle);
      return this;
    }
  }
}