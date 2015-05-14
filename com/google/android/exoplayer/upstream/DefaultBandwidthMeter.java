package com.google.android.exoplayer.upstream;

import android.os.Handler;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Clock;
import com.google.android.exoplayer.util.SlidingPercentile;
import com.google.android.exoplayer.util.SystemClock;

public class DefaultBandwidthMeter
  implements BandwidthMeter, TransferListener
{
  private static final int DEFAULT_MAX_WEIGHT = 2000;
  private long bitrateEstimate;
  private long bytesAccumulator;
  private final Clock clock;
  private final Handler eventHandler;
  private final EventListener eventListener;
  private final SlidingPercentile slidingPercentile;
  private long startTimeMs;
  private int streamCount;

  public DefaultBandwidthMeter()
  {
    this(null, null);
  }

  public DefaultBandwidthMeter(Handler paramHandler, EventListener paramEventListener)
  {
    this(paramHandler, paramEventListener, new SystemClock());
  }

  public DefaultBandwidthMeter(Handler paramHandler, EventListener paramEventListener, int paramInt)
  {
    this(paramHandler, paramEventListener, new SystemClock(), paramInt);
  }

  public DefaultBandwidthMeter(Handler paramHandler, EventListener paramEventListener, Clock paramClock)
  {
    this(paramHandler, paramEventListener, paramClock, 2000);
  }

  public DefaultBandwidthMeter(Handler paramHandler, EventListener paramEventListener, Clock paramClock, int paramInt)
  {
    this.eventHandler = paramHandler;
    this.eventListener = paramEventListener;
    this.clock = paramClock;
    this.slidingPercentile = new SlidingPercentile(paramInt);
    this.bitrateEstimate = -1L;
  }

  private void notifyBandwidthSample(final int paramInt, final long paramLong1, long paramLong2)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          DefaultBandwidthMeter.this.eventListener.onBandwidthSample(paramInt, paramLong1, this.val$bitrate);
        }
      });
  }

  public long getBitrateEstimate()
  {
    try
    {
      long l = this.bitrateEstimate;
      return l;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void onBytesTransferred(int paramInt)
  {
    try
    {
      this.bytesAccumulator += paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void onTransferEnd()
  {
    try
    {
      boolean bool;
      long l1;
      int i;
      float f2;
      if (this.streamCount > 0)
      {
        bool = true;
        Assertions.checkState(bool);
        l1 = this.clock.elapsedRealtime();
        i = (int)(l1 - this.startTimeMs);
        if (i > 0)
        {
          float f1 = (float)(8000L * this.bytesAccumulator / i);
          this.slidingPercentile.addSample((int)Math.sqrt(this.bytesAccumulator), f1);
          f2 = this.slidingPercentile.getPercentile(0.5F);
          if (!Float.isNaN(f2))
            break label151;
        }
      }
      label151: for (long l2 = -1L; ; l2 = ()f2)
      {
        this.bitrateEstimate = l2;
        notifyBandwidthSample(i, this.bytesAccumulator, this.bitrateEstimate);
        this.streamCount = (-1 + this.streamCount);
        if (this.streamCount > 0)
          this.startTimeMs = l1;
        this.bytesAccumulator = 0L;
        return;
        bool = false;
        break;
      }
    }
    finally
    {
    }
  }

  public void onTransferStart()
  {
    try
    {
      if (this.streamCount == 0)
        this.startTimeMs = this.clock.elapsedRealtime();
      this.streamCount = (1 + this.streamCount);
      return;
    }
    finally
    {
    }
  }

  public static abstract interface EventListener
  {
    public abstract void onBandwidthSample(int paramInt, long paramLong1, long paramLong2);
  }
}