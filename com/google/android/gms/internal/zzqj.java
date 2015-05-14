package com.google.android.gms.internal;

import android.os.Parcelable.Creator;
import android.util.Log;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.safeparcel.zzc;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public abstract class zzqj extends zzd
{
  private final String TAG = "SafeDataBufferRef";

  public zzqj(DataHolder paramDataHolder, int paramInt)
  {
    super(paramDataHolder, paramInt);
  }

  protected int zzC(String paramString, int paramInt)
  {
    if ((zzba(paramString)) && (!zzbc(paramString)))
      paramInt = getInteger(paramString);
    return paramInt;
  }

  protected float zza(String paramString, float paramFloat)
  {
    if ((zzba(paramString)) && (!zzbc(paramString)))
      paramFloat = getFloat(paramString);
    return paramFloat;
  }

  protected <E extends SafeParcelable> E zza(String paramString, Parcelable.Creator<E> paramCreator)
  {
    byte[] arrayOfByte = zzd(paramString, null);
    if (arrayOfByte == null)
      return null;
    return zzc.zza(arrayOfByte, paramCreator);
  }

  protected <E extends SafeParcelable> List<E> zza(String paramString, Parcelable.Creator<E> paramCreator, List<E> paramList)
  {
    byte[] arrayOfByte = zzd(paramString, null);
    if (arrayOfByte == null);
    do
      while (true)
      {
        return paramList;
        try
        {
          zzwo localzzwo = zzwo.zzr(arrayOfByte);
          if (localzzwo.zzaHn != null)
          {
            ArrayList localArrayList = new ArrayList(localzzwo.zzaHn.length);
            byte[][] arrayOfByte1 = localzzwo.zzaHn;
            int i = arrayOfByte1.length;
            for (int j = 0; j < i; j++)
              localArrayList.add(zzc.zza(arrayOfByte1[j], paramCreator));
            return localArrayList;
          }
        }
        catch (zzwx localzzwx)
        {
        }
      }
    while (!Log.isLoggable("SafeDataBufferRef", 6));
    Log.e("SafeDataBufferRef", "Cannot parse byte[]", localzzwx);
    return paramList;
  }

  protected List<Integer> zza(String paramString, List<Integer> paramList)
  {
    byte[] arrayOfByte = zzd(paramString, null);
    if (arrayOfByte == null);
    do
      while (true)
      {
        return paramList;
        try
        {
          zzwo localzzwo = zzwo.zzr(arrayOfByte);
          if (localzzwo.zzaHm != null)
          {
            ArrayList localArrayList = new ArrayList(localzzwo.zzaHm.length);
            for (int i = 0; i < localzzwo.zzaHm.length; i++)
              localArrayList.add(Integer.valueOf(localzzwo.zzaHm[i]));
            return localArrayList;
          }
        }
        catch (zzwx localzzwx)
        {
        }
      }
    while (!Log.isLoggable("SafeDataBufferRef", 6));
    Log.e("SafeDataBufferRef", "Cannot parse byte[]", localzzwx);
    return paramList;
  }

  protected List<String> zzb(String paramString, List<String> paramList)
  {
    byte[] arrayOfByte = zzd(paramString, null);
    if (arrayOfByte == null);
    do
      while (true)
      {
        return paramList;
        try
        {
          zzwo localzzwo = zzwo.zzr(arrayOfByte);
          if (localzzwo.zzaHl != null)
          {
            List localList = Arrays.asList(localzzwo.zzaHl);
            return localList;
          }
        }
        catch (zzwx localzzwx)
        {
        }
      }
    while (!Log.isLoggable("SafeDataBufferRef", 6));
    Log.e("SafeDataBufferRef", "Cannot parse byte[]", localzzwx);
    return paramList;
  }

  protected byte[] zzd(String paramString, byte[] paramArrayOfByte)
  {
    if ((zzba(paramString)) && (!zzbc(paramString)))
      paramArrayOfByte = getByteArray(paramString);
    return paramArrayOfByte;
  }

  protected boolean zzj(String paramString, boolean paramBoolean)
  {
    if ((zzba(paramString)) && (!zzbc(paramString)))
      paramBoolean = getBoolean(paramString);
    return paramBoolean;
  }

  protected String zzz(String paramString1, String paramString2)
  {
    if ((zzba(paramString1)) && (!zzbc(paramString1)))
      paramString2 = getString(paramString1);
    return paramString2;
  }
}