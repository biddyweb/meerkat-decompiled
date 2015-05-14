package co.getair.meerkat.video.broadcast.mp4writer;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.MovieFragmentBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.MovieFragmentHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.SampleFlags;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackFragmentBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackFragmentHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackRunBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackRunBox.Entry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class ChunkBuilder
{
  private static final String TAG = "ChunkBuilder";

  public static List<Box> createFragment(MediaTrackChunk paramMediaTrackChunk1, long[] paramArrayOfLong, MediaTrackChunk paramMediaTrackChunk2, byte[] paramArrayOfByte, int paramInt, long paramLong)
  {
    return createMoofMdat(paramMediaTrackChunk1, paramMediaTrackChunk2, paramInt, paramLong);
  }

  protected static Box createMdat(MediaTrackChunk paramMediaTrackChunk1, final MediaTrackChunk paramMediaTrackChunk2)
  {
    return new Box()
    {
      Container parent;
      long size_ = -1L;

      public void getBox(WritableByteChannel paramAnonymousWritableByteChannel)
        throws IOException
      {
        ByteBuffer localByteBuffer = ByteBuffer.allocate(8);
        IsoTypeWriter.writeUInt32(localByteBuffer, CastUtils.l2i(getSize()));
        localByteBuffer.put(IsoFile.fourCCtoBytes(getType()));
        localByteBuffer.rewind();
        paramAnonymousWritableByteChannel.write(localByteBuffer);
        this.val$videoTrack.getData().position(0);
        this.val$videoTrack.getData().limit(this.val$videoTrack.getSize());
        paramAnonymousWritableByteChannel.write(this.val$videoTrack.getData());
        paramMediaTrackChunk2.getData().position(0);
        paramMediaTrackChunk2.getData().limit(paramMediaTrackChunk2.getSize());
        paramAnonymousWritableByteChannel.write(paramMediaTrackChunk2.getData());
        paramAnonymousWritableByteChannel.close();
      }

      public long getOffset()
      {
        throw new RuntimeException("Doesn't have any meaning for programmatically created boxes");
      }

      public Container getParent()
      {
        return this.parent;
      }

      public long getSize()
      {
        if (this.size_ != -1L)
          return this.size_;
        long l = 8 + this.val$videoTrack.getSize() + paramMediaTrackChunk2.getSize();
        this.size_ = l;
        return l;
      }

      public String getType()
      {
        return "mdat";
      }

      public void parse(DataSource paramAnonymousDataSource, ByteBuffer paramAnonymousByteBuffer, long paramAnonymousLong, BoxParser paramAnonymousBoxParser)
        throws IOException
      {
      }

      public void setParent(Container paramAnonymousContainer)
      {
        this.parent = paramAnonymousContainer;
      }
    };
  }

  protected static void createMfhd(int paramInt, MovieFragmentBox paramMovieFragmentBox)
  {
    MovieFragmentHeaderBox localMovieFragmentHeaderBox = new MovieFragmentHeaderBox();
    localMovieFragmentHeaderBox.setSequenceNumber(paramInt);
    paramMovieFragmentBox.addBox(localMovieFragmentHeaderBox);
  }

  protected static Box createMoof(MediaTrackChunk paramMediaTrackChunk1, MediaTrackChunk paramMediaTrackChunk2, int paramInt, long paramLong)
  {
    MovieFragmentBox localMovieFragmentBox = new MovieFragmentBox();
    createMfhd(paramInt, localMovieFragmentBox);
    createTrafs(paramMediaTrackChunk1, paramMediaTrackChunk2, paramLong, localMovieFragmentBox);
    return localMovieFragmentBox;
  }

  protected static List<Box> createMoofMdat(MediaTrackChunk paramMediaTrackChunk1, MediaTrackChunk paramMediaTrackChunk2, int paramInt, long paramLong)
  {
    LinkedList localLinkedList = new LinkedList();
    Box localBox1 = createMdat(paramMediaTrackChunk1, paramMediaTrackChunk2);
    Box localBox2 = createMoof(paramMediaTrackChunk1, paramMediaTrackChunk2, paramInt, 8L + paramLong);
    localLinkedList.add(localBox1);
    localLinkedList.add(localBox2);
    return localLinkedList;
  }

  protected static void createTfhd(MediaTrackChunk paramMediaTrackChunk, TrackFragmentBox paramTrackFragmentBox)
  {
    TrackFragmentHeaderBox localTrackFragmentHeaderBox = new TrackFragmentHeaderBox();
    localTrackFragmentHeaderBox.setDefaultSampleFlags(new SampleFlags());
    localTrackFragmentHeaderBox.setBaseDataOffset(-1L);
    localTrackFragmentHeaderBox.setTrackId(paramMediaTrackChunk.getTrackId());
    localTrackFragmentHeaderBox.setDefaultBaseIsMoof(true);
    paramTrackFragmentBox.addBox(localTrackFragmentHeaderBox);
  }

  protected static void createTrafs(MediaTrackChunk paramMediaTrackChunk1, MediaTrackChunk paramMediaTrackChunk2, long paramLong, MovieFragmentBox paramMovieFragmentBox)
  {
    TrackFragmentBox localTrackFragmentBox1 = new TrackFragmentBox();
    createTfhd(paramMediaTrackChunk1, localTrackFragmentBox1);
    createTrun(paramMediaTrackChunk1, 0, localTrackFragmentBox1);
    localTrackFragmentBox1.getTrackFragmentHeaderBox().setTrackId(1L);
    TrackFragmentBox localTrackFragmentBox2 = new TrackFragmentBox();
    createTfhd(paramMediaTrackChunk2, localTrackFragmentBox2);
    createTrun(paramMediaTrackChunk2, 0, localTrackFragmentBox2);
    localTrackFragmentBox2.getTrackFragmentHeaderBox().setTrackId(2L);
    paramMovieFragmentBox.addBox(localTrackFragmentBox1);
    paramMovieFragmentBox.addBox(localTrackFragmentBox2);
    int i = paramMediaTrackChunk1.getSize();
    ((TrackFragmentHeaderBox)paramMovieFragmentBox.getTrackFragmentHeaderBoxes().get(0)).setBaseDataOffset(paramLong);
    ((TrackFragmentHeaderBox)paramMovieFragmentBox.getTrackFragmentHeaderBoxes().get(1)).setBaseDataOffset(paramLong + i);
  }

  protected static void createTrun(MediaTrackChunk paramMediaTrackChunk, int paramInt, TrackFragmentBox paramTrackFragmentBox)
  {
    TrackRunBox localTrackRunBox = new TrackRunBox();
    localTrackRunBox.setVersion(1);
    int[] arrayOfInt1 = paramMediaTrackChunk.getSampleSizes();
    localTrackRunBox.setDataOffset(paramInt);
    localTrackRunBox.setDataOffsetPresent(true);
    localTrackRunBox.setSampleDurationPresent(true);
    localTrackRunBox.setSampleSizePresent(true);
    ArrayList localArrayList = new ArrayList(arrayOfInt1.length);
    localTrackRunBox.setSampleCompositionTimeOffsetPresent(false);
    int[] arrayOfInt2 = paramMediaTrackChunk.getIFrameIndexes();
    int i = paramMediaTrackChunk.getTrackId();
    boolean bool = false;
    if (i == 1)
      bool = true;
    localTrackRunBox.setSampleFlagsPresent(bool);
    int[] arrayOfInt3 = paramMediaTrackChunk.getSampleDurations();
    int j = 0;
    if (j < arrayOfInt1.length)
    {
      TrackRunBox.Entry localEntry = new TrackRunBox.Entry();
      localEntry.setSampleSize(arrayOfInt1[j]);
      SampleFlags localSampleFlags;
      int k;
      if (bool)
      {
        localSampleFlags = new SampleFlags();
        if (paramMediaTrackChunk.getTrackId() == 1)
        {
          k = 0;
          label148: int m = arrayOfInt2.length;
          int n = 0;
          if (k < m)
          {
            if (arrayOfInt2[k] != j)
              break label239;
            n = 1;
          }
          localSampleFlags.setSampleHasRedundancy(0);
          if (n == 0)
            break label245;
          localSampleFlags.setSampleIsDifferenceSample(false);
          localSampleFlags.setSampleDependsOn(2);
          localSampleFlags.setSampleIsDependedOn(1);
        }
      }
      while (true)
      {
        localEntry.setSampleFlags(localSampleFlags);
        localEntry.setSampleDuration(arrayOfInt3[j]);
        localArrayList.add(localEntry);
        j++;
        break;
        label239: k++;
        break label148;
        label245: localSampleFlags.setSampleIsDifferenceSample(true);
        localSampleFlags.setSampleDependsOn(1);
        localSampleFlags.setSampleIsDependedOn(0);
      }
    }
    localTrackRunBox.setEntries(localArrayList);
    paramTrackFragmentBox.addBox(localTrackRunBox);
  }

  public static int getChunkSize(Track paramTrack)
  {
    List localList = paramTrack.getSamples();
    int i = 0;
    for (int j = 0; j < localList.size(); j++)
      i = (int)(i + ((Sample)localList.get(j)).getSize());
    return i;
  }
}