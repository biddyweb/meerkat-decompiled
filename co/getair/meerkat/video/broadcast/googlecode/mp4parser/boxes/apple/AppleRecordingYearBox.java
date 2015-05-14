package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import java.nio.ByteBuffer;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class AppleRecordingYearBox extends AppleDataBox
{
  Date date = new Date();
  DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'kk:mm:ssZ");

  public AppleRecordingYearBox()
  {
    super("\u00A9day", 1);
    this.df.setTimeZone(TimeZone.getTimeZone("UTC"));
  }

  protected static String iso8601toRfc822Date(String paramString)
  {
    return paramString.replaceAll("Z$", "+0000").replaceAll("([0-9][0-9]):([0-9][0-9])$", "$1$2");
  }

  protected static String rfc822toIso8601Date(String paramString)
  {
    return paramString.replaceAll("\\+0000$", "Z");
  }

  protected int getDataLength()
  {
    return Utf8.convert(rfc822toIso8601Date(this.df.format(this.date))).length;
  }

  public Date getDate()
  {
    return this.date;
  }

  protected void parseData(ByteBuffer paramByteBuffer)
  {
    String str = IsoTypeReader.readString(paramByteBuffer, paramByteBuffer.remaining());
    try
    {
      this.date = this.df.parse(iso8601toRfc822Date(str));
      return;
    }
    catch (ParseException localParseException)
    {
      throw new RuntimeException(localParseException);
    }
  }

  public void setDate(Date paramDate)
  {
    this.date = paramDate;
  }

  protected byte[] writeData()
  {
    return Utf8.convert(rfc822toIso8601Date(this.df.format(this.date)));
  }
}