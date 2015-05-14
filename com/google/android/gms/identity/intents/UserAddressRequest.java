package com.google.android.gms.identity.intents;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.identity.intents.model.CountrySpecification;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

public final class UserAddressRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<UserAddressRequest> CREATOR = new zza();
  private final int zzFG;
  List<CountrySpecification> zzalr;

  UserAddressRequest()
  {
    this.zzFG = 1;
  }

  UserAddressRequest(int paramInt, List<CountrySpecification> paramList)
  {
    this.zzFG = paramInt;
    this.zzalr = paramList;
  }

  public static Builder newBuilder()
  {
    UserAddressRequest localUserAddressRequest = new UserAddressRequest();
    localUserAddressRequest.getClass();
    return new Builder(null);
  }

  public int describeContents()
  {
    return 0;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }

  public final class Builder
  {
    private Builder()
    {
    }

    public Builder addAllowedCountrySpecification(CountrySpecification paramCountrySpecification)
    {
      if (UserAddressRequest.this.zzalr == null)
        UserAddressRequest.this.zzalr = new ArrayList();
      UserAddressRequest.this.zzalr.add(paramCountrySpecification);
      return this;
    }

    public Builder addAllowedCountrySpecifications(Collection<CountrySpecification> paramCollection)
    {
      if (UserAddressRequest.this.zzalr == null)
        UserAddressRequest.this.zzalr = new ArrayList();
      UserAddressRequest.this.zzalr.addAll(paramCollection);
      return this;
    }

    public UserAddressRequest build()
    {
      if (UserAddressRequest.this.zzalr != null)
        UserAddressRequest.this.zzalr = Collections.unmodifiableList(UserAddressRequest.this.zzalr);
      return UserAddressRequest.this;
    }
  }
}