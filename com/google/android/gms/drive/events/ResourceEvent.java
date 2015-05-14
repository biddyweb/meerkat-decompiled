package com.google.android.gms.drive.events;

import com.google.android.gms.drive.DriveId;

public abstract interface ResourceEvent extends DriveEvent
{
  public abstract DriveId getDriveId();
}