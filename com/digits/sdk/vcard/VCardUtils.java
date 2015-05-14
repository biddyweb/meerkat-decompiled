package com.digits.sdk.vcard;

import android.telephony.PhoneNumberUtils;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.util.SparseArray;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class VCardUtils
{
  private static final String LOG_TAG = "vCard";
  private static final int[] sEscapeIndicatorsV30 = { 58, 59, 44, 32 };
  private static final int[] sEscapeIndicatorsV40 = { 59, 58 };
  private static final SparseArray<String> sKnownImPropNameMap_ItoS;
  private static final Map<String, Integer> sKnownPhoneTypeMap_StoI;
  private static final SparseArray<String> sKnownPhoneTypesMap_ItoS = new SparseArray();
  private static final Set<String> sMobilePhoneLabelSet;
  private static final Set<String> sPhoneTypesUnknownToContactsSet;
  private static final Set<Character> sUnAcceptableAsciiInV21WordSet;

  static
  {
    sKnownPhoneTypeMap_StoI = new HashMap();
    sKnownPhoneTypesMap_ItoS.put(9, "CAR");
    sKnownPhoneTypeMap_StoI.put("CAR", Integer.valueOf(9));
    sKnownPhoneTypesMap_ItoS.put(6, "PAGER");
    sKnownPhoneTypeMap_StoI.put("PAGER", Integer.valueOf(6));
    sKnownPhoneTypesMap_ItoS.put(11, "ISDN");
    sKnownPhoneTypeMap_StoI.put("ISDN", Integer.valueOf(11));
    sKnownPhoneTypeMap_StoI.put("HOME", Integer.valueOf(1));
    sKnownPhoneTypeMap_StoI.put("WORK", Integer.valueOf(3));
    sKnownPhoneTypeMap_StoI.put("CELL", Integer.valueOf(2));
    sKnownPhoneTypeMap_StoI.put("OTHER", Integer.valueOf(7));
    sKnownPhoneTypeMap_StoI.put("CALLBACK", Integer.valueOf(8));
    sKnownPhoneTypeMap_StoI.put("COMPANY-MAIN", Integer.valueOf(10));
    sKnownPhoneTypeMap_StoI.put("RADIO", Integer.valueOf(14));
    sKnownPhoneTypeMap_StoI.put("TTY-TDD", Integer.valueOf(16));
    sKnownPhoneTypeMap_StoI.put("ASSISTANT", Integer.valueOf(19));
    sKnownPhoneTypeMap_StoI.put("VOICE", Integer.valueOf(7));
    sPhoneTypesUnknownToContactsSet = new HashSet();
    sPhoneTypesUnknownToContactsSet.add("MODEM");
    sPhoneTypesUnknownToContactsSet.add("MSG");
    sPhoneTypesUnknownToContactsSet.add("BBS");
    sPhoneTypesUnknownToContactsSet.add("VIDEO");
    sKnownImPropNameMap_ItoS = new SparseArray();
    sKnownImPropNameMap_ItoS.put(0, "X-AIM");
    sKnownImPropNameMap_ItoS.put(1, "X-MSN");
    sKnownImPropNameMap_ItoS.put(2, "X-YAHOO");
    sKnownImPropNameMap_ItoS.put(3, "X-SKYPE-USERNAME");
    sKnownImPropNameMap_ItoS.put(5, "X-GOOGLE-TALK");
    sKnownImPropNameMap_ItoS.put(6, "X-ICQ");
    sKnownImPropNameMap_ItoS.put(7, "X-JABBER");
    sKnownImPropNameMap_ItoS.put(4, "X-QQ");
    sKnownImPropNameMap_ItoS.put(8, "X-NETMEETING");
    sMobilePhoneLabelSet = new HashSet(Arrays.asList(new String[] { "MOBILE", "\u643A\u5E2F\u96FB\u8A71", "\u643A\u5E2F", "\u30B1\u30A4\u30BF\u30A4", "\uFF79\uFF72\uFF80\uFF72" }));
    Character[] arrayOfCharacter = new Character[7];
    arrayOfCharacter[0] = Character.valueOf('[');
    arrayOfCharacter[1] = Character.valueOf(']');
    arrayOfCharacter[2] = Character.valueOf('=');
    arrayOfCharacter[3] = Character.valueOf(':');
    arrayOfCharacter[4] = Character.valueOf('.');
    arrayOfCharacter[5] = Character.valueOf(',');
    arrayOfCharacter[6] = Character.valueOf(' ');
    sUnAcceptableAsciiInV21WordSet = new HashSet(Arrays.asList(arrayOfCharacter));
  }

  public static String constructNameFromElements(int paramInt, String paramString1, String paramString2, String paramString3)
  {
    return constructNameFromElements(paramInt, paramString1, paramString2, paramString3, null, null);
  }

  public static String constructNameFromElements(int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    String[] arrayOfString = sortNameElements(paramInt, paramString1, paramString2, paramString3);
    int i = 1;
    if (!TextUtils.isEmpty(paramString4))
    {
      i = 0;
      localStringBuilder.append(paramString4);
    }
    int j = arrayOfString.length;
    int k = 0;
    if (k < j)
    {
      String str = arrayOfString[k];
      if (!TextUtils.isEmpty(str))
      {
        if (i == 0)
          break label92;
        i = 0;
      }
      while (true)
      {
        localStringBuilder.append(str);
        k++;
        break;
        label92: localStringBuilder.append(' ');
      }
    }
    if (!TextUtils.isEmpty(paramString5))
    {
      if (i == 0)
        localStringBuilder.append(' ');
      localStringBuilder.append(paramString5);
    }
    return localStringBuilder.toString();
  }

  public static boolean containsOnlyAlphaDigitHyphen(Collection<String> paramCollection)
  {
    label4: Iterator localIterator;
    if (paramCollection == null)
    {
      break label13;
      return true;
    }
    else
    {
      localIterator = paramCollection.iterator();
    }
    while (true)
    {
      label13: if (!localIterator.hasNext())
        break label4;
      String str = (String)localIterator.next();
      if (TextUtils.isEmpty(str))
        break;
      int i = str.length();
      for (int j = 0; j < i; j = str.offsetByCodePoints(j, 1))
      {
        int k = str.codePointAt(j);
        if (((97 > k) || (k >= 123)) && ((65 > k) || (k >= 91)) && ((48 > k) || (k >= 58)) && (k != 45))
          return false;
      }
    }
  }

  public static boolean containsOnlyAlphaDigitHyphen(String[] paramArrayOfString)
  {
    if (paramArrayOfString == null)
      return true;
    return containsOnlyAlphaDigitHyphen(Arrays.asList(paramArrayOfString));
  }

  public static boolean containsOnlyNonCrLfPrintableAscii(Collection<String> paramCollection)
  {
    label4: Iterator localIterator;
    if (paramCollection == null)
    {
      break label13;
      return true;
    }
    else
    {
      localIterator = paramCollection.iterator();
    }
    while (true)
    {
      label13: if (!localIterator.hasNext())
        break label4;
      String str = (String)localIterator.next();
      if (TextUtils.isEmpty(str))
        break;
      int i = str.length();
      for (int j = 0; j < i; j = str.offsetByCodePoints(j, 1))
      {
        int k = str.codePointAt(j);
        if ((32 > k) || (k > 126))
          return false;
      }
    }
  }

  public static boolean containsOnlyNonCrLfPrintableAscii(String[] paramArrayOfString)
  {
    if (paramArrayOfString == null)
      return true;
    return containsOnlyNonCrLfPrintableAscii(Arrays.asList(paramArrayOfString));
  }

  public static boolean containsOnlyPrintableAscii(Collection<String> paramCollection)
  {
    if (paramCollection == null);
    String str;
    do
    {
      Iterator localIterator;
      while (!localIterator.hasNext())
      {
        return true;
        localIterator = paramCollection.iterator();
      }
      str = (String)localIterator.next();
    }
    while ((TextUtils.isEmpty(str)) || (TextUtilsPort.isPrintableAsciiOnly(str)));
    return false;
  }

  public static boolean containsOnlyPrintableAscii(String[] paramArrayOfString)
  {
    if (paramArrayOfString == null)
      return true;
    return containsOnlyPrintableAscii(Arrays.asList(paramArrayOfString));
  }

  public static boolean containsOnlyWhiteSpaces(Collection<String> paramCollection)
  {
    label4: Iterator localIterator;
    if (paramCollection == null)
    {
      break label13;
      return true;
    }
    else
    {
      localIterator = paramCollection.iterator();
    }
    while (true)
    {
      label13: if (!localIterator.hasNext())
        break label4;
      String str = (String)localIterator.next();
      if (TextUtils.isEmpty(str))
        break;
      int i = str.length();
      for (int j = 0; j < i; j = str.offsetByCodePoints(j, 1))
        if (!Character.isWhitespace(str.codePointAt(j)))
          return false;
    }
  }

  public static boolean containsOnlyWhiteSpaces(String[] paramArrayOfString)
  {
    if (paramArrayOfString == null)
      return true;
    return containsOnlyWhiteSpaces(Arrays.asList(paramArrayOfString));
  }

  public static int getPhoneNumberFormat(int paramInt)
  {
    if (VCardConfig.isJapaneseDevice(paramInt))
      return 2;
    return 1;
  }

  public static String getPhoneTypeString(Integer paramInteger)
  {
    return (String)sKnownPhoneTypesMap_ItoS.get(paramInteger.intValue());
  }

  public static String getPropertyNameForIm(int paramInt)
  {
    return (String)sKnownImPropNameMap_ItoS.get(paramInt);
  }

  public static boolean isMobilePhoneLabel(String paramString)
  {
    return ("_AUTO_CELL".equals(paramString)) || (sMobilePhoneLabelSet.contains(paramString));
  }

  public static boolean isV21Word(String paramString)
  {
    if (TextUtils.isEmpty(paramString));
    while (true)
    {
      return true;
      int i = paramString.length();
      for (int j = 0; j < i; j = paramString.offsetByCodePoints(j, 1))
      {
        int k = paramString.codePointAt(j);
        if ((32 > k) || (k > 126) || (sUnAcceptableAsciiInV21WordSet.contains(Character.valueOf((char)k))))
          return false;
      }
    }
  }

  public static boolean isValidInV21ButUnknownToContactsPhoteType(String paramString)
  {
    return sPhoneTypesUnknownToContactsSet.contains(paramString);
  }

  public static String[] sortNameElements(int paramInt, String paramString1, String paramString2, String paramString3)
  {
    String[] arrayOfString = new String[3];
    switch (VCardConfig.getNameOrderType(paramInt))
    {
    default:
      arrayOfString[0] = paramString3;
      arrayOfString[1] = paramString2;
      arrayOfString[2] = paramString1;
      return arrayOfString;
    case 8:
      if (containsOnlyPrintableAscii(new String[] { paramString1 }))
        if (containsOnlyPrintableAscii(new String[] { paramString3 }))
        {
          arrayOfString[0] = paramString3;
          arrayOfString[1] = paramString2;
          arrayOfString[2] = paramString1;
          return arrayOfString;
        }
      arrayOfString[0] = paramString1;
      arrayOfString[1] = paramString2;
      arrayOfString[2] = paramString3;
      return arrayOfString;
    case 4:
    }
    arrayOfString[0] = paramString2;
    arrayOfString[1] = paramString3;
    arrayOfString[2] = paramString1;
    return arrayOfString;
  }

  public static String toHalfWidthString(String paramString)
  {
    if (TextUtils.isEmpty(paramString))
      return null;
    StringBuilder localStringBuilder = new StringBuilder();
    int i = paramString.length();
    int j = 0;
    if (j < i)
    {
      char c = paramString.charAt(j);
      String str = JapaneseUtils.tryGetHalfWidthText(c);
      if (str != null)
        localStringBuilder.append(str);
      while (true)
      {
        j = paramString.offsetByCodePoints(j, 1);
        break;
        localStringBuilder.append(c);
      }
    }
    return localStringBuilder.toString();
  }

  private static String toStringAsParamValue(String paramString, int[] paramArrayOfInt)
  {
    if (TextUtils.isEmpty(paramString))
      paramString = "";
    StringBuilder localStringBuilder = new StringBuilder();
    int i = paramString.length();
    int j = 0;
    int k = 0;
    if (k < i)
    {
      int m = paramString.codePointAt(k);
      if ((m < 32) || (m == 34));
      label110: 
      while (true)
      {
        k = paramString.offsetByCodePoints(k, 1);
        break;
        localStringBuilder.appendCodePoint(m);
        int n = paramArrayOfInt.length;
        for (int i1 = 0; ; i1++)
        {
          if (i1 >= n)
            break label110;
          if (m == paramArrayOfInt[i1])
          {
            j = 1;
            break;
          }
        }
      }
    }
    String str = localStringBuilder.toString();
    if (str.length() != 0)
    {
      if (!containsOnlyWhiteSpaces(new String[] { str }));
    }
    else
      str = "";
    while (j == 0)
      return str;
    return '"' + str + '"';
  }

  public static String toStringAsV30ParamValue(String paramString)
  {
    return toStringAsParamValue(paramString, sEscapeIndicatorsV30);
  }

  public static String toStringAsV40ParamValue(String paramString)
  {
    return toStringAsParamValue(paramString, sEscapeIndicatorsV40);
  }

  public static class PhoneNumberUtilsPort
  {
    public static String formatNumber(String paramString, int paramInt)
    {
      SpannableStringBuilder localSpannableStringBuilder = new SpannableStringBuilder(paramString);
      PhoneNumberUtils.formatNumber(localSpannableStringBuilder, paramInt);
      return localSpannableStringBuilder.toString();
    }
  }

  public static class TextUtilsPort
  {
    public static boolean isPrintableAscii(char paramChar)
    {
      return ((' ' <= paramChar) && (paramChar <= '~')) || (paramChar == '\r') || (paramChar == '\n');
    }

    public static boolean isPrintableAsciiOnly(CharSequence paramCharSequence)
    {
      int i = paramCharSequence.length();
      for (int j = 0; j < i; j++)
        if (!isPrintableAscii(paramCharSequence.charAt(j)))
          return false;
      return true;
    }
  }
}