package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.dece;

import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;

public class AssetInformationBox$Entry
{
  public String assetId;
  public String namespace;
  public String profileLevelIdc;

  public AssetInformationBox$Entry(String paramString1, String paramString2, String paramString3)
  {
    this.namespace = paramString1;
    this.profileLevelIdc = paramString2;
    this.assetId = paramString3;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    Entry localEntry;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localEntry = (Entry)paramObject;
      if (!this.assetId.equals(localEntry.assetId))
        return false;
      if (!this.namespace.equals(localEntry.namespace))
        return false;
    }
    while (this.profileLevelIdc.equals(localEntry.profileLevelIdc));
    return false;
  }

  public int getSize()
  {
    return 3 + Utf8.utf8StringLengthInBytes(this.namespace) + Utf8.utf8StringLengthInBytes(this.profileLevelIdc) + Utf8.utf8StringLengthInBytes(this.assetId);
  }

  public int hashCode()
  {
    return 31 * (31 * this.namespace.hashCode() + this.profileLevelIdc.hashCode()) + this.assetId.hashCode();
  }

  public String toString()
  {
    return "{namespace='" + this.namespace + '\'' + ", profileLevelIdc='" + this.profileLevelIdc + '\'' + ", assetId='" + this.assetId + '\'' + '}';
  }
}