package com.google.android.exoplayer.audio;

import android.annotation.TargetApi;
import com.google.android.exoplayer.util.Util;
import java.util.HashSet;
import java.util.Set;

@TargetApi(21)
public final class AudioCapabilities
{
  private final int maxChannelCount;
  private final Set<Integer> supportedEncodings = new HashSet();

  public AudioCapabilities(int[] paramArrayOfInt, int paramInt)
  {
    if (paramArrayOfInt != null)
    {
      int i = paramArrayOfInt.length;
      for (int j = 0; j < i; j++)
      {
        int k = paramArrayOfInt[j];
        this.supportedEncodings.add(Integer.valueOf(k));
      }
    }
    this.maxChannelCount = paramInt;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    AudioCapabilities localAudioCapabilities;
    do
    {
      return true;
      if (!(paramObject instanceof AudioCapabilities))
        return false;
      localAudioCapabilities = (AudioCapabilities)paramObject;
    }
    while ((this.supportedEncodings.equals(localAudioCapabilities.supportedEncodings)) && (this.maxChannelCount == localAudioCapabilities.maxChannelCount));
    return false;
  }

  public int getMaxChannelCount()
  {
    return this.maxChannelCount;
  }

  public int hashCode()
  {
    return this.maxChannelCount + 31 * this.supportedEncodings.hashCode();
  }

  public boolean supportsAc3()
  {
    return (Util.SDK_INT >= 21) && (this.supportedEncodings.contains(Integer.valueOf(5)));
  }

  public boolean supportsEAc3()
  {
    return (Util.SDK_INT >= 21) && (this.supportedEncodings.contains(Integer.valueOf(6)));
  }

  public boolean supportsPcm()
  {
    return this.supportedEncodings.contains(Integer.valueOf(2));
  }

  public String toString()
  {
    return "AudioCapabilities[maxChannelCount=" + this.maxChannelCount + ", supportedEncodings=" + this.supportedEncodings + "]";
  }
}