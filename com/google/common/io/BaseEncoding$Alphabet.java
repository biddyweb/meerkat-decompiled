package com.google.common.io;

import com.google.common.base.Ascii;
import com.google.common.base.CharMatcher;
import com.google.common.base.Preconditions;
import com.google.common.math.IntMath;
import java.io.IOException;
import java.math.RoundingMode;
import java.util.Arrays;

final class BaseEncoding$Alphabet extends CharMatcher
{
  final int bitsPerChar;
  final int bytesPerChunk;
  private final char[] chars;
  final int charsPerChunk;
  private final byte[] decodabet;
  final int mask;
  private final String name;
  private final boolean[] validPadding;

  BaseEncoding$Alphabet(String paramString, char[] paramArrayOfChar)
  {
    this.name = ((String)Preconditions.checkNotNull(paramString));
    this.chars = ((char[])Preconditions.checkNotNull(paramArrayOfChar));
    byte[] arrayOfByte;
    while (true)
    {
      try
      {
        this.bitsPerChar = IntMath.log2(paramArrayOfChar.length, RoundingMode.UNNECESSARY);
        int j = Math.min(8, Integer.lowestOneBit(this.bitsPerChar));
        this.charsPerChunk = (8 / j);
        this.bytesPerChunk = (this.bitsPerChar / j);
        this.mask = (-1 + paramArrayOfChar.length);
        arrayOfByte = new byte['\u0080'];
        Arrays.fill(arrayOfByte, (byte)-1);
        int k = 0;
        if (k >= paramArrayOfChar.length)
          break;
        char c = paramArrayOfChar[k];
        boolean bool1 = CharMatcher.ASCII.matches(c);
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = Character.valueOf(c);
        Preconditions.checkArgument(bool1, "Non-ASCII character: %s", arrayOfObject1);
        if (arrayOfByte[c] == -1)
        {
          bool2 = true;
          Object[] arrayOfObject2 = new Object[1];
          arrayOfObject2[0] = Character.valueOf(c);
          Preconditions.checkArgument(bool2, "Duplicate character: %s", arrayOfObject2);
          arrayOfByte[c] = ((byte)k);
          k++;
          continue;
        }
      }
      catch (ArithmeticException localArithmeticException)
      {
        int i = paramArrayOfChar.length;
        throw new IllegalArgumentException(35 + "Illegal alphabet length " + i, localArithmeticException);
      }
      boolean bool2 = false;
    }
    this.decodabet = arrayOfByte;
    boolean[] arrayOfBoolean = new boolean[this.charsPerChunk];
    for (int m = 0; m < this.bytesPerChunk; m++)
      arrayOfBoolean[IntMath.divide(m * 8, this.bitsPerChar, RoundingMode.CEILING)] = true;
    this.validPadding = arrayOfBoolean;
  }

  private boolean hasLowerCase()
  {
    char[] arrayOfChar = this.chars;
    int i = arrayOfChar.length;
    for (int j = 0; j < i; j++)
      if (Ascii.isLowerCase(arrayOfChar[j]))
        return true;
    return false;
  }

  private boolean hasUpperCase()
  {
    char[] arrayOfChar = this.chars;
    int i = arrayOfChar.length;
    for (int j = 0; j < i; j++)
      if (Ascii.isUpperCase(arrayOfChar[j]))
        return true;
    return false;
  }

  int decode(char paramChar)
    throws IOException
  {
    if ((paramChar > '') || (this.decodabet[paramChar] == -1))
      throw new BaseEncoding.DecodingException(25 + "Unrecognized character: " + paramChar);
    return this.decodabet[paramChar];
  }

  char encode(int paramInt)
  {
    return this.chars[paramInt];
  }

  boolean isValidPaddingStartPosition(int paramInt)
  {
    return this.validPadding[(paramInt % this.charsPerChunk)];
  }

  Alphabet lowerCase()
  {
    if (!hasUpperCase())
      return this;
    if (!hasLowerCase());
    char[] arrayOfChar;
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkState(bool, "Cannot call lowerCase() on a mixed-case alphabet");
      arrayOfChar = new char[this.chars.length];
      for (int i = 0; i < this.chars.length; i++)
        arrayOfChar[i] = Ascii.toLowerCase(this.chars[i]);
    }
    return new Alphabet(String.valueOf(this.name).concat(".lowerCase()"), arrayOfChar);
  }

  public boolean matches(char paramChar)
  {
    return (CharMatcher.ASCII.matches(paramChar)) && (this.decodabet[paramChar] != -1);
  }

  public String toString()
  {
    return this.name;
  }

  Alphabet upperCase()
  {
    if (!hasLowerCase())
      return this;
    if (!hasUpperCase());
    char[] arrayOfChar;
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkState(bool, "Cannot call upperCase() on a mixed-case alphabet");
      arrayOfChar = new char[this.chars.length];
      for (int i = 0; i < this.chars.length; i++)
        arrayOfChar[i] = Ascii.toUpperCase(this.chars[i]);
    }
    return new Alphabet(String.valueOf(this.name).concat(".upperCase()"), arrayOfChar);
  }
}