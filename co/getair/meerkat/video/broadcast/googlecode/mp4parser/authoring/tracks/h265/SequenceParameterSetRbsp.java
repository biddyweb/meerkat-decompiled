package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks.h265;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.read.CAVLCReader;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Array;

public class SequenceParameterSetRbsp
{
  public SequenceParameterSetRbsp(InputStream paramInputStream)
    throws IOException
  {
    CAVLCReader localCAVLCReader = new CAVLCReader(paramInputStream);
    ((int)localCAVLCReader.readNBit(4, "sps_video_parameter_set_id"));
    int i = (int)localCAVLCReader.readNBit(3, "sps_max_sub_layers_minus1");
    localCAVLCReader.readBool("sps_temporal_id_nesting_flag");
    profile_tier_level(i, localCAVLCReader);
    localCAVLCReader.readUE("sps_seq_parameter_set_id");
    if (localCAVLCReader.readUE("chroma_format_idc") == 3)
    {
      localCAVLCReader.read1Bit();
      localCAVLCReader.readUE("pic_width_in_luma_samples");
      localCAVLCReader.readUE("pic_width_in_luma_samples");
      if (localCAVLCReader.readBool("conformance_window_flag"))
      {
        localCAVLCReader.readUE("conf_win_left_offset");
        localCAVLCReader.readUE("conf_win_right_offset");
        localCAVLCReader.readUE("conf_win_top_offset");
        localCAVLCReader.readUE("conf_win_bottom_offset");
      }
    }
    localCAVLCReader.readUE("bit_depth_luma_minus8");
    localCAVLCReader.readUE("bit_depth_chroma_minus8");
    localCAVLCReader.readUE("log2_max_pic_order_cnt_lsb_minus4");
    boolean bool = localCAVLCReader.readBool("sps_sub_layer_ordering_info_present_flag");
    int j;
    int[] arrayOfInt1;
    int[] arrayOfInt2;
    int[] arrayOfInt3;
    int m;
    if (bool)
    {
      j = 0;
      int k = 1 + (i - j);
      arrayOfInt1 = new int[k];
      arrayOfInt2 = new int[k];
      arrayOfInt3 = new int[k];
      if (!bool)
        break label313;
      m = 0;
    }
    while (true)
    {
      if (m > i)
        break label320;
      arrayOfInt1[m] = localCAVLCReader.readUE("sps_max_dec_pic_buffering_minus1[" + m + "]");
      arrayOfInt2[m] = localCAVLCReader.readUE("sps_max_num_reorder_pics[" + m + "]");
      arrayOfInt3[m] = localCAVLCReader.readUE("sps_max_latency_increase_plus1[" + m + "]");
      m++;
      continue;
      j = i;
      break;
      label313: m = i;
    }
    label320: localCAVLCReader.readUE("log2_min_luma_coding_block_size_minus3");
    localCAVLCReader.readUE("log2_diff_max_min_luma_coding_block_size");
    localCAVLCReader.readUE("log2_min_transform_block_size_minus2");
    localCAVLCReader.readUE("log2_diff_max_min_transform_block_size");
    localCAVLCReader.readUE("max_transform_hierarchy_depth_inter");
    localCAVLCReader.readUE("max_transform_hierarchy_depth_intra");
    if ((localCAVLCReader.readBool("scaling_list_enabled_flag")) && (localCAVLCReader.readBool("sps_scaling_list_data_present_flag")))
      scaling_list_data(localCAVLCReader);
    localCAVLCReader.readBool("amp_enabled_flag");
    localCAVLCReader.readBool("sample_adaptive_offset_enabled_flag");
    if (localCAVLCReader.readBool("pcm_enabled_flag"))
    {
      ((int)localCAVLCReader.readNBit(4, "pcm_sample_bit_depth_luma_minus1"));
      ((int)localCAVLCReader.readNBit(4, "pcm_sample_bit_depth_chroma_minus1"));
      localCAVLCReader.readUE("log2_min_pcm_luma_coding_block_size_minus3");
    }
  }

  private void profile_tier_level(int paramInt, CAVLCReader paramCAVLCReader)
    throws IOException
  {
    paramCAVLCReader.readU(2, "general_profile_space");
    paramCAVLCReader.readBool("general_tier_flag");
    paramCAVLCReader.readU(5, "general_profile_idc");
    boolean[] arrayOfBoolean1 = new boolean[32];
    for (int i = 0; i < 32; i++)
      arrayOfBoolean1[i] = paramCAVLCReader.readBool();
    paramCAVLCReader.readBool("general_progressive_source_flag");
    paramCAVLCReader.readBool("general_interlaced_source_flag");
    paramCAVLCReader.readBool("general_non_packed_constraint_flag");
    paramCAVLCReader.readBool("general_frame_only_constraint_flag");
    paramCAVLCReader.readNBit(44, "general_reserved_zero_44bits");
    paramCAVLCReader.readByte();
    boolean[] arrayOfBoolean2 = new boolean[paramInt];
    boolean[] arrayOfBoolean3 = new boolean[paramInt];
    for (int j = 0; j < paramInt; j++)
    {
      arrayOfBoolean2[j] = paramCAVLCReader.readBool("sub_layer_profile_present_flag[" + j + "]");
      arrayOfBoolean3[j] = paramCAVLCReader.readBool("sub_layer_level_present_flag[" + j + "]");
    }
    if (paramInt > 0)
    {
      int[] arrayOfInt5 = new int[8];
      for (int n = paramInt; n < 8; n++)
        arrayOfInt5[n] = paramCAVLCReader.readU(2, "reserved_zero_2bits[" + n + "]");
    }
    int[] arrayOfInt1 = new int[paramInt];
    boolean[] arrayOfBoolean4 = new boolean[paramInt];
    int[] arrayOfInt2 = new int[paramInt];
    int[] arrayOfInt3 = { paramInt, 32 };
    boolean[][] arrayOfBoolean = (boolean[][])Array.newInstance(Boolean.TYPE, arrayOfInt3);
    boolean[] arrayOfBoolean5 = new boolean[paramInt];
    boolean[] arrayOfBoolean6 = new boolean[paramInt];
    boolean[] arrayOfBoolean7 = new boolean[paramInt];
    boolean[] arrayOfBoolean8 = new boolean[paramInt];
    long[] arrayOfLong = new long[paramInt];
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
        arrayOfLong[k] = paramCAVLCReader.readNBit(44);
      }
      if (arrayOfBoolean3[k] != 0)
        arrayOfInt4[k] = paramCAVLCReader.readU(8, "sub_layer_level_idc[" + k + "]");
    }
  }

  private void scaling_list_data(CAVLCReader paramCAVLCReader)
    throws IOException
  {
    boolean[][] arrayOfBoolean = new boolean[4][];
    int[][] arrayOfInt1 = new int[4][];
    int[][] arrayOfInt2 = new int[2][];
    int[][][] arrayOfInt = new int[4][][];
    for (int i = 0; i < 4; i++)
    {
      int j = 0;
      int k;
      label43: int m;
      label59: int n;
      label76: int i1;
      if (i == 3)
      {
        k = 2;
        if (j >= k)
          continue;
        if (i != 3)
          break label183;
        m = 2;
        arrayOfBoolean[i] = new boolean[m];
        if (i != 3)
          break label190;
        n = 2;
        arrayOfInt1[i] = new int[n];
        if (i != 3)
          break label197;
        i1 = 2;
        label93: arrayOfInt[i] = new int[i1][];
        arrayOfBoolean[i][j] = paramCAVLCReader.readBool();
        if (arrayOfBoolean[i][j] != 0)
          break label204;
        arrayOfInt1[i][j] = paramCAVLCReader.readUE("scaling_list_pred_matrix_id_delta[" + i + "][" + j + "]");
      }
      while (true)
      {
        j++;
        break;
        k = 6;
        break label43;
        label183: m = 6;
        break label59;
        label190: n = 6;
        break label76;
        label197: i1 = 6;
        break label93;
        label204: int i2 = 8;
        int i3 = Math.min(64, 1 << 4 + (i << 1));
        if (i > 1)
        {
          arrayOfInt2[(i - 2)][j] = paramCAVLCReader.readSE("scaling_list_dc_coef_minus8[" + i + "- 2][" + j + "]");
          i2 = 8 + arrayOfInt2[(i - 2)][j];
        }
        arrayOfInt[i][j] = new int[i3];
        for (int i4 = 0; i4 < i3; i4++)
        {
          i2 = (256 + (i2 + paramCAVLCReader.readSE("scaling_list_delta_coef "))) % 256;
          arrayOfInt[i][j][i4] = i2;
        }
      }
    }
  }
}