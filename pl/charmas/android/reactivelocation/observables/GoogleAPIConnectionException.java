package pl.charmas.android.reactivelocation.observables;

import com.google.android.gms.common.ConnectionResult;

public class GoogleAPIConnectionException extends RuntimeException
{
  private final ConnectionResult connectionResult;

  GoogleAPIConnectionException(String paramString, ConnectionResult paramConnectionResult)
  {
    super(paramString);
    this.connectionResult = paramConnectionResult;
  }

  public ConnectionResult getConnectionResult()
  {
    return this.connectionResult;
  }
}