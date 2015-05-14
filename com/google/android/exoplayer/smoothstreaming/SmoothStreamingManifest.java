package com.google.android.exoplayer.smoothstreaming;

import android.net.Uri;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.util.List;
import java.util.UUID;

public class SmoothStreamingManifest
{
  public final long durationUs;
  public final long dvrWindowLengthUs;
  public final boolean isLive;
  public final int lookAheadCount;
  public final int majorVersion;
  public final int minorVersion;
  public final ProtectionElement protectionElement;
  public final StreamElement[] streamElements;

  public SmoothStreamingManifest(int paramInt1, int paramInt2, long paramLong1, long paramLong2, long paramLong3, int paramInt3, boolean paramBoolean, ProtectionElement paramProtectionElement, StreamElement[] paramArrayOfStreamElement)
  {
    this.majorVersion = paramInt1;
    this.minorVersion = paramInt2;
    this.lookAheadCount = paramInt3;
    this.isLive = paramBoolean;
    this.protectionElement = paramProtectionElement;
    this.streamElements = paramArrayOfStreamElement;
    long l1;
    if (paramLong3 == 0L)
    {
      l1 = -1L;
      this.dvrWindowLengthUs = l1;
      if (paramLong2 != 0L)
        break label89;
    }
    label89: for (long l2 = -1L; ; l2 = Util.scaleLargeTimestamp(paramLong2, 1000000L, paramLong1))
    {
      this.durationUs = l2;
      return;
      l1 = Util.scaleLargeTimestamp(paramLong3, 1000000L, paramLong1);
      break;
    }
  }

  public static class ProtectionElement
  {
    public final byte[] data;
    public final UUID uuid;

    public ProtectionElement(UUID paramUUID, byte[] paramArrayOfByte)
    {
      this.uuid = paramUUID;
      this.data = paramArrayOfByte;
    }
  }

  public static class StreamElement
  {
    public static final int TYPE_AUDIO = 0;
    public static final int TYPE_TEXT = 2;
    public static final int TYPE_UNKNOWN = -1;
    public static final int TYPE_VIDEO = 1;
    private static final String URL_PLACEHOLDER_BITRATE = "{bitrate}";
    private static final String URL_PLACEHOLDER_START_TIME = "{start time}";
    private final Uri baseUri;
    public final int chunkCount;
    private final List<Long> chunkStartTimes;
    private final long[] chunkStartTimesUs;
    private final String chunkTemplate;
    public final int displayHeight;
    public final int displayWidth;
    public final String language;
    private final long lastChunkDurationUs;
    public final int maxHeight;
    public final int maxWidth;
    public final String name;
    public final int qualityLevels;
    public final String subType;
    public final long timescale;
    public final SmoothStreamingManifest.TrackElement[] tracks;
    public final int type;

    public StreamElement(Uri paramUri, String paramString1, int paramInt1, String paramString2, long paramLong1, String paramString3, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, String paramString4, SmoothStreamingManifest.TrackElement[] paramArrayOfTrackElement, List<Long> paramList, long paramLong2)
    {
      this.baseUri = paramUri;
      this.chunkTemplate = paramString1;
      this.type = paramInt1;
      this.subType = paramString2;
      this.timescale = paramLong1;
      this.name = paramString3;
      this.qualityLevels = paramInt2;
      this.maxWidth = paramInt3;
      this.maxHeight = paramInt4;
      this.displayWidth = paramInt5;
      this.displayHeight = paramInt6;
      this.language = paramString4;
      this.tracks = paramArrayOfTrackElement;
      this.chunkCount = paramList.size();
      this.chunkStartTimes = paramList;
      this.lastChunkDurationUs = Util.scaleLargeTimestamp(paramLong2, 1000000L, paramLong1);
      this.chunkStartTimesUs = Util.scaleLargeTimestamps(paramList, 1000000L, paramLong1);
    }

    public Uri buildRequestUri(int paramInt1, int paramInt2)
    {
      boolean bool1 = true;
      boolean bool2;
      boolean bool3;
      if (this.tracks != null)
      {
        bool2 = bool1;
        Assertions.checkState(bool2);
        if (this.chunkStartTimes == null)
          break label109;
        bool3 = bool1;
        label27: Assertions.checkState(bool3);
        if (paramInt2 >= this.chunkStartTimes.size())
          break label115;
      }
      while (true)
      {
        Assertions.checkState(bool1);
        String str = this.chunkTemplate.replace("{bitrate}", Integer.toString(this.tracks[paramInt1].bitrate)).replace("{start time}", ((Long)this.chunkStartTimes.get(paramInt2)).toString());
        return Util.getMergedUri(this.baseUri, str);
        bool2 = false;
        break;
        label109: bool3 = false;
        break label27;
        label115: bool1 = false;
      }
    }

    public long getChunkDurationUs(int paramInt)
    {
      if (paramInt == -1 + this.chunkCount)
        return this.lastChunkDurationUs;
      return this.chunkStartTimesUs[(paramInt + 1)] - this.chunkStartTimesUs[paramInt];
    }

    public int getChunkIndex(long paramLong)
    {
      return Util.binarySearchFloor(this.chunkStartTimesUs, paramLong, true, true);
    }

    public long getStartTimeUs(int paramInt)
    {
      return this.chunkStartTimesUs[paramInt];
    }
  }

  public static class TrackElement
  {
    public final int audioTag;
    public final int bitPerSample;
    public final int bitrate;
    public final String content;
    public final byte[][] csd;
    public final int index;
    public final int level;
    public final int maxHeight;
    public final int maxWidth;
    public final String mimeType;
    public final int nalUnitLengthField;
    public final int numChannels;
    public final int packetSize;
    public final int profile;
    public final int sampleRate;

    public TrackElement(int paramInt1, int paramInt2, String paramString1, byte[][] paramArrayOfByte, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10, int paramInt11, int paramInt12, String paramString2)
    {
      this.index = paramInt1;
      this.bitrate = paramInt2;
      this.mimeType = paramString1;
      this.csd = paramArrayOfByte;
      this.profile = paramInt3;
      this.level = paramInt4;
      this.maxWidth = paramInt5;
      this.maxHeight = paramInt6;
      this.sampleRate = paramInt7;
      this.numChannels = paramInt8;
      this.packetSize = paramInt9;
      this.audioTag = paramInt10;
      this.bitPerSample = paramInt11;
      this.nalUnitLengthField = paramInt12;
      this.content = paramString2;
    }
  }
}