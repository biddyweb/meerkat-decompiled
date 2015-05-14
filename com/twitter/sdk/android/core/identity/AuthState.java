package com.twitter.sdk.android.core.identity;

import android.app.Activity;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import java.util.concurrent.atomic.AtomicReference;

class AuthState
{
  final AtomicReference<AuthHandler> authHandlerRef = new AtomicReference(null);

  public boolean beginAuthorize(Activity paramActivity, AuthHandler paramAuthHandler)
  {
    boolean bool1 = false;
    if (isAuthorizeInProgress())
      Fabric.getLogger().w("Twitter", "Authorize already in progress");
    do
    {
      boolean bool2;
      do
      {
        return bool1;
        bool2 = paramAuthHandler.authorize(paramActivity);
        bool1 = false;
      }
      while (!bool2);
      bool1 = this.authHandlerRef.compareAndSet(null, paramAuthHandler);
    }
    while (bool1);
    Fabric.getLogger().w("Twitter", "Failed to update authHandler, authorize already in progress.");
    return bool1;
  }

  public void endAuthorize()
  {
    this.authHandlerRef.set(null);
  }

  public AuthHandler getAuthHandler()
  {
    return (AuthHandler)this.authHandlerRef.get();
  }

  public boolean isAuthorizeInProgress()
  {
    return this.authHandlerRef.get() != null;
  }
}