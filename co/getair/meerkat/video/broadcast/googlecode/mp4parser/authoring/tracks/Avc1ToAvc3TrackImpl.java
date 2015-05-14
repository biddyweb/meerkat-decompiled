package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriterVariable;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AbstractSampleEntry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.VisualSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.MemoryDataSourceImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.WrappingTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Path;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15.AvcConfigurationBox;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.WritableByteChannel;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class Avc1ToAvc3TrackImpl extends WrappingTrack
{
  AvcConfigurationBox avcC;
  List<Sample> samples;
  SampleDescriptionBox stsd;

  public Avc1ToAvc3TrackImpl(Track paramTrack)
    throws IOException
  {
    super(paramTrack);
    if (!"avc1".equals(paramTrack.getSampleDescriptionBox().getSampleEntry().getType()))
      throw new RuntimeException("Only avc1 tracks can be converted to avc3 tracks");
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    paramTrack.getSampleDescriptionBox().getBox(Channels.newChannel(localByteArrayOutputStream));
    this.stsd = ((SampleDescriptionBox)Path.getPath(new IsoFile(new MemoryDataSourceImpl(localByteArrayOutputStream.toByteArray())), "stsd"));
    ((VisualSampleEntry)this.stsd.getSampleEntry()).setType("avc3");
    this.avcC = ((AvcConfigurationBox)Path.getPath(this.stsd, "avc./avcC"));
    this.samples = new ReplaceSyncSamplesList(paramTrack.getSamples());
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    return this.stsd;
  }

  public List<Sample> getSamples()
  {
    return this.samples;
  }

  private class ReplaceSyncSamplesList extends AbstractList<Sample>
  {
    List<Sample> parentSamples;

    public ReplaceSyncSamplesList()
    {
      Object localObject;
      this.parentSamples = localObject;
    }

    public Sample get(int paramInt)
    {
      if (Arrays.binarySearch(Avc1ToAvc3TrackImpl.this.getSyncSamples(), paramInt + 1) >= 0)
      {
        final int i = 1 + Avc1ToAvc3TrackImpl.this.avcC.getLengthSizeMinusOne();
        return new Sample()
        {
          public ByteBuffer asByteBuffer()
          {
            int i = 0;
            Iterator localIterator1 = Avc1ToAvc3TrackImpl.this.avcC.getSequenceParameterSets().iterator();
            while (localIterator1.hasNext())
            {
              byte[] arrayOfByte6 = (byte[])localIterator1.next();
              i += i + arrayOfByte6.length;
            }
            Iterator localIterator2 = Avc1ToAvc3TrackImpl.this.avcC.getSequenceParameterSetExts().iterator();
            while (localIterator2.hasNext())
            {
              byte[] arrayOfByte5 = (byte[])localIterator2.next();
              i += i + arrayOfByte5.length;
            }
            Iterator localIterator3 = Avc1ToAvc3TrackImpl.this.avcC.getPictureParameterSets().iterator();
            while (localIterator3.hasNext())
            {
              byte[] arrayOfByte4 = (byte[])localIterator3.next();
              i += i + arrayOfByte4.length;
            }
            ByteBuffer localByteBuffer = ByteBuffer.allocate(i + CastUtils.l2i(this.val$orignalSample.getSize()));
            Iterator localIterator4 = Avc1ToAvc3TrackImpl.this.avcC.getSequenceParameterSets().iterator();
            while (localIterator4.hasNext())
            {
              byte[] arrayOfByte3 = (byte[])localIterator4.next();
              IsoTypeWriterVariable.write(arrayOfByte3.length, localByteBuffer, i);
              localByteBuffer.put(arrayOfByte3);
            }
            Iterator localIterator5 = Avc1ToAvc3TrackImpl.this.avcC.getSequenceParameterSetExts().iterator();
            while (localIterator5.hasNext())
            {
              byte[] arrayOfByte2 = (byte[])localIterator5.next();
              IsoTypeWriterVariable.write(arrayOfByte2.length, localByteBuffer, i);
              localByteBuffer.put(arrayOfByte2);
            }
            Iterator localIterator6 = Avc1ToAvc3TrackImpl.this.avcC.getPictureParameterSets().iterator();
            while (localIterator6.hasNext())
            {
              byte[] arrayOfByte1 = (byte[])localIterator6.next();
              IsoTypeWriterVariable.write(arrayOfByte1.length, localByteBuffer, i);
              localByteBuffer.put(arrayOfByte1);
            }
            localByteBuffer.put(this.val$orignalSample.asByteBuffer());
            return (ByteBuffer)localByteBuffer.rewind();
          }

          public long getSize()
          {
            int i = 0;
            Iterator localIterator1 = Avc1ToAvc3TrackImpl.this.avcC.getSequenceParameterSets().iterator();
            while (localIterator1.hasNext())
            {
              byte[] arrayOfByte3 = (byte[])localIterator1.next();
              i += i + arrayOfByte3.length;
            }
            Iterator localIterator2 = Avc1ToAvc3TrackImpl.this.avcC.getSequenceParameterSetExts().iterator();
            while (localIterator2.hasNext())
            {
              byte[] arrayOfByte2 = (byte[])localIterator2.next();
              i += i + arrayOfByte2.length;
            }
            Iterator localIterator3 = Avc1ToAvc3TrackImpl.this.avcC.getPictureParameterSets().iterator();
            while (localIterator3.hasNext())
            {
              byte[] arrayOfByte1 = (byte[])localIterator3.next();
              i += i + arrayOfByte1.length;
            }
            return this.val$orignalSample.getSize() + i;
          }

          public void writeTo(WritableByteChannel paramAnonymousWritableByteChannel)
            throws IOException
          {
            Iterator localIterator1 = Avc1ToAvc3TrackImpl.this.avcC.getSequenceParameterSets().iterator();
            while (localIterator1.hasNext())
            {
              byte[] arrayOfByte3 = (byte[])localIterator1.next();
              IsoTypeWriterVariable.write(arrayOfByte3.length, (ByteBuffer)this.val$buf.rewind(), i);
              paramAnonymousWritableByteChannel.write((ByteBuffer)this.val$buf.rewind());
              paramAnonymousWritableByteChannel.write(ByteBuffer.wrap(arrayOfByte3));
            }
            Iterator localIterator2 = Avc1ToAvc3TrackImpl.this.avcC.getSequenceParameterSetExts().iterator();
            while (localIterator2.hasNext())
            {
              byte[] arrayOfByte2 = (byte[])localIterator2.next();
              IsoTypeWriterVariable.write(arrayOfByte2.length, (ByteBuffer)this.val$buf.rewind(), i);
              paramAnonymousWritableByteChannel.write((ByteBuffer)this.val$buf.rewind());
              paramAnonymousWritableByteChannel.write(ByteBuffer.wrap(arrayOfByte2));
            }
            Iterator localIterator3 = Avc1ToAvc3TrackImpl.this.avcC.getPictureParameterSets().iterator();
            while (localIterator3.hasNext())
            {
              byte[] arrayOfByte1 = (byte[])localIterator3.next();
              IsoTypeWriterVariable.write(arrayOfByte1.length, (ByteBuffer)this.val$buf.rewind(), i);
              paramAnonymousWritableByteChannel.write((ByteBuffer)this.val$buf.rewind());
              paramAnonymousWritableByteChannel.write(ByteBuffer.wrap(arrayOfByte1));
            }
            this.val$orignalSample.writeTo(paramAnonymousWritableByteChannel);
          }
        };
      }
      return (Sample)this.parentSamples.get(paramInt);
    }

    public int size()
    {
      return this.parentSamples.size();
    }
  }
}