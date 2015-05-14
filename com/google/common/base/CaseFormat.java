package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import java.io.Serializable;
import javax.annotation.Nullable;

@GwtCompatible
public enum CaseFormat
{
  private final CharMatcher wordBoundary;
  private final String wordSeparator;

  static
  {
    // Byte code:
    //   0: new 22\011com/google/common/base/CaseFormat$1
    //   3: dup
    //   4: ldc 23
    //   6: iconst_0
    //   7: bipush 45
    //   9: invokestatic 29\011com/google/common/base/CharMatcher:is\011(C)Lcom/google/common/base/CharMatcher;
    //   12: ldc 31
    //   14: invokespecial 35\011com/google/common/base/CaseFormat$1:<init>\011(Ljava/lang/String;ILcom/google/common/base/CharMatcher;Ljava/lang/String;)V
    //   17: putstatic 37\011com/google/common/base/CaseFormat:LOWER_HYPHEN\011Lcom/google/common/base/CaseFormat;
    //   20: new 39\011com/google/common/base/CaseFormat$2
    //   23: dup
    //   24: ldc 40
    //   26: iconst_1
    //   27: bipush 95
    //   29: invokestatic 29\011com/google/common/base/CharMatcher:is\011(C)Lcom/google/common/base/CharMatcher;
    //   32: ldc 42
    //   34: invokespecial 43\011com/google/common/base/CaseFormat$2:<init>\011(Ljava/lang/String;ILcom/google/common/base/CharMatcher;Ljava/lang/String;)V
    //   37: putstatic 45\011com/google/common/base/CaseFormat:LOWER_UNDERSCORE\011Lcom/google/common/base/CaseFormat;
    //   40: new 47\011com/google/common/base/CaseFormat$3
    //   43: dup
    //   44: ldc 48
    //   46: iconst_2
    //   47: bipush 65
    //   49: bipush 90
    //   51: invokestatic 52\011com/google/common/base/CharMatcher:inRange\011(CC)Lcom/google/common/base/CharMatcher;
    //   54: ldc 54
    //   56: invokespecial 55\011com/google/common/base/CaseFormat$3:<init>\011(Ljava/lang/String;ILcom/google/common/base/CharMatcher;Ljava/lang/String;)V
    //   59: putstatic 57\011com/google/common/base/CaseFormat:LOWER_CAMEL\011Lcom/google/common/base/CaseFormat;
    //   62: new 59\011com/google/common/base/CaseFormat$4
    //   65: dup
    //   66: ldc 60
    //   68: iconst_3
    //   69: bipush 65
    //   71: bipush 90
    //   73: invokestatic 52\011com/google/common/base/CharMatcher:inRange\011(CC)Lcom/google/common/base/CharMatcher;
    //   76: ldc 54
    //   78: invokespecial 61\011com/google/common/base/CaseFormat$4:<init>\011(Ljava/lang/String;ILcom/google/common/base/CharMatcher;Ljava/lang/String;)V
    //   81: putstatic 63\011com/google/common/base/CaseFormat:UPPER_CAMEL\011Lcom/google/common/base/CaseFormat;
    //   84: new 65\011com/google/common/base/CaseFormat$5
    //   87: dup
    //   88: ldc 66
    //   90: iconst_4
    //   91: bipush 95
    //   93: invokestatic 29\011com/google/common/base/CharMatcher:is\011(C)Lcom/google/common/base/CharMatcher;
    //   96: ldc 42
    //   98: invokespecial 67\011com/google/common/base/CaseFormat$5:<init>\011(Ljava/lang/String;ILcom/google/common/base/CharMatcher;Ljava/lang/String;)V
    //   101: putstatic 69\011com/google/common/base/CaseFormat:UPPER_UNDERSCORE\011Lcom/google/common/base/CaseFormat;
    //   104: iconst_5
    //   105: anewarray 2\011com/google/common/base/CaseFormat
    //   108: astore_0
    //   109: aload_0
    //   110: iconst_0
    //   111: getstatic 37\011com/google/common/base/CaseFormat:LOWER_HYPHEN\011Lcom/google/common/base/CaseFormat;
    //   114: aastore
    //   115: aload_0
    //   116: iconst_1
    //   117: getstatic 45\011com/google/common/base/CaseFormat:LOWER_UNDERSCORE\011Lcom/google/common/base/CaseFormat;
    //   120: aastore
    //   121: aload_0
    //   122: iconst_2
    //   123: getstatic 57\011com/google/common/base/CaseFormat:LOWER_CAMEL\011Lcom/google/common/base/CaseFormat;
    //   126: aastore
    //   127: aload_0
    //   128: iconst_3
    //   129: getstatic 63\011com/google/common/base/CaseFormat:UPPER_CAMEL\011Lcom/google/common/base/CaseFormat;
    //   132: aastore
    //   133: aload_0
    //   134: iconst_4
    //   135: getstatic 69\011com/google/common/base/CaseFormat:UPPER_UNDERSCORE\011Lcom/google/common/base/CaseFormat;
    //   138: aastore
    //   139: aload_0
    //   140: putstatic 71\011com/google/common/base/CaseFormat:$VALUES\011[Lcom/google/common/base/CaseFormat;
    //   143: return
  }

  private CaseFormat(CharMatcher paramCharMatcher, String paramString)
  {
    this.wordBoundary = paramCharMatcher;
    this.wordSeparator = paramString;
  }

  private static String firstCharOnlyToUpper(String paramString)
  {
    if (paramString.isEmpty())
      return paramString;
    return paramString.length() + Ascii.toUpperCase(paramString.charAt(0)) + Ascii.toLowerCase(paramString.substring(1));
  }

  private String normalizeFirstWord(String paramString)
  {
    if (this == LOWER_CAMEL)
      return Ascii.toLowerCase(paramString);
    return normalizeWord(paramString);
  }

  String convert(CaseFormat paramCaseFormat, String paramString)
  {
    StringBuilder localStringBuilder = null;
    int i = 0;
    int j = -1;
    j = this.wordBoundary.indexIn(paramString, j + 1);
    if (j != -1)
    {
      if (i == 0)
      {
        localStringBuilder = new StringBuilder(paramString.length() + 4 * this.wordSeparator.length());
        localStringBuilder.append(paramCaseFormat.normalizeFirstWord(paramString.substring(i, j)));
      }
      while (true)
      {
        localStringBuilder.append(paramCaseFormat.wordSeparator);
        i = j + this.wordSeparator.length();
        break;
        localStringBuilder.append(paramCaseFormat.normalizeWord(paramString.substring(i, j)));
      }
    }
    if (i == 0)
      return paramCaseFormat.normalizeFirstWord(paramString);
    return paramCaseFormat.normalizeWord(paramString.substring(i));
  }

  @Beta
  public Converter<String, String> converterTo(CaseFormat paramCaseFormat)
  {
    return new StringConverter(this, paramCaseFormat);
  }

  abstract String normalizeWord(String paramString);

  public final String to(CaseFormat paramCaseFormat, String paramString)
  {
    Preconditions.checkNotNull(paramCaseFormat);
    Preconditions.checkNotNull(paramString);
    if (paramCaseFormat == this)
      return paramString;
    return convert(paramCaseFormat, paramString);
  }

  private static final class StringConverter extends Converter<String, String>
    implements Serializable
  {
    private static final long serialVersionUID;
    private final CaseFormat sourceFormat;
    private final CaseFormat targetFormat;

    StringConverter(CaseFormat paramCaseFormat1, CaseFormat paramCaseFormat2)
    {
      this.sourceFormat = ((CaseFormat)Preconditions.checkNotNull(paramCaseFormat1));
      this.targetFormat = ((CaseFormat)Preconditions.checkNotNull(paramCaseFormat2));
    }

    protected String doBackward(String paramString)
    {
      if (paramString == null)
        return null;
      return this.targetFormat.to(this.sourceFormat, paramString);
    }

    protected String doForward(String paramString)
    {
      if (paramString == null)
        return null;
      return this.sourceFormat.to(this.targetFormat, paramString);
    }

    public boolean equals(@Nullable Object paramObject)
    {
      boolean bool1 = paramObject instanceof StringConverter;
      boolean bool2 = false;
      if (bool1)
      {
        StringConverter localStringConverter = (StringConverter)paramObject;
        boolean bool3 = this.sourceFormat.equals(localStringConverter.sourceFormat);
        bool2 = false;
        if (bool3)
        {
          boolean bool4 = this.targetFormat.equals(localStringConverter.targetFormat);
          bool2 = false;
          if (bool4)
            bool2 = true;
        }
      }
      return bool2;
    }

    public int hashCode()
    {
      return this.sourceFormat.hashCode() ^ this.targetFormat.hashCode();
    }

    public String toString()
    {
      String str1 = String.valueOf(String.valueOf(this.sourceFormat));
      String str2 = String.valueOf(String.valueOf(this.targetFormat));
      return 14 + str1.length() + str2.length() + str1 + ".converterTo(" + str2 + ")";
    }
  }
}