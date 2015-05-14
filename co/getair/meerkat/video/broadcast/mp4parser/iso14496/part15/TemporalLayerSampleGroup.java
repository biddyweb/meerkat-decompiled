package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry;
import java.nio.ByteBuffer;

public class TemporalLayerSampleGroup extends GroupEntry
{
  public static final String TYPE = "tscl";
  int temporalLayerId;
  int tlAvgBitRate;
  int tlAvgFrameRate;
  int tlConstantFrameRate;
  int tlMaxBitRate;
  long tlconstraint_indicator_flags;
  int tllevel_idc;
  long tlprofile_compatibility_flags;
  int tlprofile_idc;
  int tlprofile_space;
  boolean tltier_flag;

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    TemporalLayerSampleGroup localTemporalLayerSampleGroup;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localTemporalLayerSampleGroup = (TemporalLayerSampleGroup)paramObject;
      if (this.temporalLayerId != localTemporalLayerSampleGroup.temporalLayerId)
        return false;
      if (this.tlAvgBitRate != localTemporalLayerSampleGroup.tlAvgBitRate)
        return false;
      if (this.tlAvgFrameRate != localTemporalLayerSampleGroup.tlAvgFrameRate)
        return false;
      if (this.tlConstantFrameRate != localTemporalLayerSampleGroup.tlConstantFrameRate)
        return false;
      if (this.tlMaxBitRate != localTemporalLayerSampleGroup.tlMaxBitRate)
        return false;
      if (this.tlconstraint_indicator_flags != localTemporalLayerSampleGroup.tlconstraint_indicator_flags)
        return false;
      if (this.tllevel_idc != localTemporalLayerSampleGroup.tllevel_idc)
        return false;
      if (this.tlprofile_compatibility_flags != localTemporalLayerSampleGroup.tlprofile_compatibility_flags)
        return false;
      if (this.tlprofile_idc != localTemporalLayerSampleGroup.tlprofile_idc)
        return false;
      if (this.tlprofile_space != localTemporalLayerSampleGroup.tlprofile_space)
        return false;
    }
    while (this.tltier_flag == localTemporalLayerSampleGroup.tltier_flag);
    return false;
  }

  public ByteBuffer get()
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(20);
    IsoTypeWriter.writeUInt8(localByteBuffer, this.temporalLayerId);
    int i = this.tlprofile_space << 6;
    if (this.tltier_flag);
    for (int j = 32; ; j = 0)
    {
      IsoTypeWriter.writeUInt8(localByteBuffer, j + i + this.tlprofile_idc);
      IsoTypeWriter.writeUInt32(localByteBuffer, this.tlprofile_compatibility_flags);
      IsoTypeWriter.writeUInt48(localByteBuffer, this.tlconstraint_indicator_flags);
      IsoTypeWriter.writeUInt8(localByteBuffer, this.tllevel_idc);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.tlMaxBitRate);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.tlAvgBitRate);
      IsoTypeWriter.writeUInt8(localByteBuffer, this.tlConstantFrameRate);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.tlAvgFrameRate);
      return (ByteBuffer)localByteBuffer.rewind();
    }
  }

  public int getTemporalLayerId()
  {
    return this.temporalLayerId;
  }

  public int getTlAvgBitRate()
  {
    return this.tlAvgBitRate;
  }

  public int getTlAvgFrameRate()
  {
    return this.tlAvgFrameRate;
  }

  public int getTlConstantFrameRate()
  {
    return this.tlConstantFrameRate;
  }

  public int getTlMaxBitRate()
  {
    return this.tlMaxBitRate;
  }

  public long getTlconstraint_indicator_flags()
  {
    return this.tlconstraint_indicator_flags;
  }

  public int getTllevel_idc()
  {
    return this.tllevel_idc;
  }

  public long getTlprofile_compatibility_flags()
  {
    return this.tlprofile_compatibility_flags;
  }

  public int getTlprofile_idc()
  {
    return this.tlprofile_idc;
  }

  public int getTlprofile_space()
  {
    return this.tlprofile_space;
  }

  public String getType()
  {
    return "tscl";
  }

  public int hashCode()
  {
    int i = 31 * (31 * this.temporalLayerId + this.tlprofile_space);
    if (this.tltier_flag);
    for (int j = 1; ; j = 0)
      return 31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (i + j) + this.tlprofile_idc) + (int)(this.tlprofile_compatibility_flags ^ this.tlprofile_compatibility_flags >>> 32)) + (int)(this.tlconstraint_indicator_flags ^ this.tlconstraint_indicator_flags >>> 32)) + this.tllevel_idc) + this.tlMaxBitRate) + this.tlAvgBitRate) + this.tlConstantFrameRate) + this.tlAvgFrameRate;
  }

  public boolean isTltier_flag()
  {
    return this.tltier_flag;
  }

  public void parse(ByteBuffer paramByteBuffer)
  {
    this.temporalLayerId = IsoTypeReader.readUInt8(paramByteBuffer);
    int i = IsoTypeReader.readUInt8(paramByteBuffer);
    this.tlprofile_space = ((i & 0xC0) >> 6);
    if ((i & 0x20) > 0);
    for (boolean bool = true; ; bool = false)
    {
      this.tltier_flag = bool;
      this.tlprofile_idc = (i & 0x1F);
      this.tlprofile_compatibility_flags = IsoTypeReader.readUInt32(paramByteBuffer);
      this.tlconstraint_indicator_flags = IsoTypeReader.readUInt48(paramByteBuffer);
      this.tllevel_idc = IsoTypeReader.readUInt8(paramByteBuffer);
      this.tlMaxBitRate = IsoTypeReader.readUInt16(paramByteBuffer);
      this.tlAvgBitRate = IsoTypeReader.readUInt16(paramByteBuffer);
      this.tlConstantFrameRate = IsoTypeReader.readUInt8(paramByteBuffer);
      this.tlAvgFrameRate = IsoTypeReader.readUInt16(paramByteBuffer);
      return;
    }
  }

  public void setTemporalLayerId(int paramInt)
  {
    this.temporalLayerId = paramInt;
  }

  public void setTlAvgBitRate(int paramInt)
  {
    this.tlAvgBitRate = paramInt;
  }

  public void setTlAvgFrameRate(int paramInt)
  {
    this.tlAvgFrameRate = paramInt;
  }

  public void setTlConstantFrameRate(int paramInt)
  {
    this.tlConstantFrameRate = paramInt;
  }

  public void setTlMaxBitRate(int paramInt)
  {
    this.tlMaxBitRate = paramInt;
  }

  public void setTlconstraint_indicator_flags(long paramLong)
  {
    this.tlconstraint_indicator_flags = paramLong;
  }

  public void setTllevel_idc(int paramInt)
  {
    this.tllevel_idc = paramInt;
  }

  public void setTlprofile_compatibility_flags(long paramLong)
  {
    this.tlprofile_compatibility_flags = paramLong;
  }

  public void setTlprofile_idc(int paramInt)
  {
    this.tlprofile_idc = paramInt;
  }

  public void setTlprofile_space(int paramInt)
  {
    this.tlprofile_space = paramInt;
  }

  public void setTltier_flag(boolean paramBoolean)
  {
    this.tltier_flag = paramBoolean;
  }

  public int size()
  {
    return 20;
  }

  public String toString()
  {
    return "TemporalLayerSampleGroup{temporalLayerId=" + this.temporalLayerId + ", tlprofile_space=" + this.tlprofile_space + ", tltier_flag=" + this.tltier_flag + ", tlprofile_idc=" + this.tlprofile_idc + ", tlprofile_compatibility_flags=" + this.tlprofile_compatibility_flags + ", tlconstraint_indicator_flags=" + this.tlconstraint_indicator_flags + ", tllevel_idc=" + this.tllevel_idc + ", tlMaxBitRate=" + this.tlMaxBitRate + ", tlAvgBitRate=" + this.tlAvgBitRate + ", tlConstantFrameRate=" + this.tlConstantFrameRate + ", tlAvgFrameRate=" + this.tlAvgFrameRate + '}';
  }
}