package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class KeywordsBox extends AbstractFullBox
{
  public static final String TYPE = "kywd";
  private String[] keywords;
  private String language;

  public KeywordsBox()
  {
    super("kywd");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.language = IsoTypeReader.readIso639(paramByteBuffer);
    int i = IsoTypeReader.readUInt8(paramByteBuffer);
    this.keywords = new String[i];
    for (int j = 0; j < i; j++)
    {
      IsoTypeReader.readUInt8(paramByteBuffer);
      this.keywords[j] = IsoTypeReader.readString(paramByteBuffer);
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeIso639(paramByteBuffer, this.language);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.keywords.length);
    for (String str : this.keywords)
    {
      IsoTypeWriter.writeUInt8(paramByteBuffer, 1 + Utf8.utf8StringLengthInBytes(str));
      paramByteBuffer.put(Utf8.convert(str));
    }
  }

  protected long getContentSize()
  {
    long l = 7L;
    String[] arrayOfString = this.keywords;
    int i = arrayOfString.length;
    for (int j = 0; j < i; j++)
      l += 1 + (1 + Utf8.utf8StringLengthInBytes(arrayOfString[j]));
    return l;
  }

  public String[] getKeywords()
  {
    return this.keywords;
  }

  public String getLanguage()
  {
    return this.language;
  }

  public void setKeywords(String[] paramArrayOfString)
  {
    this.keywords = paramArrayOfString;
  }

  public void setLanguage(String paramString)
  {
    this.language = paramString;
  }

  public String toString()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append("KeywordsBox[language=").append(getLanguage());
    for (int i = 0; i < this.keywords.length; i++)
      localStringBuffer.append(";keyword").append(i).append("=").append(this.keywords[i]);
    localStringBuffer.append("]");
    return localStringBuffer.toString();
  }
}