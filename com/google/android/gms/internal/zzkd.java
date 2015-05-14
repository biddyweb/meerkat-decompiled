package com.google.android.gms.internal;

import android.os.SystemClock;
import com.google.android.gms.cast.MediaInfo;
import com.google.android.gms.cast.MediaStatus;
import com.google.android.gms.cast.TextTrackStyle;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class zzkd extends zzjs
{
  private static final String NAMESPACE = zzjv.zzaL("com.google.cast.media");
  private long zzKV;
  private MediaStatus zzKW;
  private final List<zzkg> zzKX = new ArrayList();
  private final zzkg zzKY = new zzkg(86400000L);
  private final zzkg zzKZ = new zzkg(86400000L);
  private final zzkg zzLa = new zzkg(86400000L);
  private final zzkg zzLb = new zzkg(86400000L);
  private final zzkg zzLc = new zzkg(86400000L);
  private final zzkg zzLd = new zzkg(86400000L);
  private final zzkg zzLe = new zzkg(86400000L);
  private final zzkg zzLf = new zzkg(86400000L);
  private final zzkg zzLg = new zzkg(86400000L);
  private final zzkg zzLh = new zzkg(86400000L);

  public zzkd(String paramString)
  {
    super(NAMESPACE, "MediaControlChannel", paramString, 1000L);
    this.zzKX.add(this.zzKY);
    this.zzKX.add(this.zzKZ);
    this.zzKX.add(this.zzLa);
    this.zzKX.add(this.zzLb);
    this.zzKX.add(this.zzLc);
    this.zzKX.add(this.zzLd);
    this.zzKX.add(this.zzLe);
    this.zzKX.add(this.zzLf);
    this.zzKX.add(this.zzLg);
    this.zzKX.add(this.zzLh);
  }

  private void zza(long paramLong, JSONObject paramJSONObject)
    throws JSONException
  {
    int i = 1;
    boolean bool = this.zzKY.zzq(paramLong);
    int j;
    if ((this.zzLc.zzhI()) && (!this.zzLc.zzq(paramLong)))
    {
      j = i;
      if (((!this.zzLd.zzhI()) || (this.zzLd.zzq(paramLong))) && ((!this.zzLe.zzhI()) || (this.zzLe.zzq(paramLong))))
        break label227;
      label80: if (j == 0)
        break label249;
    }
    label227: label249: for (int k = 2; ; k = 0)
    {
      if (i != 0)
        k |= 1;
      if ((bool) || (this.zzKW == null))
      {
        this.zzKW = new MediaStatus(paramJSONObject);
        this.zzKV = SystemClock.elapsedRealtime();
      }
      for (int m = 7; ; m = this.zzKW.zza(paramJSONObject, k))
      {
        if ((m & 0x1) != 0)
        {
          this.zzKV = SystemClock.elapsedRealtime();
          onStatusUpdated();
        }
        if ((m & 0x2) != 0)
        {
          this.zzKV = SystemClock.elapsedRealtime();
          onStatusUpdated();
        }
        if ((m & 0x4) != 0)
          onMetadataUpdated();
        Iterator localIterator = this.zzKX.iterator();
        while (localIterator.hasNext())
          ((zzkg)localIterator.next()).zzc(paramLong, 0);
        j = 0;
        break;
        i = 0;
        break label80;
      }
      return;
    }
  }

  public long getApproximateStreamPosition()
  {
    MediaInfo localMediaInfo = getMediaInfo();
    if (localMediaInfo == null);
    while (this.zzKV == 0L)
      return 0L;
    double d = this.zzKW.getPlaybackRate();
    long l1 = this.zzKW.getStreamPosition();
    int i = this.zzKW.getPlayerState();
    if ((d == 0.0D) || (i != 2))
      return l1;
    long l2 = SystemClock.elapsedRealtime() - this.zzKV;
    if (l2 < 0L);
    for (long l3 = 0L; ; l3 = l2)
    {
      if (l3 == 0L)
        return l1;
      long l4 = localMediaInfo.getStreamDuration();
      long l5 = l1 + ()(d * l3);
      if ((l4 > 0L) && (l5 > l4));
      while (true)
      {
        return l4;
        if (l5 < 0L)
          l4 = 0L;
        else
          l4 = l5;
      }
    }
  }

  public MediaInfo getMediaInfo()
  {
    if (this.zzKW == null)
      return null;
    return this.zzKW.getMediaInfo();
  }

  public MediaStatus getMediaStatus()
  {
    return this.zzKW;
  }

  public long getStreamDuration()
  {
    MediaInfo localMediaInfo = getMediaInfo();
    if (localMediaInfo != null)
      return localMediaInfo.getStreamDuration();
    return 0L;
  }

  protected void onMetadataUpdated()
  {
  }

  protected void onStatusUpdated()
  {
  }

  public long zza(zzkf paramzzkf)
    throws IOException
  {
    JSONObject localJSONObject = new JSONObject();
    long l = zzhn();
    this.zzLf.zza(l, paramzzkf);
    zzK(true);
    try
    {
      localJSONObject.put("requestId", l);
      localJSONObject.put("type", "GET_STATUS");
      if (this.zzKW != null)
        localJSONObject.put("mediaSessionId", this.zzKW.zzhj());
      label65: zza(localJSONObject.toString(), l, null);
      return l;
    }
    catch (JSONException localJSONException)
    {
      break label65;
    }
  }

  public long zza(zzkf paramzzkf, double paramDouble, JSONObject paramJSONObject)
    throws IOException, IllegalStateException, IllegalArgumentException
  {
    if ((Double.isInfinite(paramDouble)) || (Double.isNaN(paramDouble)))
      throw new IllegalArgumentException("Volume cannot be " + paramDouble);
    JSONObject localJSONObject1 = new JSONObject();
    long l = zzhn();
    this.zzLd.zza(l, paramzzkf);
    zzK(true);
    try
    {
      localJSONObject1.put("requestId", l);
      localJSONObject1.put("type", "SET_VOLUME");
      localJSONObject1.put("mediaSessionId", zzhj());
      JSONObject localJSONObject2 = new JSONObject();
      localJSONObject2.put("level", paramDouble);
      localJSONObject1.put("volume", localJSONObject2);
      if (paramJSONObject != null)
        localJSONObject1.put("customData", paramJSONObject);
      label146: zza(localJSONObject1.toString(), l, null);
      return l;
    }
    catch (JSONException localJSONException)
    {
      break label146;
    }
  }

  public long zza(zzkf paramzzkf, long paramLong, int paramInt, JSONObject paramJSONObject)
    throws IOException, IllegalStateException
  {
    JSONObject localJSONObject = new JSONObject();
    long l = zzhn();
    this.zzLc.zza(l, paramzzkf);
    zzK(true);
    try
    {
      localJSONObject.put("requestId", l);
      localJSONObject.put("type", "SEEK");
      localJSONObject.put("mediaSessionId", zzhj());
      localJSONObject.put("currentTime", zzjv.zzp(paramLong));
      if (paramInt == 1)
        localJSONObject.put("resumeState", "PLAYBACK_START");
      while (true)
      {
        if (paramJSONObject != null)
          localJSONObject.put("customData", paramJSONObject);
        label106: zza(localJSONObject.toString(), l, null);
        return l;
        if (paramInt == 2)
          localJSONObject.put("resumeState", "PLAYBACK_PAUSE");
      }
    }
    catch (JSONException localJSONException)
    {
      break label106;
    }
  }

  public long zza(zzkf paramzzkf, MediaInfo paramMediaInfo, boolean paramBoolean, long paramLong, long[] paramArrayOfLong, JSONObject paramJSONObject)
    throws IOException
  {
    JSONObject localJSONObject = new JSONObject();
    long l = zzhn();
    this.zzKY.zza(l, paramzzkf);
    zzK(true);
    try
    {
      localJSONObject.put("requestId", l);
      localJSONObject.put("type", "LOAD");
      localJSONObject.put("media", paramMediaInfo.toJson());
      localJSONObject.put("autoplay", paramBoolean);
      localJSONObject.put("currentTime", zzjv.zzp(paramLong));
      if (paramArrayOfLong != null)
      {
        JSONArray localJSONArray = new JSONArray();
        for (int i = 0; i < paramArrayOfLong.length; i++)
          localJSONArray.put(i, paramArrayOfLong[i]);
        localJSONObject.put("activeTrackIds", localJSONArray);
      }
      if (paramJSONObject != null)
        localJSONObject.put("customData", paramJSONObject);
      label157: zza(localJSONObject.toString(), l, null);
      return l;
    }
    catch (JSONException localJSONException)
    {
      break label157;
    }
  }

  public long zza(zzkf paramzzkf, TextTrackStyle paramTextTrackStyle)
    throws IOException
  {
    JSONObject localJSONObject = new JSONObject();
    long l = zzhn();
    this.zzLh.zza(l, paramzzkf);
    zzK(true);
    try
    {
      localJSONObject.put("requestId", l);
      localJSONObject.put("type", "EDIT_TRACKS_INFO");
      if (paramTextTrackStyle != null)
        localJSONObject.put("textTrackStyle", paramTextTrackStyle.toJson());
      localJSONObject.put("mediaSessionId", zzhj());
      label75: zza(localJSONObject.toString(), l, null);
      return l;
    }
    catch (JSONException localJSONException)
    {
      break label75;
    }
  }

  public long zza(zzkf paramzzkf, JSONObject paramJSONObject)
    throws IOException
  {
    JSONObject localJSONObject = new JSONObject();
    long l = zzhn();
    this.zzKZ.zza(l, paramzzkf);
    zzK(true);
    try
    {
      localJSONObject.put("requestId", l);
      localJSONObject.put("type", "PAUSE");
      localJSONObject.put("mediaSessionId", zzhj());
      if (paramJSONObject != null)
        localJSONObject.put("customData", paramJSONObject);
      label71: zza(localJSONObject.toString(), l, null);
      return l;
    }
    catch (JSONException localJSONException)
    {
      break label71;
    }
  }

  public long zza(zzkf paramzzkf, boolean paramBoolean, JSONObject paramJSONObject)
    throws IOException, IllegalStateException
  {
    JSONObject localJSONObject1 = new JSONObject();
    long l = zzhn();
    this.zzLe.zza(l, paramzzkf);
    zzK(true);
    try
    {
      localJSONObject1.put("requestId", l);
      localJSONObject1.put("type", "SET_VOLUME");
      localJSONObject1.put("mediaSessionId", zzhj());
      JSONObject localJSONObject2 = new JSONObject();
      localJSONObject2.put("muted", paramBoolean);
      localJSONObject1.put("volume", localJSONObject2);
      if (paramJSONObject != null)
        localJSONObject1.put("customData", paramJSONObject);
      label104: zza(localJSONObject1.toString(), l, null);
      return l;
    }
    catch (JSONException localJSONException)
    {
      break label104;
    }
  }

  public long zza(zzkf paramzzkf, long[] paramArrayOfLong)
    throws IOException
  {
    JSONObject localJSONObject = new JSONObject();
    long l = zzhn();
    this.zzLg.zza(l, paramzzkf);
    zzK(true);
    try
    {
      localJSONObject.put("requestId", l);
      localJSONObject.put("type", "EDIT_TRACKS_INFO");
      localJSONObject.put("mediaSessionId", zzhj());
      JSONArray localJSONArray = new JSONArray();
      for (int i = 0; i < paramArrayOfLong.length; i++)
        localJSONArray.put(i, paramArrayOfLong[i]);
      localJSONObject.put("activeTrackIds", localJSONArray);
      label106: zza(localJSONObject.toString(), l, null);
      return l;
    }
    catch (JSONException localJSONException)
    {
      break label106;
    }
  }

  public final void zzaI(String paramString)
  {
    this.zzKe.zzb("message received: %s", new Object[] { paramString });
    JSONObject localJSONObject1;
    String str;
    long l;
    try
    {
      localJSONObject1 = new JSONObject(paramString);
      str = localJSONObject1.getString("type");
      l = localJSONObject1.optLong("requestId", -1L);
      if (str.equals("MEDIA_STATUS"))
      {
        JSONArray localJSONArray = localJSONObject1.getJSONArray("status");
        if (localJSONArray.length() > 0)
        {
          zza(l, localJSONArray.getJSONObject(0));
          return;
        }
        this.zzKW = null;
        onStatusUpdated();
        onMetadataUpdated();
        this.zzLf.zzc(l, 0);
        return;
      }
    }
    catch (JSONException localJSONException)
    {
      zzkc localzzkc = this.zzKe;
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = localJSONException.getMessage();
      arrayOfObject[1] = paramString;
      localzzkc.zzd("Message is malformed (%s); ignoring: %s", arrayOfObject);
      return;
    }
    if (str.equals("INVALID_PLAYER_STATE"))
    {
      this.zzKe.zzd("received unexpected error: Invalid Player State.", new Object[0]);
      JSONObject localJSONObject5 = localJSONObject1.optJSONObject("customData");
      Iterator localIterator2 = this.zzKX.iterator();
      while (localIterator2.hasNext())
        ((zzkg)localIterator2.next()).zzb(l, 2100, localJSONObject5);
    }
    if (str.equals("LOAD_FAILED"))
    {
      JSONObject localJSONObject4 = localJSONObject1.optJSONObject("customData");
      this.zzKY.zzb(l, 2100, localJSONObject4);
      return;
    }
    if (str.equals("LOAD_CANCELLED"))
    {
      JSONObject localJSONObject3 = localJSONObject1.optJSONObject("customData");
      this.zzKY.zzb(l, 2101, localJSONObject3);
      return;
    }
    if (str.equals("INVALID_REQUEST"))
    {
      this.zzKe.zzd("received unexpected error: Invalid Request.", new Object[0]);
      JSONObject localJSONObject2 = localJSONObject1.optJSONObject("customData");
      Iterator localIterator1 = this.zzKX.iterator();
      while (localIterator1.hasNext())
        ((zzkg)localIterator1.next()).zzb(l, 2100, localJSONObject2);
    }
  }

  public long zzb(zzkf paramzzkf, JSONObject paramJSONObject)
    throws IOException
  {
    JSONObject localJSONObject = new JSONObject();
    long l = zzhn();
    this.zzLb.zza(l, paramzzkf);
    zzK(true);
    try
    {
      localJSONObject.put("requestId", l);
      localJSONObject.put("type", "STOP");
      localJSONObject.put("mediaSessionId", zzhj());
      if (paramJSONObject != null)
        localJSONObject.put("customData", paramJSONObject);
      label71: zza(localJSONObject.toString(), l, null);
      return l;
    }
    catch (JSONException localJSONException)
    {
      break label71;
    }
  }

  public void zzb(long paramLong, int paramInt)
  {
    Iterator localIterator = this.zzKX.iterator();
    while (localIterator.hasNext())
      ((zzkg)localIterator.next()).zzc(paramLong, paramInt);
  }

  public long zzc(zzkf paramzzkf, JSONObject paramJSONObject)
    throws IOException, IllegalStateException
  {
    JSONObject localJSONObject = new JSONObject();
    long l = zzhn();
    this.zzLa.zza(l, paramzzkf);
    zzK(true);
    try
    {
      localJSONObject.put("requestId", l);
      localJSONObject.put("type", "PLAY");
      localJSONObject.put("mediaSessionId", zzhj());
      if (paramJSONObject != null)
        localJSONObject.put("customData", paramJSONObject);
      label71: zza(localJSONObject.toString(), l, null);
      return l;
    }
    catch (JSONException localJSONException)
    {
      break label71;
    }
  }

  public long zzhj()
    throws IllegalStateException
  {
    if (this.zzKW == null)
      throw new IllegalStateException("No current media session");
    return this.zzKW.zzhj();
  }

  protected boolean zzo(long paramLong)
  {
    Iterator localIterator1 = this.zzKX.iterator();
    while (localIterator1.hasNext())
      ((zzkg)localIterator1.next()).zzd(paramLong, 2102);
    while (true)
    {
      synchronized (zzkg.zzLm)
      {
        Iterator localIterator2 = this.zzKX.iterator();
        if (localIterator2.hasNext())
        {
          if (!((zzkg)localIterator2.next()).zzhI())
            continue;
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }
}