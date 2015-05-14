package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.dece;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class BaseLocationBox extends AbstractFullBox
{
  public static final String TYPE = "bloc";
  String baseLocation = "";
  String purchaseLocation = "";

  public BaseLocationBox()
  {
    super("bloc");
  }

  public BaseLocationBox(String paramString1, String paramString2)
  {
    super("bloc");
    this.baseLocation = paramString1;
    this.purchaseLocation = paramString2;
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.baseLocation = IsoTypeReader.readString(paramByteBuffer);
    paramByteBuffer.get(new byte[-1 + (256 - Utf8.utf8StringLengthInBytes(this.baseLocation))]);
    this.purchaseLocation = IsoTypeReader.readString(paramByteBuffer);
    paramByteBuffer.get(new byte[-1 + (256 - Utf8.utf8StringLengthInBytes(this.purchaseLocation))]);
    paramByteBuffer.get(new byte[512]);
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    BaseLocationBox localBaseLocationBox;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localBaseLocationBox = (BaseLocationBox)paramObject;
      if (this.baseLocation != null)
      {
        if (this.baseLocation.equals(localBaseLocationBox.baseLocation));
      }
      else
        while (localBaseLocationBox.baseLocation != null)
          return false;
      if (this.purchaseLocation == null)
        break;
    }
    while (this.purchaseLocation.equals(localBaseLocationBox.purchaseLocation));
    while (true)
    {
      return false;
      if (localBaseLocationBox.purchaseLocation == null)
        break;
    }
  }

  public String getBaseLocation()
  {
    return this.baseLocation;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    paramByteBuffer.put(Utf8.convert(this.baseLocation));
    paramByteBuffer.put(new byte[256 - Utf8.utf8StringLengthInBytes(this.baseLocation)]);
    paramByteBuffer.put(Utf8.convert(this.purchaseLocation));
    paramByteBuffer.put(new byte[256 - Utf8.utf8StringLengthInBytes(this.purchaseLocation)]);
    paramByteBuffer.put(new byte[512]);
  }

  protected long getContentSize()
  {
    return 1028L;
  }

  public String getPurchaseLocation()
  {
    return this.purchaseLocation;
  }

  public int hashCode()
  {
    if (this.baseLocation != null);
    for (int i = this.baseLocation.hashCode(); ; i = 0)
    {
      int j = i * 31;
      String str = this.purchaseLocation;
      int k = 0;
      if (str != null)
        k = this.purchaseLocation.hashCode();
      return j + k;
    }
  }

  public void setBaseLocation(String paramString)
  {
    this.baseLocation = paramString;
  }

  public void setPurchaseLocation(String paramString)
  {
    this.purchaseLocation = paramString;
  }

  public String toString()
  {
    return "BaseLocationBox{baseLocation='" + this.baseLocation + '\'' + ", purchaseLocation='" + this.purchaseLocation + '\'' + '}';
  }
}