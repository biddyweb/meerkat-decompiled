package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.ESDescriptor;
import java.nio.ByteBuffer;

public class ESDescriptorBox extends AbstractDescriptorBox
{
  public static final String TYPE = "esds";

  public ESDescriptorBox()
  {
    super("esds");
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    ESDescriptorBox localESDescriptorBox;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localESDescriptorBox = (ESDescriptorBox)paramObject;
      if (this.data == null)
        break;
    }
    while (this.data.equals(localESDescriptorBox.data));
    while (true)
    {
      return false;
      if (localESDescriptorBox.data == null)
        break;
    }
  }

  public ESDescriptor getEsDescriptor()
  {
    return (ESDescriptor)super.getDescriptor();
  }

  public int hashCode()
  {
    if (this.data != null)
      return this.data.hashCode();
    return 0;
  }

  public void setEsDescriptor(ESDescriptor paramESDescriptor)
  {
    super.setDescriptor(paramESDescriptor);
  }
}