package co.getair.meerkat.dtos;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class GoLiveParams
  implements Parcelable
{
  public static final Parcelable.Creator<GoLiveParams> CREATOR = new Parcelable.Creator()
  {
    public GoLiveParams createFromParcel(Parcel paramAnonymousParcel)
    {
      return new GoLiveParams(paramAnonymousParcel, null);
    }

    public GoLiveParams[] newArray(int paramAnonymousInt)
    {
      return new GoLiveParams[paramAnonymousInt];
    }
  };
  String caption;

  private GoLiveParams(Parcel paramParcel)
  {
    this.caption = paramParcel.readString();
  }

  public GoLiveParams(String paramString)
  {
    this.caption = paramString;
  }

  public int describeContents()
  {
    return 0;
  }

  public String getCaption()
  {
    return this.caption;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.caption);
  }
}