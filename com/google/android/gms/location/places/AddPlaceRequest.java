package com.google.android.gms.location.places;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.maps.model.LatLng;
import java.util.ArrayList;
import java.util.List;

public class AddPlaceRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<AddPlaceRequest> CREATOR = new zza();
  private final String mName;
  final int zzFG;
  private final String zzYy;
  private final LatLng zzant;
  private final List<Integer> zzanu;
  private final String zzanv;
  private final Uri zzanw;

  AddPlaceRequest(int paramInt, String paramString1, LatLng paramLatLng, String paramString2, List<Integer> paramList, String paramString3, Uri paramUri)
  {
    this.zzFG = paramInt;
    this.mName = zzx.zzbn(paramString1);
    this.zzant = ((LatLng)zzx.zzl(paramLatLng));
    this.zzYy = paramString2;
    this.zzanu = new ArrayList(paramList);
    if ((!TextUtils.isEmpty(paramString3)) || (paramUri != null));
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzb(bool, "One of phone number or URI should be provided.");
      this.zzanv = paramString3;
      this.zzanw = paramUri;
      return;
    }
  }

  public AddPlaceRequest(String paramString1, LatLng paramLatLng, String paramString2, List<Integer> paramList, Uri paramUri)
  {
    this(paramString1, paramLatLng, paramString2, paramList, null, (Uri)zzx.zzl(paramUri));
  }

  public AddPlaceRequest(String paramString1, LatLng paramLatLng, String paramString2, List<Integer> paramList, String paramString3)
  {
    this(paramString1, paramLatLng, paramString2, paramList, zzx.zzbn(paramString3), null);
  }

  public AddPlaceRequest(String paramString1, LatLng paramLatLng, String paramString2, List<Integer> paramList, String paramString3, Uri paramUri)
  {
    this(0, paramString1, paramLatLng, paramString2, paramList, paramString3, paramUri);
  }

  public int describeContents()
  {
    return 0;
  }

  public String getAddress()
  {
    return this.zzYy;
  }

  public LatLng getLatLng()
  {
    return this.zzant;
  }

  public String getName()
  {
    return this.mName;
  }

  public String getPhoneNumber()
  {
    return this.zzanv;
  }

  public List<Integer> getPlaceTypes()
  {
    return this.zzanu;
  }

  public Uri getWebsiteUri()
  {
    return this.zzanw;
  }

  public String toString()
  {
    return zzw.zzk(this).zza("name", this.mName).zza("latLng", this.zzant).zza("address", this.zzYy).zza("placeTypes", this.zzanu).zza("phoneNumer", this.zzanv).zza("websiteUri", this.zzanw).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }
}