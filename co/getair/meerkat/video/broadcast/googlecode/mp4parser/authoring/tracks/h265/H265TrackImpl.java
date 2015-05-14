package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks.h265;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.VisualSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.FileDataSourceImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Movie;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.builder.DefaultMp4Builder;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks.AbstractH26XTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks.AbstractH26XTrack.LookAhead;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.ByteBufferByteChannel;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15.HevcConfigurationBox;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15.HevcDecoderConfigurationRecord.Array;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class H265TrackImpl extends AbstractH26XTrack
  implements NalUnitTypes
{
  ArrayList<ByteBuffer> pps = new ArrayList();
  ArrayList<Sample> samples = new ArrayList();
  ArrayList<ByteBuffer> sps = new ArrayList();
  SampleDescriptionBox stsd;
  ArrayList<ByteBuffer> vps = new ArrayList();

  public H265TrackImpl(DataSource paramDataSource)
    throws IOException
  {
    super(paramDataSource);
    ArrayList localArrayList = new ArrayList();
    AbstractH26XTrack.LookAhead localLookAhead = new AbstractH26XTrack.LookAhead(paramDataSource);
    boolean[] arrayOfBoolean1 = { false };
    boolean[] arrayOfBoolean2 = { true };
    ByteBuffer localByteBuffer = findNextNal(localLookAhead);
    if (localByteBuffer != null)
    {
      NalUnitHeader localNalUnitHeader = getNalUnitHeader(localByteBuffer);
      if (arrayOfBoolean1[0] != 0)
      {
        if (!isVcl(localNalUnitHeader))
          break label335;
        if ((0xFFFFFF80 & localByteBuffer.get(2)) != 0)
          wrapUp(localArrayList, arrayOfBoolean1, arrayOfBoolean2);
      }
      switch (localNalUnitHeader.nalUnitType)
      {
      case 35:
      case 36:
      case 37:
      case 38:
      default:
        label192: switch (localNalUnitHeader.nalUnitType)
        {
        default:
          System.err.println("Adding " + localNalUnitHeader.nalUnitType);
          localArrayList.add(localByteBuffer);
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
        case 38:
        }
        if (isVcl(localNalUnitHeader))
          switch (localNalUnitHeader.nalUnitType)
          {
          default:
            arrayOfBoolean2[0] = false;
          case 19:
          case 20:
          }
        break;
      case 34:
      case 32:
      case 33:
      case 39:
      }
      while (true)
      {
        arrayOfBoolean1[0] |= isVcl(localNalUnitHeader);
        break;
        label335: switch (localNalUnitHeader.nalUnitType)
        {
        case 38:
        case 40:
        case 45:
        case 46:
        case 47:
        default:
          break;
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
        case 39:
        case 41:
        case 42:
        case 43:
        case 44:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
          wrapUp(localArrayList, arrayOfBoolean1, arrayOfBoolean2);
          break;
          localByteBuffer.position(2);
          this.pps.add(localByteBuffer.slice());
          System.err.println("Stored PPS");
          break label192;
          localByteBuffer.position(2);
          this.vps.add(localByteBuffer.slice());
          System.err.println("Stored VPS");
          break label192;
          localByteBuffer.position(2);
          this.sps.add(localByteBuffer.slice());
          localByteBuffer.position(1);
          new SequenceParameterSetRbsp(Channels.newInputStream(new ByteBufferByteChannel(localByteBuffer.slice())));
          System.err.println("Stored SPS");
          break label192;
          new SEIMessage(new BitReaderBuffer(localByteBuffer.slice()));
          break label192;
          arrayOfBoolean2[0] = (0x1 & arrayOfBoolean2[0]);
        }
      }
    }
    this.stsd = createSampleDescriptionBox();
    this.decodingTimes = new long[this.samples.size()];
    getTrackMetaData().setTimescale(25L);
    Arrays.fill(this.decodingTimes, 1L);
  }

  private SampleDescriptionBox createSampleDescriptionBox()
  {
    this.stsd = new SampleDescriptionBox();
    VisualSampleEntry localVisualSampleEntry = new VisualSampleEntry("hvc1");
    localVisualSampleEntry.setDataReferenceIndex(1);
    localVisualSampleEntry.setDepth(24);
    localVisualSampleEntry.setFrameCount(1);
    localVisualSampleEntry.setHorizresolution(72.0D);
    localVisualSampleEntry.setVertresolution(72.0D);
    localVisualSampleEntry.setWidth(640);
    localVisualSampleEntry.setHeight(480);
    localVisualSampleEntry.setCompressorname("HEVC Coding");
    HevcConfigurationBox localHevcConfigurationBox = new HevcConfigurationBox();
    HevcDecoderConfigurationRecord.Array localArray1 = new HevcDecoderConfigurationRecord.Array();
    localArray1.array_completeness = true;
    localArray1.nal_unit_type = 33;
    localArray1.nalUnits = new ArrayList();
    Iterator localIterator1 = this.sps.iterator();
    while (localIterator1.hasNext())
    {
      ByteBuffer localByteBuffer3 = (ByteBuffer)localIterator1.next();
      localArray1.nalUnits.add(toArray(localByteBuffer3));
    }
    HevcDecoderConfigurationRecord.Array localArray2 = new HevcDecoderConfigurationRecord.Array();
    localArray2.array_completeness = true;
    localArray2.nal_unit_type = 34;
    localArray2.nalUnits = new ArrayList();
    Iterator localIterator2 = this.pps.iterator();
    while (localIterator2.hasNext())
    {
      ByteBuffer localByteBuffer2 = (ByteBuffer)localIterator2.next();
      localArray2.nalUnits.add(toArray(localByteBuffer2));
    }
    HevcDecoderConfigurationRecord.Array localArray3 = new HevcDecoderConfigurationRecord.Array();
    localArray3.array_completeness = true;
    localArray3.nal_unit_type = 34;
    localArray3.nalUnits = new ArrayList();
    Iterator localIterator3 = this.vps.iterator();
    while (localIterator3.hasNext())
    {
      ByteBuffer localByteBuffer1 = (ByteBuffer)localIterator3.next();
      localArray3.nalUnits.add(toArray(localByteBuffer1));
    }
    localHevcConfigurationBox.getArrays().addAll(Arrays.asList(new HevcDecoderConfigurationRecord.Array[] { localArray1, localArray3, localArray2 }));
    localVisualSampleEntry.addBox(localHevcConfigurationBox);
    this.stsd.addBox(localVisualSampleEntry);
    return this.stsd;
  }

  public static void main(String[] paramArrayOfString)
    throws IOException
  {
    H265TrackImpl localH265TrackImpl = new H265TrackImpl(new FileDataSourceImpl("c:\\content\\test-UHD-HEVC_01_FMV_Med_track1.hvc"));
    Movie localMovie = new Movie();
    localMovie.addTrack(localH265TrackImpl);
    new DefaultMp4Builder().build(localMovie).writeContainer(new FileOutputStream("output.mp4").getChannel());
  }

  public String getHandler()
  {
    return "vide";
  }

  public NalUnitHeader getNalUnitHeader(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.position(0);
    int i = IsoTypeReader.readUInt16(paramByteBuffer);
    NalUnitHeader localNalUnitHeader = new NalUnitHeader();
    localNalUnitHeader.forbiddenZeroFlag = ((0x8000 & i) >> 15);
    localNalUnitHeader.nalUnitType = ((i & 0x7E00) >> 9);
    localNalUnitHeader.nuhLayerId = ((i & 0x1F8) >> 3);
    localNalUnitHeader.nuhTemporalIdPlusOne = (i & 0x7);
    return localNalUnitHeader;
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    return null;
  }

  public List<Sample> getSamples()
  {
    return this.samples;
  }

  boolean isVcl(NalUnitHeader paramNalUnitHeader)
  {
    return (paramNalUnitHeader.nalUnitType >= 0) && (paramNalUnitHeader.nalUnitType <= 31);
  }

  public void wrapUp(List<ByteBuffer> paramList, boolean[] paramArrayOfBoolean1, boolean[] paramArrayOfBoolean2)
  {
    this.samples.add(createSampleObject(paramList));
    System.err.print("Create AU from " + paramList.size() + " NALs");
    if (paramArrayOfBoolean2[0] != 0)
      System.err.println("  IDR");
    while (true)
    {
      paramArrayOfBoolean1[0] = false;
      paramArrayOfBoolean2[0] = true;
      paramList.clear();
      return;
      System.err.println();
    }
  }
}