package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.samples;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.ChunkOffsetBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MovieBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleSizeBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleTableBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleToChunkBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleToChunkBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackHeaderBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class DefaultMp4SampleList extends AbstractList<Sample>
{
  private static final long MAX_MAP_SIZE = 268435456L;
  ByteBuffer[][] cache = (ByteBuffer[][])null;
  int[] chunkNumsStartSampleNum;
  long[] chunkOffsets;
  long[] chunkSizes;
  int lastChunk = 0;
  long[][] sampleOffsetsWithinChunks;
  SampleSizeBox ssb;
  Container topLevel;
  TrackBox trackBox = null;

  public DefaultMp4SampleList(long paramLong, Container paramContainer)
  {
    this.topLevel = paramContainer;
    Iterator localIterator = ((MovieBox)paramContainer.getBoxes(MovieBox.class).get(0)).getBoxes(TrackBox.class).iterator();
    while (localIterator.hasNext())
    {
      TrackBox localTrackBox = (TrackBox)localIterator.next();
      if (localTrackBox.getTrackHeaderBox().getTrackId() == paramLong)
        this.trackBox = localTrackBox;
    }
    if (this.trackBox == null)
      throw new RuntimeException("This MP4 does not contain track " + paramLong);
    this.chunkOffsets = this.trackBox.getSampleTableBox().getChunkOffsetBox().getChunkOffsets();
    this.chunkSizes = new long[this.chunkOffsets.length];
    this.cache = new ByteBuffer[this.chunkOffsets.length][];
    this.sampleOffsetsWithinChunks = new long[this.chunkOffsets.length][];
    this.ssb = this.trackBox.getSampleTableBox().getSampleSizeBox();
    List localList = this.trackBox.getSampleTableBox().getSampleToChunkBox().getEntries();
    SampleToChunkBox.Entry[] arrayOfEntry = (SampleToChunkBox.Entry[])localList.toArray(new SampleToChunkBox.Entry[localList.size()]);
    int i = 0 + 1;
    SampleToChunkBox.Entry localEntry1 = arrayOfEntry[0];
    int j = 0;
    int k = 0;
    long l1 = localEntry1.getFirstChunk();
    int m = CastUtils.l2i(localEntry1.getSamplesPerChunk());
    int n = 1;
    int i1 = size();
    j++;
    int i2;
    if (j == l1)
    {
      k = m;
      if (arrayOfEntry.length > i)
      {
        i2 = i + 1;
        SampleToChunkBox.Entry localEntry4 = arrayOfEntry[i];
        m = CastUtils.l2i(localEntry4.getSamplesPerChunk());
        l1 = localEntry4.getFirstChunk();
      }
    }
    while (true)
    {
      this.sampleOffsetsWithinChunks[(j - 1)] = new long[k];
      n += k;
      if (n > i1)
      {
        this.chunkNumsStartSampleNum = new int[j + 1];
        int i3 = 0 + 1;
        SampleToChunkBox.Entry localEntry2 = arrayOfEntry[0];
        int i4 = 0;
        int i5 = 0;
        long l2 = localEntry2.getFirstChunk();
        int i6 = CastUtils.l2i(localEntry2.getSamplesPerChunk());
        int i7 = 1;
        int i8 = i3;
        while (true)
        {
          int[] arrayOfInt = this.chunkNumsStartSampleNum;
          int i9 = i4 + 1;
          arrayOfInt[i4] = i7;
          label486: int i10;
          long l3;
          if (i9 == l2)
          {
            i5 = i6;
            if (arrayOfEntry.length > i8)
            {
              int i13 = i8 + 1;
              SampleToChunkBox.Entry localEntry3 = arrayOfEntry[i8];
              i6 = CastUtils.l2i(localEntry3.getSamplesPerChunk());
              l2 = localEntry3.getFirstChunk();
              i8 = i13;
            }
          }
          else
          {
            i7 += i5;
            if (i7 <= i1)
              break label660;
            this.chunkNumsStartSampleNum[i9] = 2147483647;
            i10 = 0;
            l3 = 0L;
          }
          for (int i11 = 1; ; i11++)
          {
            if (i11 > this.ssb.getSampleCount())
              break label659;
            while (true)
              if (i11 == this.chunkNumsStartSampleNum[i10])
              {
                i10++;
                l3 = 0L;
                continue;
                m = -1;
                l1 = 9223372036854775807L;
                i2 = i;
                break;
                i6 = -1;
                l2 = 9223372036854775807L;
                break label486;
              }
            long[] arrayOfLong = this.chunkSizes;
            int i12 = i10 - 1;
            arrayOfLong[i12] += this.ssb.getSampleSizeAtIndex(i11 - 1);
            this.sampleOffsetsWithinChunks[(i10 - 1)][(i11 - this.chunkNumsStartSampleNum[(i10 - 1)])] = l3;
            l3 += this.ssb.getSampleSizeAtIndex(i11 - 1);
          }
          label659: return;
          label660: i4 = i9;
        }
      }
      i = i2;
      break;
      i2 = i;
    }
  }

  public Sample get(int paramInt)
  {
    if (paramInt >= this.ssb.getSampleCount())
      throw new IndexOutOfBoundsException();
    int i = getChunkForSample(paramInt);
    int j = -1 + this.chunkNumsStartSampleNum[i];
    long l1 = this.chunkOffsets[CastUtils.l2i(i)];
    int k = paramInt - j;
    long[] arrayOfLong = this.sampleOffsetsWithinChunks[CastUtils.l2i(i)];
    final long l2 = arrayOfLong[k];
    ByteBuffer[] arrayOfByteBuffer = this.cache[CastUtils.l2i(i)];
    ArrayList localArrayList;
    long l3;
    if (arrayOfByteBuffer == null)
    {
      localArrayList = new ArrayList();
      l3 = 0L;
    }
    for (int m = 0; ; m++)
      while (true)
      {
        int i2;
        ByteBuffer localByteBuffer;
        try
        {
          int n = arrayOfLong.length;
          if (m < n)
          {
            if (arrayOfLong[m] + this.ssb.getSampleSizeAtIndex(m + j) - l3 <= 268435456L)
              break;
            localArrayList.add(this.topLevel.getByteBuffer(l1 + l3, arrayOfLong[m] - l3));
            l3 = arrayOfLong[m];
            break;
          }
          localArrayList.add(this.topLevel.getByteBuffer(l1 + l3, -l3 + arrayOfLong[(-1 + arrayOfLong.length)] + this.ssb.getSampleSizeAtIndex(-1 + (j + arrayOfLong.length))));
          arrayOfByteBuffer = (ByteBuffer[])localArrayList.toArray(new ByteBuffer[localArrayList.size()]);
          this.cache[CastUtils.l2i(i)] = arrayOfByteBuffer;
          int i1 = arrayOfByteBuffer.length;
          i2 = 0;
          Object localObject = null;
          if (i2 < i1)
          {
            localByteBuffer = arrayOfByteBuffer[i2];
            if (l2 < localByteBuffer.limit())
              localObject = localByteBuffer;
          }
          else
          {
            return new Sample()
            {
              public ByteBuffer asByteBuffer()
              {
                return (ByteBuffer)((ByteBuffer)l2.position(CastUtils.l2i(this.val$finalOffsetWithInChunk))).slice().limit(CastUtils.l2i(this.val$sampleSize));
              }

              public long getSize()
              {
                return this.val$sampleSize;
              }

              public String toString()
              {
                return "DefaultMp4Sample(size:" + this.val$sampleSize + ")";
              }

              public void writeTo(WritableByteChannel paramAnonymousWritableByteChannel)
                throws IOException
              {
                paramAnonymousWritableByteChannel.write(asByteBuffer());
              }
            };
          }
        }
        catch (IOException localIOException)
        {
          throw new IndexOutOfBoundsException(localIOException.getMessage());
        }
        l2 -= localByteBuffer.limit();
        i2++;
      }
  }

  int getChunkForSample(int paramInt)
  {
    int i = paramInt + 1;
    while (true)
    {
      try
      {
        if ((i >= this.chunkNumsStartSampleNum[this.lastChunk]) && (i < this.chunkNumsStartSampleNum[(1 + this.lastChunk)]))
        {
          j = this.lastChunk;
          return j;
        }
        if (i >= this.chunkNumsStartSampleNum[this.lastChunk])
          break label105;
        this.lastChunk = 0;
        if (this.chunkNumsStartSampleNum[(1 + this.lastChunk)] <= i)
        {
          this.lastChunk = (1 + this.lastChunk);
          continue;
        }
      }
      finally
      {
      }
      int j = this.lastChunk;
      continue;
      label105: for (this.lastChunk = (1 + this.lastChunk); this.chunkNumsStartSampleNum[(1 + this.lastChunk)] <= i; this.lastChunk = (1 + this.lastChunk));
      j = this.lastChunk;
    }
  }

  public int size()
  {
    return CastUtils.l2i(this.trackBox.getSampleTableBox().getSampleSizeBox().getSampleCount());
  }
}