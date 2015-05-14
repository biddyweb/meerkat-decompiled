package co.getair.meerkat.utilities.objectPool;

public class NoUnlockedObjectException extends Exception
{
  public NoUnlockedObjectException()
  {
    super("No free object available");
  }
}