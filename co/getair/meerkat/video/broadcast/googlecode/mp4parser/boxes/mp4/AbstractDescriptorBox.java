package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.ObjectDescriptorFactory;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AbstractDescriptorBox extends AbstractFullBox
{
  private static Logger log = Logger.getLogger(AbstractDescriptorBox.class.getName());
  protected ByteBuffer data;
  protected BaseDescriptor descriptor;

  public AbstractDescriptorBox(String paramString)
  {
    super(paramString);
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.data = paramByteBuffer.slice();
    paramByteBuffer.position(paramByteBuffer.position() + paramByteBuffer.remaining());
    try
    {
      this.data.rewind();
      this.descriptor = ObjectDescriptorFactory.createFrom(-1, this.data);
      return;
    }
    catch (IOException localIOException)
    {
      log.log(Level.WARNING, "Error parsing ObjectDescriptor", localIOException);
      return;
    }
    catch (IndexOutOfBoundsException localIndexOutOfBoundsException)
    {
      log.log(Level.WARNING, "Error parsing ObjectDescriptor", localIndexOutOfBoundsException);
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    this.data.rewind();
    paramByteBuffer.put(this.data);
  }

  protected long getContentSize()
  {
    return 4 + this.data.limit();
  }

  public ByteBuffer getData()
  {
    return this.data;
  }

  public BaseDescriptor getDescriptor()
  {
    return this.descriptor;
  }

  public String getDescriptorAsString()
  {
    return this.descriptor.toString();
  }

  public void setData(ByteBuffer paramByteBuffer)
  {
    this.data = paramByteBuffer;
  }

  public void setDescriptor(BaseDescriptor paramBaseDescriptor)
  {
    this.descriptor = paramBaseDescriptor;
  }
}