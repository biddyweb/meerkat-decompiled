package com.google.android.gms.drive.metadata;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;

public class CustomPropertyKey
  implements SafeParcelable
{
  public static final Parcelable.Creator<CustomPropertyKey> CREATOR = new zzc();
  public static final int PRIVATE = 1;
  public static final int PUBLIC;
  private static final Pattern zzVk = Pattern.compile("[\\w.!@$%^&*()/-]+");
  final int mVisibility;
  final int zzFG;
  final String zzqd;

  CustomPropertyKey(int paramInt1, String paramString, int paramInt2)
  {
    zzx.zzb(paramString, "key");
    zzx.zzb(zzVk.matcher(paramString).matches(), "key name characters must be alphanumeric or one of .!@$%^&*()-_/");
    if ((paramInt2 == 0) || (paramInt2 == i));
    while (true)
    {
      zzx.zzb(i, "visibility must be either PUBLIC or PRIVATE");
      this.zzFG = paramInt1;
      this.zzqd = paramString;
      this.mVisibility = paramInt2;
      return;
      i = 0;
    }
  }

  public CustomPropertyKey(String paramString, int paramInt)
  {
    this(1, paramString, paramInt);
  }

  public static CustomPropertyKey fromJson(JSONObject paramJSONObject)
    throws JSONException
  {
    return new CustomPropertyKey(paramJSONObject.getString("key"), paramJSONObject.getInt("visibility"));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    boolean bool = true;
    if (paramObject == null);
    do
    {
      return false;
      if (paramObject == this)
        return bool;
    }
    while (!(paramObject instanceof CustomPropertyKey));
    CustomPropertyKey localCustomPropertyKey = (CustomPropertyKey)paramObject;
    if ((localCustomPropertyKey.getKey().equals(this.zzqd)) && (localCustomPropertyKey.getVisibility() == this.mVisibility));
    while (true)
    {
      return bool;
      bool = false;
    }
  }

  public String getKey()
  {
    return this.zzqd;
  }

  public int getVisibility()
  {
    return this.mVisibility;
  }

  public int hashCode()
  {
    return (this.zzqd + this.mVisibility).hashCode();
  }

  public JSONObject toJson()
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    localJSONObject.put("key", getKey());
    localJSONObject.put("visibility", getVisibility());
    return localJSONObject;
  }

  public String toString()
  {
    return "CustomPropertyKey(" + this.zzqd + "," + this.mVisibility + ")";
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }
}