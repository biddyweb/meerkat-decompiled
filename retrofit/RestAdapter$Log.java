package retrofit;

public abstract interface RestAdapter$Log
{
  public static final Log NONE = new Log()
  {
    public void log(String paramAnonymousString)
    {
    }
  };

  public abstract void log(String paramString);
}