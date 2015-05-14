package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.FileDataSourceImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.SampleImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.read.CAVLCReader;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.ByteBufferByteChannel;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15.HevcDecoderConfigurationRecord;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15.HevcDecoderConfigurationRecord.Array;
import java.io.EOFException;
import java.io.IOException;
import java.io.PrintStream;
import java.lang.reflect.Array;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

public class H265TrackImplOld
{
  public static final int AUD_NUT = 35;
  private static final int BLA_N_LP = 18;
  private static final int BLA_W_LP = 16;
  private static final int BLA_W_RADL = 17;
  private static final long BUFFER = 1048576L;
  private static final int CRA_NUT = 21;
  private static final int IDR_N_LP = 20;
  private static final int IDR_W_RADL = 19;
  public static final int PPS_NUT = 34;
  public static final int PREFIX_SEI_NUT = 39;
  private static final int RADL_N = 6;
  private static final int RADL_R = 7;
  private static final int RASL_N = 8;
  private static final int RASL_R = 9;
  public static final int RSV_NVCL41 = 41;
  public static final int RSV_NVCL42 = 42;
  public static final int RSV_NVCL43 = 43;
  public static final int RSV_NVCL44 = 44;
  public static final int SPS_NUT = 33;
  private static final int STSA_N = 4;
  private static final int STSA_R = 5;
  private static final int TRAIL_N = 0;
  private static final int TRAIL_R = 1;
  private static final int TSA_N = 2;
  private static final int TSA_R = 3;
  public static final int UNSPEC48 = 48;
  public static final int UNSPEC49 = 49;
  public static final int UNSPEC50 = 50;
  public static final int UNSPEC51 = 51;
  public static final int UNSPEC52 = 52;
  public static final int UNSPEC53 = 53;
  public static final int UNSPEC54 = 54;
  public static final int UNSPEC55 = 55;
  public static final int VPS_NUT = 32;
  LinkedHashMap<Long, ByteBuffer> pictureParamterSets = new LinkedHashMap();
  List<Sample> samples = new ArrayList();
  LinkedHashMap<Long, ByteBuffer> sequenceParamterSets = new LinkedHashMap();
  List<Long> syncSamples = new ArrayList();
  LinkedHashMap<Long, ByteBuffer> videoParamterSets = new LinkedHashMap();

  public H265TrackImplOld(DataSource paramDataSource)
    throws IOException
  {
    LookAhead localLookAhead = new LookAhead(paramDataSource);
    long l = 1L;
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    while (true)
    {
      ByteBuffer localByteBuffer1 = findNextNal(localLookAhead);
      if (localByteBuffer1 == null)
        break;
      NalUnitHeader localNalUnitHeader1 = getNalUnitHeader(localByteBuffer1);
      switch (localNalUnitHeader1.nalUnitType)
      {
      default:
      case 32:
      case 33:
      case 34:
      }
      while (true)
      {
        if (localNalUnitHeader1.nalUnitType < 32)
          i = localNalUnitHeader1.nalUnitType;
        if ((!isFirstOfAU(localNalUnitHeader1.nalUnitType, localByteBuffer1, localArrayList)) || (localArrayList.isEmpty()))
          break label386;
        System.err.println("##########################");
        Iterator localIterator = localArrayList.iterator();
        while (localIterator.hasNext())
        {
          ByteBuffer localByteBuffer2 = (ByteBuffer)localIterator.next();
          NalUnitHeader localNalUnitHeader2 = getNalUnitHeader(localByteBuffer2);
          PrintStream localPrintStream = System.err;
          Object[] arrayOfObject = new Object[4];
          arrayOfObject[0] = Integer.valueOf(localNalUnitHeader2.nalUnitType);
          arrayOfObject[1] = Integer.valueOf(localNalUnitHeader2.nuhLayerId);
          arrayOfObject[2] = Integer.valueOf(localNalUnitHeader2.nuhTemporalIdPlusOne);
          arrayOfObject[3] = Integer.valueOf(localByteBuffer2.limit());
          localPrintStream.println(String.format("type: %3d - layer: %3d - tempId: %3d - size: %3d", arrayOfObject));
        }
        this.videoParamterSets.put(Long.valueOf(l), localByteBuffer1);
        continue;
        this.sequenceParamterSets.put(Long.valueOf(l), localByteBuffer1);
        continue;
        this.pictureParamterSets.put(Long.valueOf(l), localByteBuffer1);
      }
      System.err.println("                          ##########################");
      this.samples.add(createSample(localArrayList));
      localArrayList.clear();
      l += 1L;
      label386: localArrayList.add(localByteBuffer1);
      if ((i >= 16) && (i <= 21))
        this.syncSamples.add(Long.valueOf(l));
    }
    System.err.println("");
    HevcDecoderConfigurationRecord localHevcDecoderConfigurationRecord = new HevcDecoderConfigurationRecord();
    localHevcDecoderConfigurationRecord.setArrays(getArrays());
    localHevcDecoderConfigurationRecord.setAvgFrameRate(0);
  }

  private ByteBuffer findNextNal(LookAhead paramLookAhead)
    throws IOException
  {
    try
    {
      while (!paramLookAhead.nextThreeEquals001())
        paramLookAhead.discardByte();
      paramLookAhead.discardNext3AndMarkStart();
      while (!paramLookAhead.nextThreeEquals000or001orEof())
        paramLookAhead.discardByte();
      ByteBuffer localByteBuffer = paramLookAhead.getNal();
      return localByteBuffer;
    }
    catch (EOFException localEOFException)
    {
    }
    return null;
  }

  private List<HevcDecoderConfigurationRecord.Array> getArrays()
  {
    HevcDecoderConfigurationRecord.Array localArray1 = new HevcDecoderConfigurationRecord.Array();
    localArray1.array_completeness = true;
    localArray1.nal_unit_type = 32;
    localArray1.nalUnits = new ArrayList();
    Iterator localIterator1 = this.videoParamterSets.values().iterator();
    while (localIterator1.hasNext())
    {
      ByteBuffer localByteBuffer3 = (ByteBuffer)localIterator1.next();
      byte[] arrayOfByte3 = new byte[localByteBuffer3.limit()];
      localByteBuffer3.position(0);
      localByteBuffer3.get(arrayOfByte3);
      localArray1.nalUnits.add(arrayOfByte3);
    }
    HevcDecoderConfigurationRecord.Array localArray2 = new HevcDecoderConfigurationRecord.Array();
    localArray2.array_completeness = true;
    localArray2.nal_unit_type = 33;
    localArray2.nalUnits = new ArrayList();
    Iterator localIterator2 = this.sequenceParamterSets.values().iterator();
    while (localIterator2.hasNext())
    {
      ByteBuffer localByteBuffer2 = (ByteBuffer)localIterator2.next();
      byte[] arrayOfByte2 = new byte[localByteBuffer2.limit()];
      localByteBuffer2.position(0);
      localByteBuffer2.get(arrayOfByte2);
      localArray2.nalUnits.add(arrayOfByte2);
    }
    HevcDecoderConfigurationRecord.Array localArray3 = new HevcDecoderConfigurationRecord.Array();
    localArray3.array_completeness = true;
    localArray3.nal_unit_type = 33;
    localArray3.nalUnits = new ArrayList();
    Iterator localIterator3 = this.pictureParamterSets.values().iterator();
    while (localIterator3.hasNext())
    {
      ByteBuffer localByteBuffer1 = (ByteBuffer)localIterator3.next();
      byte[] arrayOfByte1 = new byte[localByteBuffer1.limit()];
      localByteBuffer1.position(0);
      localByteBuffer1.get(arrayOfByte1);
      localArray3.nalUnits.add(arrayOfByte1);
    }
    return Arrays.asList(new HevcDecoderConfigurationRecord.Array[] { localArray1, localArray2, localArray3 });
  }

  private void hrd_parameters(boolean paramBoolean, int paramInt, CAVLCReader paramCAVLCReader)
    throws IOException
  {
    boolean bool1 = false;
    boolean bool2 = false;
    boolean bool3 = false;
    if (paramBoolean)
    {
      bool1 = paramCAVLCReader.readBool("nal_hrd_parameters_present_flag");
      bool3 = paramCAVLCReader.readBool("vcl_hrd_parameters_present_flag");
      if (!bool1)
      {
        bool2 = false;
        if (!bool3);
      }
      else
      {
        bool2 = paramCAVLCReader.readBool("sub_pic_hrd_params_present_flag");
        if (bool2)
        {
          paramCAVLCReader.readU(8, "tick_divisor_minus2");
          paramCAVLCReader.readU(5, "du_cpb_removal_delay_increment_length_minus1");
          paramCAVLCReader.readBool("sub_pic_cpb_params_in_pic_timing_sei_flag");
          paramCAVLCReader.readU(5, "dpb_output_delay_du_length_minus1");
        }
        paramCAVLCReader.readU(4, "bit_rate_scale");
        paramCAVLCReader.readU(4, "cpb_size_scale");
        if (bool2)
          paramCAVLCReader.readU(4, "cpb_size_du_scale");
        paramCAVLCReader.readU(5, "initial_cpb_removal_delay_length_minus1");
        paramCAVLCReader.readU(5, "au_cpb_removal_delay_length_minus1");
        paramCAVLCReader.readU(5, "dpb_output_delay_length_minus1");
      }
    }
    boolean[] arrayOfBoolean1 = new boolean[paramInt];
    boolean[] arrayOfBoolean2 = new boolean[paramInt];
    boolean[] arrayOfBoolean3 = new boolean[paramInt];
    int[] arrayOfInt1 = new int[paramInt];
    int[] arrayOfInt2 = new int[paramInt];
    int i = 0;
    if (i <= paramInt)
    {
      arrayOfBoolean1[i] = paramCAVLCReader.readBool("fixed_pic_rate_general_flag[" + i + "]");
      if (arrayOfBoolean1[i] == 0)
        arrayOfBoolean2[i] = paramCAVLCReader.readBool("fixed_pic_rate_within_cvs_flag[" + i + "]");
      if (arrayOfBoolean2[i] != 0)
        arrayOfInt2[i] = paramCAVLCReader.readUE("elemental_duration_in_tc_minus1[" + i + "]");
      while (true)
      {
        if (arrayOfBoolean3[i] == 0)
          arrayOfInt1[i] = paramCAVLCReader.readUE("cpb_cnt_minus1[" + i + "]");
        if (bool1)
          sub_layer_hrd_parameters(i, arrayOfInt1[i], bool2, paramCAVLCReader);
        if (bool3)
          sub_layer_hrd_parameters(i, arrayOfInt1[i], bool2, paramCAVLCReader);
        i++;
        break;
        arrayOfBoolean3[i] = paramCAVLCReader.readBool("low_delay_hrd_flag[" + i + "]");
      }
    }
  }

  public static void main(String[] paramArrayOfString)
    throws IOException
  {
    new H265TrackImplOld(new FileDataSourceImpl("c:\\content\\test-UHD-HEVC_01_FMV_Med_track1.hvc"));
  }

  protected Sample createSample(List<ByteBuffer> paramList)
  {
    byte[] arrayOfByte = new byte[4 * paramList.size()];
    ByteBuffer localByteBuffer = ByteBuffer.wrap(arrayOfByte);
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
      localByteBuffer.putInt(((ByteBuffer)localIterator.next()).remaining());
    ByteBuffer[] arrayOfByteBuffer = new ByteBuffer[2 * paramList.size()];
    for (int i = 0; i < paramList.size(); i++)
    {
      arrayOfByteBuffer[(i * 2)] = ByteBuffer.wrap(arrayOfByte, i * 4, 4);
      arrayOfByteBuffer[(1 + i * 2)] = ((ByteBuffer)paramList.get(i));
    }
    return new SampleImpl(arrayOfByteBuffer);
  }

  public int getFrameRate(ByteBuffer paramByteBuffer)
    throws IOException
  {
    ByteBufferByteChannel localByteBufferByteChannel = new ByteBufferByteChannel((ByteBuffer)paramByteBuffer.position(0));
    CAVLCReader localCAVLCReader = new CAVLCReader(Channels.newInputStream(localByteBufferByteChannel));
    localCAVLCReader.readU(4, "vps_parameter_set_id");
    localCAVLCReader.readU(2, "vps_reserved_three_2bits");
    localCAVLCReader.readU(6, "vps_max_layers_minus1");
    int i = localCAVLCReader.readU(3, "vps_max_sub_layers_minus1");
    localCAVLCReader.readBool("vps_temporal_id_nesting_flag");
    localCAVLCReader.readU(16, "vps_reserved_0xffff_16bits");
    profile_tier_level(i, localCAVLCReader);
    boolean bool = localCAVLCReader.readBool("vps_sub_layer_ordering_info_present_flag");
    int j;
    int[] arrayOfInt1;
    int k;
    label122: int[] arrayOfInt2;
    int m;
    label136: int[] arrayOfInt3;
    int n;
    if (bool)
    {
      j = 0;
      arrayOfInt1 = new int[j];
      if (!bool)
        break label278;
      k = 0;
      arrayOfInt2 = new int[k];
      if (!bool)
        break label285;
      m = 0;
      arrayOfInt3 = new int[m];
      if (!bool)
        break label292;
      n = 0;
    }
    while (true)
    {
      if (n > i)
        break label299;
      arrayOfInt1[n] = localCAVLCReader.readUE("vps_max_dec_pic_buffering_minus1[" + n + "]");
      arrayOfInt2[n] = localCAVLCReader.readUE("vps_max_dec_pic_buffering_minus1[" + n + "]");
      arrayOfInt3[n] = localCAVLCReader.readUE("vps_max_dec_pic_buffering_minus1[" + n + "]");
      n++;
      continue;
      j = i;
      break;
      label278: k = i;
      break label122;
      label285: m = i;
      break label136;
      label292: n = i;
    }
    label299: int i1 = localCAVLCReader.readU(6, "vps_max_layer_id");
    int i2 = localCAVLCReader.readUE("vps_num_layer_sets_minus1");
    int[] arrayOfInt4 = { i2, i1 };
    boolean[][] arrayOfBoolean = (boolean[][])Array.newInstance(Boolean.TYPE, arrayOfInt4);
    for (int i3 = 1; i3 <= i2; i3++)
      for (int i6 = 0; i6 <= i1; i6++)
        arrayOfBoolean[i3][i6] = localCAVLCReader.readBool("layer_id_included_flag[" + i3 + "][" + i6 + "]");
    if (localCAVLCReader.readBool("vps_timing_info_present_flag"))
    {
      localCAVLCReader.readU(32, "vps_num_units_in_tick");
      localCAVLCReader.readU(32, "vps_time_scale");
      if (localCAVLCReader.readBool("vps_poc_proportional_to_timing_flag"))
        localCAVLCReader.readUE("vps_num_ticks_poc_diff_one_minus1");
      int i4 = localCAVLCReader.readUE("vps_num_hrd_parameters");
      int[] arrayOfInt5 = new int[i4];
      boolean[] arrayOfBoolean1 = new boolean[i4];
      int i5 = 0;
      if (i5 < i4)
      {
        arrayOfInt5[i5] = localCAVLCReader.readUE("hrd_layer_set_idx[" + i5 + "]");
        if (i5 > 0)
          arrayOfBoolean1[i5] = localCAVLCReader.readBool("cprms_present_flag[" + i5 + "]");
        while (true)
        {
          hrd_parameters(arrayOfBoolean1[i5], i, localCAVLCReader);
          i5++;
          break;
          arrayOfBoolean1[0] = true;
        }
      }
    }
    if (localCAVLCReader.readBool("vps_extension_flag"))
      while (localCAVLCReader.moreRBSPData())
        localCAVLCReader.readBool("vps_extension_data_flag");
    localCAVLCReader.readTrailingBits();
    return 0;
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

  boolean isFirstOfAU(int paramInt, ByteBuffer paramByteBuffer, List<ByteBuffer> paramList)
  {
    if (paramList.isEmpty())
      return true;
    int i;
    if (getNalUnitHeader((ByteBuffer)paramList.get(-1 + paramList.size())).nalUnitType <= 31)
    {
      i = 1;
      label43: switch (paramInt)
      {
      case 36:
      case 37:
      case 38:
      case 40:
      case 45:
      case 46:
      case 47:
      default:
      case 32:
      case 33:
      case 34:
      case 35:
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
      }
    }
    do
      switch (paramInt)
      {
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      default:
        return false;
        i = 0;
        break label43;
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      }
    while (i == 0);
    return true;
    byte[] arrayOfByte = new byte[50];
    paramByteBuffer.position(0);
    paramByteBuffer.get(arrayOfByte);
    paramByteBuffer.position(2);
    int j = IsoTypeReader.readUInt8(paramByteBuffer);
    if ((i != 0) && ((j & 0x80) > 0));
    for (boolean bool = true; ; bool = false)
      return bool;
  }

  public void profile_tier_level(int paramInt, CAVLCReader paramCAVLCReader)
    throws IOException
  {
    paramCAVLCReader.readU(2, "general_profile_space ");
    paramCAVLCReader.readBool("general_tier_flag");
    paramCAVLCReader.readU(5, "general_profile_idc");
    boolean[] arrayOfBoolean1 = new boolean[32];
    for (int i = 0; i < 32; i++)
      arrayOfBoolean1[i] = paramCAVLCReader.readBool("general_profile_compatibility_flag[" + i + "]");
    paramCAVLCReader.readBool("general_progressive_source_flag");
    paramCAVLCReader.readBool("general_interlaced_source_flag");
    paramCAVLCReader.readBool("general_non_packed_constraint_flag");
    paramCAVLCReader.readBool("general_frame_only_constraint_flag");
    paramCAVLCReader.readU(44, "general_reserved_zero_44bits");
    paramCAVLCReader.readU(8, "general_level_idc");
    boolean[] arrayOfBoolean2 = new boolean[paramInt];
    boolean[] arrayOfBoolean3 = new boolean[paramInt];
    for (int j = 0; j < paramInt; j++)
    {
      arrayOfBoolean2[j] = paramCAVLCReader.readBool("sub_layer_profile_present_flag[" + j + "]");
      arrayOfBoolean3[j] = paramCAVLCReader.readBool("sub_layer_level_present_flag[" + j + "]");
    }
    if (paramInt > 0)
      for (int n = paramInt; n < 8; n++)
        paramCAVLCReader.readU(2, "reserved_zero_2bits");
    int[] arrayOfInt1 = new int[paramInt];
    boolean[] arrayOfBoolean4 = new boolean[paramInt];
    int[] arrayOfInt2 = new int[paramInt];
    int[] arrayOfInt3 = { paramInt, 32 };
    boolean[][] arrayOfBoolean = (boolean[][])Array.newInstance(Boolean.TYPE, arrayOfInt3);
    boolean[] arrayOfBoolean5 = new boolean[paramInt];
    boolean[] arrayOfBoolean6 = new boolean[paramInt];
    boolean[] arrayOfBoolean7 = new boolean[paramInt];
    boolean[] arrayOfBoolean8 = new boolean[paramInt];
    int[] arrayOfInt4 = new int[paramInt];
    for (int k = 0; k < paramInt; k++)
    {
      if (arrayOfBoolean2[k] != 0)
      {
        arrayOfInt1[k] = paramCAVLCReader.readU(2, "sub_layer_profile_space[" + k + "]");
        arrayOfBoolean4[k] = paramCAVLCReader.readBool("sub_layer_tier_flag[" + k + "]");
        arrayOfInt2[k] = paramCAVLCReader.readU(5, "sub_layer_profile_idc[" + k + "]");
        for (int m = 0; m < 32; m++)
          arrayOfBoolean[k][m] = paramCAVLCReader.readBool("sub_layer_profile_compatibility_flag[" + k + "][" + m + "]");
        arrayOfBoolean5[k] = paramCAVLCReader.readBool("sub_layer_progressive_source_flag[" + k + "]");
        arrayOfBoolean6[k] = paramCAVLCReader.readBool("sub_layer_interlaced_source_flag[" + k + "]");
        arrayOfBoolean7[k] = paramCAVLCReader.readBool("sub_layer_non_packed_constraint_flag[" + k + "]");
        arrayOfBoolean8[k] = paramCAVLCReader.readBool("sub_layer_frame_only_constraint_flag[" + k + "]");
        paramCAVLCReader.readNBit(44, "reserved");
      }
      if (arrayOfBoolean3[k] != 0)
        arrayOfInt4[k] = paramCAVLCReader.readU(8, "sub_layer_level_idc");
    }
  }

  void sub_layer_hrd_parameters(int paramInt1, int paramInt2, boolean paramBoolean, CAVLCReader paramCAVLCReader)
    throws IOException
  {
    int[] arrayOfInt1 = new int[paramInt2];
    int[] arrayOfInt2 = new int[paramInt2];
    int[] arrayOfInt3 = new int[paramInt2];
    int[] arrayOfInt4 = new int[paramInt2];
    boolean[] arrayOfBoolean = new boolean[paramInt2];
    for (int i = 0; i <= paramInt2; i++)
    {
      arrayOfInt1[i] = paramCAVLCReader.readUE("bit_rate_value_minus1[" + i + "]");
      arrayOfInt2[i] = paramCAVLCReader.readUE("cpb_size_value_minus1[" + i + "]");
      if (paramBoolean)
      {
        arrayOfInt3[i] = paramCAVLCReader.readUE("cpb_size_du_value_minus1[" + i + "]");
        arrayOfInt4[i] = paramCAVLCReader.readUE("bit_rate_du_value_minus1[" + i + "]");
      }
      arrayOfBoolean[i] = paramCAVLCReader.readBool("cbr_flag[" + i + "]");
    }
  }

  class LookAhead
  {
    ByteBuffer buffer;
    long bufferStartPos = 0L;
    DataSource dataSource;
    int inBufferPos = 0;
    long start;

    LookAhead(DataSource arg2)
      throws IOException
    {
      Object localObject;
      this.dataSource = localObject;
      fillBuffer();
    }

    void discardByte()
    {
      this.inBufferPos = (1 + this.inBufferPos);
    }

    void discardNext3AndMarkStart()
    {
      this.inBufferPos = (3 + this.inBufferPos);
      this.start = (this.bufferStartPos + this.inBufferPos);
    }

    public void fillBuffer()
      throws IOException
    {
      this.buffer = this.dataSource.map(this.bufferStartPos, Math.min(this.dataSource.size() - this.bufferStartPos, 1048576L));
    }

    public ByteBuffer getNal()
    {
      if (this.start >= this.bufferStartPos)
      {
        this.buffer.position((int)(this.start - this.bufferStartPos));
        ByteBuffer localByteBuffer = this.buffer.slice();
        localByteBuffer.limit((int)(this.inBufferPos - (this.start - this.bufferStartPos)));
        return (ByteBuffer)localByteBuffer;
      }
      throw new RuntimeException("damn! NAL exceeds buffer");
    }

    boolean nextThreeEquals000or001orEof()
      throws IOException
    {
      if (this.buffer.limit() - this.inBufferPos >= 3)
        if ((this.buffer.get(this.inBufferPos) != 0) || (this.buffer.get(1 + this.inBufferPos) != 0) || ((this.buffer.get(2 + this.inBufferPos) != 0) && (this.buffer.get(2 + this.inBufferPos) != 1)));
      do
      {
        return true;
        return false;
        if (3L + (this.bufferStartPos + this.inBufferPos) <= this.dataSource.size())
          break;
      }
      while (this.bufferStartPos + this.inBufferPos == this.dataSource.size());
      return false;
      this.bufferStartPos = this.start;
      this.inBufferPos = 0;
      fillBuffer();
      return nextThreeEquals000or001orEof();
    }

    boolean nextThreeEquals001()
      throws IOException
    {
      if (this.buffer.limit() - this.inBufferPos >= 3)
        return (this.buffer.get(this.inBufferPos) == 0) && (this.buffer.get(1 + this.inBufferPos) == 0) && (this.buffer.get(2 + this.inBufferPos) == 1);
      if (this.bufferStartPos + this.inBufferPos == this.dataSource.size())
        throw new EOFException();
      throw new RuntimeException("buffer repositioning require");
    }
  }

  public static class NalUnitHeader
  {
    int forbiddenZeroFlag;
    int nalUnitType;
    int nuhLayerId;
    int nuhTemporalIdPlusOne;
  }

  public static enum PARSE_STATE
  {
    static
    {
      PARSE_STATE[] arrayOfPARSE_STATE = new PARSE_STATE[3];
      arrayOfPARSE_STATE[0] = AUD_SEI_SLICE;
      arrayOfPARSE_STATE[1] = SEI_SLICE;
      arrayOfPARSE_STATE[2] = SLICE_OES_EOB;
    }
  }
}