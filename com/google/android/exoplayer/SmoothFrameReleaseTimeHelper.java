package com.google.android.exoplayer;

import android.annotation.TargetApi;
import android.view.Choreographer;
import android.view.Choreographer.FrameCallback;

@TargetApi(16)
public class SmoothFrameReleaseTimeHelper
  implements MediaCodecVideoTrackRenderer.FrameReleaseTimeHelper, Choreographer.FrameCallback
{
  private static final long CHOREOGRAPHER_SAMPLE_DELAY_MILLIS = 500L;
  private static final long MAX_ALLOWED_DRIFT_NS = 20000000L;
  private static final int MIN_FRAMES_FOR_ADJUSTMENT = 6;
  private static final long VSYNC_OFFSET_PERCENTAGE = 80L;
  private long adjustedLastFrameTimeNs;
  private Choreographer choreographer;
  private int frameCount;
  private boolean haveSync;
  private long lastUnadjustedFrameTimeUs;
  private long pendingAdjustedFrameTimeNs;
  private long sampledVsyncTimeNs;
  private long syncFrameTimeNs;
  private long syncReleaseTimeNs;
  private final boolean usePrimaryDisplayVsync;
  private final long vsyncDurationNs;
  private final long vsyncOffsetNs;

  public SmoothFrameReleaseTimeHelper(float paramFloat, boolean paramBoolean)
  {
    this.usePrimaryDisplayVsync = paramBoolean;
    if (paramBoolean)
    {
      this.vsyncDurationNs = (()(1000000000.0D / paramFloat));
      this.vsyncOffsetNs = (80L * this.vsyncDurationNs / 100L);
      return;
    }
    this.vsyncDurationNs = -1L;
    this.vsyncOffsetNs = -1L;
  }

  private static long closestVsync(long paramLong1, long paramLong2, long paramLong3)
  {
    long l1 = paramLong2 + paramLong3 * ((paramLong1 - paramLong2) / paramLong3);
    long l2;
    if (paramLong1 <= l1)
      l2 = l1 - paramLong3;
    for (long l3 = l1; l3 - paramLong1 < paramLong1 - l2; l3 = l1 + paramLong3)
    {
      return l3;
      l2 = l1;
    }
    return l2;
  }

  private boolean isDriftTooLarge(long paramLong1, long paramLong2)
  {
    long l = paramLong1 - this.syncFrameTimeNs;
    return Math.abs(paramLong2 - this.syncReleaseTimeNs - l) > 20000000L;
  }

  public long adjustReleaseTime(long paramLong1, long paramLong2)
  {
    long l1 = paramLong1 * 1000L;
    long l2 = l1;
    long l3 = paramLong2;
    long l4;
    if (this.haveSync)
    {
      if (paramLong1 != this.lastUnadjustedFrameTimeUs)
      {
        this.frameCount = (1 + this.frameCount);
        this.adjustedLastFrameTimeNs = this.pendingAdjustedFrameTimeNs;
      }
      if (this.frameCount < 6)
        break label168;
      l4 = (l1 - this.syncFrameTimeNs) / this.frameCount + this.adjustedLastFrameTimeNs;
      if (!isDriftTooLarge(l4, paramLong2))
        break label147;
      this.haveSync = false;
    }
    while (true)
    {
      if (!this.haveSync)
      {
        this.syncFrameTimeNs = l1;
        this.syncReleaseTimeNs = paramLong2;
        this.frameCount = 0;
        this.haveSync = true;
        onSynced();
      }
      this.lastUnadjustedFrameTimeUs = paramLong1;
      this.pendingAdjustedFrameTimeNs = l2;
      if (this.sampledVsyncTimeNs != 0L)
        break;
      return l3;
      label147: l2 = l4;
      l3 = l2 + this.syncReleaseTimeNs - this.syncFrameTimeNs;
      continue;
      label168: if (isDriftTooLarge(l1, paramLong2))
        this.haveSync = false;
    }
    return closestVsync(l3, this.sampledVsyncTimeNs, this.vsyncDurationNs) - this.vsyncOffsetNs;
  }

  public void disable()
  {
    if (this.usePrimaryDisplayVsync)
    {
      this.choreographer.removeFrameCallback(this);
      this.choreographer = null;
    }
  }

  public void doFrame(long paramLong)
  {
    this.sampledVsyncTimeNs = paramLong;
    this.choreographer.postFrameCallbackDelayed(this, 500L);
  }

  public void enable()
  {
    this.haveSync = false;
    if (this.usePrimaryDisplayVsync)
    {
      this.sampledVsyncTimeNs = 0L;
      this.choreographer = Choreographer.getInstance();
      this.choreographer.postFrameCallback(this);
    }
  }

  protected void onSynced()
  {
  }
}