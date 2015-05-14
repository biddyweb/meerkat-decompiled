package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks.h265;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.read.CAVLCReader;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.ByteBufferByteChannel;
import java.io.IOException;
import java.lang.reflect.Array;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;

public class VideoParameterSet
{
  ByteBuffer vps;
  int vps_parameter_set_id;

  public VideoParameterSet(ByteBuffer paramByteBuffer)
    throws IOException
  {
    this.vps = paramByteBuffer;
    ByteBufferByteChannel localByteBufferByteChannel = new ByteBufferByteChannel((ByteBuffer)paramByteBuffer.position(0));
    CAVLCReader localCAVLCReader = new CAVLCReader(Channels.newInputStream(localByteBufferByteChannel));
    this.vps_parameter_set_id = localCAVLCReader.readU(4, "vps_parameter_set_id");
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
    label127: int[] arrayOfInt2;
    int m;
    label141: int[] arrayOfInt3;
    int n;
    if (bool)
    {
      j = 1;
      arrayOfInt1 = new int[j];
      if (!bool)
        break label279;
      k = 1;
      arrayOfInt2 = new int[k];
      if (!bool)
        break label288;
      m = 1;
      arrayOfInt3 = new int[m];
      if (!bool)
        break label297;
      n = 0;
    }
    while (true)
    {
      if (n > i)
        break label304;
      arrayOfInt1[n] = localCAVLCReader.readUE("vps_max_dec_pic_buffering_minus1[" + n + "]");
      arrayOfInt2[n] = localCAVLCReader.readUE("vps_max_dec_pic_buffering_minus1[" + n + "]");
      arrayOfInt3[n] = localCAVLCReader.readUE("vps_max_dec_pic_buffering_minus1[" + n + "]");
      n++;
      continue;
      j = i + 1;
      break;
      label279: k = i + 1;
      break label127;
      label288: m = i + 1;
      break label141;
      label297: n = i;
    }
    label304: int i1 = localCAVLCReader.readU(6, "vps_max_layer_id");
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

  public ByteBuffer toByteBuffer()
  {
    return this.vps;
  }
}