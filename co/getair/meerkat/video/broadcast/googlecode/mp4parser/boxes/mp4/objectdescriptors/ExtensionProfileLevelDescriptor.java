package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors;

import co.getair.meerkat.video.broadcast.coremedia.iso.Hex;
import java.io.IOException;
import java.nio.ByteBuffer;

@Descriptor(tags={19})
public class ExtensionProfileLevelDescriptor extends BaseDescriptor
{
  byte[] bytes;

  public void parseDetail(ByteBuffer paramByteBuffer)
    throws IOException
  {
    if (getSize() > 0)
    {
      this.bytes = new byte[getSize()];
      paramByteBuffer.get(this.bytes);
    }
  }

  public String toString()
  {
    StringBuilder localStringBuilder1 = new StringBuilder();
    localStringBuilder1.append("ExtensionDescriptor");
    StringBuilder localStringBuilder2 = localStringBuilder1.append("{bytes=");
    if (this.bytes == null);
    for (String str = "null"; ; str = Hex.encodeHex(this.bytes))
    {
      localStringBuilder2.append(str);
      localStringBuilder1.append('}');
      return localStringBuilder1.toString();
    }
  }
}