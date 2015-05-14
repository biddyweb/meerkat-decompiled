package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class PixelAspectRationAtom extends AbstractBox
{
  public static final String TYPE = "pasp";
  private int hSpacing;
  private int vSpacing;

  public PixelAspectRationAtom()
  {
    super("pasp");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.hSpacing = paramByteBuffer.getInt();
    this.vSpacing = paramByteBuffer.getInt();
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.putInt(this.hSpacing);
    paramByteBuffer.putInt(this.vSpacing);
  }

  protected long getContentSize()
  {
    return 8L;
  }

  public int gethSpacing()
  {
    return this.hSpacing;
  }

  public int getvSpacing()
  {
    return this.vSpacing;
  }

  public void sethSpacing(int paramInt)
  {
    this.hSpacing = paramInt;
  }

  public void setvSpacing(int paramInt)
  {
    this.vSpacing = paramInt;
  }
}