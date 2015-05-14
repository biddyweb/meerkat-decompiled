package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.microsoft;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Date;
import java.util.Iterator;
import java.util.Vector;

public class XtraBox extends AbstractBox
{
  private static final long FILETIME_EPOCH_DIFF = 11644473600000L;
  private static final long FILETIME_ONE_MILLISECOND = 10000L;
  public static final int MP4_XTRA_BT_FILETIME = 21;
  public static final int MP4_XTRA_BT_GUID = 72;
  public static final int MP4_XTRA_BT_INT64 = 19;
  public static final int MP4_XTRA_BT_UNICODE = 8;
  public static final String TYPE = "Xtra";
  ByteBuffer data;
  private boolean successfulParse = false;
  Vector<XtraTag> tags = new Vector();

  public XtraBox()
  {
    super("Xtra");
  }

  public XtraBox(String paramString)
  {
    super(paramString);
  }

  private int detailSize()
  {
    int i = 0;
    for (int j = 0; j < this.tags.size(); j++)
      i += ((XtraTag)this.tags.elementAt(j)).getContentSize();
    return i;
  }

  private static long filetimeToMillis(long paramLong)
  {
    return paramLong / 10000L - 11644473600000L;
  }

  private XtraTag getTagByName(String paramString)
  {
    Iterator localIterator = this.tags.iterator();
    while (localIterator.hasNext())
    {
      XtraTag localXtraTag = (XtraTag)localIterator.next();
      if (localXtraTag.tagName.equals(paramString))
        return localXtraTag;
    }
    return null;
  }

  private static long millisToFiletime(long paramLong)
  {
    return 10000L * (11644473600000L + paramLong);
  }

  private static String readAsciiString(ByteBuffer paramByteBuffer, int paramInt)
  {
    byte[] arrayOfByte = new byte[paramInt];
    paramByteBuffer.get(arrayOfByte);
    try
    {
      String str = new String(arrayOfByte, "US-ASCII");
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException("Shouldn't happen", localUnsupportedEncodingException);
    }
  }

  private static String readUtf16String(ByteBuffer paramByteBuffer, int paramInt)
  {
    char[] arrayOfChar = new char[-1 + paramInt / 2];
    for (int i = 0; i < -1 + paramInt / 2; i++)
      arrayOfChar[i] = paramByteBuffer.getChar();
    paramByteBuffer.getChar();
    return new String(arrayOfChar);
  }

  private static void writeAsciiString(ByteBuffer paramByteBuffer, String paramString)
  {
    try
    {
      paramByteBuffer.put(paramString.getBytes("US-ASCII"));
      return;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException("Shouldn't happen", localUnsupportedEncodingException);
    }
  }

  private static void writeUtf16String(ByteBuffer paramByteBuffer, String paramString)
  {
    char[] arrayOfChar = paramString.toCharArray();
    for (int i = 0; i < arrayOfChar.length; i++)
      paramByteBuffer.putChar(arrayOfChar[i]);
    paramByteBuffer.putChar('\000');
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    int i = paramByteBuffer.remaining();
    this.data = paramByteBuffer.slice();
    this.successfulParse = false;
    try
    {
      this.tags.clear();
      while (paramByteBuffer.remaining() > 0)
      {
        XtraTag localXtraTag = new XtraTag(null);
        localXtraTag.parse(paramByteBuffer);
        this.tags.addElement(localXtraTag);
      }
    }
    catch (Exception localException)
    {
      this.successfulParse = false;
      System.err.println("Malformed Xtra Tag detected: " + localException.toString());
      localException.printStackTrace();
      paramByteBuffer.position(paramByteBuffer.position() + paramByteBuffer.remaining());
      return;
      int j = detailSize();
      if (i != j)
        throw new RuntimeException("Improperly handled Xtra tag: Calculated sizes don't match ( " + i + "/" + j + ")");
    }
    finally
    {
      paramByteBuffer.order(ByteOrder.BIG_ENDIAN);
    }
    this.successfulParse = true;
    paramByteBuffer.order(ByteOrder.BIG_ENDIAN);
  }

  public String[] getAllTagNames()
  {
    String[] arrayOfString = new String[this.tags.size()];
    for (int i = 0; i < this.tags.size(); i++)
      arrayOfString[i] = ((XtraTag)this.tags.elementAt(i)).tagName;
    return arrayOfString;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    if (this.successfulParse)
      for (int i = 0; i < this.tags.size(); i++)
        ((XtraTag)this.tags.elementAt(i)).getContent(paramByteBuffer);
    this.data.rewind();
    paramByteBuffer.put(this.data);
  }

  protected long getContentSize()
  {
    if (this.successfulParse)
      return detailSize();
    return this.data.limit();
  }

  public Date getFirstDateValue(String paramString)
  {
    for (Object localObject : getValues(paramString))
      if ((localObject instanceof Date))
        return (Date)localObject;
    return null;
  }

  public Long getFirstLongValue(String paramString)
  {
    for (Object localObject : getValues(paramString))
      if ((localObject instanceof Long))
        return (Long)localObject;
    return null;
  }

  public String getFirstStringValue(String paramString)
  {
    for (Object localObject : getValues(paramString))
      if ((localObject instanceof String))
        return (String)localObject;
    return null;
  }

  public Object[] getValues(String paramString)
  {
    XtraTag localXtraTag = getTagByName(paramString);
    if (localXtraTag != null)
    {
      arrayOfObject = new Object[localXtraTag.values.size()];
      for (int i = 0; i < localXtraTag.values.size(); i++)
        arrayOfObject[i] = ((XtraValue)localXtraTag.values.elementAt(i)).getValueAsObject();
    }
    Object[] arrayOfObject = new Object[0];
    return arrayOfObject;
  }

  public void removeTag(String paramString)
  {
    XtraTag localXtraTag = getTagByName(paramString);
    if (localXtraTag != null)
      this.tags.remove(localXtraTag);
  }

  public void setTagValue(String paramString, long paramLong)
  {
    removeTag(paramString);
    XtraTag localXtraTag = new XtraTag(paramString, null);
    localXtraTag.values.addElement(new XtraValue(paramLong, null));
    this.tags.addElement(localXtraTag);
  }

  public void setTagValue(String paramString1, String paramString2)
  {
    setTagValues(paramString1, new String[] { paramString2 });
  }

  public void setTagValue(String paramString, Date paramDate)
  {
    removeTag(paramString);
    XtraTag localXtraTag = new XtraTag(paramString, null);
    localXtraTag.values.addElement(new XtraValue(paramDate, null));
    this.tags.addElement(localXtraTag);
  }

  public void setTagValues(String paramString, String[] paramArrayOfString)
  {
    removeTag(paramString);
    XtraTag localXtraTag = new XtraTag(paramString, null);
    for (int i = 0; i < paramArrayOfString.length; i++)
      localXtraTag.values.addElement(new XtraValue(paramArrayOfString[i], null));
    this.tags.addElement(localXtraTag);
  }

  public String toString()
  {
    if (!isParsed())
      parseDetails();
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append("XtraBox[");
    Iterator localIterator1 = this.tags.iterator();
    while (localIterator1.hasNext())
    {
      XtraTag localXtraTag = (XtraTag)localIterator1.next();
      Iterator localIterator2 = localXtraTag.values.iterator();
      while (localIterator2.hasNext())
      {
        XtraValue localXtraValue = (XtraValue)localIterator2.next();
        localStringBuffer.append(localXtraTag.tagName);
        localStringBuffer.append("=");
        localStringBuffer.append(localXtraValue.toString());
        localStringBuffer.append(";");
      }
    }
    localStringBuffer.append("]");
    return localStringBuffer.toString();
  }

  private static class XtraTag
  {
    private int inputSize;
    private String tagName;
    private Vector<XtraBox.XtraValue> values = new Vector();

    private XtraTag()
    {
    }

    private XtraTag(String paramString)
    {
      this();
      this.tagName = paramString;
    }

    private void getContent(ByteBuffer paramByteBuffer)
    {
      paramByteBuffer.putInt(getContentSize());
      paramByteBuffer.putInt(this.tagName.length());
      XtraBox.writeAsciiString(paramByteBuffer, this.tagName);
      paramByteBuffer.putInt(this.values.size());
      for (int i = 0; i < this.values.size(); i++)
        XtraBox.XtraValue.access$1500((XtraBox.XtraValue)this.values.elementAt(i), paramByteBuffer);
    }

    private int getContentSize()
    {
      int i = 12 + this.tagName.length();
      for (int j = 0; j < this.values.size(); j++)
        i += XtraBox.XtraValue.access$1600((XtraBox.XtraValue)this.values.elementAt(j));
      return i;
    }

    private void parse(ByteBuffer paramByteBuffer)
    {
      this.inputSize = paramByteBuffer.getInt();
      this.tagName = XtraBox.readAsciiString(paramByteBuffer, paramByteBuffer.getInt());
      int i = paramByteBuffer.getInt();
      for (int j = 0; j < i; j++)
      {
        XtraBox.XtraValue localXtraValue = new XtraBox.XtraValue(null);
        XtraBox.XtraValue.access$1300(localXtraValue, paramByteBuffer);
        this.values.addElement(localXtraValue);
      }
      if (this.inputSize != getContentSize())
        throw new RuntimeException("Improperly handled Xtra tag: Sizes don't match ( " + this.inputSize + "/" + getContentSize() + ") on " + this.tagName);
    }

    public String toString()
    {
      StringBuffer localStringBuffer = new StringBuffer();
      localStringBuffer.append(this.tagName);
      localStringBuffer.append(" [");
      localStringBuffer.append(this.inputSize);
      localStringBuffer.append("/");
      localStringBuffer.append(this.values.size());
      localStringBuffer.append("]:\n");
      for (int i = 0; i < this.values.size(); i++)
      {
        localStringBuffer.append("  ");
        localStringBuffer.append(((XtraBox.XtraValue)this.values.elementAt(i)).toString());
        localStringBuffer.append("\n");
      }
      return localStringBuffer.toString();
    }
  }

  private static class XtraValue
  {
    public Date fileTimeValue;
    public long longValue;
    public byte[] nonParsedValue;
    public String stringValue;
    public int type;

    private XtraValue()
    {
    }

    private XtraValue(long paramLong)
    {
      this.type = 19;
      this.longValue = paramLong;
    }

    private XtraValue(String paramString)
    {
      this.type = 8;
      this.stringValue = paramString;
    }

    private XtraValue(Date paramDate)
    {
      this.type = 21;
      this.fileTimeValue = paramDate;
    }

    private void getContent(ByteBuffer paramByteBuffer)
    {
      while (true)
      {
        try
        {
          paramByteBuffer.putInt(getContentSize());
          paramByteBuffer.putShort((short)this.type);
          paramByteBuffer.order(ByteOrder.LITTLE_ENDIAN);
          switch (this.type)
          {
          default:
            paramByteBuffer.put(this.nonParsedValue);
            return;
          case 8:
            XtraBox.writeUtf16String(paramByteBuffer, this.stringValue);
            continue;
          case 19:
          case 21:
          }
        }
        finally
        {
          paramByteBuffer.order(ByteOrder.BIG_ENDIAN);
        }
        paramByteBuffer.putLong(this.longValue);
        continue;
        paramByteBuffer.putLong(XtraBox.millisToFiletime(this.fileTimeValue.getTime()));
      }
    }

    private int getContentSize()
    {
      switch (this.type)
      {
      default:
        return 6 + this.nonParsedValue.length;
      case 8:
        return 6 + (2 + 2 * this.stringValue.length());
      case 19:
      case 21:
      }
      return 6 + 8;
    }

    private Object getValueAsObject()
    {
      switch (this.type)
      {
      default:
        return this.nonParsedValue;
      case 8:
        return this.stringValue;
      case 19:
        return new Long(this.longValue);
      case 21:
      }
      return this.fileTimeValue;
    }

    private void parse(ByteBuffer paramByteBuffer)
    {
      int i = -6 + paramByteBuffer.getInt();
      this.type = paramByteBuffer.getShort();
      paramByteBuffer.order(ByteOrder.LITTLE_ENDIAN);
      switch (this.type)
      {
      default:
        this.nonParsedValue = new byte[i];
        paramByteBuffer.get(this.nonParsedValue);
      case 8:
      case 19:
      case 21:
      }
      while (true)
      {
        paramByteBuffer.order(ByteOrder.BIG_ENDIAN);
        return;
        this.stringValue = XtraBox.readUtf16String(paramByteBuffer, i);
        continue;
        this.longValue = paramByteBuffer.getLong();
        continue;
        this.fileTimeValue = new Date(XtraBox.filetimeToMillis(paramByteBuffer.getLong()));
      }
    }

    public String toString()
    {
      switch (this.type)
      {
      default:
        return "[GUID](nonParsed)";
      case 8:
        return "[string]" + this.stringValue;
      case 19:
        return "[long]" + String.valueOf(this.longValue);
      case 21:
      }
      return "[filetime]" + this.fileTimeValue.toString();
    }
  }
}