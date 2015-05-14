package com.google.android.exoplayer.audio;

import android.annotation.TargetApi;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;

public final class AudioCapabilitiesReceiver
{
  private static final AudioCapabilities DEFAULT_AUDIO_CAPABILITIES = new AudioCapabilities(new int[] { 2 }, 2);
  private final Context context;
  private final Listener listener;
  private final BroadcastReceiver receiver;

  public AudioCapabilitiesReceiver(Context paramContext, Listener paramListener)
  {
    this.context = ((Context)Assertions.checkNotNull(paramContext));
    this.listener = ((Listener)Assertions.checkNotNull(paramListener));
    if (Util.SDK_INT >= 21);
    for (HdmiAudioPlugBroadcastReceiver localHdmiAudioPlugBroadcastReceiver = new HdmiAudioPlugBroadcastReceiver(null); ; localHdmiAudioPlugBroadcastReceiver = null)
    {
      this.receiver = localHdmiAudioPlugBroadcastReceiver;
      return;
    }
  }

  @TargetApi(21)
  public void register()
  {
    if (this.receiver != null)
      this.context.registerReceiver(this.receiver, new IntentFilter("android.media.action.HDMI_AUDIO_PLUG"));
    this.listener.onAudioCapabilitiesChanged(DEFAULT_AUDIO_CAPABILITIES);
  }

  public void unregister()
  {
    if (this.receiver != null)
      this.context.unregisterReceiver(this.receiver);
  }

  @TargetApi(21)
  private final class HdmiAudioPlugBroadcastReceiver extends BroadcastReceiver
  {
    private HdmiAudioPlugBroadcastReceiver()
    {
    }

    public void onReceive(Context paramContext, Intent paramIntent)
    {
      if (!paramIntent.getAction().equals("android.media.action.HDMI_AUDIO_PLUG"))
        return;
      AudioCapabilitiesReceiver.this.listener.onAudioCapabilitiesChanged(new AudioCapabilities(paramIntent.getIntArrayExtra("android.media.extra.ENCODINGS"), paramIntent.getIntExtra("android.media.extra.MAX_CHANNEL_COUNT", 0)));
    }
  }

  public static abstract interface Listener
  {
    public abstract void onAudioCapabilitiesChanged(AudioCapabilities paramAudioCapabilities);
  }
}