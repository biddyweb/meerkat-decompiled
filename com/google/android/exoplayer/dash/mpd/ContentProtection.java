package com.google.android.exoplayer.dash.mpd;

import com.google.android.exoplayer.util.Util;
import java.util.Arrays;
import java.util.UUID;

public class ContentProtection
{
  public final byte[] data;
  public final String schemeUriId;
  public final UUID uuid;

  public ContentProtection(String paramString, UUID paramUUID, byte[] paramArrayOfByte)
  {
    this.schemeUriId = paramString;
    this.uuid = paramUUID;
    this.data = paramArrayOfByte;
  }

  public boolean equals(Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof ContentProtection))
      bool = false;
    ContentProtection localContentProtection;
    do
    {
      do
        return bool;
      while (paramObject == this);
      localContentProtection = (ContentProtection)paramObject;
    }
    while ((this.schemeUriId.equals(localContentProtection.schemeUriId)) && (Util.areEqual(this.uuid, localContentProtection.uuid)) && (Arrays.equals(this.data, localContentProtection.data)));
    return false;
  }

  public int hashCode()
  {
    int i = 37 + this.schemeUriId.hashCode();
    if (this.uuid != null)
      i = i * 37 + this.uuid.hashCode();
    if (this.data != null)
      i = i * 37 + Arrays.hashCode(this.data);
    return i;
  }
}