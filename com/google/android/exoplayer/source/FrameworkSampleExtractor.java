package com.google.android.exoplayer.source;

import android.annotation.TargetApi;
import android.content.Context;
import android.media.MediaExtractor;
import android.net.Uri;
import com.google.android.exoplayer.CryptoInfo;
import com.google.android.exoplayer.MediaFormatHolder;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.TrackInfo;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.io.FileDescriptor;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Map;
import java.util.UUID;

@TargetApi(16)
public final class FrameworkSampleExtractor
  implements SampleExtractor
{
  private final Context context;
  private final FileDescriptor fileDescriptor;
  private final long fileDescriptorLength;
  private final long fileDescriptorOffset;
  private final Map<String, String> headers;
  private final MediaExtractor mediaExtractor;
  private TrackInfo[] trackInfos;
  private final Uri uri;

  public FrameworkSampleExtractor(Context paramContext, Uri paramUri, Map<String, String> paramMap)
  {
    if (Util.SDK_INT >= 16);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.context = ((Context)Assertions.checkNotNull(paramContext));
      this.uri = ((Uri)Assertions.checkNotNull(paramUri));
      this.headers = paramMap;
      this.fileDescriptor = null;
      this.fileDescriptorOffset = 0L;
      this.fileDescriptorLength = 0L;
      this.mediaExtractor = new MediaExtractor();
      return;
    }
  }

  public FrameworkSampleExtractor(FileDescriptor paramFileDescriptor, long paramLong1, long paramLong2)
  {
    if (Util.SDK_INT >= 16);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.context = null;
      this.uri = null;
      this.headers = null;
      this.fileDescriptor = ((FileDescriptor)Assertions.checkNotNull(paramFileDescriptor));
      this.fileDescriptorOffset = paramLong1;
      this.fileDescriptorLength = paramLong2;
      this.mediaExtractor = new MediaExtractor();
      return;
    }
  }

  @TargetApi(18)
  private Map<UUID, byte[]> getPsshInfoV18()
  {
    Map localMap = this.mediaExtractor.getPsshInfo();
    if ((localMap == null) || (localMap.isEmpty()))
      localMap = null;
    return localMap;
  }

  public void deselectTrack(int paramInt)
  {
    this.mediaExtractor.unselectTrack(paramInt);
  }

  public long getBufferedPositionUs()
  {
    long l1 = this.mediaExtractor.getCachedDuration();
    if (l1 == -1L)
      return -1L;
    long l2 = this.mediaExtractor.getSampleTime();
    if (l2 == -1L)
      return -3L;
    return l2 + l1;
  }

  public TrackInfo[] getTrackInfos()
  {
    return this.trackInfos;
  }

  public void getTrackMediaFormat(int paramInt, MediaFormatHolder paramMediaFormatHolder)
  {
    paramMediaFormatHolder.format = com.google.android.exoplayer.MediaFormat.createFromFrameworkMediaFormatV16(this.mediaExtractor.getTrackFormat(paramInt));
    if (Util.SDK_INT >= 18);
    for (Map localMap = getPsshInfoV18(); ; localMap = null)
    {
      paramMediaFormatHolder.drmInitData = localMap;
      return;
    }
  }

  public boolean prepare()
    throws IOException
  {
    int j;
    label44: android.media.MediaFormat localMediaFormat;
    if (this.context != null)
    {
      this.mediaExtractor.setDataSource(this.context, this.uri, this.headers);
      int i = this.mediaExtractor.getTrackCount();
      this.trackInfos = new TrackInfo[i];
      j = 0;
      if (j >= i)
        break label136;
      localMediaFormat = this.mediaExtractor.getTrackFormat(j);
      if (!localMediaFormat.containsKey("durationUs"))
        break label128;
    }
    label128: for (long l = localMediaFormat.getLong("durationUs"); ; l = -1L)
    {
      String str = localMediaFormat.getString("mime");
      this.trackInfos[j] = new TrackInfo(str, l);
      j++;
      break label44;
      this.mediaExtractor.setDataSource(this.fileDescriptor, this.fileDescriptorOffset, this.fileDescriptorLength);
      break;
    }
    label136: return true;
  }

  public int readSample(int paramInt, SampleHolder paramSampleHolder)
  {
    int i = this.mediaExtractor.getSampleTrackIndex();
    if (i != paramInt)
    {
      if (i < 0)
        return -1;
      return -2;
    }
    if (paramSampleHolder.data != null)
    {
      int j = paramSampleHolder.data.position();
      paramSampleHolder.size = this.mediaExtractor.readSampleData(paramSampleHolder.data, j);
      paramSampleHolder.data.position(j + paramSampleHolder.size);
    }
    while (true)
    {
      paramSampleHolder.timeUs = this.mediaExtractor.getSampleTime();
      paramSampleHolder.flags = this.mediaExtractor.getSampleFlags();
      if ((0x2 & paramSampleHolder.flags) != 0)
        paramSampleHolder.cryptoInfo.setFromExtractorV16(this.mediaExtractor);
      this.mediaExtractor.advance();
      return -3;
      paramSampleHolder.size = 0;
    }
  }

  public void release()
  {
    this.mediaExtractor.release();
  }

  public void seekTo(long paramLong)
  {
    this.mediaExtractor.seekTo(paramLong, 0);
  }

  public void selectTrack(int paramInt)
  {
    this.mediaExtractor.selectTrack(paramInt);
  }
}