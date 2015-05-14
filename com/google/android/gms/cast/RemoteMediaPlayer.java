package com.google.android.gms.cast;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzjr;
import com.google.android.gms.internal.zzju;
import com.google.android.gms.internal.zzkd;
import com.google.android.gms.internal.zzke;
import com.google.android.gms.internal.zzkf;
import java.io.IOException;
import org.json.JSONObject;

public class RemoteMediaPlayer
  implements Cast.MessageReceivedCallback
{
  public static final int RESUME_STATE_PAUSE = 2;
  public static final int RESUME_STATE_PLAY = 1;
  public static final int RESUME_STATE_UNCHANGED = 0;
  public static final int STATUS_CANCELED = 2101;
  public static final int STATUS_FAILED = 2100;
  public static final int STATUS_REPLACED = 2103;
  public static final int STATUS_SUCCEEDED = 0;
  public static final int STATUS_TIMED_OUT = 2102;
  private final zzkd zzJs = new zzkd(null)
  {
    protected void onMetadataUpdated()
    {
      RemoteMediaPlayer.zzb(RemoteMediaPlayer.this);
    }

    protected void onStatusUpdated()
    {
      RemoteMediaPlayer.zza(RemoteMediaPlayer.this);
    }
  };
  private final zza zzJt = new zza();
  private OnMetadataUpdatedListener zzJu;
  private OnStatusUpdatedListener zzJv;
  private final Object zznh = new Object();

  public RemoteMediaPlayer()
  {
    this.zzJs.zza(this.zzJt);
  }

  private void onMetadataUpdated()
  {
    if (this.zzJu != null)
      this.zzJu.onMetadataUpdated();
  }

  private void onStatusUpdated()
  {
    if (this.zzJv != null)
      this.zzJv.onStatusUpdated();
  }

  public long getApproximateStreamPosition()
  {
    synchronized (this.zznh)
    {
      long l = this.zzJs.getApproximateStreamPosition();
      return l;
    }
  }

  public MediaInfo getMediaInfo()
  {
    synchronized (this.zznh)
    {
      MediaInfo localMediaInfo = this.zzJs.getMediaInfo();
      return localMediaInfo;
    }
  }

  public MediaStatus getMediaStatus()
  {
    synchronized (this.zznh)
    {
      MediaStatus localMediaStatus = this.zzJs.getMediaStatus();
      return localMediaStatus;
    }
  }

  public String getNamespace()
  {
    return this.zzJs.getNamespace();
  }

  public long getStreamDuration()
  {
    synchronized (this.zznh)
    {
      long l = this.zzJs.getStreamDuration();
      return l;
    }
  }

  public PendingResult<MediaChannelResult> load(GoogleApiClient paramGoogleApiClient, MediaInfo paramMediaInfo)
  {
    return load(paramGoogleApiClient, paramMediaInfo, true, 0L, null, null);
  }

  public PendingResult<MediaChannelResult> load(GoogleApiClient paramGoogleApiClient, MediaInfo paramMediaInfo, boolean paramBoolean)
  {
    return load(paramGoogleApiClient, paramMediaInfo, paramBoolean, 0L, null, null);
  }

  public PendingResult<MediaChannelResult> load(GoogleApiClient paramGoogleApiClient, MediaInfo paramMediaInfo, boolean paramBoolean, long paramLong)
  {
    return load(paramGoogleApiClient, paramMediaInfo, paramBoolean, paramLong, null, null);
  }

  public PendingResult<MediaChannelResult> load(GoogleApiClient paramGoogleApiClient, MediaInfo paramMediaInfo, boolean paramBoolean, long paramLong, JSONObject paramJSONObject)
  {
    return load(paramGoogleApiClient, paramMediaInfo, paramBoolean, paramLong, null, paramJSONObject);
  }

  public PendingResult<MediaChannelResult> load(final GoogleApiClient paramGoogleApiClient, final MediaInfo paramMediaInfo, final boolean paramBoolean, final long paramLong, long[] paramArrayOfLong, final JSONObject paramJSONObject)
  {
    return paramGoogleApiClient.zzb(new zzb(paramGoogleApiClient)
    {
      protected void zza(zzju paramAnonymouszzju)
      {
        synchronized (RemoteMediaPlayer.zzc(RemoteMediaPlayer.this))
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(paramGoogleApiClient);
        }
        try
        {
          RemoteMediaPlayer.zze(RemoteMediaPlayer.this).zza(this.zzJN, paramMediaInfo, paramBoolean, paramLong, paramJSONObject, this.zzJE);
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          return;
        }
        catch (IOException localIOException)
        {
          while (true)
          {
            setResult(zzj(new Status(2100)));
            RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          }
          localObject2 = finally;
          throw localObject2;
        }
        finally
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
        }
      }
    });
  }

  public void onMessageReceived(CastDevice paramCastDevice, String paramString1, String paramString2)
  {
    this.zzJs.zzaI(paramString2);
  }

  public PendingResult<MediaChannelResult> pause(GoogleApiClient paramGoogleApiClient)
  {
    return pause(paramGoogleApiClient, null);
  }

  public PendingResult<MediaChannelResult> pause(final GoogleApiClient paramGoogleApiClient, final JSONObject paramJSONObject)
  {
    return paramGoogleApiClient.zzb(new zzb(paramGoogleApiClient)
    {
      protected void zza(zzju paramAnonymouszzju)
      {
        synchronized (RemoteMediaPlayer.zzc(RemoteMediaPlayer.this))
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(paramGoogleApiClient);
        }
        try
        {
          RemoteMediaPlayer.zze(RemoteMediaPlayer.this).zza(this.zzJN, paramJSONObject);
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          return;
        }
        catch (IOException localIOException)
        {
          while (true)
          {
            setResult(zzj(new Status(2100)));
            RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          }
          localObject2 = finally;
          throw localObject2;
        }
        finally
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
        }
      }
    });
  }

  public PendingResult<MediaChannelResult> play(GoogleApiClient paramGoogleApiClient)
  {
    return play(paramGoogleApiClient, null);
  }

  public PendingResult<MediaChannelResult> play(final GoogleApiClient paramGoogleApiClient, final JSONObject paramJSONObject)
  {
    return paramGoogleApiClient.zzb(new zzb(paramGoogleApiClient)
    {
      protected void zza(zzju paramAnonymouszzju)
      {
        synchronized (RemoteMediaPlayer.zzc(RemoteMediaPlayer.this))
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(paramGoogleApiClient);
        }
        try
        {
          RemoteMediaPlayer.zze(RemoteMediaPlayer.this).zzc(this.zzJN, paramJSONObject);
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          return;
        }
        catch (IOException localIOException)
        {
          while (true)
          {
            setResult(zzj(new Status(2100)));
            RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          }
          localObject2 = finally;
          throw localObject2;
        }
        finally
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
        }
      }
    });
  }

  public PendingResult<MediaChannelResult> requestStatus(final GoogleApiClient paramGoogleApiClient)
  {
    return paramGoogleApiClient.zzb(new zzb(paramGoogleApiClient)
    {
      protected void zza(zzju paramAnonymouszzju)
      {
        synchronized (RemoteMediaPlayer.zzc(RemoteMediaPlayer.this))
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(paramGoogleApiClient);
        }
        try
        {
          RemoteMediaPlayer.zze(RemoteMediaPlayer.this).zza(this.zzJN);
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          return;
        }
        catch (IOException localIOException)
        {
          while (true)
          {
            setResult(zzj(new Status(2100)));
            RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          }
          localObject2 = finally;
          throw localObject2;
        }
        finally
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
        }
      }
    });
  }

  public PendingResult<MediaChannelResult> seek(GoogleApiClient paramGoogleApiClient, long paramLong)
  {
    return seek(paramGoogleApiClient, paramLong, 0, null);
  }

  public PendingResult<MediaChannelResult> seek(GoogleApiClient paramGoogleApiClient, long paramLong, int paramInt)
  {
    return seek(paramGoogleApiClient, paramLong, paramInt, null);
  }

  public PendingResult<MediaChannelResult> seek(final GoogleApiClient paramGoogleApiClient, final long paramLong, int paramInt, final JSONObject paramJSONObject)
  {
    return paramGoogleApiClient.zzb(new zzb(paramGoogleApiClient)
    {
      protected void zza(zzju paramAnonymouszzju)
      {
        synchronized (RemoteMediaPlayer.zzc(RemoteMediaPlayer.this))
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(paramGoogleApiClient);
        }
        try
        {
          RemoteMediaPlayer.zze(RemoteMediaPlayer.this).zza(this.zzJN, paramLong, paramJSONObject, this.zzJE);
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          return;
        }
        catch (IOException localIOException)
        {
          while (true)
          {
            setResult(zzj(new Status(2100)));
            RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          }
          localObject2 = finally;
          throw localObject2;
        }
        finally
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
        }
      }
    });
  }

  public PendingResult<MediaChannelResult> setActiveMediaTracks(final GoogleApiClient paramGoogleApiClient, final long[] paramArrayOfLong)
  {
    if (paramArrayOfLong == null)
      throw new IllegalArgumentException("trackIds cannot be null");
    return paramGoogleApiClient.zzb(new zzb(paramGoogleApiClient)
    {
      protected void zza(zzju paramAnonymouszzju)
      {
        synchronized (RemoteMediaPlayer.zzc(RemoteMediaPlayer.this))
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(paramGoogleApiClient);
        }
        try
        {
          RemoteMediaPlayer.zze(RemoteMediaPlayer.this).zza(this.zzJN, paramArrayOfLong);
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          return;
        }
        catch (IOException localIOException)
        {
          while (true)
          {
            setResult(zzj(new Status(2100)));
            RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          }
          localObject2 = finally;
          throw localObject2;
        }
        finally
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
        }
      }
    });
  }

  public void setOnMetadataUpdatedListener(OnMetadataUpdatedListener paramOnMetadataUpdatedListener)
  {
    this.zzJu = paramOnMetadataUpdatedListener;
  }

  public void setOnStatusUpdatedListener(OnStatusUpdatedListener paramOnStatusUpdatedListener)
  {
    this.zzJv = paramOnStatusUpdatedListener;
  }

  public PendingResult<MediaChannelResult> setStreamMute(GoogleApiClient paramGoogleApiClient, boolean paramBoolean)
  {
    return setStreamMute(paramGoogleApiClient, paramBoolean, null);
  }

  public PendingResult<MediaChannelResult> setStreamMute(final GoogleApiClient paramGoogleApiClient, final boolean paramBoolean, final JSONObject paramJSONObject)
  {
    return paramGoogleApiClient.zzb(new zzb(paramGoogleApiClient)
    {
      protected void zza(zzju paramAnonymouszzju)
      {
        synchronized (RemoteMediaPlayer.zzc(RemoteMediaPlayer.this))
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(paramGoogleApiClient);
        }
        try
        {
          RemoteMediaPlayer.zze(RemoteMediaPlayer.this).zza(this.zzJN, paramBoolean, paramJSONObject);
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          return;
        }
        catch (IllegalStateException localIllegalStateException)
        {
          while (true)
          {
            setResult(zzj(new Status(2100)));
            RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          }
          localObject2 = finally;
          throw localObject2;
        }
        catch (IOException localIOException)
        {
          while (true)
          {
            setResult(zzj(new Status(2100)));
            RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          }
        }
        finally
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
        }
      }
    });
  }

  public PendingResult<MediaChannelResult> setStreamVolume(GoogleApiClient paramGoogleApiClient, double paramDouble)
    throws IllegalArgumentException
  {
    return setStreamVolume(paramGoogleApiClient, paramDouble, null);
  }

  public PendingResult<MediaChannelResult> setStreamVolume(final GoogleApiClient paramGoogleApiClient, final double paramDouble, JSONObject paramJSONObject)
    throws IllegalArgumentException
  {
    if ((Double.isInfinite(paramDouble)) || (Double.isNaN(paramDouble)))
      throw new IllegalArgumentException("Volume cannot be " + paramDouble);
    return paramGoogleApiClient.zzb(new zzb(paramGoogleApiClient)
    {
      protected void zza(zzju paramAnonymouszzju)
      {
        synchronized (RemoteMediaPlayer.zzc(RemoteMediaPlayer.this))
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(paramGoogleApiClient);
        }
        try
        {
          RemoteMediaPlayer.zze(RemoteMediaPlayer.this).zza(this.zzJN, paramDouble, this.zzJE);
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          return;
        }
        catch (IllegalStateException localIllegalStateException)
        {
          while (true)
          {
            setResult(zzj(new Status(2100)));
            RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          }
          localObject2 = finally;
          throw localObject2;
        }
        catch (IllegalArgumentException localIllegalArgumentException)
        {
          while (true)
          {
            setResult(zzj(new Status(2100)));
            RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          }
        }
        catch (IOException localIOException)
        {
          while (true)
          {
            setResult(zzj(new Status(2100)));
            RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          }
        }
        finally
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
        }
      }
    });
  }

  public PendingResult<MediaChannelResult> setTextTrackStyle(final GoogleApiClient paramGoogleApiClient, final TextTrackStyle paramTextTrackStyle)
  {
    if (paramTextTrackStyle == null)
      throw new IllegalArgumentException("trackStyle cannot be null");
    return paramGoogleApiClient.zzb(new zzb(paramGoogleApiClient)
    {
      protected void zza(zzju paramAnonymouszzju)
      {
        synchronized (RemoteMediaPlayer.zzc(RemoteMediaPlayer.this))
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(paramGoogleApiClient);
        }
        try
        {
          RemoteMediaPlayer.zze(RemoteMediaPlayer.this).zza(this.zzJN, paramTextTrackStyle);
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          return;
        }
        catch (IOException localIOException)
        {
          while (true)
          {
            setResult(zzj(new Status(2100)));
            RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          }
          localObject2 = finally;
          throw localObject2;
        }
        finally
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
        }
      }
    });
  }

  public PendingResult<MediaChannelResult> stop(GoogleApiClient paramGoogleApiClient)
  {
    return stop(paramGoogleApiClient, null);
  }

  public PendingResult<MediaChannelResult> stop(final GoogleApiClient paramGoogleApiClient, final JSONObject paramJSONObject)
  {
    return paramGoogleApiClient.zzb(new zzb(paramGoogleApiClient)
    {
      protected void zza(zzju paramAnonymouszzju)
      {
        synchronized (RemoteMediaPlayer.zzc(RemoteMediaPlayer.this))
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(paramGoogleApiClient);
        }
        try
        {
          RemoteMediaPlayer.zze(RemoteMediaPlayer.this).zzb(this.zzJN, paramJSONObject);
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          return;
        }
        catch (IOException localIOException)
        {
          while (true)
          {
            setResult(zzj(new Status(2100)));
            RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
          }
          localObject2 = finally;
          throw localObject2;
        }
        finally
        {
          RemoteMediaPlayer.zzd(RemoteMediaPlayer.this).zzb(null);
        }
      }
    });
  }

  public static abstract interface MediaChannelResult extends Result
  {
    public abstract JSONObject getCustomData();
  }

  public static abstract interface OnMetadataUpdatedListener
  {
    public abstract void onMetadataUpdated();
  }

  public static abstract interface OnStatusUpdatedListener
  {
    public abstract void onStatusUpdated();
  }

  private class zza
    implements zzke
  {
    private GoogleApiClient zzJJ;
    private long zzJK = 0L;

    public zza()
    {
    }

    public void zza(String paramString1, String paramString2, long paramLong, String paramString3)
      throws IOException
    {
      if (this.zzJJ == null)
        throw new IOException("No GoogleApiClient available");
      Cast.CastApi.sendMessage(this.zzJJ, paramString1, paramString2).setResultCallback(new zza(paramLong));
    }

    public void zzb(GoogleApiClient paramGoogleApiClient)
    {
      this.zzJJ = paramGoogleApiClient;
    }

    public long zzhk()
    {
      long l = 1L + this.zzJK;
      this.zzJK = l;
      return l;
    }

    private final class zza
      implements ResultCallback<Status>
    {
      private final long zzJL;

      zza(long arg2)
      {
        Object localObject;
        this.zzJL = localObject;
      }

      public void zzi(Status paramStatus)
      {
        if (!paramStatus.isSuccess())
          RemoteMediaPlayer.zze(RemoteMediaPlayer.this).zzb(this.zzJL, paramStatus.getStatusCode());
      }
    }
  }

  private static abstract class zzb extends zzjr<RemoteMediaPlayer.MediaChannelResult>
  {
    zzkf zzJN = new zzkf()
    {
      public void zza(long paramAnonymousLong, int paramAnonymousInt, Object paramAnonymousObject)
      {
        if ((paramAnonymousObject instanceof JSONObject));
        for (JSONObject localJSONObject = (JSONObject)paramAnonymousObject; ; localJSONObject = null)
        {
          RemoteMediaPlayer.zzb.this.setResult(new RemoteMediaPlayer.zzc(new Status(paramAnonymousInt), localJSONObject));
          return;
        }
      }

      public void zzn(long paramAnonymousLong)
      {
        RemoteMediaPlayer.zzb.this.setResult(RemoteMediaPlayer.zzb.this.zzj(new Status(2103)));
      }
    };

    zzb(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public RemoteMediaPlayer.MediaChannelResult zzj(final Status paramStatus)
    {
      return new RemoteMediaPlayer.MediaChannelResult()
      {
        public JSONObject getCustomData()
        {
          return null;
        }

        public Status getStatus()
        {
          return paramStatus;
        }
      };
    }
  }

  private static final class zzc
    implements RemoteMediaPlayer.MediaChannelResult
  {
    private final Status zzHb;
    private final JSONObject zzIX;

    zzc(Status paramStatus, JSONObject paramJSONObject)
    {
      this.zzHb = paramStatus;
      this.zzIX = paramJSONObject;
    }

    public JSONObject getCustomData()
    {
      return this.zzIX;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }
}