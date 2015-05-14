package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.VisualSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.model.ChromaFormat;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.model.HRDParameters;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.model.PictureParameterSet;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.model.SeqParameterSet;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.model.VUIParameters;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.read.CAVLCReader;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.RangeStartMap;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15.AvcConfigurationBox;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

public class H264TrackImpl extends AbstractH26XTrack
{
  private static final Logger LOG = Logger.getLogger(H264TrackImpl.class.getName());
  PictureParameterSet currentPictureParameterSet = null;
  SeqParameterSet currentSeqParameterSet = null;
  private boolean determineFrameRate = true;
  PictureParameterSet firstPictureParameterSet = null;
  SeqParameterSet firstSeqParameterSet = null;
  int frameNrInGop = 0;
  private int frametick;
  private int height;
  private String lang = "eng";
  RangeStartMap<Integer, byte[]> pictureParameterRangeMap = new RangeStartMap();
  Map<Integer, PictureParameterSet> ppsIdToPps = new HashMap();
  Map<Integer, byte[]> ppsIdToPpsBytes = new HashMap();
  SampleDescriptionBox sampleDescriptionBox;
  private List<Sample> samples;
  private SEIMessage seiMessage;
  RangeStartMap<Integer, byte[]> seqParameterRangeMap = new RangeStartMap();
  Map<Integer, SeqParameterSet> spsIdToSps = new HashMap();
  Map<Integer, byte[]> spsIdToSpsBytes = new HashMap();
  private long timescale;
  private int width;

  public H264TrackImpl(DataSource paramDataSource)
    throws IOException
  {
    this(paramDataSource, "eng");
  }

  public H264TrackImpl(DataSource paramDataSource, String paramString)
    throws IOException
  {
    this(paramDataSource, paramString, -1L, -1);
  }

  public H264TrackImpl(DataSource paramDataSource, String paramString, long paramLong, int paramInt)
    throws IOException
  {
    super(paramDataSource);
    this.lang = paramString;
    this.timescale = paramLong;
    this.frametick = paramInt;
    if ((paramLong > 0L) && (paramInt > 0))
      this.determineFrameRate = false;
    parse(new AbstractH26XTrack.LookAhead(paramDataSource));
  }

  private void configureFramerate()
  {
    if (this.determineFrameRate)
    {
      if (this.firstSeqParameterSet.vuiParams == null)
        break label79;
      this.timescale = (this.firstSeqParameterSet.vuiParams.time_scale >> 1);
      this.frametick = this.firstSeqParameterSet.vuiParams.num_units_in_tick;
      if ((this.timescale == 0L) || (this.frametick == 0))
      {
        this.timescale = 90000L;
        this.frametick = 3020;
      }
    }
    return;
    label79: this.timescale = 90000L;
    this.frametick = 3020;
  }

  private void createSample(List<ByteBuffer> paramList)
    throws IOException
  {
    int i = 22;
    boolean bool1 = false;
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
      if ((0x1F & ((ByteBuffer)localIterator.next()).get(0)) == 5)
        bool1 = true;
    if (bool1)
      i += 16;
    if (new SliceHeader(cleanBuffer(new ByteBufferBackedInputStream((ByteBuffer)paramList.get(-1 + paramList.size()))), this.spsIdToSps, this.ppsIdToPps, bool1).slice_type == H264TrackImpl.SliceHeader.SliceType.B)
      i += 4;
    Sample localSample = createSampleObject(paramList);
    paramList.clear();
    if ((this.seiMessage == null) || (this.seiMessage.n_frames == 0))
      this.frameNrInGop = 0;
    int j;
    if ((this.seiMessage != null) && (this.seiMessage.clock_timestamp_flag))
      j = this.seiMessage.n_frames - this.frameNrInGop;
    while (true)
    {
      this.ctts.add(new CompositionTimeToSample.Entry(1, j * this.frametick));
      this.sdtp.add(new SampleDependencyTypeBox.Entry(i));
      this.frameNrInGop = (1 + this.frameNrInGop);
      this.samples.add(localSample);
      if (bool1)
        this.stss.add(Integer.valueOf(this.samples.size()));
      return;
      SEIMessage localSEIMessage = this.seiMessage;
      j = 0;
      if (localSEIMessage != null)
      {
        boolean bool2 = this.seiMessage.removal_delay_flag;
        j = 0;
        if (bool2)
          j = this.seiMessage.dpb_removal_delay / 2;
      }
    }
  }

  private void handlePPS(ByteBuffer paramByteBuffer)
    throws IOException
  {
    ByteBufferBackedInputStream localByteBufferBackedInputStream = new ByteBufferBackedInputStream(paramByteBuffer);
    localByteBufferBackedInputStream.read();
    PictureParameterSet localPictureParameterSet = PictureParameterSet.read(localByteBufferBackedInputStream);
    if (this.firstPictureParameterSet == null)
      this.firstPictureParameterSet = localPictureParameterSet;
    this.currentPictureParameterSet = localPictureParameterSet;
    byte[] arrayOfByte1 = toArray((ByteBuffer)paramByteBuffer.rewind());
    byte[] arrayOfByte2 = (byte[])this.ppsIdToPpsBytes.get(Integer.valueOf(localPictureParameterSet.pic_parameter_set_id));
    if ((arrayOfByte2 != null) && (!Arrays.equals(arrayOfByte2, arrayOfByte1)))
      throw new RuntimeException("OMG - I got two SPS with same ID but different settings! (AVC3 is the solution)");
    if (arrayOfByte2 == null)
      this.pictureParameterRangeMap.put(Integer.valueOf(this.samples.size()), arrayOfByte1);
    this.ppsIdToPpsBytes.put(Integer.valueOf(localPictureParameterSet.pic_parameter_set_id), arrayOfByte1);
    this.ppsIdToPps.put(Integer.valueOf(localPictureParameterSet.pic_parameter_set_id), localPictureParameterSet);
  }

  private void handleSPS(ByteBuffer paramByteBuffer)
    throws IOException
  {
    InputStream localInputStream = cleanBuffer(new ByteBufferBackedInputStream(paramByteBuffer));
    localInputStream.read();
    SeqParameterSet localSeqParameterSet = SeqParameterSet.read(localInputStream);
    if (this.firstSeqParameterSet == null)
    {
      this.firstSeqParameterSet = localSeqParameterSet;
      configureFramerate();
    }
    this.currentSeqParameterSet = localSeqParameterSet;
    byte[] arrayOfByte1 = toArray((ByteBuffer)paramByteBuffer.rewind());
    byte[] arrayOfByte2 = (byte[])this.spsIdToSpsBytes.get(Integer.valueOf(localSeqParameterSet.seq_parameter_set_id));
    if ((arrayOfByte2 != null) && (!Arrays.equals(arrayOfByte2, arrayOfByte1)))
      throw new RuntimeException("OMG - I got two SPS with same ID but different settings!");
    if (arrayOfByte2 != null)
      this.seqParameterRangeMap.put(Integer.valueOf(this.samples.size()), arrayOfByte1);
    this.spsIdToSpsBytes.put(Integer.valueOf(localSeqParameterSet.seq_parameter_set_id), arrayOfByte1);
    this.spsIdToSps.put(Integer.valueOf(localSeqParameterSet.seq_parameter_set_id), localSeqParameterSet);
  }

  private void parse(AbstractH26XTrack.LookAhead paramLookAhead)
    throws IOException
  {
    this.samples = new LinkedList();
    if (!readSamples(paramLookAhead))
      throw new IOException();
    if (!readVariables())
      throw new IOException();
    this.sampleDescriptionBox = new SampleDescriptionBox();
    VisualSampleEntry localVisualSampleEntry = new VisualSampleEntry("avc1");
    localVisualSampleEntry.setDataReferenceIndex(1);
    localVisualSampleEntry.setDepth(24);
    localVisualSampleEntry.setFrameCount(1);
    localVisualSampleEntry.setHorizresolution(72.0D);
    localVisualSampleEntry.setVertresolution(72.0D);
    localVisualSampleEntry.setWidth(this.width);
    localVisualSampleEntry.setHeight(this.height);
    localVisualSampleEntry.setCompressorname("Meerkat AVC");
    AvcConfigurationBox localAvcConfigurationBox = new AvcConfigurationBox();
    localAvcConfigurationBox.setSequenceParameterSets(new ArrayList(this.spsIdToSpsBytes.values()));
    localAvcConfigurationBox.setPictureParameterSets(new ArrayList(this.ppsIdToPpsBytes.values()));
    localAvcConfigurationBox.setAvcLevelIndication(this.firstSeqParameterSet.level_idc);
    localAvcConfigurationBox.setAvcProfileIndication(this.firstSeqParameterSet.profile_idc);
    localAvcConfigurationBox.setBitDepthLumaMinus8(this.firstSeqParameterSet.bit_depth_luma_minus8);
    localAvcConfigurationBox.setBitDepthChromaMinus8(this.firstSeqParameterSet.bit_depth_chroma_minus8);
    localAvcConfigurationBox.setChromaFormat(this.firstSeqParameterSet.chroma_format_idc.getId());
    localAvcConfigurationBox.setConfigurationVersion(1);
    localAvcConfigurationBox.setLengthSizeMinusOne(3);
    int i;
    int j;
    label262: int m;
    label283: int n;
    if (this.firstSeqParameterSet.constraint_set_0_flag)
    {
      i = 128;
      if (!this.firstSeqParameterSet.constraint_set_1_flag)
        break label448;
      j = 64;
      int k = j + i;
      if (!this.firstSeqParameterSet.constraint_set_2_flag)
        break label454;
      m = 32;
      n = k + m;
      if (!this.firstSeqParameterSet.constraint_set_3_flag)
        break label460;
    }
    label448: label454: label460: for (int i1 = 16; ; i1 = 0)
    {
      int i2 = i1 + n;
      boolean bool = this.firstSeqParameterSet.constraint_set_4_flag;
      int i3 = 0;
      if (bool)
        i3 = 8;
      localAvcConfigurationBox.setProfileCompatibility(i2 + i3 + (int)(0x3 & this.firstSeqParameterSet.reserved_zero_2bits));
      localVisualSampleEntry.addBox(localAvcConfigurationBox);
      this.sampleDescriptionBox.addBox(localVisualSampleEntry);
      this.trackMetaData.setCreationTime(new Date());
      this.trackMetaData.setModificationTime(new Date());
      this.trackMetaData.setLanguage(this.lang);
      this.trackMetaData.setTimescale(this.timescale);
      this.trackMetaData.setWidth(this.width);
      this.trackMetaData.setHeight(this.height);
      return;
      i = 0;
      break;
      j = 0;
      break label262;
      m = 0;
      break label283;
    }
  }

  private boolean readSamples(AbstractH26XTrack.LookAhead paramLookAhead)
    throws IOException
  {
    ArrayList localArrayList = new ArrayList();
    Object localObject = null;
    while (true)
    {
      ByteBuffer localByteBuffer = findNextNal(paramLookAhead);
      if (localByteBuffer == null)
        break;
      int i = localByteBuffer.get(0);
      int j = 0x3 & i >> 5;
      int k = i & 0x1F;
      switch (k)
      {
      case 12:
      default:
        System.err.println("Unknown NAL unit type: " + k);
        break;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        Object local1FirstVclNalDetector = new Object()
        {
          boolean bottom_field_flag;
          int delta_pic_order_cnt_0;
          int delta_pic_order_cnt_1;
          int delta_pic_order_cnt_bottom;
          boolean field_pic_flag;
          int frame_num;
          boolean idrPicFlag;
          int idr_pic_id;
          int nal_ref_idc;
          int pic_order_cnt_lsb;
          int pic_order_cnt_type;
          int pic_parameter_set_id;

          boolean isFirstInNew(1FirstVclNalDetector paramAnonymous1FirstVclNalDetector)
          {
            if (paramAnonymous1FirstVclNalDetector.frame_num != this.frame_num);
            while ((paramAnonymous1FirstVclNalDetector.pic_parameter_set_id != this.pic_parameter_set_id) || (paramAnonymous1FirstVclNalDetector.field_pic_flag != this.field_pic_flag) || ((paramAnonymous1FirstVclNalDetector.field_pic_flag) && (paramAnonymous1FirstVclNalDetector.bottom_field_flag != this.bottom_field_flag)) || (paramAnonymous1FirstVclNalDetector.nal_ref_idc != this.nal_ref_idc) || ((paramAnonymous1FirstVclNalDetector.pic_order_cnt_type == 0) && (this.pic_order_cnt_type == 0) && ((paramAnonymous1FirstVclNalDetector.pic_order_cnt_lsb != this.pic_order_cnt_lsb) || (paramAnonymous1FirstVclNalDetector.delta_pic_order_cnt_bottom != this.delta_pic_order_cnt_bottom))) || ((paramAnonymous1FirstVclNalDetector.pic_order_cnt_type == 1) && (this.pic_order_cnt_type == 1) && ((paramAnonymous1FirstVclNalDetector.delta_pic_order_cnt_0 != this.delta_pic_order_cnt_0) || (paramAnonymous1FirstVclNalDetector.delta_pic_order_cnt_1 != this.delta_pic_order_cnt_1))) || (paramAnonymous1FirstVclNalDetector.idrPicFlag != this.idrPicFlag) || ((paramAnonymous1FirstVclNalDetector.idrPicFlag) && (this.idrPicFlag) && (paramAnonymous1FirstVclNalDetector.idr_pic_id != this.idr_pic_id)))
              return true;
            return false;
          }
        };
        if (localObject == null)
          localObject = local1FirstVclNalDetector;
        while (true)
        {
          localArrayList.add((ByteBuffer)localByteBuffer.rewind());
          break;
          if (localObject.isFirstInNew(local1FirstVclNalDetector))
          {
            createSample(localArrayList);
            localObject = local1FirstVclNalDetector;
          }
        }
      case 6:
        if (localObject != null)
        {
          createSample(localArrayList);
          localObject = null;
        }
        this.seiMessage = new SEIMessage(cleanBuffer(new ByteBufferBackedInputStream(localByteBuffer)), this.currentSeqParameterSet);
        localArrayList.add(localByteBuffer);
        break;
      case 9:
        if (localObject != null)
        {
          createSample(localArrayList);
          localObject = null;
        }
        localArrayList.add(localByteBuffer);
        break;
      case 7:
        if (localObject != null)
        {
          createSample(localArrayList);
          localObject = null;
        }
        handleSPS((ByteBuffer)localByteBuffer.rewind());
        break;
      case 8:
        if (localObject != null)
        {
          createSample(localArrayList);
          localObject = null;
        }
        handlePPS((ByteBuffer)localByteBuffer.rewind());
      case 13:
      case 10:
      case 11:
      }
    }
    throw new RuntimeException("Sequence parameter set extension is not yet handled. Needs TLC.");
    createSample(localArrayList);
    this.decodingTimes = new long[this.samples.size()];
    Arrays.fill(this.decodingTimes, this.frametick);
    return true;
  }

  private boolean readVariables()
  {
    this.width = (16 * (1 + this.firstSeqParameterSet.pic_width_in_mbs_minus1));
    int i = 2;
    if (this.firstSeqParameterSet.frame_mbs_only_flag)
      i = 1;
    this.height = (i * (16 * (1 + this.firstSeqParameterSet.pic_height_in_map_units_minus1)));
    if (this.firstSeqParameterSet.frame_cropping_flag)
    {
      boolean bool = this.firstSeqParameterSet.residual_color_transform_flag;
      int j = 0;
      if (!bool)
        j = this.firstSeqParameterSet.chroma_format_idc.getId();
      int k = 1;
      int m = i;
      if (j != 0)
      {
        k = this.firstSeqParameterSet.chroma_format_idc.getSubWidth();
        m = i * this.firstSeqParameterSet.chroma_format_idc.getSubHeight();
      }
      this.width -= k * (this.firstSeqParameterSet.frame_crop_left_offset + this.firstSeqParameterSet.frame_crop_right_offset);
      this.height -= m * (this.firstSeqParameterSet.frame_crop_top_offset + this.firstSeqParameterSet.frame_crop_bottom_offset);
    }
    return true;
  }

  public String getHandler()
  {
    return "vide";
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    return this.sampleDescriptionBox;
  }

  public List<Sample> getSamples()
  {
    return this.samples;
  }

  public class ByteBufferBackedInputStream extends InputStream
  {
    private final ByteBuffer buf;

    public ByteBufferBackedInputStream(ByteBuffer arg2)
    {
      Object localObject;
      this.buf = localObject.duplicate();
    }

    public int read()
      throws IOException
    {
      if (!this.buf.hasRemaining())
        return -1;
      return 0xFF & this.buf.get();
    }

    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      if (!this.buf.hasRemaining())
        return -1;
      int i = Math.min(paramInt2, this.buf.remaining());
      this.buf.get(paramArrayOfByte, paramInt1, i);
      return i;
    }
  }

  public class SEIMessage
  {
    boolean clock_timestamp_flag;
    int cnt_dropped_flag;
    int counting_type;
    int cpb_removal_delay;
    int ct_type;
    int discontinuity_flag;
    int dpb_removal_delay;
    int full_timestamp_flag;
    int hours_value;
    int minutes_value;
    int n_frames;
    int nuit_field_based_flag;
    int payloadSize = 0;
    int payloadType = 0;
    int pic_struct;
    boolean removal_delay_flag;
    int seconds_value;
    SeqParameterSet sps;
    int time_offset;
    int time_offset_length;

    public SEIMessage(InputStream paramSeqParameterSet, SeqParameterSet arg3)
      throws IOException
    {
      Object localObject;
      this.sps = localObject;
      paramSeqParameterSet.read();
      int i = paramSeqParameterSet.available();
      int j = 0;
      while (j < i)
      {
        this.payloadType = 0;
        this.payloadSize = 0;
        int k = paramSeqParameterSet.read();
        for (int m = j + 1; k == 255; m++)
        {
          this.payloadType = (k + this.payloadType);
          k = paramSeqParameterSet.read();
        }
        this.payloadType = (k + this.payloadType);
        int n = paramSeqParameterSet.read();
        for (j = m + 1; n == 255; j++)
        {
          this.payloadSize = (n + this.payloadSize);
          n = paramSeqParameterSet.read();
        }
        this.payloadSize = (n + this.payloadSize);
        if (i - j >= this.payloadSize)
        {
          if (this.payloadType == 1)
          {
            if ((localObject.vuiParams != null) && ((localObject.vuiParams.nalHRDParams != null) || (localObject.vuiParams.vclHRDParams != null) || (localObject.vuiParams.pic_struct_present_flag)))
            {
              byte[] arrayOfByte = new byte[this.payloadSize];
              paramSeqParameterSet.read(arrayOfByte);
              j += this.payloadSize;
              CAVLCReader localCAVLCReader = new CAVLCReader(new ByteArrayInputStream(arrayOfByte));
              int i3;
              label399: int i4;
              if ((localObject.vuiParams.nalHRDParams != null) || (localObject.vuiParams.vclHRDParams != null))
              {
                this.removal_delay_flag = true;
                this.cpb_removal_delay = localCAVLCReader.readU(1 + localObject.vuiParams.nalHRDParams.cpb_removal_delay_length_minus1, "SEI: cpb_removal_delay");
                this.dpb_removal_delay = localCAVLCReader.readU(1 + localObject.vuiParams.nalHRDParams.dpb_output_delay_length_minus1, "SEI: dpb_removal_delay");
                if (!localObject.vuiParams.pic_struct_present_flag)
                  break label807;
                this.pic_struct = localCAVLCReader.readU(4, "SEI: pic_struct");
                switch (this.pic_struct)
                {
                default:
                  i3 = 1;
                  i4 = 0;
                  label402: if (i4 >= i3)
                    break label807;
                  this.clock_timestamp_flag = localCAVLCReader.readBool("pic_timing SEI: clock_timestamp_flag[" + i4 + "]");
                  if (this.clock_timestamp_flag)
                  {
                    this.ct_type = localCAVLCReader.readU(2, "pic_timing SEI: ct_type");
                    this.nuit_field_based_flag = localCAVLCReader.readU(1, "pic_timing SEI: nuit_field_based_flag");
                    this.counting_type = localCAVLCReader.readU(5, "pic_timing SEI: counting_type");
                    this.full_timestamp_flag = localCAVLCReader.readU(1, "pic_timing SEI: full_timestamp_flag");
                    this.discontinuity_flag = localCAVLCReader.readU(1, "pic_timing SEI: discontinuity_flag");
                    this.cnt_dropped_flag = localCAVLCReader.readU(1, "pic_timing SEI: cnt_dropped_flag");
                    this.n_frames = localCAVLCReader.readU(8, "pic_timing SEI: n_frames");
                    if (this.full_timestamp_flag != 1)
                      break label644;
                    this.seconds_value = localCAVLCReader.readU(6, "pic_timing SEI: seconds_value");
                    this.minutes_value = localCAVLCReader.readU(6, "pic_timing SEI: minutes_value");
                    this.hours_value = localCAVLCReader.readU(5, "pic_timing SEI: hours_value");
                    label581: if (localObject.vuiParams.nalHRDParams == null)
                      break label715;
                    this.time_offset_length = localObject.vuiParams.nalHRDParams.time_offset_length;
                  }
                  break;
                case 3:
                case 4:
                case 7:
                case 5:
                case 6:
                case 8:
                }
              }
              while (true)
              {
                this.time_offset = localCAVLCReader.readU(24, "pic_timing SEI: time_offset");
                i4++;
                break label402;
                this.removal_delay_flag = false;
                break;
                i3 = 2;
                break label399;
                i3 = 3;
                break label399;
                label644: if (!localCAVLCReader.readBool("pic_timing SEI: seconds_flag"))
                  break label581;
                this.seconds_value = localCAVLCReader.readU(6, "pic_timing SEI: seconds_value");
                if (!localCAVLCReader.readBool("pic_timing SEI: minutes_flag"))
                  break label581;
                this.minutes_value = localCAVLCReader.readU(6, "pic_timing SEI: minutes_value");
                if (!localCAVLCReader.readBool("pic_timing SEI: hours_flag"))
                  break label581;
                this.hours_value = localCAVLCReader.readU(5, "pic_timing SEI: hours_value");
                break label581;
                label715: if (localObject.vuiParams.vclHRDParams != null)
                  this.time_offset_length = localObject.vuiParams.vclHRDParams.time_offset_length;
                else
                  this.time_offset_length = 24;
              }
            }
            else
            {
              for (int i2 = 0; i2 < this.payloadSize; i2++)
              {
                paramSeqParameterSet.read();
                j++;
              }
            }
          }
          else
            for (int i1 = 0; i1 < this.payloadSize; i1++)
            {
              paramSeqParameterSet.read();
              j++;
            }
        }
        else
          j = i;
        label807: H264TrackImpl.LOG.fine(toString());
      }
    }

    public String toString()
    {
      String str = "SEIMessage{payloadType=" + this.payloadType + ", payloadSize=" + this.payloadSize;
      if (this.payloadType == 1)
      {
        if ((this.sps.vuiParams.nalHRDParams != null) || (this.sps.vuiParams.vclHRDParams != null))
          str = str + ", cpb_removal_delay=" + this.cpb_removal_delay + ", dpb_removal_delay=" + this.dpb_removal_delay;
        if (this.sps.vuiParams.pic_struct_present_flag)
        {
          str = str + ", pic_struct=" + this.pic_struct;
          if (this.clock_timestamp_flag)
            str = str + ", ct_type=" + this.ct_type + ", nuit_field_based_flag=" + this.nuit_field_based_flag + ", counting_type=" + this.counting_type + ", full_timestamp_flag=" + this.full_timestamp_flag + ", discontinuity_flag=" + this.discontinuity_flag + ", cnt_dropped_flag=" + this.cnt_dropped_flag + ", n_frames=" + this.n_frames + ", seconds_value=" + this.seconds_value + ", minutes_value=" + this.minutes_value + ", hours_value=" + this.hours_value + ", time_offset_length=" + this.time_offset_length + ", time_offset=" + this.time_offset;
        }
      }
      return str + '}';
    }
  }

  public static class SliceHeader
  {
    public boolean bottom_field_flag = false;
    public int colour_plane_id;
    public int delta_pic_order_cnt_0;
    public int delta_pic_order_cnt_1;
    public int delta_pic_order_cnt_bottom;
    public boolean field_pic_flag = false;
    public int first_mb_in_slice;
    public int frame_num;
    public int idr_pic_id;
    public int pic_order_cnt_lsb;
    public int pic_parameter_set_id;
    public SliceType slice_type;

    public SliceHeader(InputStream paramInputStream, Map<Integer, SeqParameterSet> paramMap, Map<Integer, PictureParameterSet> paramMap1, boolean paramBoolean)
    {
      while (true)
      {
        try
        {
          paramInputStream.read();
          CAVLCReader localCAVLCReader = new CAVLCReader(paramInputStream);
          this.first_mb_in_slice = localCAVLCReader.readUE("SliceHeader: first_mb_in_slice");
          switch (localCAVLCReader.readUE("SliceHeader: slice_type"))
          {
          default:
            this.pic_parameter_set_id = localCAVLCReader.readUE("SliceHeader: pic_parameter_set_id");
            PictureParameterSet localPictureParameterSet = (PictureParameterSet)paramMap1.get(Integer.valueOf(this.pic_parameter_set_id));
            SeqParameterSet localSeqParameterSet = (SeqParameterSet)paramMap.get(Integer.valueOf(localPictureParameterSet.seq_parameter_set_id));
            if (localSeqParameterSet.residual_color_transform_flag)
              this.colour_plane_id = localCAVLCReader.readU(2, "SliceHeader: colour_plane_id");
            this.frame_num = localCAVLCReader.readU(4 + localSeqParameterSet.log2_max_frame_num_minus4, "SliceHeader: frame_num");
            if (!localSeqParameterSet.frame_mbs_only_flag)
            {
              this.field_pic_flag = localCAVLCReader.readBool("SliceHeader: field_pic_flag");
              if (this.field_pic_flag)
                this.bottom_field_flag = localCAVLCReader.readBool("SliceHeader: bottom_field_flag");
            }
            if (paramBoolean)
              this.idr_pic_id = localCAVLCReader.readUE("SliceHeader: idr_pic_id");
            if (localSeqParameterSet.pic_order_cnt_type == 0)
            {
              this.pic_order_cnt_lsb = localCAVLCReader.readU(4 + localSeqParameterSet.log2_max_pic_order_cnt_lsb_minus4, "SliceHeader: pic_order_cnt_lsb");
              if ((localPictureParameterSet.bottom_field_pic_order_in_frame_present_flag) && (!this.field_pic_flag))
                this.delta_pic_order_cnt_bottom = localCAVLCReader.readSE("SliceHeader: delta_pic_order_cnt_bottom");
            }
            if ((localSeqParameterSet.pic_order_cnt_type != 1) || (localSeqParameterSet.delta_pic_order_always_zero_flag))
              break;
            this.delta_pic_order_cnt_0 = localCAVLCReader.readSE("delta_pic_order_cnt_0");
            if ((!localPictureParameterSet.bottom_field_pic_order_in_frame_present_flag) || (this.field_pic_flag))
              break;
            this.delta_pic_order_cnt_1 = localCAVLCReader.readSE("delta_pic_order_cnt_1");
            return;
          case 0:
          case 5:
            this.slice_type = SliceType.P;
            continue;
          case 1:
          case 6:
          case 2:
          case 7:
          case 3:
          case 8:
          case 4:
          case 9:
          }
        }
        catch (IOException localIOException)
        {
          throw new RuntimeException(localIOException);
        }
        this.slice_type = SliceType.B;
        continue;
        this.slice_type = SliceType.I;
        continue;
        this.slice_type = SliceType.SP;
        continue;
        this.slice_type = SliceType.SI;
      }
    }

    public String toString()
    {
      return "SliceHeader{first_mb_in_slice=" + this.first_mb_in_slice + ", slice_type=" + this.slice_type + ", pic_parameter_set_id=" + this.pic_parameter_set_id + ", colour_plane_id=" + this.colour_plane_id + ", frame_num=" + this.frame_num + ", field_pic_flag=" + this.field_pic_flag + ", bottom_field_flag=" + this.bottom_field_flag + ", idr_pic_id=" + this.idr_pic_id + ", pic_order_cnt_lsb=" + this.pic_order_cnt_lsb + ", delta_pic_order_cnt_bottom=" + this.delta_pic_order_cnt_bottom + '}';
    }

    public static enum SliceType
    {
      static
      {
        B = new SliceType("B", 1);
        I = new SliceType("I", 2);
        SP = new SliceType("SP", 3);
        SI = new SliceType("SI", 4);
        SliceType[] arrayOfSliceType = new SliceType[5];
        arrayOfSliceType[0] = P;
        arrayOfSliceType[1] = B;
        arrayOfSliceType[2] = I;
        arrayOfSliceType[3] = SP;
        arrayOfSliceType[4] = SI;
      }
    }
  }
}