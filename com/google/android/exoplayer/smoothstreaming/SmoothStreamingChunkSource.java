package com.google.android.exoplayer.smoothstreaming;

import android.net.Uri;
import android.os.SystemClock;
import android.util.Base64;
import android.util.SparseArray;
import com.google.android.exoplayer.BehindLiveWindowException;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.TrackInfo;
import com.google.android.exoplayer.chunk.Chunk;
import com.google.android.exoplayer.chunk.ChunkOperationHolder;
import com.google.android.exoplayer.chunk.ChunkSource;
import com.google.android.exoplayer.chunk.ContainerMediaChunk;
import com.google.android.exoplayer.chunk.Format;
import com.google.android.exoplayer.chunk.Format.DecreasingBandwidthComparator;
import com.google.android.exoplayer.chunk.FormatEvaluator;
import com.google.android.exoplayer.chunk.FormatEvaluator.Evaluation;
import com.google.android.exoplayer.chunk.MediaChunk;
import com.google.android.exoplayer.chunk.parser.Extractor;
import com.google.android.exoplayer.chunk.parser.mp4.FragmentedMp4Extractor;
import com.google.android.exoplayer.chunk.parser.mp4.TrackEncryptionBox;
import com.google.android.exoplayer.mp4.Track;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import com.google.android.exoplayer.util.CodecSpecificDataUtil;
import com.google.android.exoplayer.util.ManifestFetcher;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class SmoothStreamingChunkSource
  implements ChunkSource
{
  private static final int INITIALIZATION_VECTOR_SIZE = 8;
  private static final int MINIMUM_MANIFEST_REFRESH_PERIOD_MS = 5000;
  private SmoothStreamingManifest currentManifest;
  private int currentManifestChunkOffset;
  private final DataSource dataSource;
  private final FormatEvaluator.Evaluation evaluation;
  private final SparseArray<FragmentedMp4Extractor> extractors;
  private IOException fatalError;
  private boolean finishedCurrentManifest;
  private final FormatEvaluator formatEvaluator;
  private final SmoothStreamingFormat[] formats;
  private final long liveEdgeLatencyUs;
  private final ManifestFetcher<SmoothStreamingManifest> manifestFetcher;
  private final int maxHeight;
  private final int maxWidth;
  private final Map<UUID, byte[]> psshInfo;
  private final int streamElementIndex;
  private final TrackInfo trackInfo;

  public SmoothStreamingChunkSource(SmoothStreamingManifest paramSmoothStreamingManifest, int paramInt, int[] paramArrayOfInt, DataSource paramDataSource, FormatEvaluator paramFormatEvaluator)
  {
    this(null, paramSmoothStreamingManifest, paramInt, paramArrayOfInt, paramDataSource, paramFormatEvaluator, 0L);
  }

  public SmoothStreamingChunkSource(ManifestFetcher<SmoothStreamingManifest> paramManifestFetcher, int paramInt, int[] paramArrayOfInt, DataSource paramDataSource, FormatEvaluator paramFormatEvaluator, long paramLong)
  {
    this(paramManifestFetcher, (SmoothStreamingManifest)paramManifestFetcher.getManifest(), paramInt, paramArrayOfInt, paramDataSource, paramFormatEvaluator, paramLong);
  }

  private SmoothStreamingChunkSource(ManifestFetcher<SmoothStreamingManifest> paramManifestFetcher, SmoothStreamingManifest paramSmoothStreamingManifest, int paramInt, int[] paramArrayOfInt, DataSource paramDataSource, FormatEvaluator paramFormatEvaluator, long paramLong)
  {
    this.manifestFetcher = paramManifestFetcher;
    this.streamElementIndex = paramInt;
    this.currentManifest = paramSmoothStreamingManifest;
    this.dataSource = paramDataSource;
    this.formatEvaluator = paramFormatEvaluator;
    this.liveEdgeLatencyUs = (1000L * paramLong);
    SmoothStreamingManifest.StreamElement localStreamElement = getElement(paramSmoothStreamingManifest);
    this.trackInfo = new TrackInfo(localStreamElement.tracks[0].mimeType, paramSmoothStreamingManifest.durationUs);
    this.evaluation = new FormatEvaluator.Evaluation();
    SmoothStreamingManifest.ProtectionElement localProtectionElement = paramSmoothStreamingManifest.protectionElement;
    TrackEncryptionBox[] arrayOfTrackEncryptionBox;
    int i;
    label154: int j;
    int k;
    int m;
    label183: int n;
    label202: MediaFormat localMediaFormat;
    if (localProtectionElement != null)
    {
      byte[] arrayOfByte = getKeyId(localProtectionElement.data);
      arrayOfTrackEncryptionBox = new TrackEncryptionBox[1];
      arrayOfTrackEncryptionBox[0] = new TrackEncryptionBox(true, 8, arrayOfByte);
      this.psshInfo = Collections.singletonMap(localProtectionElement.uuid, localProtectionElement.data);
      if (paramArrayOfInt == null)
        break label384;
      i = paramArrayOfInt.length;
      this.formats = new SmoothStreamingFormat[i];
      this.extractors = new SparseArray();
      j = 0;
      k = 0;
      m = 0;
      if (m >= i)
        break label409;
      if (paramArrayOfInt == null)
        break label395;
      n = paramArrayOfInt[m];
      SmoothStreamingManifest.TrackElement localTrackElement = localStreamElement.tracks[n];
      this.formats[m] = new SmoothStreamingFormat(String.valueOf(n), localTrackElement.mimeType, localTrackElement.maxWidth, localTrackElement.maxHeight, localTrackElement.numChannels, localTrackElement.sampleRate, localTrackElement.bitrate, n);
      int i1 = localTrackElement.maxWidth;
      j = Math.max(j, i1);
      int i2 = localTrackElement.maxHeight;
      k = Math.max(k, i2);
      localMediaFormat = getMediaFormat(localStreamElement, n);
      if (localStreamElement.type != 1)
        break label402;
    }
    label384: label395: label402: for (int i3 = 1986618469; ; i3 = 1936684398)
    {
      FragmentedMp4Extractor localFragmentedMp4Extractor = new FragmentedMp4Extractor(1);
      localFragmentedMp4Extractor.setTrack(new Track(n, i3, localStreamElement.timescale, paramSmoothStreamingManifest.durationUs, localMediaFormat, arrayOfTrackEncryptionBox));
      this.extractors.put(n, localFragmentedMp4Extractor);
      m++;
      break label183;
      this.psshInfo = null;
      arrayOfTrackEncryptionBox = null;
      break;
      i = localStreamElement.tracks.length;
      break label154;
      n = m;
      break label202;
    }
    label409: this.maxHeight = k;
    this.maxWidth = j;
    Arrays.sort(this.formats, new Format.DecreasingBandwidthComparator());
  }

  private SmoothStreamingManifest.StreamElement getElement(SmoothStreamingManifest paramSmoothStreamingManifest)
  {
    return paramSmoothStreamingManifest.streamElements[this.streamElementIndex];
  }

  private static byte[] getKeyId(byte[] paramArrayOfByte)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    for (int i = 0; i < paramArrayOfByte.length; i += 2)
      localStringBuilder.append((char)paramArrayOfByte[i]);
    String str = localStringBuilder.toString();
    byte[] arrayOfByte = Base64.decode(str.substring(5 + str.indexOf("<KID>"), str.indexOf("</KID>")), 0);
    swap(arrayOfByte, 0, 3);
    swap(arrayOfByte, 1, 2);
    swap(arrayOfByte, 4, 5);
    swap(arrayOfByte, 6, 7);
    return arrayOfByte;
  }

  private long getLiveSeekPosition()
  {
    long l = -9223372036854775808L;
    for (int i = 0; i < this.currentManifest.streamElements.length; i++)
    {
      SmoothStreamingManifest.StreamElement localStreamElement = this.currentManifest.streamElements[i];
      if (localStreamElement.chunkCount > 0)
        l = Math.max(l, localStreamElement.getStartTimeUs(-1 + localStreamElement.chunkCount) + localStreamElement.getChunkDurationUs(-1 + localStreamElement.chunkCount));
    }
    return l - this.liveEdgeLatencyUs;
  }

  private static MediaFormat getMediaFormat(SmoothStreamingManifest.StreamElement paramStreamElement, int paramInt)
  {
    SmoothStreamingManifest.TrackElement localTrackElement = paramStreamElement.tracks[paramInt];
    String str = localTrackElement.mimeType;
    if (paramStreamElement.type == 1)
    {
      MediaFormat localMediaFormat = MediaFormat.createVideoFormat(str, -1, localTrackElement.maxWidth, localTrackElement.maxHeight, Arrays.asList(localTrackElement.csd));
      localMediaFormat.setMaxVideoDimensions(paramStreamElement.maxWidth, paramStreamElement.maxHeight);
      return localMediaFormat;
    }
    if (paramStreamElement.type == 0)
    {
      if (localTrackElement.csd != null);
      for (List localList = Arrays.asList(localTrackElement.csd); ; localList = Collections.singletonList(CodecSpecificDataUtil.buildAudioSpecificConfig(localTrackElement.sampleRate, localTrackElement.numChannels)))
        return MediaFormat.createAudioFormat(str, -1, localTrackElement.numChannels, localTrackElement.sampleRate, localList);
    }
    if (paramStreamElement.type == 2)
      return MediaFormat.createFormatForMimeType(paramStreamElement.tracks[paramInt].mimeType);
    return null;
  }

  private static MediaChunk newMediaChunk(Format paramFormat, Uri paramUri, String paramString, Extractor paramExtractor, Map<UUID, byte[]> paramMap, DataSource paramDataSource, int paramInt1, boolean paramBoolean, long paramLong1, long paramLong2, int paramInt2)
  {
    int i;
    if (paramBoolean)
    {
      i = -1;
      if (!paramBoolean)
        break label66;
    }
    label66: for (long l = -1L; ; l = paramLong2)
    {
      return new ContainerMediaChunk(paramDataSource, new DataSpec(paramUri, 0L, -1L, paramString), paramFormat, paramInt2, paramLong1, l, i, paramExtractor, paramMap, false, -paramLong1);
      i = paramInt1 + 1;
      break;
    }
  }

  private static void swap(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int i = paramArrayOfByte[paramInt1];
    paramArrayOfByte[paramInt1] = paramArrayOfByte[paramInt2];
    paramArrayOfByte[paramInt2] = i;
  }

  public void continueBuffering(long paramLong)
  {
    if ((this.manifestFetcher == null) || (!this.currentManifest.isLive) || (this.fatalError != null))
      return;
    SmoothStreamingManifest localSmoothStreamingManifest = (SmoothStreamingManifest)this.manifestFetcher.getManifest();
    SmoothStreamingManifest.StreamElement localStreamElement1;
    SmoothStreamingManifest.StreamElement localStreamElement2;
    if ((this.currentManifest != localSmoothStreamingManifest) && (localSmoothStreamingManifest != null))
    {
      localStreamElement1 = getElement(this.currentManifest);
      localStreamElement2 = getElement(localSmoothStreamingManifest);
      if (localStreamElement2.chunkCount != 0)
        break label130;
      this.currentManifestChunkOffset += localStreamElement1.chunkCount;
    }
    while (true)
    {
      this.currentManifest = localSmoothStreamingManifest;
      this.finishedCurrentManifest = false;
      if ((!this.finishedCurrentManifest) || (SystemClock.elapsedRealtime() <= 5000L + this.manifestFetcher.getManifestLoadTimestamp()))
        break;
      this.manifestFetcher.requestRefresh();
      return;
      label130: if (localStreamElement1.chunkCount > 0)
        this.currentManifestChunkOffset += localStreamElement1.getChunkIndex(localStreamElement2.getStartTimeUs(0));
    }
  }

  public void disable(List<? extends MediaChunk> paramList)
  {
    if (this.manifestFetcher != null)
      this.manifestFetcher.disable();
  }

  public void enable()
  {
    this.fatalError = null;
    if (this.manifestFetcher != null)
      this.manifestFetcher.enable();
  }

  public final void getChunkOperation(List<? extends MediaChunk> paramList, long paramLong1, long paramLong2, ChunkOperationHolder paramChunkOperationHolder)
  {
    if (this.fatalError != null)
      paramChunkOperationHolder.chunk = null;
    SmoothStreamingFormat localSmoothStreamingFormat;
    do
    {
      return;
      this.evaluation.queueSize = paramList.size();
      this.formatEvaluator.evaluate(paramList, paramLong2, this.formats, this.evaluation);
      localSmoothStreamingFormat = (SmoothStreamingFormat)this.evaluation.format;
      paramChunkOperationHolder.queueSize = this.evaluation.queueSize;
      if (localSmoothStreamingFormat == null)
      {
        paramChunkOperationHolder.chunk = null;
        return;
      }
    }
    while ((paramChunkOperationHolder.queueSize == paramList.size()) && (paramChunkOperationHolder.chunk != null) && (paramChunkOperationHolder.chunk.format.id.equals(this.evaluation.format.id)));
    paramChunkOperationHolder.chunk = null;
    SmoothStreamingManifest.StreamElement localStreamElement = getElement(this.currentManifest);
    if (localStreamElement.chunkCount == 0)
    {
      this.finishedCurrentManifest = true;
      return;
    }
    int i;
    if (paramList.isEmpty())
    {
      if (this.currentManifest.isLive)
        paramLong1 = getLiveSeekPosition();
      i = localStreamElement.getChunkIndex(paramLong1);
    }
    boolean bool;
    label320: long l1;
    while (this.currentManifest.isLive)
      if (i < 0)
      {
        this.fatalError = new BehindLiveWindowException();
        return;
        i = ((MediaChunk)paramList.get(-1 + paramChunkOperationHolder.queueSize)).nextChunkIndex - this.currentManifestChunkOffset;
      }
      else
      {
        int m = localStreamElement.chunkCount;
        if (i >= m)
        {
          this.finishedCurrentManifest = true;
          return;
        }
        int n = -1 + localStreamElement.chunkCount;
        if (i == n)
          this.finishedCurrentManifest = true;
        if (this.currentManifest.isLive)
          break label414;
        int k = -1 + localStreamElement.chunkCount;
        if (i != k)
          break label414;
        bool = true;
        l1 = localStreamElement.getStartTimeUs(i);
        if (!bool)
          break label420;
      }
    label414: label420: for (long l2 = -1L; ; l2 = l1 + localStreamElement.getChunkDurationUs(i))
    {
      int j = i + this.currentManifestChunkOffset;
      paramChunkOperationHolder.chunk = newMediaChunk(localSmoothStreamingFormat, localStreamElement.buildRequestUri(localSmoothStreamingFormat.trackIndex, i), null, (Extractor)this.extractors.get(Integer.parseInt(localSmoothStreamingFormat.id)), this.psshInfo, this.dataSource, j, bool, l1, l2, 0);
      return;
      if (i != -1)
        break;
      return;
      bool = false;
      break label320;
    }
  }

  public IOException getError()
  {
    if (this.fatalError != null)
      return this.fatalError;
    if (this.manifestFetcher != null)
      return this.manifestFetcher.getError();
    return null;
  }

  public final void getMaxVideoDimensions(MediaFormat paramMediaFormat)
  {
    if (this.trackInfo.mimeType.startsWith("video"))
      paramMediaFormat.setMaxVideoDimensions(this.maxWidth, this.maxHeight);
  }

  public final TrackInfo getTrackInfo()
  {
    return this.trackInfo;
  }

  public void onChunkLoadError(Chunk paramChunk, Exception paramException)
  {
  }

  private static final class SmoothStreamingFormat extends Format
  {
    public final int trackIndex;

    public SmoothStreamingFormat(String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6)
    {
      super(paramString2, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
      this.trackIndex = paramInt6;
    }
  }
}