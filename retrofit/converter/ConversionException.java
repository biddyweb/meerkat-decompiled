package retrofit.converter;

public class ConversionException extends Exception
{
  public ConversionException(String paramString)
  {
    super(paramString);
  }

  public ConversionException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }

  public ConversionException(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}