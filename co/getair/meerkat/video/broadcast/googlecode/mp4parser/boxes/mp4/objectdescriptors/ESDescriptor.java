package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@Descriptor(tags={3})
public class ESDescriptor extends BaseDescriptor
{
  private static Logger log = Logger.getLogger(ESDescriptor.class.getName());
  int URLFlag;
  int URLLength = 0;
  String URLString;
  DecoderConfigDescriptor decoderConfigDescriptor;
  int dependsOnEsId;
  int esId;
  int oCREsId;
  int oCRstreamFlag;
  List<BaseDescriptor> otherDescriptors = new ArrayList();
  int remoteODFlag;
  SLConfigDescriptor slConfigDescriptor;
  int streamDependenceFlag;
  int streamPriority;

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    ESDescriptor localESDescriptor;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localESDescriptor = (ESDescriptor)paramObject;
      if (this.URLFlag != localESDescriptor.URLFlag)
        return false;
      if (this.URLLength != localESDescriptor.URLLength)
        return false;
      if (this.dependsOnEsId != localESDescriptor.dependsOnEsId)
        return false;
      if (this.esId != localESDescriptor.esId)
        return false;
      if (this.oCREsId != localESDescriptor.oCREsId)
        return false;
      if (this.oCRstreamFlag != localESDescriptor.oCRstreamFlag)
        return false;
      if (this.remoteODFlag != localESDescriptor.remoteODFlag)
        return false;
      if (this.streamDependenceFlag != localESDescriptor.streamDependenceFlag)
        return false;
      if (this.streamPriority != localESDescriptor.streamPriority)
        return false;
      if (this.URLString != null)
      {
        if (this.URLString.equals(localESDescriptor.URLString));
      }
      else
        while (localESDescriptor.URLString != null)
          return false;
      if (this.decoderConfigDescriptor != null)
      {
        if (this.decoderConfigDescriptor.equals(localESDescriptor.decoderConfigDescriptor));
      }
      else
        while (localESDescriptor.decoderConfigDescriptor != null)
          return false;
      if (this.otherDescriptors != null)
      {
        if (this.otherDescriptors.equals(localESDescriptor.otherDescriptors));
      }
      else
        while (localESDescriptor.otherDescriptors != null)
          return false;
      if (this.slConfigDescriptor == null)
        break;
    }
    while (this.slConfigDescriptor.equals(localESDescriptor.slConfigDescriptor));
    while (true)
    {
      return false;
      if (localESDescriptor.slConfigDescriptor == null)
        break;
    }
  }

  public DecoderConfigDescriptor getDecoderConfigDescriptor()
  {
    return this.decoderConfigDescriptor;
  }

  public int getDependsOnEsId()
  {
    return this.dependsOnEsId;
  }

  public int getEsId()
  {
    return this.esId;
  }

  public List<BaseDescriptor> getOtherDescriptors()
  {
    return this.otherDescriptors;
  }

  public int getRemoteODFlag()
  {
    return this.remoteODFlag;
  }

  public SLConfigDescriptor getSlConfigDescriptor()
  {
    return this.slConfigDescriptor;
  }

  public int getStreamDependenceFlag()
  {
    return this.streamDependenceFlag;
  }

  public int getStreamPriority()
  {
    return this.streamPriority;
  }

  public int getURLFlag()
  {
    return this.URLFlag;
  }

  public int getURLLength()
  {
    return this.URLLength;
  }

  public String getURLString()
  {
    return this.URLString;
  }

  public int getoCREsId()
  {
    return this.oCREsId;
  }

  public int getoCRstreamFlag()
  {
    return this.oCRstreamFlag;
  }

  public int hashCode()
  {
    int i = 31 * (31 * (31 * (31 * (31 * (31 * this.esId + this.streamDependenceFlag) + this.URLFlag) + this.oCRstreamFlag) + this.streamPriority) + this.URLLength);
    int j;
    int m;
    label110: int n;
    if (this.URLString != null)
    {
      j = this.URLString.hashCode();
      int k = 31 * (31 * (31 * (31 * (i + j) + this.remoteODFlag) + this.dependsOnEsId) + this.oCREsId);
      if (this.decoderConfigDescriptor == null)
        break label181;
      m = this.decoderConfigDescriptor.hashCode();
      n = 31 * (k + m);
      if (this.slConfigDescriptor == null)
        break label187;
    }
    label181: label187: for (int i1 = this.slConfigDescriptor.hashCode(); ; i1 = 0)
    {
      int i2 = 31 * (n + i1);
      List localList = this.otherDescriptors;
      int i3 = 0;
      if (localList != null)
        i3 = this.otherDescriptors.hashCode();
      return i2 + i3;
      j = 0;
      break;
      m = 0;
      break label110;
    }
  }

  public void parseDetail(ByteBuffer paramByteBuffer)
    throws IOException
  {
    this.esId = IsoTypeReader.readUInt16(paramByteBuffer);
    int i = IsoTypeReader.readUInt8(paramByteBuffer);
    this.streamDependenceFlag = (i >>> 7);
    this.URLFlag = (0x1 & i >>> 6);
    this.oCRstreamFlag = (0x1 & i >>> 5);
    this.streamPriority = (i & 0x1F);
    if (this.streamDependenceFlag == 1)
      this.dependsOnEsId = IsoTypeReader.readUInt16(paramByteBuffer);
    if (this.URLFlag == 1)
    {
      this.URLLength = IsoTypeReader.readUInt8(paramByteBuffer);
      this.URLString = IsoTypeReader.readString(paramByteBuffer, this.URLLength);
    }
    if (this.oCRstreamFlag == 1)
      this.oCREsId = IsoTypeReader.readUInt16(paramByteBuffer);
    int j = 1 + (2 + (1 + getSizeBytes()));
    int k;
    int n;
    label152: int i2;
    label170: int i3;
    long l3;
    Integer localInteger3;
    label260: label304: long l2;
    Integer localInteger2;
    label404: label448: label465: BaseDescriptor localBaseDescriptor1;
    long l1;
    Integer localInteger1;
    if (this.streamDependenceFlag == 1)
    {
      k = 2;
      int m = j + k;
      if (this.URLFlag != 1)
        break label613;
      n = 1 + this.URLLength;
      int i1 = m + n;
      if (this.oCRstreamFlag != 1)
        break label619;
      i2 = 2;
      i3 = i1 + i2;
      int i4 = paramByteBuffer.position();
      if (getSize() > i3 + 2)
      {
        BaseDescriptor localBaseDescriptor3 = ObjectDescriptorFactory.createFrom(-1, paramByteBuffer);
        l3 = paramByteBuffer.position() - i4;
        Logger localLogger3 = log;
        StringBuilder localStringBuilder3 = new StringBuilder().append(localBaseDescriptor3).append(" - ESDescriptor1 read: ").append(l3).append(", size: ");
        if (localBaseDescriptor3 == null)
          break label625;
        localInteger3 = Integer.valueOf(localBaseDescriptor3.getSize());
        localLogger3.finer(localInteger3);
        if (localBaseDescriptor3 == null)
          break label631;
        int i9 = localBaseDescriptor3.getSize();
        paramByteBuffer.position(i4 + i9);
        i3 += i9;
        if ((localBaseDescriptor3 instanceof DecoderConfigDescriptor))
          this.decoderConfigDescriptor = ((DecoderConfigDescriptor)localBaseDescriptor3);
      }
      int i5 = paramByteBuffer.position();
      if (getSize() <= i3 + 2)
        break label661;
      BaseDescriptor localBaseDescriptor2 = ObjectDescriptorFactory.createFrom(-1, paramByteBuffer);
      l2 = paramByteBuffer.position() - i5;
      Logger localLogger2 = log;
      StringBuilder localStringBuilder2 = new StringBuilder().append(localBaseDescriptor2).append(" - ESDescriptor2 read: ").append(l2).append(", size: ");
      if (localBaseDescriptor2 == null)
        break label643;
      localInteger2 = Integer.valueOf(localBaseDescriptor2.getSize());
      localLogger2.finer(localInteger2);
      if (localBaseDescriptor2 == null)
        break label649;
      int i8 = localBaseDescriptor2.getSize();
      paramByteBuffer.position(i5 + i8);
      i3 += i8;
      if ((localBaseDescriptor2 instanceof SLConfigDescriptor))
        this.slConfigDescriptor = ((SLConfigDescriptor)localBaseDescriptor2);
      if (getSize() - i3 <= 2)
        return;
      int i6 = paramByteBuffer.position();
      localBaseDescriptor1 = ObjectDescriptorFactory.createFrom(-1, paramByteBuffer);
      l1 = paramByteBuffer.position() - i6;
      Logger localLogger1 = log;
      StringBuilder localStringBuilder1 = new StringBuilder().append(localBaseDescriptor1).append(" - ESDescriptor3 read: ").append(l1).append(", size: ");
      if (localBaseDescriptor1 == null)
        break label672;
      localInteger1 = Integer.valueOf(localBaseDescriptor1.getSize());
      label548: localLogger1.finer(localInteger1);
      if (localBaseDescriptor1 == null)
        break label678;
      int i7 = localBaseDescriptor1.getSize();
      paramByteBuffer.position(i6 + i7);
      i3 += i7;
    }
    while (true)
    {
      this.otherDescriptors.add(localBaseDescriptor1);
      break label465;
      k = 0;
      break;
      label613: n = 0;
      break label152;
      label619: i2 = 0;
      break label170;
      label625: localInteger3 = null;
      break label260;
      label631: i3 = (int)(l3 + i3);
      break label304;
      label643: localInteger2 = null;
      break label404;
      label649: i3 = (int)(l2 + i3);
      break label448;
      label661: log.warning("SLConfigDescriptor is missing!");
      break label465;
      label672: localInteger1 = null;
      break label548;
      label678: i3 = (int)(l1 + i3);
    }
  }

  public ByteBuffer serialize()
  {
    ByteBuffer localByteBuffer1 = ByteBuffer.allocate(serializedSize());
    IsoTypeWriter.writeUInt8(localByteBuffer1, 3);
    IsoTypeWriter.writeUInt8(localByteBuffer1, -2 + serializedSize());
    IsoTypeWriter.writeUInt16(localByteBuffer1, this.esId);
    IsoTypeWriter.writeUInt8(localByteBuffer1, this.streamDependenceFlag << 7 | this.URLFlag << 6 | this.oCRstreamFlag << 5 | 0x1F & this.streamPriority);
    if (this.streamDependenceFlag > 0)
      IsoTypeWriter.writeUInt16(localByteBuffer1, this.dependsOnEsId);
    if (this.URLFlag > 0)
    {
      IsoTypeWriter.writeUInt8(localByteBuffer1, this.URLLength);
      IsoTypeWriter.writeUtf8String(localByteBuffer1, this.URLString);
    }
    if (this.oCRstreamFlag > 0)
      IsoTypeWriter.writeUInt16(localByteBuffer1, this.oCREsId);
    ByteBuffer localByteBuffer2 = this.decoderConfigDescriptor.serialize();
    ByteBuffer localByteBuffer3 = this.slConfigDescriptor.serialize();
    localByteBuffer1.put(localByteBuffer2.array());
    localByteBuffer1.put(localByteBuffer3.array());
    return localByteBuffer1;
  }

  public int serializedSize()
  {
    int i = 5;
    if (this.streamDependenceFlag > 0)
      i += 2;
    if (this.URLFlag > 0)
      i += 1 + this.URLLength;
    if (this.oCRstreamFlag > 0)
      i += 2;
    return i + this.decoderConfigDescriptor.serializedSize() + this.slConfigDescriptor.serializedSize();
  }

  public void setDecoderConfigDescriptor(DecoderConfigDescriptor paramDecoderConfigDescriptor)
  {
    this.decoderConfigDescriptor = paramDecoderConfigDescriptor;
  }

  public void setDependsOnEsId(int paramInt)
  {
    this.dependsOnEsId = paramInt;
  }

  public void setEsId(int paramInt)
  {
    this.esId = paramInt;
  }

  public void setRemoteODFlag(int paramInt)
  {
    this.remoteODFlag = paramInt;
  }

  public void setSlConfigDescriptor(SLConfigDescriptor paramSLConfigDescriptor)
  {
    this.slConfigDescriptor = paramSLConfigDescriptor;
  }

  public void setStreamDependenceFlag(int paramInt)
  {
    this.streamDependenceFlag = paramInt;
  }

  public void setStreamPriority(int paramInt)
  {
    this.streamPriority = paramInt;
  }

  public void setURLFlag(int paramInt)
  {
    this.URLFlag = paramInt;
  }

  public void setURLLength(int paramInt)
  {
    this.URLLength = paramInt;
  }

  public void setURLString(String paramString)
  {
    this.URLString = paramString;
  }

  public void setoCREsId(int paramInt)
  {
    this.oCREsId = paramInt;
  }

  public void setoCRstreamFlag(int paramInt)
  {
    this.oCRstreamFlag = paramInt;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("ESDescriptor");
    localStringBuilder.append("{esId=").append(this.esId);
    localStringBuilder.append(", streamDependenceFlag=").append(this.streamDependenceFlag);
    localStringBuilder.append(", URLFlag=").append(this.URLFlag);
    localStringBuilder.append(", oCRstreamFlag=").append(this.oCRstreamFlag);
    localStringBuilder.append(", streamPriority=").append(this.streamPriority);
    localStringBuilder.append(", URLLength=").append(this.URLLength);
    localStringBuilder.append(", URLString='").append(this.URLString).append('\'');
    localStringBuilder.append(", remoteODFlag=").append(this.remoteODFlag);
    localStringBuilder.append(", dependsOnEsId=").append(this.dependsOnEsId);
    localStringBuilder.append(", oCREsId=").append(this.oCREsId);
    localStringBuilder.append(", decoderConfigDescriptor=").append(this.decoderConfigDescriptor);
    localStringBuilder.append(", slConfigDescriptor=").append(this.slConfigDescriptor);
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }
}