package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.upstream.BandwidthMeter;
import java.util.List;
import java.util.Random;

public abstract interface FormatEvaluator
{
  public static final int TRIGGER_ADAPTIVE = 2;
  public static final int TRIGGER_CUSTOM_BASE = 10000;
  public static final int TRIGGER_INITIAL = 0;
  public static final int TRIGGER_MANUAL = 1;

  public abstract void disable();

  public abstract void enable();

  public abstract void evaluate(List<? extends MediaChunk> paramList, long paramLong, Format[] paramArrayOfFormat, Evaluation paramEvaluation);

  public static class AdaptiveEvaluator
    implements FormatEvaluator
  {
    public static final float DEFAULT_BANDWIDTH_FRACTION = 0.75F;
    public static final int DEFAULT_MAX_DURATION_FOR_QUALITY_DECREASE_MS = 25000;
    public static final int DEFAULT_MAX_INITIAL_BITRATE = 800000;
    public static final int DEFAULT_MIN_DURATION_FOR_QUALITY_INCREASE_MS = 10000;
    public static final int DEFAULT_MIN_DURATION_TO_RETAIN_AFTER_DISCARD_MS = 25000;
    private final float bandwidthFraction;
    private final BandwidthMeter bandwidthMeter;
    private final long maxDurationForQualityDecreaseUs;
    private final int maxInitialBitrate;
    private final long minDurationForQualityIncreaseUs;
    private final long minDurationToRetainAfterDiscardUs;

    public AdaptiveEvaluator(BandwidthMeter paramBandwidthMeter)
    {
      this(paramBandwidthMeter, 800000, 10000, 25000, 25000, 0.75F);
    }

    public AdaptiveEvaluator(BandwidthMeter paramBandwidthMeter, int paramInt1, int paramInt2, int paramInt3, int paramInt4, float paramFloat)
    {
      this.bandwidthMeter = paramBandwidthMeter;
      this.maxInitialBitrate = paramInt1;
      this.minDurationForQualityIncreaseUs = (1000L * paramInt2);
      this.maxDurationForQualityDecreaseUs = (1000L * paramInt3);
      this.minDurationToRetainAfterDiscardUs = (1000L * paramInt4);
      this.bandwidthFraction = paramFloat;
    }

    protected long computeEffectiveBitrateEstimate(long paramLong)
    {
      if (paramLong == -1L)
        return this.maxInitialBitrate;
      return ()((float)paramLong * this.bandwidthFraction);
    }

    protected Format determineIdealFormat(Format[] paramArrayOfFormat, long paramLong)
    {
      long l = computeEffectiveBitrateEstimate(paramLong);
      for (int i = 0; i < paramArrayOfFormat.length; i++)
      {
        Format localFormat = paramArrayOfFormat[i];
        if (localFormat.bitrate <= l)
          return localFormat;
      }
      return paramArrayOfFormat[(-1 + paramArrayOfFormat.length)];
    }

    public void disable()
    {
    }

    public void enable()
    {
    }

    public void evaluate(List<? extends MediaChunk> paramList, long paramLong, Format[] paramArrayOfFormat, FormatEvaluator.Evaluation paramEvaluation)
    {
      long l;
      Format localFormat1;
      Format localFormat2;
      int i;
      label62: int j;
      if (paramList.isEmpty())
      {
        l = 0L;
        localFormat1 = paramEvaluation.format;
        localFormat2 = determineIdealFormat(paramArrayOfFormat, this.bandwidthMeter.getBitrateEstimate());
        if ((localFormat2 == null) || (localFormat1 == null) || (localFormat2.bitrate <= localFormat1.bitrate))
          break label160;
        i = 1;
        if ((localFormat2 == null) || (localFormat1 == null) || (localFormat2.bitrate >= localFormat1.bitrate))
          break label166;
        j = 1;
        label88: if (i == 0)
          break label300;
        if (l >= this.minDurationForQualityIncreaseUs)
          break label172;
        localFormat2 = localFormat1;
      }
      label160: label166: label298: 
      while (true)
      {
        if ((localFormat1 != null) && (localFormat2 != localFormat1))
          paramEvaluation.trigger = 2;
        paramEvaluation.format = localFormat2;
        return;
        l = ((MediaChunk)paramList.get(-1 + paramList.size())).endTimeUs - paramLong;
        break;
        i = 0;
        break label62;
        j = 0;
        break label88;
        label172: if (l >= this.minDurationToRetainAfterDiscardUs)
        {
          for (int k = 1; ; k++)
          {
            if (k >= paramList.size())
              break label298;
            MediaChunk localMediaChunk = (MediaChunk)paramList.get(k);
            if ((localMediaChunk.startTimeUs - paramLong >= this.minDurationToRetainAfterDiscardUs) && (localMediaChunk.format.bitrate < localFormat2.bitrate) && (localMediaChunk.format.height < localFormat2.height) && (localMediaChunk.format.height < 720) && (localMediaChunk.format.width < 1280))
            {
              paramEvaluation.queueSize = k;
              break;
            }
          }
          continue;
          label300: if ((j != 0) && (localFormat1 != null) && (l >= this.maxDurationForQualityDecreaseUs))
            localFormat2 = localFormat1;
        }
      }
    }
  }

  public static final class Evaluation
  {
    public Format format;
    public int queueSize;
    public int trigger = 0;
  }

  public static class FixedEvaluator
    implements FormatEvaluator
  {
    public void disable()
    {
    }

    public void enable()
    {
    }

    public void evaluate(List<? extends MediaChunk> paramList, long paramLong, Format[] paramArrayOfFormat, FormatEvaluator.Evaluation paramEvaluation)
    {
      paramEvaluation.format = paramArrayOfFormat[0];
    }
  }

  public static class RandomEvaluator
    implements FormatEvaluator
  {
    private final Random random = new Random();

    public void disable()
    {
    }

    public void enable()
    {
    }

    public void evaluate(List<? extends MediaChunk> paramList, long paramLong, Format[] paramArrayOfFormat, FormatEvaluator.Evaluation paramEvaluation)
    {
      Format localFormat = paramArrayOfFormat[this.random.nextInt(paramArrayOfFormat.length)];
      if ((paramEvaluation.format != null) && (!paramEvaluation.format.id.equals(localFormat.id)))
        paramEvaluation.trigger = 2;
      paramEvaluation.format = localFormat;
    }
  }
}