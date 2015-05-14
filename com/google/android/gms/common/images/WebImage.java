package com.google.android.gms.common.images;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import org.json.JSONException;
import org.json.JSONObject;

public final class WebImage
  implements SafeParcelable
{
  public static final Parcelable.Creator<WebImage> CREATOR = new zzb();
  private final int zzFG;
  private final Uri zzOL;
  private final int zzli;
  private final int zzlj;

  WebImage(int paramInt1, Uri paramUri, int paramInt2, int paramInt3)
  {
    this.zzFG = paramInt1;
    this.zzOL = paramUri;
    this.zzli = paramInt2;
    this.zzlj = paramInt3;
  }

  public WebImage(Uri paramUri)
    throws IllegalArgumentException
  {
    this(paramUri, 0, 0);
  }

  public WebImage(Uri paramUri, int paramInt1, int paramInt2)
    throws IllegalArgumentException
  {
    this(1, paramUri, paramInt1, paramInt2);
    if (paramUri == null)
      throw new IllegalArgumentException("url cannot be null");
    if ((paramInt1 < 0) || (paramInt2 < 0))
      throw new IllegalArgumentException("width and height must not be negative");
  }

  public WebImage(JSONObject paramJSONObject)
    throws IllegalArgumentException
  {
    this(zze(paramJSONObject), paramJSONObject.optInt("width", 0), paramJSONObject.optInt("height", 0));
  }

  private static Uri zze(JSONObject paramJSONObject)
  {
    boolean bool = paramJSONObject.has("url");
    Object localObject = null;
    if (bool);
    try
    {
      Uri localUri = Uri.parse(paramJSONObject.getString("url"));
      localObject = localUri;
      return localObject;
    }
    catch (JSONException localJSONException)
    {
    }
    return null;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    WebImage localWebImage;
    do
    {
      return true;
      if ((paramObject == null) || (!(paramObject instanceof WebImage)))
        return false;
      localWebImage = (WebImage)paramObject;
    }
    while ((zzw.equal(this.zzOL, localWebImage.zzOL)) && (this.zzli == localWebImage.zzli) && (this.zzlj == localWebImage.zzlj));
    return false;
  }

  public int getHeight()
  {
    return this.zzlj;
  }

  public Uri getUrl()
  {
    return this.zzOL;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int getWidth()
  {
    return this.zzli;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this.zzOL;
    arrayOfObject[1] = Integer.valueOf(this.zzli);
    arrayOfObject[2] = Integer.valueOf(this.zzlj);
    return zzw.hashCode(arrayOfObject);
  }

  public JSONObject toJson()
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("url", this.zzOL.toString());
      localJSONObject.put("width", this.zzli);
      localJSONObject.put("height", this.zzlj);
      return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
    }
    return localJSONObject;
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Integer.valueOf(this.zzli);
    arrayOfObject[1] = Integer.valueOf(this.zzlj);
    arrayOfObject[2] = this.zzOL.toString();
    return String.format("Image %dx%d %s", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }
}