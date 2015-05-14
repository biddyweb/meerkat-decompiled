package com.google.android.exoplayer.dash;

import android.net.Uri;
import android.os.SystemClock;
import com.google.android.exoplayer.BehindLiveWindowException;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.ParserException;
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
import com.google.android.exoplayer.chunk.SingleSampleMediaChunk;
import com.google.android.exoplayer.chunk.parser.Extractor;
import com.google.android.exoplayer.chunk.parser.mp4.FragmentedMp4Extractor;
import com.google.android.exoplayer.chunk.parser.webm.WebmExtractor;
import com.google.android.exoplayer.dash.mpd.AdaptationSet;
import com.google.android.exoplayer.dash.mpd.ContentProtection;
import com.google.android.exoplayer.dash.mpd.MediaPresentationDescription;
import com.google.android.exoplayer.dash.mpd.Period;
import com.google.android.exoplayer.dash.mpd.RangedUri;
import com.google.android.exoplayer.dash.mpd.Representation;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import com.google.android.exoplayer.upstream.NonBlockingInputStream;
import com.google.android.exoplayer.util.ManifestFetcher;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class DashChunkSource
  implements ChunkSource
{
  public static final int USE_ALL_TRACKS = -1;
  private final int adaptationSetIndex;
  private MediaPresentationDescription currentManifest;
  private final DataSource dataSource;
  private final FormatEvaluator.Evaluation evaluation;
  private final FormatEvaluator evaluator;
  private IOException fatalError;
  private boolean finishedCurrentManifest;
  private final Format[] formats;
  private final StringBuilder headerBuilder;
  private boolean lastChunkWasInitialization;
  private final long liveEdgeLatencyUs;
  private final ManifestFetcher<MediaPresentationDescription> manifestFetcher;
  private final int maxHeight;
  private final int maxWidth;
  private final Map<UUID, byte[]> psshInfo;
  private final HashMap<String, RepresentationHolder> representationHolders;
  private final int[] representationIndices;
  private final TrackInfo trackInfo;

  public DashChunkSource(MediaPresentationDescription paramMediaPresentationDescription, int paramInt, int[] paramArrayOfInt, DataSource paramDataSource, FormatEvaluator paramFormatEvaluator)
  {
    this(null, paramMediaPresentationDescription, paramInt, paramArrayOfInt, paramDataSource, paramFormatEvaluator, 0L);
  }

  public DashChunkSource(DataSource paramDataSource, FormatEvaluator paramFormatEvaluator, List<Representation> paramList)
  {
    this(buildManifest(paramList), 0, null, paramDataSource, paramFormatEvaluator);
  }

  public DashChunkSource(DataSource paramDataSource, FormatEvaluator paramFormatEvaluator, Representation[] paramArrayOfRepresentation)
  {
    this(buildManifest(Arrays.asList(paramArrayOfRepresentation)), 0, null, paramDataSource, paramFormatEvaluator);
  }

  public DashChunkSource(ManifestFetcher<MediaPresentationDescription> paramManifestFetcher, int paramInt, int[] paramArrayOfInt, DataSource paramDataSource, FormatEvaluator paramFormatEvaluator, long paramLong)
  {
    this(paramManifestFetcher, (MediaPresentationDescription)paramManifestFetcher.getManifest(), paramInt, paramArrayOfInt, paramDataSource, paramFormatEvaluator, paramLong * 1000L);
  }

  private DashChunkSource(ManifestFetcher<MediaPresentationDescription> paramManifestFetcher, MediaPresentationDescription paramMediaPresentationDescription, int paramInt, int[] paramArrayOfInt, DataSource paramDataSource, FormatEvaluator paramFormatEvaluator, long paramLong)
  {
    this.manifestFetcher = paramManifestFetcher;
    this.currentManifest = paramMediaPresentationDescription;
    this.adaptationSetIndex = paramInt;
    this.representationIndices = paramArrayOfInt;
    this.dataSource = paramDataSource;
    this.evaluator = paramFormatEvaluator;
    this.liveEdgeLatencyUs = paramLong;
    this.evaluation = new FormatEvaluator.Evaluation();
    this.headerBuilder = new StringBuilder();
    this.psshInfo = getPsshInfo(this.currentManifest, paramInt);
    Representation[] arrayOfRepresentation = getFilteredRepresentations(this.currentManifest, paramInt, paramArrayOfInt);
    long l;
    int i;
    int j;
    int k;
    if (arrayOfRepresentation[0].periodDurationMs == -1L)
    {
      l = -1L;
      this.trackInfo = new TrackInfo(arrayOfRepresentation[0].format.mimeType, l);
      this.formats = new Format[arrayOfRepresentation.length];
      this.representationHolders = new HashMap();
      i = 0;
      j = 0;
      k = 0;
      label161: if (k >= arrayOfRepresentation.length)
        break label310;
      this.formats[k] = arrayOfRepresentation[k].format;
      i = Math.max(this.formats[k].width, i);
      j = Math.max(this.formats[k].height, j);
      if (!mimeTypeIsWebm(this.formats[k].mimeType))
        break label298;
    }
    label298: for (Object localObject = new WebmExtractor(); ; localObject = new FragmentedMp4Extractor())
    {
      this.representationHolders.put(this.formats[k].id, new RepresentationHolder(arrayOfRepresentation[k], (Extractor)localObject));
      k++;
      break label161;
      l = 1000L * arrayOfRepresentation[0].periodDurationMs;
      break;
    }
    label310: this.maxWidth = i;
    this.maxHeight = j;
    Arrays.sort(this.formats, new Format.DecreasingBandwidthComparator());
  }

  private static MediaPresentationDescription buildManifest(List<Representation> paramList)
  {
    Representation localRepresentation = (Representation)paramList.get(0);
    AdaptationSet localAdaptationSet = new AdaptationSet(0, -1, paramList);
    Period localPeriod = new Period(null, localRepresentation.periodStartMs, localRepresentation.periodDurationMs, Collections.singletonList(localAdaptationSet));
    return new MediaPresentationDescription(-1L, localRepresentation.periodDurationMs - localRepresentation.periodStartMs, -1L, false, -1L, -1L, null, Collections.singletonList(localPeriod));
  }

  private static Representation[] getFilteredRepresentations(MediaPresentationDescription paramMediaPresentationDescription, int paramInt, int[] paramArrayOfInt)
  {
    List localList = ((AdaptationSet)((Period)paramMediaPresentationDescription.periods.get(0)).adaptationSets.get(paramInt)).representations;
    if (paramArrayOfInt == null)
    {
      Representation[] arrayOfRepresentation2 = new Representation[localList.size()];
      localList.toArray(arrayOfRepresentation2);
      return arrayOfRepresentation2;
    }
    Representation[] arrayOfRepresentation1 = new Representation[paramArrayOfInt.length];
    for (int i = 0; i < paramArrayOfInt.length; i++)
      arrayOfRepresentation1[i] = ((Representation)localList.get(paramArrayOfInt[i]));
    return arrayOfRepresentation1;
  }

  private long getLiveSeekPosition(long paramLong, boolean paramBoolean1, boolean paramBoolean2)
  {
    long l;
    if (paramBoolean1)
      l = paramLong - 1000L * this.currentManifest.availabilityStartTime;
    while (true)
    {
      return l - this.liveEdgeLatencyUs;
      l = -9223372036854775808L;
      Iterator localIterator = this.representationHolders.values().iterator();
      while (localIterator.hasNext())
      {
        DashSegmentIndex localDashSegmentIndex = ((RepresentationHolder)localIterator.next()).segmentIndex;
        int i = localDashSegmentIndex.getLastSegmentNum();
        l = Math.max(l, localDashSegmentIndex.getTimeUs(i) + localDashSegmentIndex.getDurationUs(i));
      }
      if (!paramBoolean2)
        l = Math.min(l, paramLong - 1000L * this.currentManifest.availabilityStartTime);
    }
  }

  private static Map<UUID, byte[]> getPsshInfo(MediaPresentationDescription paramMediaPresentationDescription, int paramInt)
  {
    AdaptationSet localAdaptationSet = (AdaptationSet)((Period)paramMediaPresentationDescription.periods.get(0)).adaptationSets.get(paramInt);
    if (localAdaptationSet.contentProtections.isEmpty())
      return null;
    HashMap localHashMap = new HashMap();
    Iterator localIterator = localAdaptationSet.contentProtections.iterator();
    while (localIterator.hasNext())
    {
      ContentProtection localContentProtection = (ContentProtection)localIterator.next();
      if ((localContentProtection.uuid != null) && (localContentProtection.data != null))
        localHashMap.put(localContentProtection.uuid, localContentProtection.data);
    }
    if (localHashMap.isEmpty())
      localHashMap = null;
    return localHashMap;
  }

  private boolean mimeTypeIsWebm(String paramString)
  {
    return (paramString.startsWith("video/webm")) || (paramString.startsWith("audio/webm"));
  }

  private Chunk newInitializationChunk(RangedUri paramRangedUri1, RangedUri paramRangedUri2, Representation paramRepresentation, Extractor paramExtractor, DataSource paramDataSource, int paramInt)
  {
    long l = 0L;
    int i;
    RangedUri localRangedUri;
    if (paramRangedUri1 != null)
    {
      i = 0x2 | 0x8;
      localRangedUri = paramRangedUri1.attemptMerge(paramRangedUri2);
      if (localRangedUri != null)
      {
        i |= 16;
        if (paramExtractor.hasRelativeIndexOffsets())
          l = paramRangedUri2.start + paramRangedUri2.length;
      }
    }
    while (true)
    {
      return new InitializationLoadable(paramDataSource, new DataSpec(localRangedUri.getUri(), localRangedUri.start, localRangedUri.length, paramRepresentation.getCacheKey()), paramInt, paramRepresentation.format, paramExtractor, i, l);
      localRangedUri = paramRangedUri1;
      continue;
      localRangedUri = paramRangedUri2;
      if (paramExtractor.hasRelativeIndexOffsets())
        l = paramRangedUri2.start + paramRangedUri2.length;
      i = 0x2 | 0x10;
    }
  }

  private Chunk newMediaChunk(RepresentationHolder paramRepresentationHolder, DataSource paramDataSource, int paramInt1, int paramInt2)
  {
    Representation localRepresentation = paramRepresentationHolder.representation;
    DashSegmentIndex localDashSegmentIndex = paramRepresentationHolder.segmentIndex;
    long l1 = localDashSegmentIndex.getTimeUs(paramInt1);
    long l2 = l1 + localDashSegmentIndex.getDurationUs(paramInt1);
    int i;
    if ((!this.currentManifest.dynamic) && (paramInt1 == localDashSegmentIndex.getLastSegmentNum()))
    {
      i = 1;
      if (i == 0)
        break label236;
    }
    DataSpec localDataSpec;
    long l3;
    label236: for (int j = -1; ; j = 1 + (paramInt1 + paramRepresentationHolder.segmentNumShift))
    {
      RangedUri localRangedUri = localDashSegmentIndex.getSegmentUrl(paramInt1);
      localDataSpec = new DataSpec(localRangedUri.getUri(), localRangedUri.start, localRangedUri.length, localRepresentation.getCacheKey());
      l3 = localRepresentation.presentationTimeOffsetUs;
      if (!localRepresentation.format.mimeType.equals("text/vtt"))
        break label249;
      if (paramRepresentationHolder.vttHeaderOffsetUs != l3)
      {
        this.headerBuilder.setLength(0);
        this.headerBuilder.append("EXO-HEADER").append("=").append("OFFSET:").append(l3).append("\n");
        paramRepresentationHolder.vttHeader = this.headerBuilder.toString().getBytes();
        paramRepresentationHolder.vttHeaderOffsetUs = l3;
      }
      return new SingleSampleMediaChunk(paramDataSource, localDataSpec, localRepresentation.format, 0, l1, l2, j, null, paramRepresentationHolder.vttHeader);
      i = 0;
      break;
    }
    label249: return new ContainerMediaChunk(paramDataSource, localDataSpec, localRepresentation.format, paramInt2, l1, l2, j, paramRepresentationHolder.extractor, this.psshInfo, false, l3);
  }

  public void continueBuffering(long paramLong)
  {
    if ((this.manifestFetcher == null) || (!this.currentManifest.dynamic) || (this.fatalError != null));
    long l;
    do
    {
      return;
      MediaPresentationDescription localMediaPresentationDescription = (MediaPresentationDescription)this.manifestFetcher.getManifest();
      if ((this.currentManifest != localMediaPresentationDescription) && (localMediaPresentationDescription != null))
      {
        for (Representation localRepresentation : getFilteredRepresentations(localMediaPresentationDescription, this.adaptationSetIndex, this.representationIndices))
        {
          RepresentationHolder localRepresentationHolder = (RepresentationHolder)this.representationHolders.get(localRepresentation.format.id);
          DashSegmentIndex localDashSegmentIndex1 = localRepresentationHolder.segmentIndex;
          DashSegmentIndex localDashSegmentIndex2 = localRepresentation.getIndex();
          int k = localDashSegmentIndex2.getFirstSegmentNum();
          localRepresentationHolder.segmentNumShift = (localDashSegmentIndex1.getSegmentNum(localDashSegmentIndex2.getTimeUs(k)) - k + localRepresentationHolder.segmentNumShift);
          localRepresentationHolder.segmentIndex = localDashSegmentIndex2;
        }
        this.currentManifest = localMediaPresentationDescription;
        this.finishedCurrentManifest = false;
      }
      l = this.currentManifest.minUpdatePeriod;
      if (l == 0L)
        l = 5000L;
    }
    while ((!this.finishedCurrentManifest) || (SystemClock.elapsedRealtime() <= l + this.manifestFetcher.getManifestLoadTimestamp()));
    this.manifestFetcher.requestRefresh();
  }

  public void disable(List<? extends MediaChunk> paramList)
  {
    this.evaluator.disable();
    if (this.manifestFetcher != null)
      this.manifestFetcher.disable();
  }

  public void enable()
  {
    this.evaluator.enable();
    if (this.manifestFetcher != null)
      this.manifestFetcher.enable();
  }

  public final void getChunkOperation(List<? extends MediaChunk> paramList, long paramLong1, long paramLong2, ChunkOperationHolder paramChunkOperationHolder)
  {
    if (this.fatalError != null)
      paramChunkOperationHolder.chunk = null;
    Format localFormat;
    do
    {
      return;
      this.evaluation.queueSize = paramList.size();
      if ((this.evaluation.format == null) || (!this.lastChunkWasInitialization))
        this.evaluator.evaluate(paramList, paramLong2, this.formats, this.evaluation);
      localFormat = this.evaluation.format;
      paramChunkOperationHolder.queueSize = this.evaluation.queueSize;
      if (localFormat == null)
      {
        paramChunkOperationHolder.chunk = null;
        return;
      }
    }
    while ((paramChunkOperationHolder.queueSize == paramList.size()) && (paramChunkOperationHolder.chunk != null) && (paramChunkOperationHolder.chunk.format.id.equals(localFormat.id)));
    RepresentationHolder localRepresentationHolder = (RepresentationHolder)this.representationHolders.get(localFormat.id);
    Representation localRepresentation = localRepresentationHolder.representation;
    DashSegmentIndex localDashSegmentIndex = localRepresentationHolder.segmentIndex;
    Extractor localExtractor = localRepresentationHolder.extractor;
    MediaFormat localMediaFormat = localExtractor.getFormat();
    RangedUri localRangedUri1 = null;
    if (localMediaFormat == null)
      localRangedUri1 = localRepresentation.getInitializationUri();
    RangedUri localRangedUri2 = null;
    if (localDashSegmentIndex == null)
      localRangedUri2 = localRepresentation.getIndexUri();
    if ((localRangedUri1 != null) || (localRangedUri2 != null))
    {
      Chunk localChunk1 = newInitializationChunk(localRangedUri1, localRangedUri2, localRepresentation, localExtractor, this.dataSource, this.evaluation.trigger);
      this.lastChunkWasInitialization = true;
      paramChunkOperationHolder.chunk = localChunk1;
      return;
    }
    long l1 = 1000L * System.currentTimeMillis();
    int i = localDashSegmentIndex.getFirstSegmentNum();
    int j = localDashSegmentIndex.getLastSegmentNum();
    boolean bool1;
    int k;
    if (j == -1)
    {
      bool1 = true;
      if (bool1)
      {
        long l2 = l1 - 1000L * this.currentManifest.availabilityStartTime;
        if (this.currentManifest.timeShiftBufferDepth != -1L)
          i = Math.max(i, localDashSegmentIndex.getSegmentNum(l2 - 1000L * this.currentManifest.timeShiftBufferDepth));
        j = -1 + localDashSegmentIndex.getSegmentNum(l2);
      }
      if (!paramList.isEmpty())
        break label458;
      if (this.currentManifest.dynamic)
        paramLong1 = getLiveSeekPosition(l1, bool1, localDashSegmentIndex.isExplicit());
      k = localDashSegmentIndex.getSegmentNum(paramLong1);
    }
    while (true)
      if (this.currentManifest.dynamic)
      {
        if (k < i)
        {
          this.fatalError = new BehindLiveWindowException();
          return;
          bool1 = false;
          break;
          label458: k = ((MediaChunk)paramList.get(-1 + paramChunkOperationHolder.queueSize)).nextChunkIndex - localRepresentationHolder.segmentNumShift;
          continue;
        }
        if (k > j)
        {
          if (!bool1);
          for (boolean bool2 = true; ; bool2 = false)
          {
            this.finishedCurrentManifest = bool2;
            return;
          }
        }
        if ((!bool1) && (k == j))
          this.finishedCurrentManifest = true;
      }
    if (k == -1)
    {
      paramChunkOperationHolder.chunk = null;
      return;
    }
    DataSource localDataSource = this.dataSource;
    int m = this.evaluation.trigger;
    Chunk localChunk2 = newMediaChunk(localRepresentationHolder, localDataSource, k, m);
    this.lastChunkWasInitialization = false;
    paramChunkOperationHolder.chunk = localChunk2;
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

  private class InitializationLoadable extends Chunk
  {
    private final int expectedExtractorResult;
    private final Extractor extractor;
    private final long indexAnchor;
    private final Uri uri;

    public InitializationLoadable(DataSource paramDataSpec, DataSpec paramInt1, int paramFormat, Format paramExtractor, Extractor paramInt2, int paramLong, long arg8)
    {
      super(paramInt1, paramExtractor, paramFormat);
      this.extractor = paramInt2;
      this.expectedExtractorResult = paramLong;
      Object localObject;
      this.indexAnchor = localObject;
      this.uri = paramInt1.uri;
    }

    protected void consumeStream(NonBlockingInputStream paramNonBlockingInputStream)
      throws IOException
    {
      int i = this.extractor.read(paramNonBlockingInputStream, null);
      if (i != this.expectedExtractorResult)
        throw new ParserException("Invalid extractor result. Expected " + this.expectedExtractorResult + ", got " + i);
      if ((i & 0x10) != 0)
        ((DashChunkSource.RepresentationHolder)DashChunkSource.this.representationHolders.get(this.format.id)).segmentIndex = new DashWrappingSegmentIndex(this.extractor.getIndex(), this.uri, this.indexAnchor);
    }
  }

  public static class NoAdaptationSetException extends IOException
  {
    public NoAdaptationSetException(String paramString)
    {
      super();
    }
  }

  private static class RepresentationHolder
  {
    public final Extractor extractor;
    public final Representation representation;
    public DashSegmentIndex segmentIndex;
    public int segmentNumShift;
    public byte[] vttHeader;
    public long vttHeaderOffsetUs;

    public RepresentationHolder(Representation paramRepresentation, Extractor paramExtractor)
    {
      this.representation = paramRepresentation;
      this.extractor = paramExtractor;
      this.segmentIndex = paramRepresentation.getIndex();
    }
  }
}