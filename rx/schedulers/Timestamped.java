package rx.schedulers;

public final class Timestamped<T>
{
  private final long timestampMillis;
  private final T value;

  public Timestamped(long paramLong, T paramT)
  {
    this.value = paramT;
    this.timestampMillis = paramLong;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    Timestamped localTimestamped;
    do
    {
      do
      {
        return true;
        if (paramObject == null)
          return false;
        if (!(paramObject instanceof Timestamped))
          return false;
        localTimestamped = (Timestamped)paramObject;
        if (this.timestampMillis != localTimestamped.timestampMillis)
          return false;
        if (this.value != null)
          break;
      }
      while (localTimestamped.value == null);
      return false;
    }
    while (this.value.equals(localTimestamped.value));
    return false;
  }

  public long getTimestampMillis()
  {
    return this.timestampMillis;
  }

  public T getValue()
  {
    return this.value;
  }

  public int hashCode()
  {
    int i = 31 * (31 + (int)(this.timestampMillis ^ this.timestampMillis >>> 32));
    if (this.value == null);
    for (int j = 0; ; j = this.value.hashCode())
      return i + j;
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Long.valueOf(this.timestampMillis);
    arrayOfObject[1] = this.value.toString();
    return String.format("Timestamped(timestampMillis = %d, value = %s)", arrayOfObject);
  }
}