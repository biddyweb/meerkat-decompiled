package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import java.io.IOException;
import java.nio.ByteBuffer;

@Descriptor(tags={20})
public class ProfileLevelIndicationDescriptor extends BaseDescriptor
{
  int profileLevelIndicationIndex;

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    ProfileLevelIndicationDescriptor localProfileLevelIndicationDescriptor;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localProfileLevelIndicationDescriptor = (ProfileLevelIndicationDescriptor)paramObject;
    }
    while (this.profileLevelIndicationIndex == localProfileLevelIndicationDescriptor.profileLevelIndicationIndex);
    return false;
  }

  public int hashCode()
  {
    return this.profileLevelIndicationIndex;
  }

  public void parseDetail(ByteBuffer paramByteBuffer)
    throws IOException
  {
    this.profileLevelIndicationIndex = IsoTypeReader.readUInt8(paramByteBuffer);
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("ProfileLevelIndicationDescriptor");
    localStringBuilder.append("{profileLevelIndicationIndex=").append(Integer.toHexString(this.profileLevelIndicationIndex));
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }
}