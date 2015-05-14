package com.google.android.gms.cast;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.images.WebImage;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.internal.zzjv;
import java.util.ArrayList;
import java.util.List;

public final class ApplicationMetadata
  implements SafeParcelable
{
  public static final Parcelable.Creator<ApplicationMetadata> CREATOR = new zza();
  String mName;
  private final int zzFG;
  String zzIm;
  List<WebImage> zzIn;
  List<String> zzIo;
  String zzIp;
  Uri zzIq;

  private ApplicationMetadata()
  {
    this.zzFG = 1;
    this.zzIn = new ArrayList();
    this.zzIo = new ArrayList();
  }

  ApplicationMetadata(int paramInt, String paramString1, String paramString2, List<WebImage> paramList, List<String> paramList1, String paramString3, Uri paramUri)
  {
    this.zzFG = paramInt;
    this.zzIm = paramString1;
    this.mName = paramString2;
    this.zzIn = paramList;
    this.zzIo = paramList1;
    this.zzIp = paramString3;
    this.zzIq = paramUri;
  }

  public boolean areNamespacesSupported(List<String> paramList)
  {
    return (this.zzIo != null) && (this.zzIo.containsAll(paramList));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    ApplicationMetadata localApplicationMetadata;
    do
    {
      return true;
      if (!(paramObject instanceof ApplicationMetadata))
        return false;
      localApplicationMetadata = (ApplicationMetadata)paramObject;
    }
    while ((zzjv.zza(this.zzIm, localApplicationMetadata.zzIm)) && (zzjv.zza(this.zzIn, localApplicationMetadata.zzIn)) && (zzjv.zza(this.mName, localApplicationMetadata.mName)) && (zzjv.zza(this.zzIo, localApplicationMetadata.zzIo)) && (zzjv.zza(this.zzIp, localApplicationMetadata.zzIp)) && (zzjv.zza(this.zzIq, localApplicationMetadata.zzIq)));
    return false;
  }

  public String getApplicationId()
  {
    return this.zzIm;
  }

  public List<WebImage> getImages()
  {
    return this.zzIn;
  }

  public String getName()
  {
    return this.mName;
  }

  public String getSenderAppIdentifier()
  {
    return this.zzIp;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[7];
    arrayOfObject[0] = Integer.valueOf(this.zzFG);
    arrayOfObject[1] = this.zzIm;
    arrayOfObject[2] = this.mName;
    arrayOfObject[3] = this.zzIn;
    arrayOfObject[4] = this.zzIo;
    arrayOfObject[5] = this.zzIp;
    arrayOfObject[6] = this.zzIq;
    return zzw.hashCode(arrayOfObject);
  }

  public boolean isNamespaceSupported(String paramString)
  {
    return (this.zzIo != null) && (this.zzIo.contains(paramString));
  }

  public String toString()
  {
    StringBuilder localStringBuilder1 = new StringBuilder().append("applicationId: ").append(this.zzIm).append(", name: ").append(this.mName).append(", images.count: ");
    int i;
    StringBuilder localStringBuilder2;
    int j;
    if (this.zzIn == null)
    {
      i = 0;
      localStringBuilder2 = localStringBuilder1.append(i).append(", namespaces.count: ");
      List localList = this.zzIo;
      j = 0;
      if (localList != null)
        break label118;
    }
    while (true)
    {
      return j + ", senderAppIdentifier: " + this.zzIp + ", senderAppLaunchUrl: " + this.zzIq;
      i = this.zzIn.size();
      break;
      label118: j = this.zzIo.size();
    }
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }

  public Uri zzhh()
  {
    return this.zzIq;
  }
}