package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.threegpp26244;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class LocationInformationBox extends AbstractFullBox
{
  public static final String TYPE = "loci";
  private String additionalNotes = "";
  private double altitude;
  private String astronomicalBody = "";
  private String language;
  private double latitude;
  private double longitude;
  private String name = "";
  private int role;

  public LocationInformationBox()
  {
    super("loci");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.language = IsoTypeReader.readIso639(paramByteBuffer);
    this.name = IsoTypeReader.readString(paramByteBuffer);
    this.role = IsoTypeReader.readUInt8(paramByteBuffer);
    this.longitude = IsoTypeReader.readFixedPoint1616(paramByteBuffer);
    this.latitude = IsoTypeReader.readFixedPoint1616(paramByteBuffer);
    this.altitude = IsoTypeReader.readFixedPoint1616(paramByteBuffer);
    this.astronomicalBody = IsoTypeReader.readString(paramByteBuffer);
    this.additionalNotes = IsoTypeReader.readString(paramByteBuffer);
  }

  public String getAdditionalNotes()
  {
    return this.additionalNotes;
  }

  public double getAltitude()
  {
    return this.altitude;
  }

  public String getAstronomicalBody()
  {
    return this.astronomicalBody;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeIso639(paramByteBuffer, this.language);
    paramByteBuffer.put(Utf8.convert(this.name));
    paramByteBuffer.put((byte)0);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.role);
    IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.longitude);
    IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.latitude);
    IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.altitude);
    paramByteBuffer.put(Utf8.convert(this.astronomicalBody));
    paramByteBuffer.put((byte)0);
    paramByteBuffer.put(Utf8.convert(this.additionalNotes));
    paramByteBuffer.put((byte)0);
  }

  protected long getContentSize()
  {
    return 22 + Utf8.convert(this.name).length + Utf8.convert(this.astronomicalBody).length + Utf8.convert(this.additionalNotes).length;
  }

  public String getLanguage()
  {
    return this.language;
  }

  public double getLatitude()
  {
    return this.latitude;
  }

  public double getLongitude()
  {
    return this.longitude;
  }

  public String getName()
  {
    return this.name;
  }

  public int getRole()
  {
    return this.role;
  }

  public void setAdditionalNotes(String paramString)
  {
    this.additionalNotes = paramString;
  }

  public void setAltitude(double paramDouble)
  {
    this.altitude = paramDouble;
  }

  public void setAstronomicalBody(String paramString)
  {
    this.astronomicalBody = paramString;
  }

  public void setLanguage(String paramString)
  {
    this.language = paramString;
  }

  public void setLatitude(double paramDouble)
  {
    this.latitude = paramDouble;
  }

  public void setLongitude(double paramDouble)
  {
    this.longitude = paramDouble;
  }

  public void setName(String paramString)
  {
    this.name = paramString;
  }

  public void setRole(int paramInt)
  {
    this.role = paramInt;
  }
}