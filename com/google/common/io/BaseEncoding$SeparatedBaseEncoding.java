package com.google.common.io;

import com.google.common.base.CharMatcher;
import com.google.common.base.Preconditions;
import com.google.common.math.IntMath;
import java.math.RoundingMode;

final class BaseEncoding$SeparatedBaseEncoding extends BaseEncoding
{
  private final int afterEveryChars;
  private final BaseEncoding delegate;
  private final String separator;
  private final CharMatcher separatorChars;

  BaseEncoding$SeparatedBaseEncoding(BaseEncoding paramBaseEncoding, String paramString, int paramInt)
  {
    this.delegate = ((BaseEncoding)Preconditions.checkNotNull(paramBaseEncoding));
    this.separator = ((String)Preconditions.checkNotNull(paramString));
    this.afterEveryChars = paramInt;
    if (paramInt > 0);
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Integer.valueOf(paramInt);
      Preconditions.checkArgument(bool, "Cannot add a separator after every %s chars", arrayOfObject);
      this.separatorChars = CharMatcher.anyOf(paramString).precomputed();
      return;
    }
  }

  GwtWorkarounds.ByteInput decodingStream(GwtWorkarounds.CharInput paramCharInput)
  {
    return this.delegate.decodingStream(ignoringInput(paramCharInput, this.separatorChars));
  }

  GwtWorkarounds.ByteOutput encodingStream(GwtWorkarounds.CharOutput paramCharOutput)
  {
    return this.delegate.encodingStream(separatingOutput(paramCharOutput, this.separator, this.afterEveryChars));
  }

  public BaseEncoding lowerCase()
  {
    return this.delegate.lowerCase().withSeparator(this.separator, this.afterEveryChars);
  }

  int maxDecodedSize(int paramInt)
  {
    return this.delegate.maxDecodedSize(paramInt);
  }

  int maxEncodedSize(int paramInt)
  {
    int i = this.delegate.maxEncodedSize(paramInt);
    return i + this.separator.length() * IntMath.divide(Math.max(0, i - 1), this.afterEveryChars, RoundingMode.FLOOR);
  }

  public BaseEncoding omitPadding()
  {
    return this.delegate.omitPadding().withSeparator(this.separator, this.afterEveryChars);
  }

  CharMatcher padding()
  {
    return this.delegate.padding();
  }

  public String toString()
  {
    String str1 = String.valueOf(String.valueOf(this.delegate.toString()));
    String str2 = String.valueOf(String.valueOf(this.separator));
    int i = this.afterEveryChars;
    return 31 + str1.length() + str2.length() + str1 + ".withSeparator(\"" + str2 + "\", " + i + ")";
  }

  public BaseEncoding upperCase()
  {
    return this.delegate.upperCase().withSeparator(this.separator, this.afterEveryChars);
  }

  public BaseEncoding withPadChar(char paramChar)
  {
    return this.delegate.withPadChar(paramChar).withSeparator(this.separator, this.afterEveryChars);
  }

  public BaseEncoding withSeparator(String paramString, int paramInt)
  {
    throw new UnsupportedOperationException("Already have a separator");
  }
}