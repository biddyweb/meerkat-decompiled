package com.digits.sdk.android;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class ContactsUploadResult$1
  implements Parcelable.Creator<ContactsUploadResult>
{
  public ContactsUploadResult createFromParcel(Parcel paramParcel)
  {
    return new ContactsUploadResult(paramParcel);
  }

  public ContactsUploadResult[] newArray(int paramInt)
  {
    return new ContactsUploadResult[paramInt];
  }
}