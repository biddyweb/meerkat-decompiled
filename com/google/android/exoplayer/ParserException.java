package com.google.android.exoplayer;

import java.io.IOException;

public class ParserException extends IOException
{
  public ParserException(String paramString)
  {
    super(paramString);
  }

  public ParserException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }

  public ParserException(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}