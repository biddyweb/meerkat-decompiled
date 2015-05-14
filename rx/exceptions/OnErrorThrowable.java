package rx.exceptions;

public final class OnErrorThrowable extends RuntimeException
{
  private static final long serialVersionUID = -569558213262703934L;
  private final boolean hasValue;
  private final Object value;

  private OnErrorThrowable(Throwable paramThrowable)
  {
    super(paramThrowable);
    this.hasValue = false;
    this.value = null;
  }

  private OnErrorThrowable(Throwable paramThrowable, Object paramObject)
  {
    super(paramThrowable);
    this.hasValue = true;
    this.value = paramObject;
  }

  public static Throwable addValueAsLastCause(Throwable paramThrowable, Object paramObject)
  {
    Throwable localThrowable = Exceptions.getFinalCause(paramThrowable);
    if ((localThrowable != null) && ((localThrowable instanceof OnNextValue)) && (((OnNextValue)localThrowable).getValue() == paramObject))
      return paramThrowable;
    Exceptions.addCause(paramThrowable, new OnNextValue(paramObject));
    return paramThrowable;
  }

  public static OnErrorThrowable from(Throwable paramThrowable)
  {
    Throwable localThrowable = Exceptions.getFinalCause(paramThrowable);
    if ((localThrowable instanceof OnNextValue))
      return new OnErrorThrowable(paramThrowable, ((OnNextValue)localThrowable).getValue());
    return new OnErrorThrowable(paramThrowable);
  }

  public Object getValue()
  {
    return this.value;
  }

  public boolean isValueNull()
  {
    return this.hasValue;
  }

  public static class OnNextValue extends RuntimeException
  {
    private static final long serialVersionUID = -3454462756050397899L;
    private final Object value;

    public OnNextValue(Object paramObject)
    {
      super();
      this.value = paramObject;
    }

    private static String renderValue(Object paramObject)
    {
      if (paramObject == null)
        return "null";
      if (paramObject.getClass().isPrimitive())
        return paramObject.toString();
      if ((paramObject instanceof String))
        return (String)paramObject;
      if ((paramObject instanceof Enum))
        return ((Enum)paramObject).name();
      return paramObject.getClass().getName() + ".class";
    }

    public Object getValue()
    {
      return this.value;
    }
  }
}