package com.google.android.exoplayer;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import com.google.android.exoplayer.util.Util;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class MediaFormat
{
  private static final String KEY_PIXEL_WIDTH_HEIGHT_RATIO = "com.google.android.videos.pixelWidthHeightRatio";
  public static final int NO_VALUE = -1;
  public final int bitrate;
  public final int channelCount;
  private android.media.MediaFormat frameworkMediaFormat;
  private int hashCode;
  public final int height;
  public final List<byte[]> initializationData;
  private int maxHeight;
  public final int maxInputSize;
  private int maxWidth;
  public final String mimeType;
  public final float pixelWidthHeightRatio;
  public final int sampleRate;
  public final int width;

  @TargetApi(16)
  private MediaFormat(android.media.MediaFormat paramMediaFormat)
  {
    this.frameworkMediaFormat = paramMediaFormat;
    this.mimeType = paramMediaFormat.getString("mime");
    this.maxInputSize = getOptionalIntegerV16(paramMediaFormat, "max-input-size");
    this.width = getOptionalIntegerV16(paramMediaFormat, "width");
    this.height = getOptionalIntegerV16(paramMediaFormat, "height");
    this.channelCount = getOptionalIntegerV16(paramMediaFormat, "channel-count");
    this.sampleRate = getOptionalIntegerV16(paramMediaFormat, "sample-rate");
    this.bitrate = getOptionalIntegerV16(paramMediaFormat, "bitrate");
    this.pixelWidthHeightRatio = getOptionalFloatV16(paramMediaFormat, "com.google.android.videos.pixelWidthHeightRatio");
    this.initializationData = new ArrayList();
    for (int i = 0; paramMediaFormat.containsKey("csd-" + i); i++)
    {
      ByteBuffer localByteBuffer = paramMediaFormat.getByteBuffer("csd-" + i);
      byte[] arrayOfByte = new byte[localByteBuffer.limit()];
      localByteBuffer.get(arrayOfByte);
      this.initializationData.add(arrayOfByte);
      localByteBuffer.flip();
    }
    this.maxWidth = -1;
    this.maxHeight = -1;
  }

  private MediaFormat(String paramString, int paramInt1, int paramInt2, int paramInt3, float paramFloat, int paramInt4, int paramInt5, int paramInt6, List<byte[]> paramList)
  {
    this.mimeType = paramString;
    this.maxInputSize = paramInt1;
    this.width = paramInt2;
    this.height = paramInt3;
    this.pixelWidthHeightRatio = paramFloat;
    this.channelCount = paramInt4;
    this.sampleRate = paramInt5;
    this.bitrate = paramInt6;
    if (paramList == null)
      paramList = Collections.emptyList();
    this.initializationData = paramList;
    this.maxWidth = -1;
    this.maxHeight = -1;
  }

  public static MediaFormat createAudioFormat(String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4, List<byte[]> paramList)
  {
    return new MediaFormat(paramString, paramInt1, -1, -1, -1.0F, paramInt2, paramInt3, paramInt4, paramList);
  }

  public static MediaFormat createAudioFormat(String paramString, int paramInt1, int paramInt2, int paramInt3, List<byte[]> paramList)
  {
    return new MediaFormat(paramString, paramInt1, -1, -1, -1.0F, paramInt2, paramInt3, -1, paramList);
  }

  public static MediaFormat createEia608Format()
  {
    return createFormatForMimeType("application/eia-608");
  }

  public static MediaFormat createFormatForMimeType(String paramString)
  {
    return new MediaFormat(paramString, -1, -1, -1, -1.0F, -1, -1, -1, null);
  }

  @TargetApi(16)
  public static MediaFormat createFromFrameworkMediaFormatV16(android.media.MediaFormat paramMediaFormat)
  {
    return new MediaFormat(paramMediaFormat);
  }

  public static MediaFormat createId3Format()
  {
    return createFormatForMimeType("application/id3");
  }

  public static MediaFormat createTtmlFormat()
  {
    return createFormatForMimeType("application/ttml+xml");
  }

  public static MediaFormat createVideoFormat(String paramString, int paramInt1, int paramInt2, int paramInt3, float paramFloat, List<byte[]> paramList)
  {
    return new MediaFormat(paramString, paramInt1, paramInt2, paramInt3, paramFloat, -1, -1, -1, paramList);
  }

  public static MediaFormat createVideoFormat(String paramString, int paramInt1, int paramInt2, int paramInt3, List<byte[]> paramList)
  {
    return createVideoFormat(paramString, paramInt1, paramInt2, paramInt3, 1.0F, paramList);
  }

  private boolean equalsInternal(MediaFormat paramMediaFormat, boolean paramBoolean)
  {
    if ((this.maxInputSize != paramMediaFormat.maxInputSize) || (this.width != paramMediaFormat.width) || (this.height != paramMediaFormat.height) || (this.pixelWidthHeightRatio != paramMediaFormat.pixelWidthHeightRatio) || ((!paramBoolean) && ((this.maxWidth != paramMediaFormat.maxWidth) || (this.maxHeight != paramMediaFormat.maxHeight))) || (this.channelCount != paramMediaFormat.channelCount) || (this.sampleRate != paramMediaFormat.sampleRate) || (!Util.areEqual(this.mimeType, paramMediaFormat.mimeType)) || (this.bitrate != paramMediaFormat.bitrate) || (this.initializationData.size() != paramMediaFormat.initializationData.size()))
      return false;
    for (int i = 0; i < this.initializationData.size(); i++)
      if (!Arrays.equals((byte[])this.initializationData.get(i), (byte[])paramMediaFormat.initializationData.get(i)))
        return false;
    return true;
  }

  @TargetApi(16)
  private static final float getOptionalFloatV16(android.media.MediaFormat paramMediaFormat, String paramString)
  {
    if (paramMediaFormat.containsKey(paramString))
      return paramMediaFormat.getFloat(paramString);
    return -1.0F;
  }

  @TargetApi(16)
  private static final int getOptionalIntegerV16(android.media.MediaFormat paramMediaFormat, String paramString)
  {
    if (paramMediaFormat.containsKey(paramString))
      return paramMediaFormat.getInteger(paramString);
    return -1;
  }

  @TargetApi(16)
  private static final void maybeSetFloatV16(android.media.MediaFormat paramMediaFormat, String paramString, float paramFloat)
  {
    if (paramFloat != -1.0F)
      paramMediaFormat.setFloat(paramString, paramFloat);
  }

  @TargetApi(16)
  private static final void maybeSetIntegerV16(android.media.MediaFormat paramMediaFormat, String paramString, int paramInt)
  {
    if (paramInt != -1)
      paramMediaFormat.setInteger(paramString, paramInt);
  }

  @SuppressLint({"InlinedApi"})
  @TargetApi(16)
  private final void maybeSetMaxDimensionsV16(android.media.MediaFormat paramMediaFormat)
  {
    maybeSetIntegerV16(paramMediaFormat, "max-width", this.maxWidth);
    maybeSetIntegerV16(paramMediaFormat, "max-height", this.maxHeight);
  }

  public boolean equals(MediaFormat paramMediaFormat, boolean paramBoolean)
  {
    if (this == paramMediaFormat)
      return true;
    if (paramMediaFormat == null)
      return false;
    return equalsInternal(paramMediaFormat, paramBoolean);
  }

  public boolean equals(Object paramObject)
  {
    boolean bool;
    if (this == paramObject)
      bool = true;
    Class localClass1;
    Class localClass2;
    do
    {
      do
      {
        return bool;
        bool = false;
      }
      while (paramObject == null);
      localClass1 = getClass();
      localClass2 = paramObject.getClass();
      bool = false;
    }
    while (localClass1 != localClass2);
    return equalsInternal((MediaFormat)paramObject, false);
  }

  @TargetApi(16)
  public final android.media.MediaFormat getFrameworkMediaFormatV16()
  {
    if (this.frameworkMediaFormat == null)
    {
      android.media.MediaFormat localMediaFormat = new android.media.MediaFormat();
      localMediaFormat.setString("mime", this.mimeType);
      maybeSetIntegerV16(localMediaFormat, "max-input-size", this.maxInputSize);
      maybeSetIntegerV16(localMediaFormat, "width", this.width);
      maybeSetIntegerV16(localMediaFormat, "height", this.height);
      maybeSetIntegerV16(localMediaFormat, "channel-count", this.channelCount);
      maybeSetIntegerV16(localMediaFormat, "sample-rate", this.sampleRate);
      maybeSetIntegerV16(localMediaFormat, "bitrate", this.bitrate);
      maybeSetFloatV16(localMediaFormat, "com.google.android.videos.pixelWidthHeightRatio", this.pixelWidthHeightRatio);
      for (int i = 0; i < this.initializationData.size(); i++)
        localMediaFormat.setByteBuffer("csd-" + i, ByteBuffer.wrap((byte[])this.initializationData.get(i)));
      maybeSetMaxDimensionsV16(localMediaFormat);
      this.frameworkMediaFormat = localMediaFormat;
    }
    return this.frameworkMediaFormat;
  }

  public int getMaxVideoHeight()
  {
    return this.maxHeight;
  }

  public int getMaxVideoWidth()
  {
    return this.maxWidth;
  }

  public int hashCode()
  {
    if (this.hashCode == 0)
    {
      if (this.mimeType == null);
      int j;
      for (int i = 0; ; i = this.mimeType.hashCode())
      {
        j = 31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (i + 527) + this.maxInputSize) + this.width) + this.height) + Float.floatToRawIntBits(this.pixelWidthHeightRatio)) + this.maxWidth) + this.maxHeight) + this.channelCount) + this.sampleRate) + this.bitrate;
        for (int k = 0; k < this.initializationData.size(); k++)
          j = j * 31 + Arrays.hashCode((byte[])this.initializationData.get(k));
      }
      this.hashCode = j;
    }
    return this.hashCode;
  }

  public void setMaxVideoDimensions(int paramInt1, int paramInt2)
  {
    this.maxWidth = paramInt1;
    this.maxHeight = paramInt2;
    if (this.frameworkMediaFormat != null)
      maybeSetMaxDimensionsV16(this.frameworkMediaFormat);
  }

  public String toString()
  {
    return "MediaFormat(" + this.mimeType + ", " + this.maxInputSize + ", " + this.width + ", " + this.height + ", " + this.pixelWidthHeightRatio + ", " + this.channelCount + ", " + this.sampleRate + ", " + this.bitrate + ", " + this.maxWidth + ", " + this.maxHeight + ")";
  }
}