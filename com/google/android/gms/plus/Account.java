package com.google.android.gms.plus;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;

public abstract interface Account
{
  @Deprecated
  public abstract void clearDefaultAccount(GoogleApiClient paramGoogleApiClient);

  public abstract String getAccountName(GoogleApiClient paramGoogleApiClient);

  public abstract PendingResult<Status> revokeAccessAndDisconnect(GoogleApiClient paramGoogleApiClient);
}