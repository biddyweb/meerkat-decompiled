package com.google.common.escape;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Nullable;

@Beta
@GwtCompatible
public final class Escapers
{
  private static final Escaper NULL_ESCAPER = new CharEscaper()
  {
    public String escape(String paramAnonymousString)
    {
      return (String)Preconditions.checkNotNull(paramAnonymousString);
    }

    protected char[] escape(char paramAnonymousChar)
    {
      return null;
    }
  };

  static UnicodeEscaper asUnicodeEscaper(Escaper paramEscaper)
  {
    Preconditions.checkNotNull(paramEscaper);
    if ((paramEscaper instanceof UnicodeEscaper))
      return (UnicodeEscaper)paramEscaper;
    if ((paramEscaper instanceof CharEscaper))
      return wrap((CharEscaper)paramEscaper);
    String str1 = String.valueOf(paramEscaper.getClass().getName());
    if (str1.length() != 0);
    for (String str2 = "Cannot create a UnicodeEscaper from: ".concat(str1); ; str2 = new String("Cannot create a UnicodeEscaper from: "))
      throw new IllegalArgumentException(str2);
  }

  public static Builder builder()
  {
    return new Builder(null);
  }

  public static String computeReplacement(CharEscaper paramCharEscaper, char paramChar)
  {
    return stringOrNull(paramCharEscaper.escape(paramChar));
  }

  public static String computeReplacement(UnicodeEscaper paramUnicodeEscaper, int paramInt)
  {
    return stringOrNull(paramUnicodeEscaper.escape(paramInt));
  }

  public static Escaper nullEscaper()
  {
    return NULL_ESCAPER;
  }

  private static String stringOrNull(char[] paramArrayOfChar)
  {
    if (paramArrayOfChar == null)
      return null;
    return new String(paramArrayOfChar);
  }

  private static UnicodeEscaper wrap(CharEscaper paramCharEscaper)
  {
    return new UnicodeEscaper()
    {
      protected char[] escape(int paramAnonymousInt)
      {
        char[] arrayOfChar4;
        if (paramAnonymousInt < 65536)
          arrayOfChar4 = this.val$escaper.escape((char)paramAnonymousInt);
        char[] arrayOfChar1;
        int i;
        while (true)
        {
          return arrayOfChar4;
          arrayOfChar1 = new char[2];
          Character.toChars(paramAnonymousInt, arrayOfChar1, 0);
          char[] arrayOfChar2 = this.val$escaper.escape(arrayOfChar1[0]);
          char[] arrayOfChar3 = this.val$escaper.escape(arrayOfChar1[1]);
          if ((arrayOfChar2 == null) && (arrayOfChar3 == null))
            return null;
          if (arrayOfChar2 != null)
          {
            i = arrayOfChar2.length;
            if (arrayOfChar3 == null)
              break label134;
          }
          label134: for (int j = arrayOfChar3.length; ; j = 1)
          {
            arrayOfChar4 = new char[i + j];
            if (arrayOfChar2 == null)
              break label140;
            for (int m = 0; m < arrayOfChar2.length; m++)
              arrayOfChar4[m] = arrayOfChar2[m];
            i = 1;
            break;
          }
          label140: arrayOfChar4[0] = arrayOfChar1[0];
          if (arrayOfChar3 == null)
            break;
          for (int k = 0; k < arrayOfChar3.length; k++)
            arrayOfChar4[(i + k)] = arrayOfChar3[k];
        }
        arrayOfChar4[i] = arrayOfChar1[1];
        return arrayOfChar4;
      }
    };
  }

  @Beta
  public static final class Builder
  {
    private final Map<Character, String> replacementMap = new HashMap();
    private char safeMax = 65535;
    private char safeMin = '\000';
    private String unsafeReplacement = null;

    public Builder addEscape(char paramChar, String paramString)
    {
      Preconditions.checkNotNull(paramString);
      this.replacementMap.put(Character.valueOf(paramChar), paramString);
      return this;
    }

    public Escaper build()
    {
      return new ArrayBasedCharEscaper(this.replacementMap, this.safeMin, this.safeMax)
      {
        private final char[] replacementChars;

        protected char[] escapeUnsafe(char paramAnonymousChar)
        {
          return this.replacementChars;
        }
      };
    }

    public Builder setSafeRange(char paramChar1, char paramChar2)
    {
      this.safeMin = paramChar1;
      this.safeMax = paramChar2;
      return this;
    }

    public Builder setUnsafeReplacement(@Nullable String paramString)
    {
      this.unsafeReplacement = paramString;
      return this;
    }
  }
}