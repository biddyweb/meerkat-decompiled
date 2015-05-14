package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.dece;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class ContentInformationBox extends AbstractFullBox
{
  public static final String TYPE = "cinf";
  Map<String, String> brandEntries = new LinkedHashMap();
  String codecs;
  Map<String, String> idEntries = new LinkedHashMap();
  String languages;
  String mimeSubtypeName;
  String profileLevelIdc;
  String protection;

  public ContentInformationBox()
  {
    super("cinf");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.mimeSubtypeName = IsoTypeReader.readString(paramByteBuffer);
    this.profileLevelIdc = IsoTypeReader.readString(paramByteBuffer);
    this.codecs = IsoTypeReader.readString(paramByteBuffer);
    this.protection = IsoTypeReader.readString(paramByteBuffer);
    this.languages = IsoTypeReader.readString(paramByteBuffer);
    int j;
    for (int i = IsoTypeReader.readUInt8(paramByteBuffer); ; i = j)
    {
      j = i - 1;
      if (i <= 0)
        break;
      this.brandEntries.put(IsoTypeReader.readString(paramByteBuffer), IsoTypeReader.readString(paramByteBuffer));
    }
    int m;
    for (int k = IsoTypeReader.readUInt8(paramByteBuffer); ; k = m)
    {
      m = k - 1;
      if (k <= 0)
        break;
      this.idEntries.put(IsoTypeReader.readString(paramByteBuffer), IsoTypeReader.readString(paramByteBuffer));
    }
  }

  public Map<String, String> getBrandEntries()
  {
    return this.brandEntries;
  }

  public String getCodecs()
  {
    return this.codecs;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeZeroTermUtf8String(paramByteBuffer, this.mimeSubtypeName);
    IsoTypeWriter.writeZeroTermUtf8String(paramByteBuffer, this.profileLevelIdc);
    IsoTypeWriter.writeZeroTermUtf8String(paramByteBuffer, this.codecs);
    IsoTypeWriter.writeZeroTermUtf8String(paramByteBuffer, this.protection);
    IsoTypeWriter.writeZeroTermUtf8String(paramByteBuffer, this.languages);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.brandEntries.size());
    Iterator localIterator1 = this.brandEntries.entrySet().iterator();
    while (localIterator1.hasNext())
    {
      Map.Entry localEntry2 = (Map.Entry)localIterator1.next();
      IsoTypeWriter.writeZeroTermUtf8String(paramByteBuffer, (String)localEntry2.getKey());
      IsoTypeWriter.writeZeroTermUtf8String(paramByteBuffer, (String)localEntry2.getValue());
    }
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.idEntries.size());
    Iterator localIterator2 = this.idEntries.entrySet().iterator();
    while (localIterator2.hasNext())
    {
      Map.Entry localEntry1 = (Map.Entry)localIterator2.next();
      IsoTypeWriter.writeZeroTermUtf8String(paramByteBuffer, (String)localEntry1.getKey());
      IsoTypeWriter.writeZeroTermUtf8String(paramByteBuffer, (String)localEntry1.getValue());
    }
  }

  protected long getContentSize()
  {
    long l1 = 1L + (4L + (1 + Utf8.utf8StringLengthInBytes(this.mimeSubtypeName)) + (1 + Utf8.utf8StringLengthInBytes(this.profileLevelIdc)) + (1 + Utf8.utf8StringLengthInBytes(this.codecs)) + (1 + Utf8.utf8StringLengthInBytes(this.protection)) + (1 + Utf8.utf8StringLengthInBytes(this.languages)));
    Iterator localIterator1 = this.brandEntries.entrySet().iterator();
    while (localIterator1.hasNext())
    {
      Map.Entry localEntry2 = (Map.Entry)localIterator1.next();
      l1 = l1 + (1 + Utf8.utf8StringLengthInBytes((String)localEntry2.getKey())) + (1 + Utf8.utf8StringLengthInBytes((String)localEntry2.getValue()));
    }
    long l2 = l1 + 1L;
    Iterator localIterator2 = this.idEntries.entrySet().iterator();
    while (localIterator2.hasNext())
    {
      Map.Entry localEntry1 = (Map.Entry)localIterator2.next();
      l2 = l2 + (1 + Utf8.utf8StringLengthInBytes((String)localEntry1.getKey())) + (1 + Utf8.utf8StringLengthInBytes((String)localEntry1.getValue()));
    }
    return l2;
  }

  public Map<String, String> getIdEntries()
  {
    return this.idEntries;
  }

  public String getLanguages()
  {
    return this.languages;
  }

  public String getMimeSubtypeName()
  {
    return this.mimeSubtypeName;
  }

  public String getProfileLevelIdc()
  {
    return this.profileLevelIdc;
  }

  public String getProtection()
  {
    return this.protection;
  }

  public void setBrandEntries(Map<String, String> paramMap)
  {
    this.brandEntries = paramMap;
  }

  public void setCodecs(String paramString)
  {
    this.codecs = paramString;
  }

  public void setIdEntries(Map<String, String> paramMap)
  {
    this.idEntries = paramMap;
  }

  public void setLanguages(String paramString)
  {
    this.languages = paramString;
  }

  public void setMimeSubtypeName(String paramString)
  {
    this.mimeSubtypeName = paramString;
  }

  public void setProfileLevelIdc(String paramString)
  {
    this.profileLevelIdc = paramString;
  }

  public void setProtection(String paramString)
  {
    this.protection = paramString;
  }

  public static class BrandEntry
  {
    String iso_brand;
    String version;

    public BrandEntry(String paramString1, String paramString2)
    {
      this.iso_brand = paramString1;
      this.version = paramString2;
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      BrandEntry localBrandEntry;
      do
      {
        return true;
        if ((paramObject == null) || (getClass() != paramObject.getClass()))
          return false;
        localBrandEntry = (BrandEntry)paramObject;
        if (this.iso_brand != null)
        {
          if (this.iso_brand.equals(localBrandEntry.iso_brand));
        }
        else
          while (localBrandEntry.iso_brand != null)
            return false;
        if (this.version == null)
          break;
      }
      while (this.version.equals(localBrandEntry.version));
      while (true)
      {
        return false;
        if (localBrandEntry.version == null)
          break;
      }
    }

    public int hashCode()
    {
      if (this.iso_brand != null);
      for (int i = this.iso_brand.hashCode(); ; i = 0)
      {
        int j = i * 31;
        String str = this.version;
        int k = 0;
        if (str != null)
          k = this.version.hashCode();
        return j + k;
      }
    }
  }
}