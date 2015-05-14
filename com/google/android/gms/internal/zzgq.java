package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.Collections;
import java.util.List;

@zzgi
public final class zzgq
  implements SafeParcelable
{
  public static final zzgr CREATOR = new zzgr();
  public final int errorCode;
  public final int orientation;
  public final int versionCode;
  public final List<String> zzst;
  public final List<String> zzsu;
  public final long zzsx;
  public final String zzus;
  public final String zzwG;
  public final long zzwH;
  public final boolean zzwI;
  public final long zzwJ;
  public final List<String> zzwK;
  public final String zzwL;
  public final long zzwM;
  public final String zzwN;
  public final boolean zzwO;
  public final String zzwP;
  public final String zzwQ;
  public final boolean zzwR;
  public final boolean zzwS;
  public final boolean zzwT;
  public final boolean zzwU;
  public final boolean zzwv;

  public zzgq(int paramInt)
  {
    this(11, null, null, null, paramInt, null, -1L, false, -1L, null, -1L, -1, null, -1L, null, false, null, null, false, false, false, true, false);
  }

  public zzgq(int paramInt, long paramLong)
  {
    this(11, null, null, null, paramInt, null, -1L, false, -1L, null, paramLong, -1, null, -1L, null, false, null, null, false, false, false, true, false);
  }

  zzgq(int paramInt1, String paramString1, String paramString2, List<String> paramList1, int paramInt2, List<String> paramList2, long paramLong1, boolean paramBoolean1, long paramLong2, List<String> paramList3, long paramLong3, int paramInt3, String paramString3, long paramLong4, String paramString4, boolean paramBoolean2, String paramString5, String paramString6, boolean paramBoolean3, boolean paramBoolean4, boolean paramBoolean5, boolean paramBoolean6, boolean paramBoolean7)
  {
    this.versionCode = paramInt1;
    this.zzus = paramString1;
    this.zzwG = paramString2;
    List localList1;
    List localList2;
    if (paramList1 != null)
    {
      localList1 = Collections.unmodifiableList(paramList1);
      this.zzst = localList1;
      this.errorCode = paramInt2;
      if (paramList2 == null)
        break label182;
      localList2 = Collections.unmodifiableList(paramList2);
      label55: this.zzsu = localList2;
      this.zzwH = paramLong1;
      this.zzwI = paramBoolean1;
      this.zzwJ = paramLong2;
      if (paramList3 == null)
        break label188;
    }
    label182: label188: for (List localList3 = Collections.unmodifiableList(paramList3); ; localList3 = null)
    {
      this.zzwK = localList3;
      this.zzsx = paramLong3;
      this.orientation = paramInt3;
      this.zzwL = paramString3;
      this.zzwM = paramLong4;
      this.zzwN = paramString4;
      this.zzwO = paramBoolean2;
      this.zzwP = paramString5;
      this.zzwQ = paramString6;
      this.zzwR = paramBoolean3;
      this.zzwS = paramBoolean4;
      this.zzwv = paramBoolean5;
      this.zzwT = paramBoolean6;
      this.zzwU = paramBoolean7;
      return;
      localList1 = null;
      break;
      localList2 = null;
      break label55;
    }
  }

  public zzgq(String paramString1, String paramString2, List<String> paramList1, List<String> paramList2, long paramLong1, boolean paramBoolean1, long paramLong2, List<String> paramList3, long paramLong3, int paramInt, String paramString3, long paramLong4, String paramString4, String paramString5, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4, boolean paramBoolean5, boolean paramBoolean6)
  {
    this(11, paramString1, paramString2, paramList1, -2, paramList2, paramLong1, paramBoolean1, paramLong2, paramList3, paramLong3, paramInt, paramString3, paramLong4, paramString4, false, null, paramString5, paramBoolean2, paramBoolean3, paramBoolean4, paramBoolean5, paramBoolean6);
  }

  public zzgq(String paramString1, String paramString2, List<String> paramList1, List<String> paramList2, long paramLong1, boolean paramBoolean1, long paramLong2, List<String> paramList3, long paramLong3, int paramInt, String paramString3, long paramLong4, String paramString4, boolean paramBoolean2, String paramString5, String paramString6, boolean paramBoolean3, boolean paramBoolean4, boolean paramBoolean5, boolean paramBoolean6, boolean paramBoolean7)
  {
    this(11, paramString1, paramString2, paramList1, -2, paramList2, paramLong1, paramBoolean1, paramLong2, paramList3, paramLong3, paramInt, paramString3, paramLong4, paramString4, paramBoolean2, paramString5, paramString6, paramBoolean3, paramBoolean4, paramBoolean5, paramBoolean6, paramBoolean7);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzgr.zza(this, paramParcel, paramInt);
  }
}