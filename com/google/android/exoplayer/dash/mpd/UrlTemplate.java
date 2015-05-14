package com.google.android.exoplayer.dash.mpd;

public final class UrlTemplate
{
  private static final String BANDWIDTH = "Bandwidth";
  private static final int BANDWIDTH_ID = 3;
  private static final String DEFAULT_FORMAT_TAG = "%01d";
  private static final String ESCAPED_DOLLAR = "$$";
  private static final String NUMBER = "Number";
  private static final int NUMBER_ID = 2;
  private static final String REPRESENTATION = "RepresentationID";
  private static final int REPRESENTATION_ID = 1;
  private static final String TIME = "Time";
  private static final int TIME_ID = 4;
  private final int identifierCount;
  private final String[] identifierFormatTags;
  private final int[] identifiers;
  private final String[] urlPieces;

  private UrlTemplate(String[] paramArrayOfString1, int[] paramArrayOfInt, String[] paramArrayOfString2, int paramInt)
  {
    this.urlPieces = paramArrayOfString1;
    this.identifiers = paramArrayOfInt;
    this.identifierFormatTags = paramArrayOfString2;
    this.identifierCount = paramInt;
  }

  public static UrlTemplate compile(String paramString)
  {
    String[] arrayOfString1 = new String[5];
    int[] arrayOfInt = new int[4];
    String[] arrayOfString2 = new String[4];
    return new UrlTemplate(arrayOfString1, arrayOfInt, arrayOfString2, parseTemplate(paramString, arrayOfString1, arrayOfInt, arrayOfString2));
  }

  private static int parseTemplate(String paramString, String[] paramArrayOfString1, int[] paramArrayOfInt, String[] paramArrayOfString2)
  {
    paramArrayOfString1[0] = "";
    int i = 0;
    int j = 0;
    while (i < paramString.length())
    {
      int k = paramString.indexOf("$", i);
      if (k == -1)
      {
        paramArrayOfString1[j] = (paramArrayOfString1[j] + paramString.substring(i));
        i = paramString.length();
      }
      else if (k != i)
      {
        paramArrayOfString1[j] = (paramArrayOfString1[j] + paramString.substring(i, k));
        i = k;
      }
      else if (paramString.startsWith("$$", i))
      {
        paramArrayOfString1[j] = (paramArrayOfString1[j] + "$");
        i += 2;
      }
      else
      {
        int m = paramString.indexOf("$", i + 1);
        String str1 = paramString.substring(i + 1, m);
        if (str1.equals("RepresentationID"))
        {
          paramArrayOfInt[j] = 1;
          j++;
          paramArrayOfString1[j] = "";
          i = m + 1;
        }
        else
        {
          int n = str1.indexOf("%0");
          String str2 = "%01d";
          if (n != -1)
          {
            str2 = str1.substring(n);
            if (!str2.endsWith("d"))
              str2 = str2 + "d";
            str1 = str1.substring(0, n);
          }
          if (str1.equals("Number"))
            paramArrayOfInt[j] = 2;
          while (true)
          {
            paramArrayOfString2[j] = str2;
            break;
            if (str1.equals("Bandwidth"))
            {
              paramArrayOfInt[j] = 3;
            }
            else
            {
              if (!str1.equals("Time"))
                break label351;
              paramArrayOfInt[j] = 4;
            }
          }
          label351: throw new IllegalArgumentException("Invalid template: " + paramString);
        }
      }
    }
    return j;
  }

  public String buildUri(String paramString, int paramInt1, int paramInt2, long paramLong)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    int i = 0;
    if (i < this.identifierCount)
    {
      localStringBuilder.append(this.urlPieces[i]);
      if (this.identifiers[i] == 1)
        localStringBuilder.append(paramString);
      while (true)
      {
        i++;
        break;
        if (this.identifiers[i] == 2)
        {
          String str3 = this.identifierFormatTags[i];
          Object[] arrayOfObject3 = new Object[1];
          arrayOfObject3[0] = Integer.valueOf(paramInt1);
          localStringBuilder.append(String.format(str3, arrayOfObject3));
        }
        else if (this.identifiers[i] == 3)
        {
          String str2 = this.identifierFormatTags[i];
          Object[] arrayOfObject2 = new Object[1];
          arrayOfObject2[0] = Integer.valueOf(paramInt2);
          localStringBuilder.append(String.format(str2, arrayOfObject2));
        }
        else if (this.identifiers[i] == 4)
        {
          String str1 = this.identifierFormatTags[i];
          Object[] arrayOfObject1 = new Object[1];
          arrayOfObject1[0] = Long.valueOf(paramLong);
          localStringBuilder.append(String.format(str1, arrayOfObject1));
        }
      }
    }
    localStringBuilder.append(this.urlPieces[this.identifierCount]);
    return localStringBuilder.toString();
  }
}