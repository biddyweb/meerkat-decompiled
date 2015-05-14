package com.google.android.exoplayer.drm;

import android.annotation.TargetApi;
import android.media.MediaDrm.KeyRequest;
import android.media.MediaDrm.ProvisionRequest;
import java.util.UUID;

@TargetApi(18)
public abstract interface MediaDrmCallback
{
  public abstract byte[] executeKeyRequest(UUID paramUUID, MediaDrm.KeyRequest paramKeyRequest)
    throws Exception;

  public abstract byte[] executeProvisionRequest(UUID paramUUID, MediaDrm.ProvisionRequest paramProvisionRequest)
    throws Exception;
}