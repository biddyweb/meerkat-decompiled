package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part30;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AbstractSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Path;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;

public class WebVTTSampleEntry extends AbstractSampleEntry
{
  public static final String TYPE = "wvtt";

  public WebVTTSampleEntry()
  {
    super("wvtt");
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    paramWritableByteChannel.write(getHeader());
    writeContainer(paramWritableByteChannel);
  }

  public WebVTTConfigurationBox getConfig()
  {
    return (WebVTTConfigurationBox)Path.getPath(this, "vttC");
  }

  public WebVTTSourceLabelBox getSourceLabel()
  {
    return (WebVTTSourceLabelBox)Path.getPath(this, "vlab");
  }

  public void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException
  {
    initContainer(paramDataSource, paramLong, paramBoxParser);
  }
}