package co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.model;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.read.CAVLCReader;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.write.CAVLCWriter;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;

public class PictureParameterSet extends BitstreamElement
{
  public boolean bottom_field_pic_order_in_frame_present_flag;
  public int[] bottom_right;
  public int chroma_qp_index_offset;
  public boolean constrained_intra_pred_flag;
  public boolean deblocking_filter_control_present_flag;
  public boolean entropy_coding_mode_flag;
  public PPSExt extended;
  public int num_ref_idx_l0_active_minus1;
  public int num_ref_idx_l1_active_minus1;
  public int num_slice_groups_minus1;
  public int pic_init_qp_minus26;
  public int pic_init_qs_minus26;
  public int pic_parameter_set_id;
  public boolean redundant_pic_cnt_present_flag;
  public int[] run_length_minus1;
  public int seq_parameter_set_id;
  public boolean slice_group_change_direction_flag;
  public int slice_group_change_rate_minus1;
  public int[] slice_group_id;
  public int slice_group_map_type;
  public int[] top_left;
  public int weighted_bipred_idc;
  public boolean weighted_pred_flag;

  public static PictureParameterSet read(InputStream paramInputStream)
    throws IOException
  {
    CAVLCReader localCAVLCReader = new CAVLCReader(paramInputStream);
    PictureParameterSet localPictureParameterSet = new PictureParameterSet();
    localPictureParameterSet.pic_parameter_set_id = localCAVLCReader.readUE("PPS: pic_parameter_set_id");
    localPictureParameterSet.seq_parameter_set_id = localCAVLCReader.readUE("PPS: seq_parameter_set_id");
    localPictureParameterSet.entropy_coding_mode_flag = localCAVLCReader.readBool("PPS: entropy_coding_mode_flag");
    localPictureParameterSet.bottom_field_pic_order_in_frame_present_flag = localCAVLCReader.readBool("PPS: pic_order_present_flag");
    localPictureParameterSet.num_slice_groups_minus1 = localCAVLCReader.readUE("PPS: num_slice_groups_minus1");
    int i;
    label398: int j;
    if (localPictureParameterSet.num_slice_groups_minus1 > 0)
    {
      localPictureParameterSet.slice_group_map_type = localCAVLCReader.readUE("PPS: slice_group_map_type");
      localPictureParameterSet.top_left = new int[1 + localPictureParameterSet.num_slice_groups_minus1];
      localPictureParameterSet.bottom_right = new int[1 + localPictureParameterSet.num_slice_groups_minus1];
      localPictureParameterSet.run_length_minus1 = new int[1 + localPictureParameterSet.num_slice_groups_minus1];
      if (localPictureParameterSet.slice_group_map_type == 0)
        for (int i2 = 0; i2 <= localPictureParameterSet.num_slice_groups_minus1; i2++)
          localPictureParameterSet.run_length_minus1[i2] = localCAVLCReader.readUE("PPS: run_length_minus1");
      if (localPictureParameterSet.slice_group_map_type == 2)
        for (int i1 = 0; i1 < localPictureParameterSet.num_slice_groups_minus1; i1++)
        {
          localPictureParameterSet.top_left[i1] = localCAVLCReader.readUE("PPS: top_left");
          localPictureParameterSet.bottom_right[i1] = localCAVLCReader.readUE("PPS: bottom_right");
        }
      if ((localPictureParameterSet.slice_group_map_type == 3) || (localPictureParameterSet.slice_group_map_type == 4) || (localPictureParameterSet.slice_group_map_type == 5))
      {
        localPictureParameterSet.slice_group_change_direction_flag = localCAVLCReader.readBool("PPS: slice_group_change_direction_flag");
        localPictureParameterSet.slice_group_change_rate_minus1 = localCAVLCReader.readUE("PPS: slice_group_change_rate_minus1");
      }
    }
    else
    {
      localPictureParameterSet.num_ref_idx_l0_active_minus1 = localCAVLCReader.readUE("PPS: num_ref_idx_l0_active_minus1");
      localPictureParameterSet.num_ref_idx_l1_active_minus1 = localCAVLCReader.readUE("PPS: num_ref_idx_l1_active_minus1");
      localPictureParameterSet.weighted_pred_flag = localCAVLCReader.readBool("PPS: weighted_pred_flag");
      localPictureParameterSet.weighted_bipred_idc = ((int)localCAVLCReader.readNBit(2, "PPS: weighted_bipred_idc"));
      localPictureParameterSet.pic_init_qp_minus26 = localCAVLCReader.readSE("PPS: pic_init_qp_minus26");
      localPictureParameterSet.pic_init_qs_minus26 = localCAVLCReader.readSE("PPS: pic_init_qs_minus26");
      localPictureParameterSet.chroma_qp_index_offset = localCAVLCReader.readSE("PPS: chroma_qp_index_offset");
      localPictureParameterSet.deblocking_filter_control_present_flag = localCAVLCReader.readBool("PPS: deblocking_filter_control_present_flag");
      localPictureParameterSet.constrained_intra_pred_flag = localCAVLCReader.readBool("PPS: constrained_intra_pred_flag");
      localPictureParameterSet.redundant_pic_cnt_present_flag = localCAVLCReader.readBool("PPS: redundant_pic_cnt_present_flag");
      if (!localCAVLCReader.moreRBSPData())
        break label650;
      localPictureParameterSet.extended = new PPSExt();
      localPictureParameterSet.extended.transform_8x8_mode_flag = localCAVLCReader.readBool("PPS: transform_8x8_mode_flag");
      if (!localCAVLCReader.readBool("PPS: pic_scaling_matrix_present_flag"))
        break label637;
      i = 0;
      if (!localPictureParameterSet.extended.transform_8x8_mode_flag)
        break label607;
      j = 1;
      label411: if (i >= 6 + j * 2)
        break label637;
      if (localCAVLCReader.readBool("PPS: pic_scaling_list_present_flag"))
      {
        localPictureParameterSet.extended.scalindMatrix.ScalingList4x4 = new ScalingList[8];
        localPictureParameterSet.extended.scalindMatrix.ScalingList8x8 = new ScalingList[8];
        if (i >= 6)
          break label613;
        localPictureParameterSet.extended.scalindMatrix.ScalingList4x4[i] = ScalingList.read(localCAVLCReader, 16);
      }
    }
    while (true)
    {
      i++;
      break label398;
      if (localPictureParameterSet.slice_group_map_type != 6)
        break;
      int k;
      if (1 + localPictureParameterSet.num_slice_groups_minus1 > 4)
        k = 3;
      while (true)
      {
        int m = localCAVLCReader.readUE("PPS: pic_size_in_map_units_minus1");
        localPictureParameterSet.slice_group_id = new int[m + 1];
        for (int n = 0; n <= m; n++)
          localPictureParameterSet.slice_group_id[n] = localCAVLCReader.readU(k, "PPS: slice_group_id [" + n + "]f");
        break;
        if (1 + localPictureParameterSet.num_slice_groups_minus1 > 2)
          k = 2;
        else
          k = 1;
      }
      label607: j = 0;
      break label411;
      label613: localPictureParameterSet.extended.scalindMatrix.ScalingList8x8[(i - 6)] = ScalingList.read(localCAVLCReader, 64);
    }
    label637: localPictureParameterSet.extended.second_chroma_qp_index_offset = localCAVLCReader.readSE("PPS: second_chroma_qp_index_offset");
    label650: localCAVLCReader.readTrailingBits();
    return localPictureParameterSet;
  }

  public static PictureParameterSet read(byte[] paramArrayOfByte)
    throws IOException
  {
    return read(new ByteArrayInputStream(paramArrayOfByte));
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    PictureParameterSet localPictureParameterSet;
    do
    {
      return true;
      if (paramObject == null)
        return false;
      if (getClass() != paramObject.getClass())
        return false;
      localPictureParameterSet = (PictureParameterSet)paramObject;
      if (!Arrays.equals(this.bottom_right, localPictureParameterSet.bottom_right))
        return false;
      if (this.chroma_qp_index_offset != localPictureParameterSet.chroma_qp_index_offset)
        return false;
      if (this.constrained_intra_pred_flag != localPictureParameterSet.constrained_intra_pred_flag)
        return false;
      if (this.deblocking_filter_control_present_flag != localPictureParameterSet.deblocking_filter_control_present_flag)
        return false;
      if (this.entropy_coding_mode_flag != localPictureParameterSet.entropy_coding_mode_flag)
        return false;
      if (this.extended == null)
      {
        if (localPictureParameterSet.extended != null)
          return false;
      }
      else if (!this.extended.equals(localPictureParameterSet.extended))
        return false;
      if (this.num_ref_idx_l0_active_minus1 != localPictureParameterSet.num_ref_idx_l0_active_minus1)
        return false;
      if (this.num_ref_idx_l1_active_minus1 != localPictureParameterSet.num_ref_idx_l1_active_minus1)
        return false;
      if (this.num_slice_groups_minus1 != localPictureParameterSet.num_slice_groups_minus1)
        return false;
      if (this.pic_init_qp_minus26 != localPictureParameterSet.pic_init_qp_minus26)
        return false;
      if (this.pic_init_qs_minus26 != localPictureParameterSet.pic_init_qs_minus26)
        return false;
      if (this.bottom_field_pic_order_in_frame_present_flag != localPictureParameterSet.bottom_field_pic_order_in_frame_present_flag)
        return false;
      if (this.pic_parameter_set_id != localPictureParameterSet.pic_parameter_set_id)
        return false;
      if (this.redundant_pic_cnt_present_flag != localPictureParameterSet.redundant_pic_cnt_present_flag)
        return false;
      if (!Arrays.equals(this.run_length_minus1, localPictureParameterSet.run_length_minus1))
        return false;
      if (this.seq_parameter_set_id != localPictureParameterSet.seq_parameter_set_id)
        return false;
      if (this.slice_group_change_direction_flag != localPictureParameterSet.slice_group_change_direction_flag)
        return false;
      if (this.slice_group_change_rate_minus1 != localPictureParameterSet.slice_group_change_rate_minus1)
        return false;
      if (!Arrays.equals(this.slice_group_id, localPictureParameterSet.slice_group_id))
        return false;
      if (this.slice_group_map_type != localPictureParameterSet.slice_group_map_type)
        return false;
      if (!Arrays.equals(this.top_left, localPictureParameterSet.top_left))
        return false;
      if (this.weighted_bipred_idc != localPictureParameterSet.weighted_bipred_idc)
        return false;
    }
    while (this.weighted_pred_flag == localPictureParameterSet.weighted_pred_flag);
    return false;
  }

  public int hashCode()
  {
    int i = 1231;
    int j = 31 * (31 * (31 + Arrays.hashCode(this.bottom_right)) + this.chroma_qp_index_offset);
    int k;
    int n;
    label53: int i2;
    label73: int i4;
    label93: int i6;
    label153: int i8;
    label181: int i10;
    label220: int i11;
    if (this.constrained_intra_pred_flag)
    {
      k = i;
      int m = 31 * (j + k);
      if (!this.deblocking_filter_control_present_flag)
        break label295;
      n = i;
      int i1 = 31 * (m + n);
      if (!this.entropy_coding_mode_flag)
        break label303;
      i2 = i;
      int i3 = 31 * (i1 + i2);
      if (this.extended != null)
        break label311;
      i4 = 0;
      int i5 = 31 * (31 * (31 * (31 * (31 * (31 * (i3 + i4) + this.num_ref_idx_l0_active_minus1) + this.num_ref_idx_l1_active_minus1) + this.num_slice_groups_minus1) + this.pic_init_qp_minus26) + this.pic_init_qs_minus26);
      if (!this.bottom_field_pic_order_in_frame_present_flag)
        break label323;
      i6 = i;
      int i7 = 31 * (31 * (i5 + i6) + this.pic_parameter_set_id);
      if (!this.redundant_pic_cnt_present_flag)
        break label331;
      i8 = i;
      int i9 = 31 * (31 * (31 * (i7 + i8) + Arrays.hashCode(this.run_length_minus1)) + this.seq_parameter_set_id);
      if (!this.slice_group_change_direction_flag)
        break label339;
      i10 = i;
      i11 = 31 * (31 * (31 * (31 * (31 * (31 * (i9 + i10) + this.slice_group_change_rate_minus1) + Arrays.hashCode(this.slice_group_id)) + this.slice_group_map_type) + Arrays.hashCode(this.top_left)) + this.weighted_bipred_idc);
      if (!this.weighted_pred_flag)
        break label347;
    }
    while (true)
    {
      return i11 + i;
      k = 1237;
      break;
      label295: n = 1237;
      break label53;
      label303: i2 = 1237;
      break label73;
      label311: i4 = this.extended.hashCode();
      break label93;
      label323: i6 = 1237;
      break label153;
      label331: i8 = 1237;
      break label181;
      label339: i10 = 1237;
      break label220;
      label347: i = 1237;
    }
  }

  public String toString()
  {
    return "PictureParameterSet{\n       entropy_coding_mode_flag=" + this.entropy_coding_mode_flag + ",\n       num_ref_idx_l0_active_minus1=" + this.num_ref_idx_l0_active_minus1 + ",\n       num_ref_idx_l1_active_minus1=" + this.num_ref_idx_l1_active_minus1 + ",\n       slice_group_change_rate_minus1=" + this.slice_group_change_rate_minus1 + ",\n       pic_parameter_set_id=" + this.pic_parameter_set_id + ",\n       seq_parameter_set_id=" + this.seq_parameter_set_id + ",\n       pic_order_present_flag=" + this.bottom_field_pic_order_in_frame_present_flag + ",\n       num_slice_groups_minus1=" + this.num_slice_groups_minus1 + ",\n       slice_group_map_type=" + this.slice_group_map_type + ",\n       weighted_pred_flag=" + this.weighted_pred_flag + ",\n       weighted_bipred_idc=" + this.weighted_bipred_idc + ",\n       pic_init_qp_minus26=" + this.pic_init_qp_minus26 + ",\n       pic_init_qs_minus26=" + this.pic_init_qs_minus26 + ",\n       chroma_qp_index_offset=" + this.chroma_qp_index_offset + ",\n       deblocking_filter_control_present_flag=" + this.deblocking_filter_control_present_flag + ",\n       constrained_intra_pred_flag=" + this.constrained_intra_pred_flag + ",\n       redundant_pic_cnt_present_flag=" + this.redundant_pic_cnt_present_flag + ",\n       top_left=" + this.top_left + ",\n       bottom_right=" + this.bottom_right + ",\n       run_length_minus1=" + this.run_length_minus1 + ",\n       slice_group_change_direction_flag=" + this.slice_group_change_direction_flag + ",\n       slice_group_id=" + this.slice_group_id + ",\n       extended=" + this.extended + '}';
  }

  public void write(OutputStream paramOutputStream)
    throws IOException
  {
    CAVLCWriter localCAVLCWriter = new CAVLCWriter(paramOutputStream);
    localCAVLCWriter.writeUE(this.pic_parameter_set_id, "PPS: pic_parameter_set_id");
    localCAVLCWriter.writeUE(this.seq_parameter_set_id, "PPS: seq_parameter_set_id");
    localCAVLCWriter.writeBool(this.entropy_coding_mode_flag, "PPS: entropy_coding_mode_flag");
    localCAVLCWriter.writeBool(this.bottom_field_pic_order_in_frame_present_flag, "PPS: pic_order_present_flag");
    localCAVLCWriter.writeUE(this.num_slice_groups_minus1, "PPS: num_slice_groups_minus1");
    boolean bool1;
    label356: int i;
    label377: int j;
    if (this.num_slice_groups_minus1 > 0)
    {
      localCAVLCWriter.writeUE(this.slice_group_map_type, "PPS: slice_group_map_type");
      int[] arrayOfInt1 = new int[1];
      int[] arrayOfInt2 = new int[1];
      int[] arrayOfInt3 = new int[1];
      if (this.slice_group_map_type == 0)
        for (int i1 = 0; i1 <= this.num_slice_groups_minus1; i1++)
          localCAVLCWriter.writeUE(arrayOfInt3[i1], "PPS: ");
      if (this.slice_group_map_type == 2)
        for (int n = 0; n < this.num_slice_groups_minus1; n++)
        {
          localCAVLCWriter.writeUE(arrayOfInt1[n], "PPS: ");
          localCAVLCWriter.writeUE(arrayOfInt2[n], "PPS: ");
        }
      if ((this.slice_group_map_type == 3) || (this.slice_group_map_type == 4) || (this.slice_group_map_type == 5))
      {
        localCAVLCWriter.writeBool(this.slice_group_change_direction_flag, "PPS: slice_group_change_direction_flag");
        localCAVLCWriter.writeUE(this.slice_group_change_rate_minus1, "PPS: slice_group_change_rate_minus1");
      }
    }
    else
    {
      localCAVLCWriter.writeUE(this.num_ref_idx_l0_active_minus1, "PPS: num_ref_idx_l0_active_minus1");
      localCAVLCWriter.writeUE(this.num_ref_idx_l1_active_minus1, "PPS: num_ref_idx_l1_active_minus1");
      localCAVLCWriter.writeBool(this.weighted_pred_flag, "PPS: weighted_pred_flag");
      localCAVLCWriter.writeNBit(this.weighted_bipred_idc, 2, "PPS: weighted_bipred_idc");
      localCAVLCWriter.writeSE(this.pic_init_qp_minus26, "PPS: pic_init_qp_minus26");
      localCAVLCWriter.writeSE(this.pic_init_qs_minus26, "PPS: pic_init_qs_minus26");
      localCAVLCWriter.writeSE(this.chroma_qp_index_offset, "PPS: chroma_qp_index_offset");
      localCAVLCWriter.writeBool(this.deblocking_filter_control_present_flag, "PPS: deblocking_filter_control_present_flag");
      localCAVLCWriter.writeBool(this.constrained_intra_pred_flag, "PPS: constrained_intra_pred_flag");
      localCAVLCWriter.writeBool(this.redundant_pic_cnt_present_flag, "PPS: redundant_pic_cnt_present_flag");
      if (this.extended == null)
        break label674;
      localCAVLCWriter.writeBool(this.extended.transform_8x8_mode_flag, "PPS: transform_8x8_mode_flag");
      if (this.extended.scalindMatrix == null)
        break label564;
      bool1 = true;
      localCAVLCWriter.writeBool(bool1, "PPS: scalindMatrix");
      if (this.extended.scalindMatrix == null)
        break label660;
      i = 0;
      if (!this.extended.transform_8x8_mode_flag)
        break label569;
      j = 1;
      label390: if (i >= 6 + j * 2)
        break label660;
      if (i >= 6)
        break label581;
      if (this.extended.scalindMatrix.ScalingList4x4[i] == null)
        break label575;
    }
    label564: label569: label575: for (boolean bool3 = true; ; bool3 = false)
    {
      localCAVLCWriter.writeBool(bool3, "PPS: ");
      if (this.extended.scalindMatrix.ScalingList4x4[i] != null)
        this.extended.scalindMatrix.ScalingList4x4[i].write(localCAVLCWriter);
      i++;
      break label377;
      if (this.slice_group_map_type != 6)
        break;
      int k;
      if (1 + this.num_slice_groups_minus1 > 4)
        k = 3;
      while (true)
      {
        localCAVLCWriter.writeUE(this.slice_group_id.length, "PPS: ");
        for (int m = 0; m <= this.slice_group_id.length; m++)
          localCAVLCWriter.writeU(this.slice_group_id[m], k);
        break;
        if (1 + this.num_slice_groups_minus1 > 2)
          k = 2;
        else
          k = 1;
      }
      bool1 = false;
      break label356;
      j = 0;
      break label390;
    }
    label581: if (this.extended.scalindMatrix.ScalingList8x8[(i - 6)] != null);
    for (boolean bool2 = true; ; bool2 = false)
    {
      localCAVLCWriter.writeBool(bool2, "PPS: ");
      if (this.extended.scalindMatrix.ScalingList8x8[(i - 6)] == null)
        break;
      this.extended.scalindMatrix.ScalingList8x8[(i - 6)].write(localCAVLCWriter);
      break;
    }
    label660: localCAVLCWriter.writeSE(this.extended.second_chroma_qp_index_offset, "PPS: ");
    label674: localCAVLCWriter.writeTrailingBits();
  }

  public static class PPSExt
  {
    public boolean[] pic_scaling_list_present_flag;
    public ScalingMatrix scalindMatrix = new ScalingMatrix();
    public int second_chroma_qp_index_offset;
    public boolean transform_8x8_mode_flag;

    public String toString()
    {
      return "PPSExt{transform_8x8_mode_flag=" + this.transform_8x8_mode_flag + ", scalindMatrix=" + this.scalindMatrix + ", second_chroma_qp_index_offset=" + this.second_chroma_qp_index_offset + ", pic_scaling_list_present_flag=" + this.pic_scaling_list_present_flag + '}';
    }
  }
}