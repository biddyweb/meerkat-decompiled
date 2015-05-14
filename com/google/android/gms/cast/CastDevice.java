package com.google.android.gms.cast;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.images.WebImage;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzjv;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class CastDevice
  implements SafeParcelable
{
  public static final Parcelable.Creator<CastDevice> CREATOR = new zzb();
  private final int zzFG;
  private String zzIE;
  String zzIF;
  private Inet4Address zzIG;
  private String zzIH;
  private String zzII;
  private String zzIJ;
  private int zzIK;
  private List<WebImage> zzIL;
  private int zzIM;
  private int zzrX;

  private CastDevice()
  {
    this(3, null, null, null, null, null, -1, new ArrayList(), 0, -1);
  }

  CastDevice(int paramInt1, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, int paramInt2, List<WebImage> paramList, int paramInt3, int paramInt4)
  {
    this.zzFG = paramInt1;
    this.zzIE = paramString1;
    this.zzIF = paramString2;
    if (this.zzIF != null);
    try
    {
      InetAddress localInetAddress = InetAddress.getByName(this.zzIF);
      if ((localInetAddress instanceof Inet4Address))
        this.zzIG = ((Inet4Address)localInetAddress);
      this.zzIH = paramString3;
      this.zzII = paramString4;
      this.zzIJ = paramString5;
      this.zzIK = paramInt2;
      this.zzIL = paramList;
      this.zzIM = paramInt3;
      this.zzrX = paramInt4;
      return;
    }
    catch (UnknownHostException localUnknownHostException)
    {
      while (true)
        this.zzIG = null;
    }
  }

  public static CastDevice getFromBundle(Bundle paramBundle)
  {
    if (paramBundle == null)
      return null;
    paramBundle.setClassLoader(CastDevice.class.getClassLoader());
    return (CastDevice)paramBundle.getParcelable("com.google.android.gms.cast.EXTRA_CAST_DEVICE");
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    CastDevice localCastDevice;
    do
    {
      do
      {
        return true;
        if (!(paramObject instanceof CastDevice))
          return false;
        localCastDevice = (CastDevice)paramObject;
        if (getDeviceId() != null)
          break;
      }
      while (localCastDevice.getDeviceId() == null);
      return false;
    }
    while ((zzjv.zza(this.zzIE, localCastDevice.zzIE)) && (zzjv.zza(this.zzIG, localCastDevice.zzIG)) && (zzjv.zza(this.zzII, localCastDevice.zzII)) && (zzjv.zza(this.zzIH, localCastDevice.zzIH)) && (zzjv.zza(this.zzIJ, localCastDevice.zzIJ)) && (this.zzIK == localCastDevice.zzIK) && (zzjv.zza(this.zzIL, localCastDevice.zzIL)) && (this.zzIM == localCastDevice.zzIM) && (this.zzrX == localCastDevice.zzrX));
    return false;
  }

  public int getCapabilities()
  {
    return this.zzIM;
  }

  public String getDeviceId()
  {
    return this.zzIE;
  }

  public String getDeviceVersion()
  {
    return this.zzIJ;
  }

  public String getFriendlyName()
  {
    return this.zzIH;
  }

  public WebImage getIcon(int paramInt1, int paramInt2)
  {
    Object localObject1 = null;
    if (this.zzIL.isEmpty())
      return null;
    if ((paramInt1 <= 0) || (paramInt2 <= 0))
      return (WebImage)this.zzIL.get(0);
    Iterator localIterator = this.zzIL.iterator();
    Object localObject2 = null;
    Object localObject3;
    int i;
    int j;
    Object localObject4;
    if (localIterator.hasNext())
    {
      localObject3 = (WebImage)localIterator.next();
      i = ((WebImage)localObject3).getWidth();
      j = ((WebImage)localObject3).getHeight();
      if ((i >= paramInt1) && (j >= paramInt2))
      {
        if ((localObject2 != null) && ((((WebImage)localObject2).getWidth() <= i) || (((WebImage)localObject2).getHeight() <= j)))
          break label223;
        Object localObject5 = localObject1;
        localObject4 = localObject3;
        localObject3 = localObject5;
      }
    }
    while (true)
    {
      localObject2 = localObject4;
      localObject1 = localObject3;
      break;
      if ((i < paramInt1) && (j < paramInt2) && ((localObject1 == null) || ((localObject1.getWidth() < i) && (localObject1.getHeight() < j))))
      {
        localObject4 = localObject2;
        continue;
        if (localObject2 != null);
        while (true)
        {
          return localObject2;
          if (localObject1 != null)
            localObject2 = localObject1;
          else
            localObject2 = (WebImage)this.zzIL.get(0);
        }
      }
      else
      {
        label223: localObject3 = localObject1;
        localObject4 = localObject2;
      }
    }
  }

  public List<WebImage> getIcons()
  {
    return Collections.unmodifiableList(this.zzIL);
  }

  public Inet4Address getIpAddress()
  {
    return this.zzIG;
  }

  public String getModelName()
  {
    return this.zzII;
  }

  public int getServicePort()
  {
    return this.zzIK;
  }

  public int getStatus()
  {
    return this.zzrX;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public boolean hasIcons()
  {
    return !this.zzIL.isEmpty();
  }

  public int hashCode()
  {
    if (this.zzIE == null)
      return 0;
    return this.zzIE.hashCode();
  }

  public boolean isOnLocalNetwork()
  {
    return !this.zzIE.startsWith("__cast_nearby__");
  }

  public boolean isSameDevice(CastDevice paramCastDevice)
  {
    if (paramCastDevice == null);
    do
    {
      return false;
      if (getDeviceId() != null)
        break;
    }
    while (paramCastDevice.getDeviceId() != null);
    return true;
    return zzjv.zza(getDeviceId(), paramCastDevice.getDeviceId());
  }

  public void putInBundle(Bundle paramBundle)
  {
    if (paramBundle == null)
      return;
    paramBundle.putParcelable("com.google.android.gms.cast.EXTRA_CAST_DEVICE", this);
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.zzIH;
    arrayOfObject[1] = this.zzIE;
    return String.format("\"%s\" (%s)", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }
}