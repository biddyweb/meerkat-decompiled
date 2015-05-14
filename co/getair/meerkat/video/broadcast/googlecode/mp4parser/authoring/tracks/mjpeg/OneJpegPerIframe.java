package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks.mjpeg;

import co.getair.meerkat.video.broadcast.coremedia.iso.Hex;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.VisualSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.AbstractTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Edit;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.ESDescriptorBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.ESDescriptor;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.ObjectDescriptorFactory;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.FileChannel.MapMode;
import java.nio.channels.WritableByteChannel;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class OneJpegPerIframe extends AbstractTrack
{
  File[] jpegs;
  long[] sampleDurations;
  SampleDescriptionBox stsd;
  long[] syncSamples;
  TrackMetaData trackMetaData = new TrackMetaData();

  public OneJpegPerIframe(String paramString, File[] paramArrayOfFile, Track paramTrack)
    throws IOException
  {
    super(paramString);
    this.jpegs = paramArrayOfFile;
    if (paramTrack.getSyncSamples().length != paramArrayOfFile.length)
      throw new RuntimeException("Number of sync samples doesn't match the number of stills (" + paramTrack.getSyncSamples().length + " vs. " + paramArrayOfFile.length + ")");
    long[] arrayOfLong1 = paramTrack.getSampleDurations();
    long[] arrayOfLong2 = paramTrack.getSyncSamples();
    int i = 1;
    long l1 = 0L;
    this.sampleDurations = new long[arrayOfLong2.length];
    for (int j = 1; ; j++)
    {
      int k = arrayOfLong1.length;
      if (j >= k)
        break;
      int i5 = arrayOfLong2.length;
      if ((i < i5) && (j == arrayOfLong2[i]))
      {
        this.sampleDurations[(i - 1)] = l1;
        l1 = 0L;
        i++;
      }
      l1 += arrayOfLong1[j];
    }
    this.sampleDurations[(-1 + this.sampleDurations.length)] = l1;
    this.stsd = new SampleDescriptionBox();
    VisualSampleEntry localVisualSampleEntry = new VisualSampleEntry("mp4v");
    this.stsd.addBox(localVisualSampleEntry);
    ESDescriptorBox localESDescriptorBox = new ESDescriptorBox();
    localESDescriptorBox.setData(ByteBuffer.wrap(Hex.decodeHex("038080801B000100048080800D6C11000000000A1CB4000A1CB4068080800102")));
    localESDescriptorBox.setEsDescriptor((ESDescriptor)ObjectDescriptorFactory.createFrom(-1, ByteBuffer.wrap(Hex.decodeHex("038080801B000100048080800D6C11000000000A1CB4000A1CB4068080800102"))));
    localVisualSampleEntry.addBox(localESDescriptorBox);
    this.syncSamples = new long[paramArrayOfFile.length];
    for (int m = 0; ; m++)
    {
      int n = this.syncSamples.length;
      if (m >= n)
        break;
      this.syncSamples[m] = (m + 1);
    }
    double d = 0.0D;
    int i1 = 1;
    int i2 = 1;
    Iterator localIterator = paramTrack.getEdits().iterator();
    while (localIterator.hasNext())
    {
      Edit localEdit = (Edit)localIterator.next();
      if ((localEdit.getMediaTime() == -1L) && (i1 == 0))
        throw new RuntimeException("Cannot accept edit list for processing (1)");
      if ((localEdit.getMediaTime() >= 0L) && (i2 == 0))
        throw new RuntimeException("Cannot accept edit list for processing (2)");
      if (localEdit.getMediaTime() == -1L)
      {
        d += localEdit.getSegmentDuration();
      }
      else
      {
        d -= localEdit.getMediaTime() / localEdit.getTimeScale();
        i1 = 0;
        i2 = 0;
      }
    }
    if ((paramTrack.getCompositionTimeEntries() != null) && (paramTrack.getCompositionTimeEntries().size() > 0))
    {
      long l2 = 0L;
      int[] arrayOfInt = Arrays.copyOfRange(CompositionTimeToSample.blowupCompositionTimes(paramTrack.getCompositionTimeEntries()), 0, 50);
      for (int i3 = 0; ; i3++)
      {
        int i4 = arrayOfInt.length;
        if (i3 >= i4)
          break;
        arrayOfInt[i3] = ((int)(l2 + arrayOfInt[i3]));
        l2 += paramTrack.getSampleDurations()[i3];
      }
      Arrays.sort(arrayOfInt);
      d += arrayOfInt[0] / paramTrack.getTrackMetaData().getTimescale();
    }
    if (d < 0.0D)
      getEdits().add(new Edit(()(-d * getTrackMetaData().getTimescale()), getTrackMetaData().getTimescale(), 1.0D, getDuration() / getTrackMetaData().getTimescale()));
    while (d <= 0.0D)
      return;
    getEdits().add(new Edit(-1L, getTrackMetaData().getTimescale(), 1.0D, d));
    getEdits().add(new Edit(0L, getTrackMetaData().getTimescale(), 1.0D, getDuration() / getTrackMetaData().getTimescale()));
  }

  public void close()
    throws IOException
  {
  }

  public String getHandler()
  {
    return "vide";
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    return this.stsd;
  }

  public long[] getSampleDurations()
  {
    return this.sampleDurations;
  }

  public List<Sample> getSamples()
  {
    return new AbstractList()
    {
      public Sample get(final int paramAnonymousInt)
      {
        return new Sample()
        {
          ByteBuffer sample = null;

          public ByteBuffer asByteBuffer()
          {
            if (this.sample == null);
            try
            {
              RandomAccessFile localRandomAccessFile = new RandomAccessFile(OneJpegPerIframe.this.jpegs[paramAnonymousInt], "r");
              this.sample = localRandomAccessFile.getChannel().map(FileChannel.MapMode.READ_ONLY, 0L, localRandomAccessFile.length());
              return this.sample;
            }
            catch (IOException localIOException)
            {
              throw new RuntimeException(localIOException);
            }
          }

          public long getSize()
          {
            return OneJpegPerIframe.this.jpegs[paramAnonymousInt].length();
          }

          public void writeTo(WritableByteChannel paramAnonymous2WritableByteChannel)
            throws IOException
          {
            RandomAccessFile localRandomAccessFile = new RandomAccessFile(OneJpegPerIframe.this.jpegs[paramAnonymousInt], "r");
            localRandomAccessFile.getChannel().transferTo(0L, localRandomAccessFile.length(), paramAnonymous2WritableByteChannel);
            localRandomAccessFile.close();
          }
        };
      }

      public int size()
      {
        return OneJpegPerIframe.this.jpegs.length;
      }
    };
  }

  public long[] getSyncSamples()
  {
    return this.syncSamples;
  }

  public TrackMetaData getTrackMetaData()
  {
    return this.trackMetaData;
  }
}