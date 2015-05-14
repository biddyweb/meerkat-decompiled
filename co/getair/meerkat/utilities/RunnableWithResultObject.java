package co.getair.meerkat.utilities;

public abstract class RunnableWithResultObject
  implements Runnable
{
  public Object resultObject = null;
  public boolean success = false;

  public abstract void run();
}