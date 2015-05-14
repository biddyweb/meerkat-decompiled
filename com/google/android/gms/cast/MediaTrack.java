package com.google.android.gms.cast;

import android.text.TextUtils;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.internal.zzjv;
import com.google.android.gms.internal.zzma;
import java.util.Locale;
import org.json.JSONException;
import org.json.JSONObject;

public final class MediaTrack
{
  public static final int SUBTYPE_CAPTIONS = 2;
  public static final int SUBTYPE_CHAPTERS = 4;
  public static final int SUBTYPE_DESCRIPTIONS = 3;
  public static final int SUBTYPE_METADATA = 5;
  public static final int SUBTYPE_NONE = 0;
  public static final int SUBTYPE_SUBTITLES = 1;
  public static final int SUBTYPE_UNKNOWN = -1;
  public static final int TYPE_AUDIO = 2;
  public static final int TYPE_TEXT = 1;
  public static final int TYPE_UNKNOWN = 0;
  public static final int TYPE_VIDEO = 3;
  private String mName;
  private long zzHf;
  private String zzIO;
  private String zzIQ;
  private String zzIS;
  private JSONObject zzIX;
  private int zzJp;
  private int zzJq;

  MediaTrack(long paramLong, int paramInt)
    throws IllegalArgumentException
  {
    clear();
    this.zzHf = paramLong;
    if ((paramInt <= 0) || (paramInt > 3))
      throw new IllegalArgumentException("invalid type " + paramInt);
    this.zzJp = paramInt;
  }

  MediaTrack(JSONObject paramJSONObject)
    throws JSONException
  {
    zzd(paramJSONObject);
  }

  private void clear()
  {
    this.zzHf = 0L;
    this.zzJp = 0;
    this.zzIQ = null;
    this.mName = null;
    this.zzIO = null;
    this.zzJq = -1;
    this.zzIX = null;
  }

  private void zzd(JSONObject paramJSONObject)
    throws JSONException
  {
    clear();
    this.zzHf = paramJSONObject.getLong("trackId");
    String str1 = paramJSONObject.getString("type");
    String str2;
    if ("TEXT".equals(str1))
    {
      this.zzJp = 1;
      this.zzIQ = paramJSONObject.optString("trackContentId", null);
      this.zzIS = paramJSONObject.optString("trackContentType", null);
      this.mName = paramJSONObject.optString("name", null);
      this.zzIO = paramJSONObject.optString("language", null);
      if (!paramJSONObject.has("subtype"))
        break label276;
      str2 = paramJSONObject.getString("subtype");
      if (!"SUBTITLES".equals(str2))
        break label181;
      this.zzJq = 1;
    }
    label276: 
    while (true)
    {
      this.zzIX = paramJSONObject.optJSONObject("customData");
      return;
      if ("AUDIO".equals(str1))
      {
        this.zzJp = 2;
        break;
      }
      if ("VIDEO".equals(str1))
      {
        this.zzJp = 3;
        break;
      }
      throw new JSONException("invalid type: " + str1);
      label181: if ("CAPTIONS".equals(str2))
      {
        this.zzJq = 2;
      }
      else if ("DESCRIPTIONS".equals(str2))
      {
        this.zzJq = 3;
      }
      else if ("CHAPTERS".equals(str2))
      {
        this.zzJq = 4;
      }
      else if ("METADATA".equals(str2))
      {
        this.zzJq = 5;
      }
      else
      {
        throw new JSONException("invalid subtype: " + str2);
        this.zzJq = 0;
      }
    }
  }

  public boolean equals(Object paramObject)
  {
    boolean bool1 = true;
    boolean bool3;
    if (this == paramObject)
      bool3 = bool1;
    MediaTrack localMediaTrack;
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
          bool2 = paramObject instanceof MediaTrack;
          bool3 = false;
        }
        while (!bool2);
        localMediaTrack = (MediaTrack)paramObject;
        if (this.zzIX != null)
          break;
        bool4 = bool1;
        if (localMediaTrack.zzIX != null)
          break label204;
        bool5 = bool1;
        bool3 = false;
      }
      while (bool4 != bool5);
      if ((this.zzIX == null) || (localMediaTrack.zzIX == null))
        break;
      bool6 = zzma.zzd(this.zzIX, localMediaTrack.zzIX);
      bool3 = false;
    }
    while (!bool6);
    if ((this.zzHf == localMediaTrack.zzHf) && (this.zzJp == localMediaTrack.zzJp) && (zzjv.zza(this.zzIQ, localMediaTrack.zzIQ)) && (zzjv.zza(this.zzIS, localMediaTrack.zzIS)) && (zzjv.zza(this.mName, localMediaTrack.mName)) && (zzjv.zza(this.zzIO, localMediaTrack.zzIO)) && (this.zzJq == localMediaTrack.zzJq));
    while (true)
    {
      return bool1;
      bool4 = false;
      break;
      label204: bool5 = false;
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

  public long getId()
  {
    return this.zzHf;
  }

  public String getLanguage()
  {
    return this.zzIO;
  }

  public String getName()
  {
    return this.mName;
  }

  public int getSubtype()
  {
    return this.zzJq;
  }

  public int getType()
  {
    return this.zzJp;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[8];
    arrayOfObject[0] = Long.valueOf(this.zzHf);
    arrayOfObject[1] = Integer.valueOf(this.zzJp);
    arrayOfObject[2] = this.zzIQ;
    arrayOfObject[3] = this.zzIS;
    arrayOfObject[4] = this.mName;
    arrayOfObject[5] = this.zzIO;
    arrayOfObject[6] = Integer.valueOf(this.zzJq);
    arrayOfObject[7] = this.zzIX;
    return zzw.hashCode(arrayOfObject);
  }

  public void setContentId(String paramString)
  {
    this.zzIQ = paramString;
  }

  public void setContentType(String paramString)
  {
    this.zzIS = paramString;
  }

  void setCustomData(JSONObject paramJSONObject)
  {
    this.zzIX = paramJSONObject;
  }

  void setLanguage(String paramString)
  {
    this.zzIO = paramString;
  }

  void setName(String paramString)
  {
    this.mName = paramString;
  }

  public JSONObject toJson()
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("trackId", this.zzHf);
      switch (this.zzJp)
      {
      default:
        if (this.zzIQ != null)
          localJSONObject.put("trackContentId", this.zzIQ);
        if (this.zzIS != null)
          localJSONObject.put("trackContentType", this.zzIS);
        if (this.mName != null)
          localJSONObject.put("name", this.mName);
        if (!TextUtils.isEmpty(this.zzIO))
          localJSONObject.put("language", this.zzIO);
        switch (this.zzJq)
        {
        default:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        }
        break;
      case 1:
      case 2:
      case 3:
      }
      while (true)
      {
        if (this.zzIX == null)
          break label276;
        localJSONObject.put("customData", this.zzIX);
        return localJSONObject;
        localJSONObject.put("type", "TEXT");
        break;
        localJSONObject.put("type", "AUDIO");
        break;
        localJSONObject.put("type", "VIDEO");
        break;
        localJSONObject.put("subtype", "SUBTITLES");
        continue;
        localJSONObject.put("subtype", "CAPTIONS");
        continue;
        localJSONObject.put("subtype", "DESCRIPTIONS");
        continue;
        localJSONObject.put("subtype", "CHAPTERS");
        continue;
        localJSONObject.put("subtype", "METADATA");
      }
      label276: return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
    }
    return localJSONObject;
  }

  void zzaf(int paramInt)
    throws IllegalArgumentException
  {
    if ((paramInt <= -1) || (paramInt > 5))
      throw new IllegalArgumentException("invalid subtype " + paramInt);
    if ((paramInt != 0) && (this.zzJp != 1))
      throw new IllegalArgumentException("subtypes are only valid for text tracks");
    this.zzJq = paramInt;
  }

  public static class Builder
  {
    private final MediaTrack zzJr;

    public Builder(long paramLong, int paramInt)
      throws IllegalArgumentException
    {
      this.zzJr = new MediaTrack(paramLong, paramInt);
    }

    public MediaTrack build()
    {
      return this.zzJr;
    }

    public Builder setContentId(String paramString)
    {
      this.zzJr.setContentId(paramString);
      return this;
    }

    public Builder setContentType(String paramString)
    {
      this.zzJr.setContentType(paramString);
      return this;
    }

    public Builder setCustomData(JSONObject paramJSONObject)
    {
      this.zzJr.setCustomData(paramJSONObject);
      return this;
    }

    public Builder setLanguage(String paramString)
    {
      this.zzJr.setLanguage(paramString);
      return this;
    }

    public Builder setLanguage(Locale paramLocale)
    {
      this.zzJr.setLanguage(zzjv.zzb(paramLocale));
      return this;
    }

    public Builder setName(String paramString)
    {
      this.zzJr.setName(paramString);
      return this;
    }

    public Builder setSubtype(int paramInt)
      throws IllegalArgumentException
    {
      this.zzJr.zzaf(paramInt);
      return this;
    }
  }
}