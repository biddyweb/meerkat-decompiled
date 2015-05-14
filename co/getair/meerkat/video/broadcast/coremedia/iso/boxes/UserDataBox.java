package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;

public class UserDataBox extends AbstractContainerBox
{
  public static final String TYPE = "udta";

  public UserDataBox()
  {
    super("udta");
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    super.getBox(paramWritableByteChannel);
  }

  public void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException
  {
    super.parse(paramDataSource, paramByteBuffer, paramLong, paramBoxParser);
  }
}