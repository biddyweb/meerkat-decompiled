package com.google.android.gms.internal;

import android.content.Context;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.MediaController;
import android.widget.VideoView;
import java.util.HashMap;
import java.util.Map;

@zzgi
public class zzeq extends FrameLayout
  implements MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnPreparedListener
{
  private final zzic zzmu;
  private final MediaController zzuA;
  private final zzeq.zza zzuB;
  private final VideoView zzuC;
  private long zzuD;
  private String zzuE;

  public zzeq(Context paramContext, zzic paramzzic)
  {
    super(paramContext);
    this.zzmu = paramzzic;
    this.zzuC = new VideoView(paramContext);
    FrameLayout.LayoutParams localLayoutParams = new FrameLayout.LayoutParams(-1, -1, 17);
    addView(this.zzuC, localLayoutParams);
    this.zzuA = new MediaController(paramContext);
    this.zzuB = new zzeq.zza(this);
    this.zzuB.zzdq();
    this.zzuC.setOnCompletionListener(this);
    this.zzuC.setOnPreparedListener(this);
    this.zzuC.setOnErrorListener(this);
  }

  private static void zza(zzic paramzzic, String paramString)
  {
    zza(paramzzic, paramString, new HashMap(1));
  }

  public static void zza(zzic paramzzic, String paramString1, String paramString2)
  {
    int i;
    if (paramString2 == null)
    {
      i = 1;
      if (i == 0)
        break label60;
    }
    label60: for (int j = 2; ; j = 3)
    {
      HashMap localHashMap = new HashMap(j);
      localHashMap.put("what", paramString1);
      if (i == 0)
        localHashMap.put("extra", paramString2);
      zza(paramzzic, "error", localHashMap);
      return;
      i = 0;
      break;
    }
  }

  private static void zza(zzic paramzzic, String paramString1, String paramString2, String paramString3)
  {
    HashMap localHashMap = new HashMap(2);
    localHashMap.put(paramString2, paramString3);
    zza(paramzzic, paramString1, localHashMap);
  }

  private static void zza(zzic paramzzic, String paramString, Map<String, String> paramMap)
  {
    paramMap.put("event", paramString);
    paramzzic.zzb("onVideoEvent", paramMap);
  }

  public void destroy()
  {
    this.zzuB.cancel();
    this.zzuC.stopPlayback();
  }

  public void onCompletion(MediaPlayer paramMediaPlayer)
  {
    zza(this.zzmu, "ended");
  }

  public boolean onError(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    zza(this.zzmu, String.valueOf(paramInt1), String.valueOf(paramInt2));
    return true;
  }

  public void onPrepared(MediaPlayer paramMediaPlayer)
  {
    float f = this.zzuC.getDuration() / 1000.0F;
    zza(this.zzmu, "canplaythrough", "duration", String.valueOf(f));
  }

  public void pause()
  {
    this.zzuC.pause();
  }

  public void play()
  {
    this.zzuC.start();
  }

  public void seekTo(int paramInt)
  {
    this.zzuC.seekTo(paramInt);
  }

  public void zzK(String paramString)
  {
    this.zzuE = paramString;
  }

  public void zzb(MotionEvent paramMotionEvent)
  {
    this.zzuC.dispatchTouchEvent(paramMotionEvent);
  }

  public void zzdo()
  {
    if (!TextUtils.isEmpty(this.zzuE))
    {
      this.zzuC.setVideoPath(this.zzuE);
      return;
    }
    zza(this.zzmu, "no_src", null);
  }

  public void zzdp()
  {
    long l = this.zzuC.getCurrentPosition();
    if (this.zzuD != l)
    {
      float f = (float)l / 1000.0F;
      zza(this.zzmu, "timeupdate", "time", String.valueOf(f));
      this.zzuD = l;
    }
  }

  public void zzu(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.zzuC.setMediaController(this.zzuA);
      return;
    }
    this.zzuA.hide();
    this.zzuC.setMediaController(null);
  }
}