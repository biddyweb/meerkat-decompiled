package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import java.io.IOException;
import java.nio.ByteBuffer;

@Descriptor(tags={6})
public class SLConfigDescriptor extends BaseDescriptor
{
  int predefined;

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    SLConfigDescriptor localSLConfigDescriptor;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localSLConfigDescriptor = (SLConfigDescriptor)paramObject;
    }
    while (this.predefined == localSLConfigDescriptor.predefined);
    return false;
  }

  public int getPredefined()
  {
    return this.predefined;
  }

  public int hashCode()
  {
    return this.predefined;
  }

  public void parseDetail(ByteBuffer paramByteBuffer)
    throws IOException
  {
    this.predefined = IsoTypeReader.readUInt8(paramByteBuffer);
  }

  public ByteBuffer serialize()
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(3);
    IsoTypeWriter.writeUInt8(localByteBuffer, 6);
    IsoTypeWriter.writeUInt8(localByteBuffer, 1);
    IsoTypeWriter.writeUInt8(localByteBuffer, this.predefined);
    return localByteBuffer;
  }

  public int serializedSize()
  {
    return 3;
  }

  public void setPredefined(int paramInt)
  {
    this.predefined = paramInt;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("SLConfigDescriptor");
    localStringBuilder.append("{predefined=").append(this.predefined);
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }
}