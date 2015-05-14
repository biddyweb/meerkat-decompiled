package com.google.android.gms.cast;

import android.os.Bundle;
import android.text.TextUtils;
import com.google.android.gms.common.images.WebImage;
import com.google.android.gms.internal.zzkh;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

public class MediaMetadata
{
  public static final String KEY_ALBUM_ARTIST = "com.google.android.gms.cast.metadata.ALBUM_ARTIST";
  public static final String KEY_ALBUM_TITLE = "com.google.android.gms.cast.metadata.ALBUM_TITLE";
  public static final String KEY_ARTIST = "com.google.android.gms.cast.metadata.ARTIST";
  public static final String KEY_BROADCAST_DATE = "com.google.android.gms.cast.metadata.BROADCAST_DATE";
  public static final String KEY_COMPOSER = "com.google.android.gms.cast.metadata.COMPOSER";
  public static final String KEY_CREATION_DATE = "com.google.android.gms.cast.metadata.CREATION_DATE";
  public static final String KEY_DISC_NUMBER = "com.google.android.gms.cast.metadata.DISC_NUMBER";
  public static final String KEY_EPISODE_NUMBER = "com.google.android.gms.cast.metadata.EPISODE_NUMBER";
  public static final String KEY_HEIGHT = "com.google.android.gms.cast.metadata.HEIGHT";
  public static final String KEY_LOCATION_LATITUDE = "com.google.android.gms.cast.metadata.LOCATION_LATITUDE";
  public static final String KEY_LOCATION_LONGITUDE = "com.google.android.gms.cast.metadata.LOCATION_LONGITUDE";
  public static final String KEY_LOCATION_NAME = "com.google.android.gms.cast.metadata.LOCATION_NAME";
  public static final String KEY_RELEASE_DATE = "com.google.android.gms.cast.metadata.RELEASE_DATE";
  public static final String KEY_SEASON_NUMBER = "com.google.android.gms.cast.metadata.SEASON_NUMBER";
  public static final String KEY_SERIES_TITLE = "com.google.android.gms.cast.metadata.SERIES_TITLE";
  public static final String KEY_STUDIO = "com.google.android.gms.cast.metadata.STUDIO";
  public static final String KEY_SUBTITLE = "com.google.android.gms.cast.metadata.SUBTITLE";
  public static final String KEY_TITLE = "com.google.android.gms.cast.metadata.TITLE";
  public static final String KEY_TRACK_NUMBER = "com.google.android.gms.cast.metadata.TRACK_NUMBER";
  public static final String KEY_WIDTH = "com.google.android.gms.cast.metadata.WIDTH";
  public static final int MEDIA_TYPE_GENERIC = 0;
  public static final int MEDIA_TYPE_MOVIE = 1;
  public static final int MEDIA_TYPE_MUSIC_TRACK = 3;
  public static final int MEDIA_TYPE_PHOTO = 4;
  public static final int MEDIA_TYPE_TV_SHOW = 2;
  public static final int MEDIA_TYPE_USER = 100;
  private static final String[] zzIZ = { null, "String", "int", "double", "ISO-8601 date String" };
  private static final zza zzJa = new zza().zzb("com.google.android.gms.cast.metadata.CREATION_DATE", "creationDateTime", 4).zzb("com.google.android.gms.cast.metadata.RELEASE_DATE", "releaseDate", 4).zzb("com.google.android.gms.cast.metadata.BROADCAST_DATE", "originalAirdate", 4).zzb("com.google.android.gms.cast.metadata.TITLE", "title", 1).zzb("com.google.android.gms.cast.metadata.SUBTITLE", "subtitle", 1).zzb("com.google.android.gms.cast.metadata.ARTIST", "artist", 1).zzb("com.google.android.gms.cast.metadata.ALBUM_ARTIST", "albumArtist", 1).zzb("com.google.android.gms.cast.metadata.ALBUM_TITLE", "albumName", 1).zzb("com.google.android.gms.cast.metadata.COMPOSER", "composer", 1).zzb("com.google.android.gms.cast.metadata.DISC_NUMBER", "discNumber", 2).zzb("com.google.android.gms.cast.metadata.TRACK_NUMBER", "trackNumber", 2).zzb("com.google.android.gms.cast.metadata.SEASON_NUMBER", "season", 2).zzb("com.google.android.gms.cast.metadata.EPISODE_NUMBER", "episode", 2).zzb("com.google.android.gms.cast.metadata.SERIES_TITLE", "seriesTitle", 1).zzb("com.google.android.gms.cast.metadata.STUDIO", "studio", 1).zzb("com.google.android.gms.cast.metadata.WIDTH", "width", 2).zzb("com.google.android.gms.cast.metadata.HEIGHT", "height", 2).zzb("com.google.android.gms.cast.metadata.LOCATION_NAME", "location", 1).zzb("com.google.android.gms.cast.metadata.LOCATION_LATITUDE", "latitude", 3).zzb("com.google.android.gms.cast.metadata.LOCATION_LONGITUDE", "longitude", 3);
  private final List<WebImage> zzIn = new ArrayList();
  private final Bundle zzJb = new Bundle();
  private int zzJc;

  public MediaMetadata()
  {
    this(0);
  }

  public MediaMetadata(int paramInt)
  {
    this.zzJc = paramInt;
  }

  private void zza(JSONObject paramJSONObject, String[] paramArrayOfString)
  {
    try
    {
      int i = paramArrayOfString.length;
      int j = 0;
      String str1;
      if (j < i)
      {
        str1 = paramArrayOfString[j];
        if (!this.zzJb.containsKey(str1));
      }
      else
      {
        switch (zzJa.zzaG(str1))
        {
        case 1:
        case 4:
          paramJSONObject.put(zzJa.zzaE(str1), this.zzJb.getString(str1));
          break;
        case 2:
          paramJSONObject.put(zzJa.zzaE(str1), this.zzJb.getInt(str1));
          break;
        case 3:
          paramJSONObject.put(zzJa.zzaE(str1), this.zzJb.getDouble(str1));
          break;
          Iterator localIterator = this.zzJb.keySet().iterator();
          while (localIterator.hasNext())
          {
            String str2 = (String)localIterator.next();
            if (!str2.startsWith("com.google."))
            {
              Object localObject = this.zzJb.get(str2);
              if ((localObject instanceof String))
                paramJSONObject.put(str2, localObject);
              else if ((localObject instanceof Integer))
                paramJSONObject.put(str2, localObject);
              else if ((localObject instanceof Double))
                paramJSONObject.put(str2, localObject);
            }
          }
        }
      }
      while (true)
      {
        j++;
        break;
      }
    }
    catch (JSONException localJSONException)
    {
    }
  }

  private boolean zza(Bundle paramBundle1, Bundle paramBundle2)
  {
    if (paramBundle1.size() != paramBundle2.size())
      return false;
    Iterator localIterator = paramBundle1.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      Object localObject1 = paramBundle1.get(str);
      Object localObject2 = paramBundle2.get(str);
      if (((localObject1 instanceof Bundle)) && ((localObject2 instanceof Bundle)) && (!zza((Bundle)localObject1, (Bundle)localObject2)))
        return false;
      if (localObject1 == null)
      {
        if ((localObject2 != null) || (!paramBundle2.containsKey(str)))
          return false;
      }
      else if (!localObject1.equals(localObject2))
        return false;
    }
    return true;
  }

  private void zzb(JSONObject paramJSONObject, String[] paramArrayOfString)
  {
    HashSet localHashSet = new HashSet(Arrays.asList(paramArrayOfString));
    try
    {
      Iterator localIterator = paramJSONObject.keys();
      while (localIterator.hasNext())
      {
        String str1 = (String)localIterator.next();
        if (!"metadataType".equals(str1))
        {
          String str2 = zzJa.zzaF(str1);
          if (str2 != null)
          {
            boolean bool = localHashSet.contains(str2);
            if (!bool);
          }
          else
          {
            try
            {
              Object localObject1 = paramJSONObject.get(str1);
              if (localObject1 != null)
                switch (zzJa.zzaG(str2))
                {
                case 1:
                  if ((localObject1 instanceof String))
                    this.zzJb.putString(str2, (String)localObject1);
                  break;
                case 4:
                  if (((localObject1 instanceof String)) && (zzkh.zzaQ((String)localObject1) != null))
                    this.zzJb.putString(str2, (String)localObject1);
                  break;
                case 2:
                  if ((localObject1 instanceof Integer))
                    this.zzJb.putInt(str2, ((Integer)localObject1).intValue());
                  break;
                case 3:
                  if ((localObject1 instanceof Double))
                  {
                    this.zzJb.putDouble(str2, ((Double)localObject1).doubleValue());
                    continue;
                    Object localObject2 = paramJSONObject.get(str1);
                    if ((localObject2 instanceof String))
                      this.zzJb.putString(str1, (String)localObject2);
                    else if ((localObject2 instanceof Integer))
                      this.zzJb.putInt(str1, ((Integer)localObject2).intValue());
                    else if ((localObject2 instanceof Double))
                      this.zzJb.putDouble(str1, ((Double)localObject2).doubleValue());
                  }
                  break;
                }
            }
            catch (JSONException localJSONException2)
            {
            }
          }
        }
      }
    }
    catch (JSONException localJSONException1)
    {
    }
  }

  private void zzf(String paramString, int paramInt)
    throws IllegalArgumentException
  {
    if (TextUtils.isEmpty(paramString))
      throw new IllegalArgumentException("null and empty keys are not allowed");
    int i = zzJa.zzaG(paramString);
    if ((i != paramInt) && (i != 0))
      throw new IllegalArgumentException("Value for " + paramString + " must be a " + zzIZ[paramInt]);
  }

  public void addImage(WebImage paramWebImage)
  {
    this.zzIn.add(paramWebImage);
  }

  public void clear()
  {
    this.zzJb.clear();
    this.zzIn.clear();
  }

  public void clearImages()
  {
    this.zzIn.clear();
  }

  public boolean containsKey(String paramString)
  {
    return this.zzJb.containsKey(paramString);
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    MediaMetadata localMediaMetadata;
    do
    {
      return true;
      if (!(paramObject instanceof MediaMetadata))
        return false;
      localMediaMetadata = (MediaMetadata)paramObject;
    }
    while ((zza(this.zzJb, localMediaMetadata.zzJb)) && (this.zzIn.equals(localMediaMetadata.zzIn)));
    return false;
  }

  public Calendar getDate(String paramString)
  {
    zzf(paramString, 4);
    String str = this.zzJb.getString(paramString);
    if (str != null)
      return zzkh.zzaQ(str);
    return null;
  }

  public String getDateAsString(String paramString)
  {
    zzf(paramString, 4);
    return this.zzJb.getString(paramString);
  }

  public double getDouble(String paramString)
  {
    zzf(paramString, 3);
    return this.zzJb.getDouble(paramString);
  }

  public List<WebImage> getImages()
  {
    return this.zzIn;
  }

  public int getInt(String paramString)
  {
    zzf(paramString, 2);
    return this.zzJb.getInt(paramString);
  }

  public int getMediaType()
  {
    return this.zzJc;
  }

  public String getString(String paramString)
  {
    zzf(paramString, 1);
    return this.zzJb.getString(paramString);
  }

  public boolean hasImages()
  {
    return (this.zzIn != null) && (!this.zzIn.isEmpty());
  }

  public int hashCode()
  {
    Iterator localIterator = this.zzJb.keySet().iterator();
    String str;
    for (int i = 17; localIterator.hasNext(); i = i * 31 + this.zzJb.get(str).hashCode())
      str = (String)localIterator.next();
    return i * 31 + this.zzIn.hashCode();
  }

  public Set<String> keySet()
  {
    return this.zzJb.keySet();
  }

  public void putDate(String paramString, Calendar paramCalendar)
  {
    zzf(paramString, 4);
    this.zzJb.putString(paramString, zzkh.zza(paramCalendar));
  }

  public void putDouble(String paramString, double paramDouble)
  {
    zzf(paramString, 3);
    this.zzJb.putDouble(paramString, paramDouble);
  }

  public void putInt(String paramString, int paramInt)
  {
    zzf(paramString, 2);
    this.zzJb.putInt(paramString, paramInt);
  }

  public void putString(String paramString1, String paramString2)
  {
    zzf(paramString1, 1);
    this.zzJb.putString(paramString1, paramString2);
  }

  public JSONObject toJson()
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("metadataType", this.zzJc);
      label20: zzkh.zza(localJSONObject, this.zzIn);
      switch (this.zzJc)
      {
      default:
        zza(localJSONObject, new String[0]);
        return localJSONObject;
      case 0:
        zza(localJSONObject, new String[] { "com.google.android.gms.cast.metadata.TITLE", "com.google.android.gms.cast.metadata.ARTIST", "com.google.android.gms.cast.metadata.SUBTITLE", "com.google.android.gms.cast.metadata.RELEASE_DATE" });
        return localJSONObject;
      case 1:
        zza(localJSONObject, new String[] { "com.google.android.gms.cast.metadata.TITLE", "com.google.android.gms.cast.metadata.STUDIO", "com.google.android.gms.cast.metadata.SUBTITLE", "com.google.android.gms.cast.metadata.RELEASE_DATE" });
        return localJSONObject;
      case 2:
        zza(localJSONObject, new String[] { "com.google.android.gms.cast.metadata.TITLE", "com.google.android.gms.cast.metadata.SERIES_TITLE", "com.google.android.gms.cast.metadata.SEASON_NUMBER", "com.google.android.gms.cast.metadata.EPISODE_NUMBER", "com.google.android.gms.cast.metadata.BROADCAST_DATE" });
        return localJSONObject;
      case 3:
        zza(localJSONObject, new String[] { "com.google.android.gms.cast.metadata.TITLE", "com.google.android.gms.cast.metadata.ARTIST", "com.google.android.gms.cast.metadata.ALBUM_TITLE", "com.google.android.gms.cast.metadata.ALBUM_ARTIST", "com.google.android.gms.cast.metadata.COMPOSER", "com.google.android.gms.cast.metadata.TRACK_NUMBER", "com.google.android.gms.cast.metadata.DISC_NUMBER", "com.google.android.gms.cast.metadata.RELEASE_DATE" });
        return localJSONObject;
      case 4:
      }
      zza(localJSONObject, new String[] { "com.google.android.gms.cast.metadata.TITLE", "com.google.android.gms.cast.metadata.ARTIST", "com.google.android.gms.cast.metadata.LOCATION_NAME", "com.google.android.gms.cast.metadata.LOCATION_LATITUDE", "com.google.android.gms.cast.metadata.LOCATION_LONGITUDE", "com.google.android.gms.cast.metadata.WIDTH", "com.google.android.gms.cast.metadata.HEIGHT", "com.google.android.gms.cast.metadata.CREATION_DATE" });
      return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
      break label20;
    }
  }

  public void zzd(JSONObject paramJSONObject)
  {
    clear();
    this.zzJc = 0;
    try
    {
      this.zzJc = paramJSONObject.getInt("metadataType");
      label20: zzkh.zza(this.zzIn, paramJSONObject);
      switch (this.zzJc)
      {
      default:
        zzb(paramJSONObject, new String[0]);
        return;
      case 0:
        zzb(paramJSONObject, new String[] { "com.google.android.gms.cast.metadata.TITLE", "com.google.android.gms.cast.metadata.ARTIST", "com.google.android.gms.cast.metadata.SUBTITLE", "com.google.android.gms.cast.metadata.RELEASE_DATE" });
        return;
      case 1:
        zzb(paramJSONObject, new String[] { "com.google.android.gms.cast.metadata.TITLE", "com.google.android.gms.cast.metadata.STUDIO", "com.google.android.gms.cast.metadata.SUBTITLE", "com.google.android.gms.cast.metadata.RELEASE_DATE" });
        return;
      case 2:
        zzb(paramJSONObject, new String[] { "com.google.android.gms.cast.metadata.TITLE", "com.google.android.gms.cast.metadata.SERIES_TITLE", "com.google.android.gms.cast.metadata.SEASON_NUMBER", "com.google.android.gms.cast.metadata.EPISODE_NUMBER", "com.google.android.gms.cast.metadata.BROADCAST_DATE" });
        return;
      case 3:
        zzb(paramJSONObject, new String[] { "com.google.android.gms.cast.metadata.TITLE", "com.google.android.gms.cast.metadata.ALBUM_TITLE", "com.google.android.gms.cast.metadata.ARTIST", "com.google.android.gms.cast.metadata.ALBUM_ARTIST", "com.google.android.gms.cast.metadata.COMPOSER", "com.google.android.gms.cast.metadata.TRACK_NUMBER", "com.google.android.gms.cast.metadata.DISC_NUMBER", "com.google.android.gms.cast.metadata.RELEASE_DATE" });
        return;
      case 4:
      }
      zzb(paramJSONObject, new String[] { "com.google.android.gms.cast.metadata.TITLE", "com.google.android.gms.cast.metadata.ARTIST", "com.google.android.gms.cast.metadata.LOCATION_NAME", "com.google.android.gms.cast.metadata.LOCATION_LATITUDE", "com.google.android.gms.cast.metadata.LOCATION_LONGITUDE", "com.google.android.gms.cast.metadata.WIDTH", "com.google.android.gms.cast.metadata.HEIGHT", "com.google.android.gms.cast.metadata.CREATION_DATE" });
      return;
    }
    catch (JSONException localJSONException)
    {
      break label20;
    }
  }

  private static class zza
  {
    private final Map<String, String> zzJd = new HashMap();
    private final Map<String, String> zzJe = new HashMap();
    private final Map<String, Integer> zzJf = new HashMap();

    public String zzaE(String paramString)
    {
      return (String)this.zzJd.get(paramString);
    }

    public String zzaF(String paramString)
    {
      return (String)this.zzJe.get(paramString);
    }

    public int zzaG(String paramString)
    {
      Integer localInteger = (Integer)this.zzJf.get(paramString);
      if (localInteger != null)
        return localInteger.intValue();
      return 0;
    }

    public zza zzb(String paramString1, String paramString2, int paramInt)
    {
      this.zzJd.put(paramString1, paramString2);
      this.zzJe.put(paramString2, paramString1);
      this.zzJf.put(paramString1, Integer.valueOf(paramInt));
      return this;
    }
  }
}