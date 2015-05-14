package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class TrackLoadSettingsAtom extends AbstractBox
{
  public static final String TYPE = "load";
  int defaultHints;
  int preloadDuration;
  int preloadFlags;
  int preloadStartTime;

  public TrackLoadSettingsAtom()
  {
    super("load");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.preloadStartTime = paramByteBuffer.getInt();
    this.preloadDuration = paramByteBuffer.getInt();
    this.preloadFlags = paramByteBuffer.getInt();
    this.defaultHints = paramByteBuffer.getInt();
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.putInt(this.preloadStartTime);
    paramByteBuffer.putInt(this.preloadDuration);
    paramByteBuffer.putInt(this.preloadFlags);
    paramByteBuffer.putInt(this.defaultHints);
  }

  protected long getContentSize()
  {
    return 16L;
  }

  public int getDefaultHints()
  {
    return this.defaultHints;
  }

  public int getPreloadDuration()
  {
    return this.preloadDuration;
  }

  public int getPreloadFlags()
  {
    return this.preloadFlags;
  }

  public int getPreloadStartTime()
  {
    return this.preloadStartTime;
  }

  public void setDefaultHints(int paramInt)
  {
    this.defaultHints = paramInt;
  }

  public void setPreloadDuration(int paramInt)
  {
    this.preloadDuration = paramInt;
  }

  public void setPreloadFlags(int paramInt)
  {
    this.preloadFlags = paramInt;
  }

  public void setPreloadStartTime(int paramInt)
  {
    this.preloadStartTime = paramInt;
  }
}