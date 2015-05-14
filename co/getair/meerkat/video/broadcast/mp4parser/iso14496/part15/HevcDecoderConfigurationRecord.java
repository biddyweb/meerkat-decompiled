package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public class HevcDecoderConfigurationRecord
{
  List<Array> arrays = new ArrayList();
  int avgFrameRate;
  int bitDepthChromaMinus8;
  int bitDepthLumaMinus8;
  int chromaFormat;
  int configurationVersion;
  int constantFrameRate;
  boolean frame_only_constraint_flag;
  long general_constraint_indicator_flags;
  int general_level_idc;
  long general_profile_compatibility_flags;
  int general_profile_idc;
  int general_profile_space;
  boolean general_tier_flag;
  boolean interlaced_source_flag;
  int lengthSizeMinusOne;
  int min_spatial_segmentation_idc;
  boolean non_packed_constraint_flag;
  int numTemporalLayers;
  int parallelismType;
  boolean progressive_source_flag;
  int reserved1 = 15;
  int reserved2 = 63;
  int reserved3 = 63;
  int reserved4 = 31;
  int reserved5 = 31;
  boolean temporalIdNested;

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    HevcDecoderConfigurationRecord localHevcDecoderConfigurationRecord;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localHevcDecoderConfigurationRecord = (HevcDecoderConfigurationRecord)paramObject;
      if (this.avgFrameRate != localHevcDecoderConfigurationRecord.avgFrameRate)
        return false;
      if (this.bitDepthChromaMinus8 != localHevcDecoderConfigurationRecord.bitDepthChromaMinus8)
        return false;
      if (this.bitDepthLumaMinus8 != localHevcDecoderConfigurationRecord.bitDepthLumaMinus8)
        return false;
      if (this.chromaFormat != localHevcDecoderConfigurationRecord.chromaFormat)
        return false;
      if (this.configurationVersion != localHevcDecoderConfigurationRecord.configurationVersion)
        return false;
      if (this.constantFrameRate != localHevcDecoderConfigurationRecord.constantFrameRate)
        return false;
      if (this.general_constraint_indicator_flags != localHevcDecoderConfigurationRecord.general_constraint_indicator_flags)
        return false;
      if (this.general_level_idc != localHevcDecoderConfigurationRecord.general_level_idc)
        return false;
      if (this.general_profile_compatibility_flags != localHevcDecoderConfigurationRecord.general_profile_compatibility_flags)
        return false;
      if (this.general_profile_idc != localHevcDecoderConfigurationRecord.general_profile_idc)
        return false;
      if (this.general_profile_space != localHevcDecoderConfigurationRecord.general_profile_space)
        return false;
      if (this.general_tier_flag != localHevcDecoderConfigurationRecord.general_tier_flag)
        return false;
      if (this.lengthSizeMinusOne != localHevcDecoderConfigurationRecord.lengthSizeMinusOne)
        return false;
      if (this.min_spatial_segmentation_idc != localHevcDecoderConfigurationRecord.min_spatial_segmentation_idc)
        return false;
      if (this.numTemporalLayers != localHevcDecoderConfigurationRecord.numTemporalLayers)
        return false;
      if (this.parallelismType != localHevcDecoderConfigurationRecord.parallelismType)
        return false;
      if (this.reserved1 != localHevcDecoderConfigurationRecord.reserved1)
        return false;
      if (this.reserved2 != localHevcDecoderConfigurationRecord.reserved2)
        return false;
      if (this.reserved3 != localHevcDecoderConfigurationRecord.reserved3)
        return false;
      if (this.reserved4 != localHevcDecoderConfigurationRecord.reserved4)
        return false;
      if (this.reserved5 != localHevcDecoderConfigurationRecord.reserved5)
        return false;
      if (this.temporalIdNested != localHevcDecoderConfigurationRecord.temporalIdNested)
        return false;
      if (this.arrays == null)
        break;
    }
    while (this.arrays.equals(localHevcDecoderConfigurationRecord.arrays));
    while (true)
    {
      return false;
      if (localHevcDecoderConfigurationRecord.arrays == null)
        break;
    }
  }

  public List<Array> getArrays()
  {
    return this.arrays;
  }

  public int getAvgFrameRate()
  {
    return this.avgFrameRate;
  }

  public int getBitDepthChromaMinus8()
  {
    return this.bitDepthChromaMinus8;
  }

  public int getBitDepthLumaMinus8()
  {
    return this.bitDepthLumaMinus8;
  }

  public int getChromaFormat()
  {
    return this.chromaFormat;
  }

  public int getConfigurationVersion()
  {
    return this.configurationVersion;
  }

  public int getConstantFrameRate()
  {
    return this.constantFrameRate;
  }

  public long getGeneral_constraint_indicator_flags()
  {
    return this.general_constraint_indicator_flags;
  }

  public int getGeneral_level_idc()
  {
    return this.general_level_idc;
  }

  public long getGeneral_profile_compatibility_flags()
  {
    return this.general_profile_compatibility_flags;
  }

  public int getGeneral_profile_idc()
  {
    return this.general_profile_idc;
  }

  public int getGeneral_profile_space()
  {
    return this.general_profile_space;
  }

  public int getLengthSizeMinusOne()
  {
    return this.lengthSizeMinusOne;
  }

  public int getMin_spatial_segmentation_idc()
  {
    return this.min_spatial_segmentation_idc;
  }

  public int getNumTemporalLayers()
  {
    return this.numTemporalLayers;
  }

  public int getParallelismType()
  {
    return this.parallelismType;
  }

  public int getSize()
  {
    int i = 23;
    Iterator localIterator1 = this.arrays.iterator();
    while (localIterator1.hasNext())
    {
      Array localArray = (Array)localIterator1.next();
      i += 3;
      Iterator localIterator2 = localArray.nalUnits.iterator();
      while (localIterator2.hasNext())
      {
        byte[] arrayOfByte = (byte[])localIterator2.next();
        i = i + 2 + arrayOfByte.length;
      }
    }
    return i;
  }

  public int hashCode()
  {
    int i = 1;
    int j = 31 * (31 * this.configurationVersion + this.general_profile_space);
    int k;
    int m;
    if (this.general_tier_flag)
    {
      k = i;
      m = 31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (j + k) + this.general_profile_idc) + (int)(this.general_profile_compatibility_flags ^ this.general_profile_compatibility_flags >>> 32)) + (int)(this.general_constraint_indicator_flags ^ this.general_constraint_indicator_flags >>> 32)) + this.general_level_idc) + this.reserved1) + this.min_spatial_segmentation_idc) + this.reserved2) + this.parallelismType) + this.reserved3) + this.chromaFormat) + this.reserved4) + this.bitDepthLumaMinus8) + this.reserved5) + this.bitDepthChromaMinus8) + this.avgFrameRate) + this.constantFrameRate) + this.numTemporalLayers);
      if (!this.temporalIdNested)
        break label249;
    }
    while (true)
    {
      int n = 31 * (31 * (m + i) + this.lengthSizeMinusOne);
      List localList = this.arrays;
      int i1 = 0;
      if (localList != null)
        i1 = this.arrays.hashCode();
      return n + i1;
      k = 0;
      break;
      label249: i = 0;
    }
  }

  public boolean isFrame_only_constraint_flag()
  {
    return this.frame_only_constraint_flag;
  }

  public boolean isGeneral_tier_flag()
  {
    return this.general_tier_flag;
  }

  public boolean isInterlaced_source_flag()
  {
    return this.interlaced_source_flag;
  }

  public boolean isNon_packed_constraint_flag()
  {
    return this.non_packed_constraint_flag;
  }

  public boolean isProgressive_source_flag()
  {
    return this.progressive_source_flag;
  }

  public boolean isTemporalIdNested()
  {
    return this.temporalIdNested;
  }

  public void parse(ByteBuffer paramByteBuffer)
  {
    this.configurationVersion = IsoTypeReader.readUInt8(paramByteBuffer);
    int i = IsoTypeReader.readUInt8(paramByteBuffer);
    this.general_profile_space = ((i & 0xC0) >> 6);
    boolean bool1;
    boolean bool2;
    label82: boolean bool3;
    label107: boolean bool4;
    label132: boolean bool5;
    label155: boolean bool6;
    label363: int i3;
    if ((i & 0x20) > 0)
    {
      bool1 = true;
      this.general_tier_flag = bool1;
      this.general_profile_idc = (i & 0x1F);
      this.general_profile_compatibility_flags = IsoTypeReader.readUInt32(paramByteBuffer);
      this.general_constraint_indicator_flags = IsoTypeReader.readUInt48(paramByteBuffer);
      if ((0x8 & this.general_constraint_indicator_flags >> 44) <= 0L)
        break label533;
      bool2 = true;
      this.frame_only_constraint_flag = bool2;
      if ((0x4 & this.general_constraint_indicator_flags >> 44) <= 0L)
        break label539;
      bool3 = true;
      this.non_packed_constraint_flag = bool3;
      if ((0x2 & this.general_constraint_indicator_flags >> 44) <= 0L)
        break label545;
      bool4 = true;
      this.interlaced_source_flag = bool4;
      if ((1L & this.general_constraint_indicator_flags >> 44) <= 0L)
        break label551;
      bool5 = true;
      this.progressive_source_flag = bool5;
      this.general_constraint_indicator_flags = (0xFFFFFFFF & this.general_constraint_indicator_flags);
      this.general_level_idc = IsoTypeReader.readUInt8(paramByteBuffer);
      int j = IsoTypeReader.readUInt16(paramByteBuffer);
      this.reserved1 = ((0xF000 & j) >> 12);
      this.min_spatial_segmentation_idc = (j & 0xFFF);
      int k = IsoTypeReader.readUInt8(paramByteBuffer);
      this.reserved2 = ((k & 0xFC) >> 2);
      this.parallelismType = (k & 0x3);
      int m = IsoTypeReader.readUInt8(paramByteBuffer);
      this.reserved3 = ((m & 0xFC) >> 2);
      this.chromaFormat = (m & 0x3);
      int n = IsoTypeReader.readUInt8(paramByteBuffer);
      this.reserved4 = ((n & 0xF8) >> 3);
      this.bitDepthLumaMinus8 = (n & 0x7);
      int i1 = IsoTypeReader.readUInt8(paramByteBuffer);
      this.reserved5 = ((i1 & 0xF8) >> 3);
      this.bitDepthChromaMinus8 = (i1 & 0x7);
      this.avgFrameRate = IsoTypeReader.readUInt16(paramByteBuffer);
      int i2 = IsoTypeReader.readUInt8(paramByteBuffer);
      this.constantFrameRate = ((i2 & 0xC0) >> 6);
      this.numTemporalLayers = ((i2 & 0x38) >> 3);
      if ((i2 & 0x4) <= 0)
        break label557;
      bool6 = true;
      this.temporalIdNested = bool6;
      this.lengthSizeMinusOne = (i2 & 0x3);
      i3 = IsoTypeReader.readUInt8(paramByteBuffer);
      this.arrays = new ArrayList();
    }
    for (int i4 = 0; ; i4++)
    {
      if (i4 >= i3)
        return;
      Array localArray = new Array();
      int i5 = IsoTypeReader.readUInt8(paramByteBuffer);
      boolean bool7;
      if ((i5 & 0x80) > 0)
      {
        bool7 = true;
        label431: localArray.array_completeness = bool7;
        if ((i5 & 0x40) <= 0)
          break label569;
      }
      label533: label539: label545: label551: label557: label569: for (boolean bool8 = true; ; bool8 = false)
      {
        localArray.reserved = bool8;
        localArray.nal_unit_type = (i5 & 0x3F);
        int i6 = IsoTypeReader.readUInt16(paramByteBuffer);
        localArray.nalUnits = new ArrayList();
        for (int i7 = 0; i7 < i6; i7++)
        {
          byte[] arrayOfByte = new byte[IsoTypeReader.readUInt16(paramByteBuffer)];
          paramByteBuffer.get(arrayOfByte);
          localArray.nalUnits.add(arrayOfByte);
        }
        bool1 = false;
        break;
        bool2 = false;
        break label82;
        bool3 = false;
        break label107;
        bool4 = false;
        break label132;
        bool5 = false;
        break label155;
        bool6 = false;
        break label363;
        bool7 = false;
        break label431;
      }
      this.arrays.add(localArray);
    }
  }

  public void setArrays(List<Array> paramList)
  {
    this.arrays = paramList;
  }

  public void setAvgFrameRate(int paramInt)
  {
    this.avgFrameRate = paramInt;
  }

  public void setBitDepthChromaMinus8(int paramInt)
  {
    this.bitDepthChromaMinus8 = paramInt;
  }

  public void setBitDepthLumaMinus8(int paramInt)
  {
    this.bitDepthLumaMinus8 = paramInt;
  }

  public void setChromaFormat(int paramInt)
  {
    this.chromaFormat = paramInt;
  }

  public void setConfigurationVersion(int paramInt)
  {
    this.configurationVersion = paramInt;
  }

  public void setConstantFrameRate(int paramInt)
  {
    this.constantFrameRate = paramInt;
  }

  public void setFrame_only_constraint_flag(boolean paramBoolean)
  {
    this.frame_only_constraint_flag = paramBoolean;
  }

  public void setGeneral_constraint_indicator_flags(long paramLong)
  {
    this.general_constraint_indicator_flags = paramLong;
  }

  public void setGeneral_level_idc(int paramInt)
  {
    this.general_level_idc = paramInt;
  }

  public void setGeneral_profile_compatibility_flags(long paramLong)
  {
    this.general_profile_compatibility_flags = paramLong;
  }

  public void setGeneral_profile_idc(int paramInt)
  {
    this.general_profile_idc = paramInt;
  }

  public void setGeneral_profile_space(int paramInt)
  {
    this.general_profile_space = paramInt;
  }

  public void setGeneral_tier_flag(boolean paramBoolean)
  {
    this.general_tier_flag = paramBoolean;
  }

  public void setInterlaced_source_flag(boolean paramBoolean)
  {
    this.interlaced_source_flag = paramBoolean;
  }

  public void setLengthSizeMinusOne(int paramInt)
  {
    this.lengthSizeMinusOne = paramInt;
  }

  public void setMin_spatial_segmentation_idc(int paramInt)
  {
    this.min_spatial_segmentation_idc = paramInt;
  }

  public void setNon_packed_constraint_flag(boolean paramBoolean)
  {
    this.non_packed_constraint_flag = paramBoolean;
  }

  public void setNumTemporalLayers(int paramInt)
  {
    this.numTemporalLayers = paramInt;
  }

  public void setParallelismType(int paramInt)
  {
    this.parallelismType = paramInt;
  }

  public void setProgressive_source_flag(boolean paramBoolean)
  {
    this.progressive_source_flag = paramBoolean;
  }

  public void setTemporalIdNested(boolean paramBoolean)
  {
    this.temporalIdNested = paramBoolean;
  }

  public String toString()
  {
    StringBuilder localStringBuilder1 = new StringBuilder().append("HEVCDecoderConfigurationRecord{configurationVersion=").append(this.configurationVersion).append(", general_profile_space=").append(this.general_profile_space).append(", general_tier_flag=").append(this.general_tier_flag).append(", general_profile_idc=").append(this.general_profile_idc).append(", general_profile_compatibility_flags=").append(this.general_profile_compatibility_flags).append(", general_constraint_indicator_flags=").append(this.general_constraint_indicator_flags).append(", general_level_idc=").append(this.general_level_idc);
    String str1;
    String str2;
    label180: String str3;
    label235: String str4;
    label291: StringBuilder localStringBuilder5;
    if (this.reserved1 != 15)
    {
      str1 = ", reserved1=" + this.reserved1;
      StringBuilder localStringBuilder2 = localStringBuilder1.append(str1).append(", min_spatial_segmentation_idc=").append(this.min_spatial_segmentation_idc);
      if (this.reserved2 == 63)
        break label461;
      str2 = ", reserved2=" + this.reserved2;
      StringBuilder localStringBuilder3 = localStringBuilder2.append(str2).append(", parallelismType=").append(this.parallelismType);
      if (this.reserved3 == 63)
        break label469;
      str3 = ", reserved3=" + this.reserved3;
      StringBuilder localStringBuilder4 = localStringBuilder3.append(str3).append(", chromaFormat=").append(this.chromaFormat);
      if (this.reserved4 == 31)
        break label477;
      str4 = ", reserved4=" + this.reserved4;
      localStringBuilder5 = localStringBuilder4.append(str4).append(", bitDepthLumaMinus8=").append(this.bitDepthLumaMinus8);
      if (this.reserved5 == 31)
        break label485;
    }
    label461: label469: label477: label485: for (String str5 = ", reserved5=" + this.reserved5; ; str5 = "")
    {
      return str5 + ", bitDepthChromaMinus8=" + this.bitDepthChromaMinus8 + ", avgFrameRate=" + this.avgFrameRate + ", constantFrameRate=" + this.constantFrameRate + ", numTemporalLayers=" + this.numTemporalLayers + ", temporalIdNested=" + this.temporalIdNested + ", lengthSizeMinusOne=" + this.lengthSizeMinusOne + ", arrays=" + this.arrays + '}';
      str1 = "";
      break;
      str2 = "";
      break label180;
      str3 = "";
      break label235;
      str4 = "";
      break label291;
    }
  }

  public void write(ByteBuffer paramByteBuffer)
  {
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.configurationVersion);
    int i = this.general_profile_space << 6;
    int j;
    int m;
    label236: Array localArray;
    label274: int n;
    if (this.general_tier_flag)
    {
      j = 32;
      IsoTypeWriter.writeUInt8(paramByteBuffer, j + i + this.general_profile_idc);
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.general_profile_compatibility_flags);
      long l = this.general_constraint_indicator_flags;
      if (this.frame_only_constraint_flag)
        l |= 140737488355328L;
      if (this.non_packed_constraint_flag)
        l |= 70368744177664L;
      if (this.interlaced_source_flag)
        l |= 35184372088832L;
      if (this.progressive_source_flag)
        l |= 17592186044416L;
      IsoTypeWriter.writeUInt48(paramByteBuffer, l);
      IsoTypeWriter.writeUInt8(paramByteBuffer, this.general_level_idc);
      IsoTypeWriter.writeUInt16(paramByteBuffer, (this.reserved1 << 12) + this.min_spatial_segmentation_idc);
      IsoTypeWriter.writeUInt8(paramByteBuffer, (this.reserved2 << 2) + this.parallelismType);
      IsoTypeWriter.writeUInt8(paramByteBuffer, (this.reserved3 << 2) + this.chromaFormat);
      IsoTypeWriter.writeUInt8(paramByteBuffer, (this.reserved4 << 3) + this.bitDepthLumaMinus8);
      IsoTypeWriter.writeUInt8(paramByteBuffer, (this.reserved5 << 3) + this.bitDepthChromaMinus8);
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.avgFrameRate);
      int k = (this.constantFrameRate << 6) + (this.numTemporalLayers << 3);
      if (!this.temporalIdNested)
        break label406;
      m = 4;
      IsoTypeWriter.writeUInt8(paramByteBuffer, m + k + this.lengthSizeMinusOne);
      IsoTypeWriter.writeUInt8(paramByteBuffer, this.arrays.size());
      Iterator localIterator1 = this.arrays.iterator();
      if (!localIterator1.hasNext())
        return;
      localArray = (Array)localIterator1.next();
      if (!localArray.array_completeness)
        break label412;
      n = 128;
      label309: if (!localArray.reserved)
        break label418;
    }
    label406: label412: label418: for (int i1 = 64; ; i1 = 0)
    {
      IsoTypeWriter.writeUInt8(paramByteBuffer, n + i1 + localArray.nal_unit_type);
      IsoTypeWriter.writeUInt16(paramByteBuffer, localArray.nalUnits.size());
      Iterator localIterator2 = localArray.nalUnits.iterator();
      while (localIterator2.hasNext())
      {
        byte[] arrayOfByte = (byte[])localIterator2.next();
        IsoTypeWriter.writeUInt16(paramByteBuffer, arrayOfByte.length);
        paramByteBuffer.put(arrayOfByte);
      }
      break label274;
      j = 0;
      break;
      m = 0;
      break label236;
      n = 0;
      break label309;
    }
  }

  public static class Array
  {
    public boolean array_completeness;
    public List<byte[]> nalUnits;
    public int nal_unit_type;
    public boolean reserved;

    public boolean equals(Object paramObject)
    {
      boolean bool1 = true;
      boolean bool2;
      if (this == paramObject)
        bool2 = bool1;
      Array localArray;
      boolean bool5;
      boolean bool6;
      do
      {
        int i;
        int j;
        do
        {
          boolean bool3;
          boolean bool4;
          do
          {
            Class localClass1;
            Class localClass2;
            do
            {
              do
              {
                return bool2;
                bool2 = false;
              }
              while (paramObject == null);
              localClass1 = getClass();
              localClass2 = paramObject.getClass();
              bool2 = false;
            }
            while (localClass1 != localClass2);
            localArray = (Array)paramObject;
            bool3 = this.array_completeness;
            bool4 = localArray.array_completeness;
            bool2 = false;
          }
          while (bool3 != bool4);
          i = this.nal_unit_type;
          j = localArray.nal_unit_type;
          bool2 = false;
        }
        while (i != j);
        bool5 = this.reserved;
        bool6 = localArray.reserved;
        bool2 = false;
      }
      while (bool5 != bool6);
      ListIterator localListIterator1 = this.nalUnits.listIterator();
      ListIterator localListIterator2 = localArray.nalUnits.listIterator();
      while (true)
        if ((localListIterator1.hasNext()) && (localListIterator2.hasNext()))
        {
          byte[] arrayOfByte1 = (byte[])localListIterator1.next();
          byte[] arrayOfByte2 = (byte[])localListIterator2.next();
          if (arrayOfByte1 == null)
          {
            bool2 = false;
            if (arrayOfByte2 != null)
              break;
            continue;
          }
          if (!Arrays.equals(arrayOfByte1, arrayOfByte2))
            return false;
        }
      if ((!localListIterator1.hasNext()) && (!localListIterator2.hasNext()));
      while (true)
      {
        return bool1;
        bool1 = false;
      }
    }

    public int hashCode()
    {
      int i = 1;
      int j;
      int k;
      if (this.array_completeness)
      {
        j = i;
        k = j * 31;
        if (!this.reserved)
          break label75;
      }
      while (true)
      {
        int m = 31 * (31 * (k + i) + this.nal_unit_type);
        List localList = this.nalUnits;
        int n = 0;
        if (localList != null)
          n = this.nalUnits.hashCode();
        return m + n;
        j = 0;
        break;
        label75: i = 0;
      }
    }

    public String toString()
    {
      return "Array{nal_unit_type=" + this.nal_unit_type + ", reserved=" + this.reserved + ", array_completeness=" + this.array_completeness + ", num_nals=" + this.nalUnits.size() + '}';
    }
  }
}