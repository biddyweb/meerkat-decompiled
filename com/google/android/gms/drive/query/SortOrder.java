package com.google.android.gms.drive.query;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.metadata.SortableMetadataField;
import com.google.android.gms.drive.query.internal.FieldWithSortOrder;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class SortOrder
  implements SafeParcelable
{
  public static final Parcelable.Creator<SortOrder> CREATOR = new zzb();
  final int zzFG;
  final List<FieldWithSortOrder> zzWu;
  final boolean zzWv;

  SortOrder(int paramInt, List<FieldWithSortOrder> paramList, boolean paramBoolean)
  {
    this.zzFG = paramInt;
    this.zzWu = paramList;
    this.zzWv = paramBoolean;
  }

  private SortOrder(List<FieldWithSortOrder> paramList, boolean paramBoolean)
  {
    this(1, paramList, paramBoolean);
  }

  public int describeContents()
  {
    return 0;
  }

  public String toString()
  {
    Locale localLocale = Locale.US;
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = TextUtils.join(",", this.zzWu);
    arrayOfObject[1] = Boolean.valueOf(this.zzWv);
    return String.format(localLocale, "SortOrder[%s, %s]", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }

  public static class Builder
  {
    private final List<FieldWithSortOrder> zzWu = new ArrayList();
    private boolean zzWv = false;

    public Builder addSortAscending(SortableMetadataField paramSortableMetadataField)
    {
      this.zzWu.add(new FieldWithSortOrder(paramSortableMetadataField.getName(), true));
      return this;
    }

    public Builder addSortDescending(SortableMetadataField paramSortableMetadataField)
    {
      this.zzWu.add(new FieldWithSortOrder(paramSortableMetadataField.getName(), false));
      return this;
    }

    public SortOrder build()
    {
      return new SortOrder(this.zzWu, this.zzWv, null);
    }
  }
}