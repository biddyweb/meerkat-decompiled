package com.google.android.exoplayer.hls;

import android.net.Uri;
import android.os.SystemClock;
import android.util.Log;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.hls.parser.AdtsExtractor;
import com.google.android.exoplayer.hls.parser.HlsExtractor;
import com.google.android.exoplayer.hls.parser.TsExtractor;
import com.google.android.exoplayer.upstream.Aes128DataSource;
import com.google.android.exoplayer.upstream.BandwidthMeter;
import com.google.android.exoplayer.upstream.BufferPool;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import com.google.android.exoplayer.upstream.HttpDataSource.InvalidResponseCodeException;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

public class HlsChunkSource
{
  private static final String AAC_FILE_EXTENSION = ".aac";
  public static final int ADAPTIVE_MODE_ABRUPT = 3;
  public static final int ADAPTIVE_MODE_NONE = 0;
  public static final int ADAPTIVE_MODE_SPLICE = 1;
  private static final float BANDWIDTH_FRACTION = 0.8F;
  public static final long DEFAULT_MAX_BUFFER_TO_SWITCH_DOWN_MS = 20000L;
  public static final long DEFAULT_MIN_BUFFER_TO_SWITCH_UP_MS = 5000L;
  public static final long DEFAULT_TARGET_BUFFER_DURATION_MS = 40000L;
  public static final int DEFAULT_TARGET_BUFFER_SIZE = 18874368;
  private static final String TAG = "HlsChunkSource";
  private final int adaptiveMode;
  private final BandwidthMeter bandwidthMeter;
  private final Uri baseUri;
  private final BufferPool bufferPool;
  long durationUs;
  private final Variant[] enabledVariants;
  private DataSource encryptedDataSource;
  private String encryptedDataSourceIv;
  private byte[] encryptedDataSourceSecretKey;
  private Uri encryptionKeyUri;
  final long[] lastMediaPlaylistLoadTimesMs;
  boolean live;
  private final long maxBufferDurationToSwitchDownUs;
  private final int maxHeight;
  private final int maxWidth;
  final boolean[] mediaPlaylistBlacklistFlags;
  final HlsMediaPlaylist[] mediaPlaylists;
  private final long minBufferDurationToSwitchUpUs;
  private final HlsPlaylistParser playlistParser;
  byte[] scratchSpace;
  private final long targetBufferDurationUs;
  private final int targetBufferSize;
  private final DataSource upstreamDataSource;
  private int variantIndex;

  public HlsChunkSource(DataSource paramDataSource, String paramString, HlsPlaylist paramHlsPlaylist, BandwidthMeter paramBandwidthMeter, int[] paramArrayOfInt, int paramInt)
  {
    this(paramDataSource, paramString, paramHlsPlaylist, paramBandwidthMeter, paramArrayOfInt, paramInt, 18874368, 40000L, 5000L, 20000L);
  }

  public HlsChunkSource(DataSource paramDataSource, String paramString, HlsPlaylist paramHlsPlaylist, BandwidthMeter paramBandwidthMeter, int[] paramArrayOfInt, int paramInt1, int paramInt2, long paramLong1, long paramLong2, long paramLong3)
  {
    this.upstreamDataSource = paramDataSource;
    this.bandwidthMeter = paramBandwidthMeter;
    this.adaptiveMode = paramInt1;
    this.targetBufferSize = paramInt2;
    this.targetBufferDurationUs = (1000L * paramLong1);
    this.minBufferDurationToSwitchUpUs = (1000L * paramLong2);
    this.maxBufferDurationToSwitchDownUs = (1000L * paramLong3);
    this.baseUri = paramHlsPlaylist.baseUri;
    this.playlistParser = new HlsPlaylistParser();
    this.bufferPool = new BufferPool(262144);
    int i;
    int j;
    if (paramHlsPlaylist.type == 1)
    {
      Variant[] arrayOfVariant = new Variant[1];
      arrayOfVariant[0] = new Variant(0, paramString, 0, null, -1, -1);
      this.enabledVariants = arrayOfVariant;
      this.mediaPlaylists = new HlsMediaPlaylist[1];
      this.mediaPlaylistBlacklistFlags = new boolean[1];
      this.lastMediaPlaylistLoadTimesMs = new long[1];
      setMediaPlaylist(0, (HlsMediaPlaylist)paramHlsPlaylist);
      i = -1;
      j = -1;
      long l = 2147483647L;
      for (int k = 0; k < this.enabledVariants.length; k++)
      {
        if (this.enabledVariants[k].index < l)
        {
          l = this.enabledVariants[k].index;
          this.variantIndex = k;
        }
        i = Math.max(this.enabledVariants[k].width, i);
        j = Math.max(this.enabledVariants[k].height, j);
      }
    }
    if (paramHlsPlaylist.type == 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.enabledVariants = filterVariants((HlsMasterPlaylist)paramHlsPlaylist, paramArrayOfInt);
      this.mediaPlaylists = new HlsMediaPlaylist[this.enabledVariants.length];
      this.mediaPlaylistBlacklistFlags = new boolean[this.enabledVariants.length];
      this.lastMediaPlaylistLoadTimesMs = new long[this.enabledVariants.length];
      break;
    }
    if (i > 0)
    {
      this.maxWidth = i;
      if (j <= 0)
        break label359;
    }
    while (true)
    {
      this.maxHeight = j;
      return;
      i = 1920;
      break;
      label359: j = 1080;
    }
  }

  private boolean allPlaylistsBlacklisted()
  {
    for (int i = 0; i < this.mediaPlaylistBlacklistFlags.length; i++)
      if (this.mediaPlaylistBlacklistFlags[i] == 0)
        return false;
    return true;
  }

  private void clearEncryptedDataSource()
  {
    this.encryptionKeyUri = null;
    this.encryptedDataSource = null;
    this.encryptedDataSourceIv = null;
    this.encryptedDataSourceSecretKey = null;
  }

  private static Variant[] filterVariants(HlsMasterPlaylist paramHlsMasterPlaylist, int[] paramArrayOfInt)
  {
    List localList = paramHlsMasterPlaylist.variants;
    Object localObject = new ArrayList();
    if (paramArrayOfInt != null)
      for (int j = 0; j < paramArrayOfInt.length; j++)
        ((ArrayList)localObject).add(localList.get(paramArrayOfInt[j]));
    ((ArrayList)localObject).addAll(localList);
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    int i = 0;
    if (i < ((ArrayList)localObject).size())
    {
      Variant localVariant = (Variant)((ArrayList)localObject).get(i);
      if ((localVariant.height > 0) || (variantHasExplicitCodecWithPrefix(localVariant, "avc")))
        localArrayList1.add(localVariant);
      while (true)
      {
        i++;
        break;
        if (variantHasExplicitCodecWithPrefix(localVariant, "mp4a"))
          localArrayList2.add(localVariant);
      }
    }
    if (!localArrayList1.isEmpty())
      localObject = localArrayList1;
    while (true)
    {
      Collections.sort((List)localObject, new Variant.DecreasingBandwidthComparator());
      Variant[] arrayOfVariant = new Variant[((ArrayList)localObject).size()];
      ((ArrayList)localObject).toArray(arrayOfVariant);
      return arrayOfVariant;
      if (localArrayList2.size() < ((ArrayList)localObject).size())
        ((ArrayList)localObject).removeAll(localArrayList2);
    }
  }

  private int getLiveStartChunkMediaSequence(int paramInt)
  {
    HlsMediaPlaylist localHlsMediaPlaylist = this.mediaPlaylists[paramInt];
    if (localHlsMediaPlaylist.segments.size() > 3);
    for (int i = -3 + localHlsMediaPlaylist.segments.size(); ; i = 0)
      return i + localHlsMediaPlaylist.mediaSequence;
  }

  private int getNextVariantIndex(TsChunk paramTsChunk, long paramLong)
  {
    int i = getVariantIndexForBandwdith((int)(0.8F * (float)this.bandwidthMeter.getBitrateEstimate()));
    if (i == this.variantIndex)
    {
      i = this.variantIndex;
      return i;
    }
    long l1;
    if (paramTsChunk == null)
      l1 = paramLong;
    while (true)
    {
      long l2 = l1 - paramLong;
      if ((this.mediaPlaylistBlacklistFlags[this.variantIndex] != 0) || ((i > this.variantIndex) && (l2 < this.maxBufferDurationToSwitchDownUs)) || ((i < this.variantIndex) && (l2 > this.minBufferDurationToSwitchUpUs)))
        break;
      return this.variantIndex;
      if (this.adaptiveMode == 1)
        l1 = paramTsChunk.startTimeUs;
      else
        l1 = paramTsChunk.endTimeUs;
    }
  }

  private int getVariantIndexForBandwdith(int paramInt)
  {
    int i = 0;
    for (int j = 0; j < this.enabledVariants.length; j++)
      if (this.mediaPlaylistBlacklistFlags[j] == 0)
      {
        if (this.enabledVariants[j].bandwidth <= paramInt)
          return j;
        i = j;
      }
    return i;
  }

  private EncryptionKeyChunk newEncryptionKeyChunk(Uri paramUri, String paramString)
  {
    DataSpec localDataSpec = new DataSpec(paramUri, 0L, -1L, null);
    return new EncryptionKeyChunk(this.upstreamDataSource, localDataSpec, paramString);
  }

  private MediaPlaylistChunk newMediaPlaylistChunk(int paramInt)
  {
    Uri localUri1 = Util.getMergedUri(this.baseUri, this.enabledVariants[paramInt].url);
    DataSpec localDataSpec = new DataSpec(localUri1, 0L, -1L, null);
    Uri localUri2 = Util.parseBaseUri(localUri1.toString());
    return new MediaPlaylistChunk(paramInt, this.upstreamDataSource, localDataSpec, localUri2);
  }

  private boolean shouldRerequestMediaPlaylist(int paramInt)
  {
    HlsMediaPlaylist localHlsMediaPlaylist = this.mediaPlaylists[paramInt];
    return SystemClock.elapsedRealtime() - this.lastMediaPlaylistLoadTimesMs[paramInt] >= 1000 * localHlsMediaPlaylist.targetDurationSecs / 2;
  }

  private static boolean variantHasExplicitCodecWithPrefix(Variant paramVariant, String paramString)
  {
    String[] arrayOfString = paramVariant.codecs;
    if (arrayOfString == null);
    while (true)
    {
      return false;
      for (int i = 0; i < arrayOfString.length; i++)
        if (arrayOfString[i].startsWith(paramString))
          return true;
    }
  }

  public HlsChunk getChunkOperation(TsChunk paramTsChunk, long paramLong1, long paramLong2)
  {
    if (((paramTsChunk != null) && ((paramTsChunk.isLastChunk) || (paramTsChunk.endTimeUs - paramLong2 >= this.targetBufferDurationUs))) || (this.bufferPool.getAllocatedSize() >= this.targetBufferSize))
      return null;
    int i = this.variantIndex;
    int j = this.adaptiveMode;
    int k = 0;
    boolean bool1 = false;
    HlsMediaPlaylist localHlsMediaPlaylist;
    if (j == 0)
    {
      localHlsMediaPlaylist = this.mediaPlaylists[i];
      if (localHlsMediaPlaylist == null)
        return newMediaPlaylistChunk(i);
    }
    else
    {
      i = getNextVariantIndex(paramTsChunk, paramLong2);
      int m = this.variantIndex;
      if (i != m)
      {
        k = 1;
        label111: if ((k == 0) || (this.adaptiveMode != 1))
          break label136;
      }
      label136: for (bool1 = true; ; bool1 = false)
      {
        break;
        k = 0;
        break label111;
      }
    }
    this.variantIndex = i;
    int n = 0;
    if (this.live)
      if (paramTsChunk == null)
        i1 = getLiveStartChunkMediaSequence(this.variantIndex);
    int i2;
    while (true)
    {
      i2 = i1 - localHlsMediaPlaylist.mediaSequence;
      if (i2 < localHlsMediaPlaylist.segments.size())
        break label346;
      if ((!localHlsMediaPlaylist.live) || (!shouldRerequestMediaPlaylist(this.variantIndex)))
        break label344;
      return newMediaPlaylistChunk(this.variantIndex);
      if (bool1);
      for (i1 = paramTsChunk.chunkIndex; ; i1 = 1 + paramTsChunk.chunkIndex)
      {
        int i4 = localHlsMediaPlaylist.mediaSequence;
        int i5 = i1;
        n = 0;
        if (i5 >= i4)
          break;
        i1 = getLiveStartChunkMediaSequence(this.variantIndex);
        n = 1;
        break;
      }
      if (paramTsChunk != null)
        break;
      i1 = Util.binarySearchFloor(localHlsMediaPlaylist.segments, Long.valueOf(paramLong1), true, true) + localHlsMediaPlaylist.mediaSequence;
      n = 0;
    }
    if (bool1);
    for (int i1 = paramTsChunk.chunkIndex; ; i1 = 1 + paramTsChunk.chunkIndex)
    {
      n = 0;
      break;
    }
    label344: return null;
    label346: HlsMediaPlaylist.Segment localSegment = (HlsMediaPlaylist.Segment)localHlsMediaPlaylist.segments.get(i2);
    Uri localUri1 = Util.getMergedUri(localHlsMediaPlaylist.baseUri, localSegment.url);
    DataSource localDataSource;
    label474: DataSpec localDataSpec;
    long l1;
    label512: long l2;
    boolean bool2;
    label555: Object localObject;
    if ("AES-128".equals(localSegment.encryptionMethod))
    {
      Uri localUri2 = Util.getMergedUri(localHlsMediaPlaylist.baseUri, localSegment.encryptionKeyUri);
      if (!localUri2.equals(this.encryptionKeyUri))
        return newEncryptionKeyChunk(localUri2, localSegment.encryptionIV);
      if (!Util.areEqual(localSegment.encryptionIV, this.encryptedDataSourceIv))
        initEncryptedDataSource(localUri2, localSegment.encryptionIV, this.encryptedDataSourceSecretKey);
      if (this.encryptedDataSource == null)
        break label656;
      localDataSource = this.encryptedDataSource;
      localDataSpec = new DataSpec(localUri1, localSegment.byterangeOffset, localSegment.byterangeLength, null);
      if (!this.live)
        break label688;
      if (paramTsChunk != null)
        break label665;
      l1 = 0L;
      l2 = l1 + ()(1000000.0D * localSegment.durationSecs);
      if ((localHlsMediaPlaylist.live) || (i2 != -1 + localHlsMediaPlaylist.segments.size()))
        break label698;
      bool2 = true;
      if ((paramTsChunk != null) && (!localSegment.discontinuity) && (k == 0) && (n == 0))
        break label728;
      if (!localUri1.getLastPathSegment().endsWith(".aac"))
        break label704;
      BufferPool localBufferPool2 = this.bufferPool;
      localObject = new AdtsExtractor(bool1, l1, localBufferPool2);
    }
    while (true)
    {
      int i3 = this.enabledVariants[this.variantIndex].index;
      return new TsChunk(localDataSource, localDataSpec, (HlsExtractor)localObject, i3, l1, l2, i1, bool2);
      clearEncryptedDataSource();
      break;
      label656: localDataSource = this.upstreamDataSource;
      break label474;
      label665: if (bool1)
      {
        l1 = paramTsChunk.startTimeUs;
        break label512;
      }
      l1 = paramTsChunk.endTimeUs;
      break label512;
      label688: l1 = localSegment.startTimeUs;
      break label512;
      label698: bool2 = false;
      break label555;
      label704: BufferPool localBufferPool1 = this.bufferPool;
      localObject = new TsExtractor(bool1, l1, localBufferPool1);
      continue;
      label728: localObject = paramTsChunk.extractor;
    }
  }

  public long getDurationUs()
  {
    if (this.live)
      return -1L;
    return this.durationUs;
  }

  public void getMaxVideoDimensions(MediaFormat paramMediaFormat)
  {
    paramMediaFormat.setMaxVideoDimensions(this.maxWidth, this.maxHeight);
  }

  void initEncryptedDataSource(Uri paramUri, String paramString, byte[] paramArrayOfByte)
  {
    String str;
    byte[] arrayOfByte1;
    byte[] arrayOfByte2;
    if (paramString.toLowerCase(Locale.getDefault()).startsWith("0x"))
    {
      str = paramString.substring(2);
      arrayOfByte1 = new BigInteger(str, 16).toByteArray();
      arrayOfByte2 = new byte[16];
      if (arrayOfByte1.length <= 16)
        break label126;
    }
    label126: for (int i = -16 + arrayOfByte1.length; ; i = 0)
    {
      System.arraycopy(arrayOfByte1, i, arrayOfByte2, i + (arrayOfByte2.length - arrayOfByte1.length), arrayOfByte1.length - i);
      this.encryptedDataSource = new Aes128DataSource(paramArrayOfByte, arrayOfByte2, this.upstreamDataSource);
      this.encryptionKeyUri = paramUri;
      this.encryptedDataSourceIv = paramString;
      this.encryptedDataSourceSecretKey = paramArrayOfByte;
      return;
      str = paramString;
      break;
    }
  }

  public boolean onLoadError(HlsChunk paramHlsChunk, IOException paramIOException)
  {
    if (((paramHlsChunk instanceof MediaPlaylistChunk)) && ((paramIOException instanceof HttpDataSource.InvalidResponseCodeException)))
    {
      int i = ((HttpDataSource.InvalidResponseCodeException)paramIOException).responseCode;
      if ((i == 404) || (i == 410))
      {
        MediaPlaylistChunk localMediaPlaylistChunk = (MediaPlaylistChunk)paramHlsChunk;
        this.mediaPlaylistBlacklistFlags[localMediaPlaylistChunk.variantIndex] = true;
        if (!allPlaylistsBlacklisted())
        {
          Log.w("HlsChunkSource", "Blacklisted playlist (" + i + "): " + localMediaPlaylistChunk.dataSpec.uri);
          return true;
        }
        Log.w("HlsChunkSource", "Final playlist not blacklisted (" + i + "): " + localMediaPlaylistChunk.dataSpec.uri);
        this.mediaPlaylistBlacklistFlags[localMediaPlaylistChunk.variantIndex] = false;
        return false;
      }
    }
    return false;
  }

  void setMediaPlaylist(int paramInt, HlsMediaPlaylist paramHlsMediaPlaylist)
  {
    this.lastMediaPlaylistLoadTimesMs[paramInt] = SystemClock.elapsedRealtime();
    this.mediaPlaylists[paramInt] = paramHlsMediaPlaylist;
    this.live |= paramHlsMediaPlaylist.live;
    this.durationUs = paramHlsMediaPlaylist.durationUs;
  }

  private class EncryptionKeyChunk extends DataChunk
  {
    private final String iv;

    public EncryptionKeyChunk(DataSource paramDataSpec, DataSpec paramString, String arg4)
    {
      super(paramString, HlsChunkSource.this.scratchSpace);
      Object localObject;
      this.iv = localObject;
    }

    protected void consume(byte[] paramArrayOfByte, int paramInt)
      throws IOException
    {
      HlsChunkSource.this.initEncryptedDataSource(this.dataSpec.uri, this.iv, Arrays.copyOf(paramArrayOfByte, paramInt));
      HlsChunkSource.this.scratchSpace = paramArrayOfByte;
    }
  }

  private class MediaPlaylistChunk extends DataChunk
  {
    private final Uri playlistBaseUri;
    final int variantIndex;

    public MediaPlaylistChunk(int paramDataSource, DataSource paramDataSpec, DataSpec paramUri, Uri arg5)
    {
      super(paramUri, HlsChunkSource.this.scratchSpace);
      this.variantIndex = paramDataSource;
      Object localObject;
      this.playlistBaseUri = localObject;
    }

    protected void consume(byte[] paramArrayOfByte, int paramInt)
      throws IOException
    {
      int i = 1;
      HlsPlaylist localHlsPlaylist = HlsChunkSource.this.playlistParser.parse(new ByteArrayInputStream(paramArrayOfByte, 0, paramInt), null, null, this.playlistBaseUri);
      if (localHlsPlaylist.type == i);
      while (true)
      {
        Assertions.checkState(i);
        HlsMediaPlaylist localHlsMediaPlaylist = (HlsMediaPlaylist)localHlsPlaylist;
        HlsChunkSource.this.setMediaPlaylist(this.variantIndex, localHlsMediaPlaylist);
        HlsChunkSource.this.scratchSpace = paramArrayOfByte;
        return;
        int j = 0;
      }
    }
  }
}