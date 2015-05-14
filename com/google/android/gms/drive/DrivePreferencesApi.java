package com.google.android.gms.drive;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;

public abstract interface DrivePreferencesApi
{
  public abstract PendingResult<FileUploadPreferencesResult> getFileUploadPreferences(GoogleApiClient paramGoogleApiClient);

  public abstract PendingResult<Status> setFileUploadPreferences(GoogleApiClient paramGoogleApiClient, FileUploadPreferences paramFileUploadPreferences);

  public static abstract interface FileUploadPreferencesResult extends Result
  {
    public abstract FileUploadPreferences getFileUploadPreferences();
  }
}