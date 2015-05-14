package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class TrackReferenceTypeBox extends AbstractBox
{
  public static final String TYPE1 = "hint";
  public static final String TYPE2 = "cdsc";
  private long[] trackIds;

  public TrackReferenceTypeBox(String paramString)
  {
    super(paramString);
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    int i = paramByteBuffer.remaining() / 4;
    this.trackIds = new long[i];
    for (int j = 0; j < i; j++)
      this.trackIds[j] = IsoTypeReader.readUInt32(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    long[] arrayOfLong = this.trackIds;
    int i = arrayOfLong.length;
    for (int j = 0; j < i; j++)
      IsoTypeWriter.writeUInt32(paramByteBuffer, arrayOfLong[j]);
  }

  protected long getContentSize()
  {
    return 4 * this.trackIds.length;
  }

  public long[] getTrackIds()
  {
    return this.trackIds;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("TrackReferenceTypeBox[type=").append(getType());
    for (int i = 0; i < this.trackIds.length; i++)
    {
      localStringBuilder.append(";trackId");
      localStringBuilder.append(i);
      localStringBuilder.append("=");
      localStringBuilder.append(this.trackIds[i]);
    }
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}