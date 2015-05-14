package com.google.android.gms.cast;

import com.google.android.gms.internal.zzjv;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class MediaStatus
{
  public static final long COMMAND_PAUSE = 1L;
  public static final long COMMAND_SEEK = 2L;
  public static final long COMMAND_SET_VOLUME = 4L;
  public static final long COMMAND_SKIP_BACKWARD = 32L;
  public static final long COMMAND_SKIP_FORWARD = 16L;
  public static final long COMMAND_TOGGLE_MUTE = 8L;
  public static final int IDLE_REASON_CANCELED = 2;
  public static final int IDLE_REASON_ERROR = 4;
  public static final int IDLE_REASON_FINISHED = 1;
  public static final int IDLE_REASON_INTERRUPTED = 3;
  public static final int IDLE_REASON_NONE = 0;
  public static final int PLAYER_STATE_BUFFERING = 4;
  public static final int PLAYER_STATE_IDLE = 1;
  public static final int PLAYER_STATE_PAUSED = 3;
  public static final int PLAYER_STATE_PLAYING = 2;
  public static final int PLAYER_STATE_UNKNOWN;
  private JSONObject zzIX;
  private MediaInfo zzIY;
  private long zzJg;
  private double zzJh;
  private int zzJi;
  private int zzJj;
  private long zzJk;
  private long zzJl;
  private double zzJm;
  private boolean zzJn;
  private long[] zzJo;

  public MediaStatus(JSONObject paramJSONObject)
    throws JSONException
  {
    zza(paramJSONObject, 0);
  }

  public long[] getActiveTrackIds()
  {
    return this.zzJo;
  }

  public JSONObject getCustomData()
  {
    return this.zzIX;
  }

  public int getIdleReason()
  {
    return this.zzJj;
  }

  public MediaInfo getMediaInfo()
  {
    return this.zzIY;
  }

  public double getPlaybackRate()
  {
    return this.zzJh;
  }

  public int getPlayerState()
  {
    return this.zzJi;
  }

  public long getStreamPosition()
  {
    return this.zzJk;
  }

  public double getStreamVolume()
  {
    return this.zzJm;
  }

  public boolean isMediaCommandSupported(long paramLong)
  {
    return (paramLong & this.zzJl) != 0L;
  }

  public boolean isMute()
  {
    return this.zzJn;
  }

  public int zza(JSONObject paramJSONObject, int paramInt)
    throws JSONException
  {
    int i = 2;
    int j = 1;
    long l1 = paramJSONObject.getLong("mediaSessionId");
    if (l1 != this.zzJg)
      this.zzJg = l1;
    for (int k = j; ; k = 0)
    {
      String str1;
      int i3;
      if (paramJSONObject.has("playerState"))
      {
        str1 = paramJSONObject.getString("playerState");
        if (!str1.equals("IDLE"))
          break label406;
        i3 = j;
      }
      while (true)
      {
        if (i3 != this.zzJi)
        {
          this.zzJi = i3;
          k |= 2;
        }
        String str2;
        if ((i3 == j) && (paramJSONObject.has("idleReason")))
        {
          str2 = paramJSONObject.getString("idleReason");
          if (!str2.equals("CANCELLED"))
            break label454;
        }
        while (true)
        {
          label119: if (i != this.zzJj)
          {
            this.zzJj = i;
            k |= 2;
          }
          if (paramJSONObject.has("playbackRate"))
          {
            double d2 = paramJSONObject.getDouble("playbackRate");
            if (this.zzJh != d2)
            {
              this.zzJh = d2;
              k |= 2;
            }
          }
          if ((paramJSONObject.has("currentTime")) && ((paramInt & 0x2) == 0))
          {
            long l3 = zzjv.zzb(paramJSONObject.getDouble("currentTime"));
            if (l3 != this.zzJk)
            {
              this.zzJk = l3;
              k |= 2;
            }
          }
          if (paramJSONObject.has("supportedMediaCommands"))
          {
            long l2 = paramJSONObject.getLong("supportedMediaCommands");
            if (l2 != this.zzJl)
            {
              this.zzJl = l2;
              k |= 2;
            }
          }
          if ((paramJSONObject.has("volume")) && ((paramInt & 0x1) == 0))
          {
            JSONObject localJSONObject2 = paramJSONObject.getJSONObject("volume");
            double d1 = localJSONObject2.getDouble("level");
            if (d1 != this.zzJm)
            {
              this.zzJm = d1;
              k |= 2;
            }
            boolean bool = localJSONObject2.getBoolean("muted");
            if (bool != this.zzJn)
            {
              this.zzJn = bool;
              k |= 2;
            }
          }
          int n;
          long[] arrayOfLong2;
          if (paramJSONObject.has("activeTrackIds"))
          {
            JSONArray localJSONArray = paramJSONObject.getJSONArray("activeTrackIds");
            n = localJSONArray.length();
            arrayOfLong2 = new long[n];
            int i1 = 0;
            while (true)
              if (i1 < n)
              {
                arrayOfLong2[i1] = localJSONArray.getLong(i1);
                i1++;
                continue;
                label406: if (str1.equals("PLAYING"))
                {
                  i3 = i;
                  break;
                }
                if (str1.equals("PAUSED"))
                {
                  i3 = 3;
                  break;
                }
                if (!str1.equals("BUFFERING"))
                  break label702;
                i3 = 4;
                break;
                label454: if (str2.equals("INTERRUPTED"))
                {
                  i = 3;
                  break label119;
                }
                if (str2.equals("FINISHED"))
                {
                  i = j;
                  break label119;
                }
                if (!str2.equals("ERROR"))
                  break label697;
                i = 4;
                break label119;
              }
            if (this.zzJo != null);
          }
          while (true)
          {
            if (j != 0)
              this.zzJo = arrayOfLong2;
            int m = j;
            long[] arrayOfLong1 = arrayOfLong2;
            while (true)
            {
              if (m != 0)
              {
                this.zzJo = arrayOfLong1;
                k |= 2;
              }
              if (paramJSONObject.has("customData"))
              {
                this.zzIX = paramJSONObject.getJSONObject("customData");
                k |= 2;
              }
              if (paramJSONObject.has("media"))
              {
                JSONObject localJSONObject1 = paramJSONObject.getJSONObject("media");
                this.zzIY = new MediaInfo(localJSONObject1);
                k |= 2;
                if (localJSONObject1.has("metadata"))
                  k |= 4;
              }
              return k;
              if (this.zzJo.length != n)
                break;
              for (int i2 = 0; ; i2++)
              {
                if (i2 >= n)
                  break label691;
                if (this.zzJo[i2] != arrayOfLong2[i2])
                  break;
              }
              if (this.zzJo != null)
              {
                m = j;
                arrayOfLong1 = null;
              }
              else
              {
                arrayOfLong1 = null;
                m = 0;
              }
            }
            label691: j = 0;
          }
          label697: i = 0;
        }
        label702: i3 = 0;
      }
    }
  }

  public long zzhj()
  {
    return this.zzJg;
  }
}