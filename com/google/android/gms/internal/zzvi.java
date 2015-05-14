package com.google.android.gms.internal;

import com.google.android.gms.tagmanager.zzbf;
import org.json.JSONException;

public final class zzvi
{
  public static zzvh zzaBX = new zzvh()
  {
    public Object zzn(byte[] paramAnonymousArrayOfByte)
      throws zzvl.zzg
    {
      if (paramAnonymousArrayOfByte == null)
        throw new zzvl.zzg("Cannot parse a null byte[]");
      if (paramAnonymousArrayOfByte.length == 0)
        throw new zzvl.zzg("Cannot parse a 0 length byte[]");
      try
      {
        zzvl.zzc localzzc = zzvf.zzdd(new String(paramAnonymousArrayOfByte));
        if (localzzc != null)
          zzbf.zzab("The container was successfully parsed from the resource");
        return localzzc;
      }
      catch (JSONException localJSONException)
      {
        throw new zzvl.zzg("The resource data is corrupted. The container cannot be extracted from the binary data");
      }
      catch (zzvl.zzg localzzg)
      {
      }
      throw new zzvl.zzg("The resource data is invalid. The container cannot be extracted from the binary data");
    }
  };
}