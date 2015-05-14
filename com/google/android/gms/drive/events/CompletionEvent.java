package com.google.android.gms.drive.events;

import android.os.IBinder;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import android.text.TextUtils;
import com.google.android.gms.common.data.zza;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.MetadataChangeSet;
import com.google.android.gms.drive.internal.zzaj;
import com.google.android.gms.drive.internal.zzaj.zza;
import com.google.android.gms.drive.internal.zzw;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.internal.zzlz;
import com.google.android.gms.internal.zzmi;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public final class CompletionEvent
  implements SafeParcelable, ResourceEvent
{
  public static final Parcelable.Creator<CompletionEvent> CREATOR = new zzb();
  public static final int STATUS_CANCELED = 3;
  public static final int STATUS_CONFLICT = 2;
  public static final int STATUS_FAILURE = 1;
  public static final int STATUS_SUCCESS;
  final int zzFG;
  final String zzHg;
  final DriveId zzRX;
  final ParcelFileDescriptor zzSP;
  final ParcelFileDescriptor zzSQ;
  final MetadataBundle zzSR;
  final List<String> zzSS;
  final IBinder zzST;
  private boolean zzSU = false;
  private boolean zzSV = false;
  private boolean zzSW = false;
  final int zzrX;

  CompletionEvent(int paramInt1, DriveId paramDriveId, String paramString, ParcelFileDescriptor paramParcelFileDescriptor1, ParcelFileDescriptor paramParcelFileDescriptor2, MetadataBundle paramMetadataBundle, List<String> paramList, int paramInt2, IBinder paramIBinder)
  {
    this.zzFG = paramInt1;
    this.zzRX = paramDriveId;
    this.zzHg = paramString;
    this.zzSP = paramParcelFileDescriptor1;
    this.zzSQ = paramParcelFileDescriptor2;
    this.zzSR = paramMetadataBundle;
    this.zzSS = paramList;
    this.zzrX = paramInt2;
    this.zzST = paramIBinder;
  }

  private void zzP(boolean paramBoolean)
  {
    zzkA();
    this.zzSW = true;
    zzlz.zza(this.zzSP);
    zzlz.zza(this.zzSQ);
    if (this.zzSR.zzc(zzmi.zzVU))
      ((zza)this.zzSR.zza(zzmi.zzVU)).release();
    if (this.zzST == null)
    {
      StringBuilder localStringBuilder2 = new StringBuilder().append("No callback on ");
      if (paramBoolean);
      for (String str2 = "snooze"; ; str2 = "dismiss")
      {
        zzw.zzs("CompletionEvent", str2);
        return;
      }
    }
    StringBuilder localStringBuilder1;
    try
    {
      zzaj.zza.zzaf(this.zzST).zzP(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      localStringBuilder1 = new StringBuilder().append("RemoteException on ");
      if (!paramBoolean);
    }
    for (String str1 = "snooze"; ; str1 = "dismiss")
    {
      zzw.zzs("CompletionEvent", str1 + ": " + localRemoteException);
      return;
    }
  }

  private void zzkA()
  {
    if (this.zzSW)
      throw new IllegalStateException("Event has already been dismissed or snoozed.");
  }

  public int describeContents()
  {
    return 0;
  }

  public void dismiss()
  {
    zzP(false);
  }

  public String getAccountName()
  {
    zzkA();
    return this.zzHg;
  }

  public InputStream getBaseContentsInputStream()
  {
    zzkA();
    if (this.zzSP == null)
      return null;
    if (this.zzSU)
      throw new IllegalStateException("getBaseInputStream() can only be called once per CompletionEvent instance.");
    this.zzSU = true;
    return new FileInputStream(this.zzSP.getFileDescriptor());
  }

  public DriveId getDriveId()
  {
    zzkA();
    return this.zzRX;
  }

  public InputStream getModifiedContentsInputStream()
  {
    zzkA();
    if (this.zzSQ == null)
      return null;
    if (this.zzSV)
      throw new IllegalStateException("getModifiedInputStream() can only be called once per CompletionEvent instance.");
    this.zzSV = true;
    return new FileInputStream(this.zzSQ.getFileDescriptor());
  }

  public MetadataChangeSet getModifiedMetadataChangeSet()
  {
    zzkA();
    if (this.zzSR != null)
      return new MetadataChangeSet(this.zzSR);
    return null;
  }

  public int getStatus()
  {
    zzkA();
    return this.zzrX;
  }

  public List<String> getTrackingTags()
  {
    zzkA();
    return new ArrayList(this.zzSS);
  }

  public int getType()
  {
    return 2;
  }

  public void snooze()
  {
    zzP(true);
  }

  public String toString()
  {
    if (this.zzSS == null);
    for (String str = "<null>"; ; str = "'" + TextUtils.join("','", this.zzSS) + "'")
    {
      Locale localLocale = Locale.US;
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = this.zzRX;
      arrayOfObject[1] = Integer.valueOf(this.zzrX);
      arrayOfObject[2] = str;
      return String.format(localLocale, "CompletionEvent [id=%s, status=%s, trackingTag=%s]", arrayOfObject);
    }
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }
}