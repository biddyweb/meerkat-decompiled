package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class CompositionShiftLeastGreatestAtom extends AbstractFullBox
{
  public static final String TYPE = "cslg";
  int compositionOffsetToDisplayOffsetShift;
  int displayEndTime;
  int displayStartTime;
  int greatestDisplayOffset;
  int leastDisplayOffset;

  public CompositionShiftLeastGreatestAtom()
  {
    super("cslg");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.compositionOffsetToDisplayOffsetShift = paramByteBuffer.getInt();
    this.leastDisplayOffset = paramByteBuffer.getInt();
    this.greatestDisplayOffset = paramByteBuffer.getInt();
    this.displayStartTime = paramByteBuffer.getInt();
    this.displayEndTime = paramByteBuffer.getInt();
  }

  public int getCompositionOffsetToDisplayOffsetShift()
  {
    return this.compositionOffsetToDisplayOffsetShift;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    paramByteBuffer.putInt(this.compositionOffsetToDisplayOffsetShift);
    paramByteBuffer.putInt(this.leastDisplayOffset);
    paramByteBuffer.putInt(this.greatestDisplayOffset);
    paramByteBuffer.putInt(this.displayStartTime);
    paramByteBuffer.putInt(this.displayEndTime);
  }

  protected long getContentSize()
  {
    return 24L;
  }

  public int getDisplayEndTime()
  {
    return this.displayEndTime;
  }

  public int getDisplayStartTime()
  {
    return this.displayStartTime;
  }

  public int getGreatestDisplayOffset()
  {
    return this.greatestDisplayOffset;
  }

  public int getLeastDisplayOffset()
  {
    return this.leastDisplayOffset;
  }

  public void setCompositionOffsetToDisplayOffsetShift(int paramInt)
  {
    this.compositionOffsetToDisplayOffsetShift = paramInt;
  }

  public void setDisplayEndTime(int paramInt)
  {
    this.displayEndTime = paramInt;
  }

  public void setDisplayStartTime(int paramInt)
  {
    this.displayStartTime = paramInt;
  }

  public void setGreatestDisplayOffset(int paramInt)
  {
    this.greatestDisplayOffset = paramInt;
  }

  public void setLeastDisplayOffset(int paramInt)
  {
    this.leastDisplayOffset = paramInt;
  }
}