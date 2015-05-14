package pl.charmas.android.reactivelocation.observables;

public class GoogleAPIConnectionSuspendedException extends RuntimeException
{
  private final int cause;

  GoogleAPIConnectionSuspendedException(int paramInt)
  {
    this.cause = paramInt;
  }

  public int getErrorCause()
  {
    return this.cause;
  }
}