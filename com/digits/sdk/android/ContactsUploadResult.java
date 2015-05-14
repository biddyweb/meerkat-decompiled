package com.digits.sdk.android;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class ContactsUploadResult
  implements Parcelable
{
  public static final Parcelable.Creator<ContactsUploadResult> CREATOR = new ContactsUploadResult.1();
  public final int successCount;
  public final int totalCount;

  ContactsUploadResult(int paramInt1, int paramInt2)
  {
    this.successCount = paramInt1;
    this.totalCount = paramInt2;
  }

  ContactsUploadResult(Parcel paramParcel)
  {
    this.successCount = paramParcel.readInt();
    this.totalCount = paramParcel.readInt();
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(this.successCount);
    paramParcel.writeInt(this.totalCount);
  }
}