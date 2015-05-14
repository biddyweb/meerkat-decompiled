package com.digits.sdk.vcard;

import android.content.ContentValues;
import android.text.TextUtils;
import android.util.Log;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;

public class VCardBuilder
{
  public static final int DEFAULT_EMAIL_TYPE = 3;
  public static final int DEFAULT_PHONE_TYPE = 1;
  private static final String LOG_TAG = "vCard";
  private static final String SHIFT_JIS = "SHIFT_JIS";
  private static final String VCARD_DATA_PUBLIC = "PUBLIC";
  private static final String VCARD_DATA_SEPARATOR = ":";
  private static final String VCARD_DATA_VCARD = "VCARD";
  public static final String VCARD_END_OF_LINE = "\r\n";
  private static final String VCARD_ITEM_SEPARATOR = ";";
  private static final String VCARD_PARAM_ENCODING_QP = "ENCODING=QUOTED-PRINTABLE";
  private static final String VCARD_PARAM_EQUAL = "=";
  private static final String VCARD_PARAM_SEPARATOR = ";";
  private static final Set<String> sAllowedAndroidPropertySet = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[] { "vnd.android.cursor.item/nickname", "vnd.android.cursor.item/contact_event", "vnd.android.cursor.item/relation" })));
  private final boolean mAppendTypeParamName;
  private StringBuilder mBuilder;
  private final String mCharset;
  private boolean mEndAppended;
  private final boolean mIsDoCoMo;
  private final boolean mIsJapaneseMobilePhone;
  private final boolean mIsV30OrV40;
  private final boolean mNeedsToConvertPhoneticString;
  private final boolean mRefrainsQPToNameProperties;
  private final boolean mShouldAppendCharsetParam;
  private final boolean mShouldUseQuotedPrintable;
  private final boolean mUsesDefactProperty;
  private final String mVCardCharsetParameter;
  private final int mVCardType;

  public VCardBuilder(int paramInt)
  {
    this(paramInt, null);
  }

  public VCardBuilder(int paramInt, String paramString)
  {
    this.mVCardType = paramInt;
    if (VCardConfig.isVersion40(paramInt))
      Log.w("vCard", "Should not use vCard 4.0 when building vCard. It is not officially published yet.");
    boolean bool1;
    if ((VCardConfig.isVersion30(paramInt)) || (VCardConfig.isVersion40(paramInt)))
    {
      bool1 = true;
      this.mIsV30OrV40 = bool1;
      this.mShouldUseQuotedPrintable = VCardConfig.shouldUseQuotedPrintable(paramInt);
      this.mIsDoCoMo = VCardConfig.isDoCoMo(paramInt);
      this.mIsJapaneseMobilePhone = VCardConfig.needsToConvertPhoneticString(paramInt);
      this.mUsesDefactProperty = VCardConfig.usesDefactProperty(paramInt);
      this.mRefrainsQPToNameProperties = VCardConfig.shouldRefrainQPToNameProperties(paramInt);
      this.mAppendTypeParamName = VCardConfig.appendTypeParamName(paramInt);
      this.mNeedsToConvertPhoneticString = VCardConfig.needsToConvertPhoneticString(paramInt);
      boolean bool2;
      if (VCardConfig.isVersion30(paramInt))
      {
        boolean bool3 = "UTF-8".equalsIgnoreCase(paramString);
        bool2 = false;
        if (bool3);
      }
      else
      {
        bool2 = true;
      }
      this.mShouldAppendCharsetParam = bool2;
      if (!VCardConfig.isDoCoMo(paramInt))
        break label194;
      if ("SHIFT_JIS".equalsIgnoreCase(paramString))
        break label186;
      if (!TextUtils.isEmpty(paramString))
        break label178;
      this.mCharset = "SHIFT_JIS";
      label162: this.mVCardCharsetParameter = "CHARSET=SHIFT_JIS";
    }
    while (true)
    {
      clear();
      return;
      bool1 = false;
      break;
      label178: this.mCharset = paramString;
      break label162;
      label186: this.mCharset = paramString;
      break label162;
      label194: if (TextUtils.isEmpty(paramString))
      {
        Log.i("vCard", "Use the charset \"UTF-8\" for export.");
        this.mCharset = "UTF-8";
        this.mVCardCharsetParameter = "CHARSET=UTF-8";
      }
      else
      {
        this.mCharset = paramString;
        this.mVCardCharsetParameter = ("CHARSET=" + paramString);
      }
    }
  }

  private VCardBuilder appendNamePropertiesV40(List<ContentValues> paramList)
  {
    if ((this.mIsDoCoMo) || (this.mNeedsToConvertPhoneticString))
      Log.w("vCard", "Invalid flag is used in vCard 4.0 construction. Ignored.");
    if ((paramList == null) || (paramList.isEmpty()))
    {
      appendLine("FN", "");
      return this;
    }
    ContentValues localContentValues = getPrimaryContentValueWithStructuredName(paramList);
    Object localObject = localContentValues.getAsString("data3");
    String str1 = localContentValues.getAsString("data5");
    String str2 = localContentValues.getAsString("data2");
    String str3 = localContentValues.getAsString("data4");
    String str4 = localContentValues.getAsString("data6");
    String str5 = localContentValues.getAsString("data1");
    if ((TextUtils.isEmpty((CharSequence)localObject)) && (TextUtils.isEmpty(str2)) && (TextUtils.isEmpty(str1)) && (TextUtils.isEmpty(str3)) && (TextUtils.isEmpty(str4)))
    {
      if (TextUtils.isEmpty(str5))
      {
        appendLine("FN", "");
        return this;
      }
      localObject = str5;
    }
    String str6 = localContentValues.getAsString("data9");
    String str7 = localContentValues.getAsString("data8");
    String str8 = localContentValues.getAsString("data7");
    String str9 = escapeCharacters((String)localObject);
    String str10 = escapeCharacters(str2);
    String str11 = escapeCharacters(str1);
    String str12 = escapeCharacters(str3);
    String str13 = escapeCharacters(str4);
    this.mBuilder.append("N");
    if ((!TextUtils.isEmpty(str6)) || (!TextUtils.isEmpty(str7)) || (!TextUtils.isEmpty(str8)))
    {
      this.mBuilder.append(";");
      String str14 = escapeCharacters(str6) + ';' + escapeCharacters(str8) + ';' + escapeCharacters(str7);
      this.mBuilder.append("SORT-AS=").append(VCardUtils.toStringAsV40ParamValue(str14));
    }
    this.mBuilder.append(":");
    this.mBuilder.append(str9);
    this.mBuilder.append(";");
    this.mBuilder.append(str10);
    this.mBuilder.append(";");
    this.mBuilder.append(str11);
    this.mBuilder.append(";");
    this.mBuilder.append(str12);
    this.mBuilder.append(";");
    this.mBuilder.append(str13);
    this.mBuilder.append("\r\n");
    if (TextUtils.isEmpty(str5))
    {
      Log.w("vCard", "DISPLAY_NAME is empty.");
      appendLine("FN", escapeCharacters(VCardUtils.constructNameFromElements(VCardConfig.getNameOrderType(this.mVCardType), (String)localObject, str1, str2, str3, str4)));
    }
    while (true)
    {
      appendPhoneticNameFields(localContentValues);
      return this;
      String str15 = escapeCharacters(str5);
      this.mBuilder.append("FN");
      this.mBuilder.append(":");
      this.mBuilder.append(str15);
      this.mBuilder.append("\r\n");
    }
  }

  private void appendPhoneticNameFields(ContentValues paramContentValues)
  {
    String str1 = paramContentValues.getAsString("data9");
    String str2 = paramContentValues.getAsString("data8");
    String str3 = paramContentValues.getAsString("data7");
    String str4;
    String str5;
    String str6;
    if (this.mNeedsToConvertPhoneticString)
    {
      str4 = VCardUtils.toHalfWidthString(str1);
      str5 = VCardUtils.toHalfWidthString(str2);
      str6 = VCardUtils.toHalfWidthString(str3);
      if ((!TextUtils.isEmpty(str4)) || (!TextUtils.isEmpty(str5)) || (!TextUtils.isEmpty(str6)))
        break label185;
      if (this.mIsDoCoMo)
      {
        this.mBuilder.append("SOUND");
        this.mBuilder.append(";");
        this.mBuilder.append("X-IRMC-N");
        this.mBuilder.append(":");
        this.mBuilder.append(";");
        this.mBuilder.append(";");
        this.mBuilder.append(";");
        this.mBuilder.append(";");
        this.mBuilder.append("\r\n");
      }
    }
    label185: label195: int n;
    label235: String str12;
    label248: int m;
    label385: String str11;
    label398: 
    do
    {
      return;
      str4 = str1;
      str5 = str2;
      str6 = str3;
      break;
      if (!VCardConfig.isVersion40(this.mVCardType))
        break label653;
      if (!this.mUsesDefactProperty)
        break label1089;
      if (!TextUtils.isEmpty(str6))
      {
        if (!this.mShouldUseQuotedPrintable)
          break label1137;
        if (VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] { str6 }))
          break label1137;
        n = 1;
        if (n == 0)
          break label1143;
        str12 = encodeQuotedPrintable(str6);
        this.mBuilder.append("X-PHONETIC-FIRST-NAME");
        if (shouldAppendCharsetParam(new String[] { str6 }))
        {
          this.mBuilder.append(";");
          this.mBuilder.append(this.mVCardCharsetParameter);
        }
        if (n != 0)
        {
          this.mBuilder.append(";");
          this.mBuilder.append("ENCODING=QUOTED-PRINTABLE");
        }
        this.mBuilder.append(":");
        this.mBuilder.append(str12);
        this.mBuilder.append("\r\n");
      }
      if (!TextUtils.isEmpty(str5))
      {
        if (!this.mShouldUseQuotedPrintable)
          break label1154;
        if (VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] { str5 }))
          break label1154;
        m = 1;
        if (m == 0)
          break label1160;
        str11 = encodeQuotedPrintable(str5);
        this.mBuilder.append("X-PHONETIC-MIDDLE-NAME");
        if (shouldAppendCharsetParam(new String[] { str5 }))
        {
          this.mBuilder.append(";");
          this.mBuilder.append(this.mVCardCharsetParameter);
        }
        if (m != 0)
        {
          this.mBuilder.append(";");
          this.mBuilder.append("ENCODING=QUOTED-PRINTABLE");
        }
        this.mBuilder.append(":");
        this.mBuilder.append(str11);
        this.mBuilder.append("\r\n");
      }
    }
    while (TextUtils.isEmpty(str4));
    int k;
    if (this.mShouldUseQuotedPrintable)
      if (!VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] { str4 }))
      {
        k = 1;
        label535: if (k == 0)
          break label1177;
      }
    label653: label1177: for (String str10 = encodeQuotedPrintable(str4); ; str10 = escapeCharacters(str4))
    {
      this.mBuilder.append("X-PHONETIC-LAST-NAME");
      if (shouldAppendCharsetParam(new String[] { str4 }))
      {
        this.mBuilder.append(";");
        this.mBuilder.append(this.mVCardCharsetParameter);
      }
      if (k != 0)
      {
        this.mBuilder.append(";");
        this.mBuilder.append("ENCODING=QUOTED-PRINTABLE");
      }
      this.mBuilder.append(":");
      this.mBuilder.append(str10);
      this.mBuilder.append("\r\n");
      return;
      if (VCardConfig.isVersion30(this.mVCardType))
      {
        String str13 = VCardUtils.constructNameFromElements(this.mVCardType, str4, str5, str6);
        this.mBuilder.append("SORT-STRING");
        if (VCardConfig.isVersion30(this.mVCardType))
          if (shouldAppendCharsetParam(new String[] { str13 }))
          {
            this.mBuilder.append(";");
            this.mBuilder.append(this.mVCardCharsetParameter);
          }
        this.mBuilder.append(":");
        this.mBuilder.append(escapeCharacters(str13));
        this.mBuilder.append("\r\n");
        break label195;
      }
      if (!this.mIsJapaneseMobilePhone)
        break label195;
      this.mBuilder.append("SOUND");
      this.mBuilder.append(";");
      this.mBuilder.append("X-IRMC-N");
      int i;
      label868: String str7;
      String str8;
      String str9;
      int j;
      if (!this.mRefrainsQPToNameProperties)
      {
        if (VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] { str4 }))
          if (VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] { str5 }))
            if (VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] { str6 }))
              break label1091;
        i = 1;
        if (i == 0)
          break label1097;
        str7 = encodeQuotedPrintable(str4);
        str8 = encodeQuotedPrintable(str5);
        str9 = encodeQuotedPrintable(str6);
        if (shouldAppendCharsetParam(new String[] { str7, str8, str9 }))
        {
          this.mBuilder.append(";");
          this.mBuilder.append(this.mVCardCharsetParameter);
        }
        this.mBuilder.append(":");
        j = 1;
        if (!TextUtils.isEmpty(str7))
        {
          this.mBuilder.append(str7);
          j = 0;
        }
        if (!TextUtils.isEmpty(str8))
        {
          if (j == 0)
            break label1124;
          j = 0;
        }
      }
      while (true)
      {
        this.mBuilder.append(str8);
        if (!TextUtils.isEmpty(str9))
        {
          if (j == 0)
            this.mBuilder.append(' ');
          this.mBuilder.append(str9);
        }
        this.mBuilder.append(";");
        this.mBuilder.append(";");
        this.mBuilder.append(";");
        this.mBuilder.append(";");
        this.mBuilder.append("\r\n");
        break label195;
        label1089: break;
        label1091: i = 0;
        break label868;
        label1097: str7 = escapeCharacters(str4);
        str8 = escapeCharacters(str5);
        str9 = escapeCharacters(str6);
        break label897;
        label1124: this.mBuilder.append(' ');
      }
      label1137: n = 0;
      break label235;
      label1143: str12 = escapeCharacters(str6);
      break label248;
      m = 0;
      break label385;
      str11 = escapeCharacters(str5);
      break label398;
      k = 0;
      break label535;
    }
  }

  private void appendTypeParameter(String paramString)
  {
    appendTypeParameter(this.mBuilder, paramString);
  }

  private void appendTypeParameter(StringBuilder paramStringBuilder, String paramString)
  {
    if ((VCardConfig.isVersion40(this.mVCardType)) || (((VCardConfig.isVersion30(this.mVCardType)) || (this.mAppendTypeParamName)) && (!this.mIsDoCoMo)))
      paramStringBuilder.append("TYPE").append("=");
    paramStringBuilder.append(paramString);
  }

  private void appendTypeParameters(List<String> paramList)
  {
    int i = 1;
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      String str1 = (String)localIterator.next();
      if ((VCardConfig.isVersion30(this.mVCardType)) || (VCardConfig.isVersion40(this.mVCardType)))
      {
        String str2;
        if (VCardConfig.isVersion40(this.mVCardType))
        {
          str2 = VCardUtils.toStringAsV40ParamValue(str1);
          label66: if (TextUtils.isEmpty(str2))
            break label97;
          if (i == 0)
            break label99;
          i = 0;
        }
        while (true)
        {
          appendTypeParameter(str2);
          break;
          str2 = VCardUtils.toStringAsV30ParamValue(str1);
          break label66;
          label97: break;
          label99: this.mBuilder.append(";");
        }
      }
      if (VCardUtils.isV21Word(str1))
      {
        if (i != 0)
          i = 0;
        while (true)
        {
          appendTypeParameter(str1);
          break;
          this.mBuilder.append(";");
        }
      }
    }
  }

  private void appendUncommonPhoneType(StringBuilder paramStringBuilder, Integer paramInteger)
  {
    if (this.mIsDoCoMo)
    {
      paramStringBuilder.append("VOICE");
      return;
    }
    String str = VCardUtils.getPhoneTypeString(paramInteger);
    if (str != null)
    {
      appendTypeParameter(str);
      return;
    }
    Log.e("vCard", "Unknown or unsupported (by vCard) Phone type: " + paramInteger);
  }

  private void buildSinglePartNameField(String paramString1, String paramString2)
  {
    int i;
    if (!this.mRefrainsQPToNameProperties)
      if (!VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] { paramString2 }))
      {
        i = 1;
        if (i == 0)
          break label130;
      }
    label130: for (String str = encodeQuotedPrintable(paramString2); ; str = escapeCharacters(paramString2))
    {
      this.mBuilder.append(paramString1);
      if (shouldAppendCharsetParam(new String[] { paramString2 }))
      {
        this.mBuilder.append(";");
        this.mBuilder.append(this.mVCardCharsetParameter);
      }
      if (i != 0)
      {
        this.mBuilder.append(";");
        this.mBuilder.append("ENCODING=QUOTED-PRINTABLE");
      }
      this.mBuilder.append(":");
      this.mBuilder.append(str);
      return;
      i = 0;
      break;
    }
  }

  private boolean containsNonEmptyName(ContentValues paramContentValues)
  {
    String str1 = paramContentValues.getAsString("data3");
    String str2 = paramContentValues.getAsString("data5");
    String str3 = paramContentValues.getAsString("data2");
    String str4 = paramContentValues.getAsString("data4");
    String str5 = paramContentValues.getAsString("data6");
    String str6 = paramContentValues.getAsString("data9");
    String str7 = paramContentValues.getAsString("data8");
    String str8 = paramContentValues.getAsString("data7");
    String str9 = paramContentValues.getAsString("data1");
    return (!TextUtils.isEmpty(str1)) || (!TextUtils.isEmpty(str2)) || (!TextUtils.isEmpty(str3)) || (!TextUtils.isEmpty(str4)) || (!TextUtils.isEmpty(str5)) || (!TextUtils.isEmpty(str6)) || (!TextUtils.isEmpty(str7)) || (!TextUtils.isEmpty(str8)) || (!TextUtils.isEmpty(str9));
  }

  private String encodeQuotedPrintable(String paramString)
  {
    if (TextUtils.isEmpty(paramString))
      return "";
    StringBuilder localStringBuilder = new StringBuilder();
    int i = 0;
    int j = 0;
    try
    {
      byte[] arrayOfByte2 = paramString.getBytes(this.mCharset);
      arrayOfByte1 = arrayOfByte2;
      while (i < arrayOfByte1.length)
      {
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Byte.valueOf(arrayOfByte1[i]);
        localStringBuilder.append(String.format("=%02X", arrayOfObject));
        i++;
        j += 3;
        if (j >= 67)
        {
          localStringBuilder.append("=\r\n");
          j = 0;
        }
      }
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      while (true)
      {
        Log.e("vCard", "Charset " + this.mCharset + " cannot be used. " + "Try default charset");
        byte[] arrayOfByte1 = paramString.getBytes();
        i = 0;
        j = 0;
      }
    }
    return localStringBuilder.toString();
  }

  private String escapeCharacters(String paramString)
  {
    if (TextUtils.isEmpty(paramString))
      return "";
    StringBuilder localStringBuilder = new StringBuilder();
    int i = paramString.length();
    int j = 0;
    if (j < i)
    {
      char c = paramString.charAt(j);
      switch (c)
      {
      default:
        localStringBuilder.append(c);
      case ';':
      case '\r':
      case '\n':
      case '\\':
      case '<':
      case '>':
      case ',':
      }
      while (true)
      {
        j++;
        break;
        localStringBuilder.append('\\');
        localStringBuilder.append(';');
        continue;
        if ((j + 1 >= i) || (paramString.charAt(j) != '\n'))
        {
          localStringBuilder.append("\\n");
          continue;
          if (this.mIsV30OrV40)
          {
            localStringBuilder.append("\\\\");
          }
          else if (this.mIsDoCoMo)
          {
            localStringBuilder.append('\\');
            localStringBuilder.append(c);
          }
          else
          {
            localStringBuilder.append(c);
            continue;
            if (this.mIsV30OrV40)
              localStringBuilder.append("\\,");
            else
              localStringBuilder.append(c);
          }
        }
      }
    }
    return localStringBuilder.toString();
  }

  private ContentValues getPrimaryContentValueWithStructuredName(List<ContentValues> paramList)
  {
    Object localObject1 = null;
    Object localObject2 = null;
    Iterator localIterator = paramList.iterator();
    while (true)
    {
      ContentValues localContentValues;
      if (localIterator.hasNext())
      {
        localContentValues = (ContentValues)localIterator.next();
        if (localContentValues != null)
        {
          Integer localInteger1 = localContentValues.getAsInteger("is_super_primary");
          if ((localInteger1 != null) && (localInteger1.intValue() > 0))
            localObject1 = localContentValues;
        }
      }
      else
      {
        if (localObject1 == null)
        {
          if (localObject2 == null)
            break;
          localObject1 = localObject2;
        }
        return localObject1;
        if (localObject1 == null)
        {
          Integer localInteger2 = localContentValues.getAsInteger("is_primary");
          if ((localInteger2 != null) && (localInteger2.intValue() > 0) && (containsNonEmptyName(localContentValues)))
            localObject1 = localContentValues;
          else if ((localObject2 == null) && (containsNonEmptyName(localContentValues)))
            localObject2 = localContentValues;
        }
      }
    }
    return new ContentValues();
  }

  private boolean shouldAppendCharsetParam(String[] paramArrayOfString)
  {
    if (!this.mShouldAppendCharsetParam);
    while (true)
    {
      return false;
      int i = paramArrayOfString.length;
      for (int j = 0; j < i; j++)
        if (!VCardUtils.containsOnlyPrintableAscii(new String[] { paramArrayOfString[j] }))
          return true;
    }
  }

  private List<String> splitPhoneNumbers(String paramString)
  {
    ArrayList localArrayList = new ArrayList();
    StringBuilder localStringBuilder = new StringBuilder();
    int i = paramString.length();
    int j = 0;
    if (j < i)
    {
      char c = paramString.charAt(j);
      if ((c == '\n') && (localStringBuilder.length() > 0))
      {
        localArrayList.add(localStringBuilder.toString());
        localStringBuilder = new StringBuilder();
      }
      while (true)
      {
        j++;
        break;
        localStringBuilder.append(c);
      }
    }
    if (localStringBuilder.length() > 0)
      localArrayList.add(localStringBuilder.toString());
    return localArrayList;
  }

  public void appendEmailLine(int paramInt, String paramString1, String paramString2, boolean paramBoolean)
  {
    Object localObject;
    switch (paramInt)
    {
    default:
      Log.e("vCard", "Unknown Email type: " + paramInt);
      localObject = null;
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    }
    while (true)
    {
      ArrayList localArrayList = new ArrayList();
      if (paramBoolean)
        localArrayList.add("PREF");
      if (!TextUtils.isEmpty((CharSequence)localObject))
        localArrayList.add(localObject);
      appendLineWithCharsetAndQPDetection("EMAIL", localArrayList, paramString2);
      return;
      if (VCardUtils.isMobilePhoneLabel(paramString1))
      {
        localObject = "CELL";
      }
      else if (!TextUtils.isEmpty(paramString1))
      {
        if (VCardUtils.containsOnlyAlphaDigitHyphen(new String[] { paramString1 }))
          localObject = "X-" + paramString1;
      }
      else
      {
        localObject = null;
        continue;
        localObject = "HOME";
        continue;
        localObject = "WORK";
        continue;
        localObject = null;
        continue;
        localObject = "CELL";
      }
    }
  }

  public VCardBuilder appendEmails(List<ContentValues> paramList)
  {
    int i = 0;
    if (paramList != null)
    {
      HashSet localHashSet = new HashSet();
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        ContentValues localContentValues = (ContentValues)localIterator.next();
        String str1 = localContentValues.getAsString("data1");
        if (str1 != null)
          str1 = str1.trim();
        if (!TextUtils.isEmpty(str1))
        {
          Integer localInteger1 = localContentValues.getAsInteger("data2");
          int j;
          label94: String str2;
          boolean bool;
          if (localInteger1 != null)
          {
            j = localInteger1.intValue();
            str2 = localContentValues.getAsString("data3");
            Integer localInteger2 = localContentValues.getAsInteger("is_primary");
            if (localInteger2 == null)
              break label178;
            if (localInteger2.intValue() <= 0)
              break label172;
            bool = true;
          }
          while (true)
          {
            i = 1;
            if (localHashSet.contains(str1))
              break;
            localHashSet.add(str1);
            appendEmailLine(j, str2, str1, bool);
            break;
            j = 3;
            break label94;
            label172: bool = false;
            continue;
            label178: bool = false;
          }
        }
      }
    }
    if ((i == 0) && (this.mIsDoCoMo))
      appendEmailLine(1, "", "", false);
    return this;
  }

  public void appendLine(String paramString1, String paramString2)
  {
    appendLine(paramString1, paramString2, false, false);
  }

  public void appendLine(String paramString1, String paramString2, boolean paramBoolean1, boolean paramBoolean2)
  {
    appendLine(paramString1, null, paramString2, paramBoolean1, paramBoolean2);
  }

  public void appendLine(String paramString1, List<String> paramList, String paramString2, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.mBuilder.append(paramString1);
    if ((paramList != null) && (paramList.size() > 0))
    {
      this.mBuilder.append(";");
      appendTypeParameters(paramList);
    }
    if (paramBoolean1)
    {
      this.mBuilder.append(";");
      this.mBuilder.append(this.mVCardCharsetParameter);
    }
    if (paramBoolean2)
    {
      this.mBuilder.append(";");
      this.mBuilder.append("ENCODING=QUOTED-PRINTABLE");
    }
    for (String str = encodeQuotedPrintable(paramString2); ; str = escapeCharacters(paramString2))
    {
      this.mBuilder.append(":");
      this.mBuilder.append(str);
      this.mBuilder.append("\r\n");
      return;
    }
  }

  public void appendLineWithCharsetAndQPDetection(String paramString1, List<String> paramList, String paramString2)
  {
    boolean bool1;
    if (!VCardUtils.containsOnlyPrintableAscii(new String[] { paramString2 }))
    {
      bool1 = true;
      if (!this.mShouldUseQuotedPrintable)
        break label59;
      if (VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] { paramString2 }))
        break label59;
    }
    label59: for (boolean bool2 = true; ; bool2 = false)
    {
      appendLine(paramString1, paramList, paramString2, bool1, bool2);
      return;
      bool1 = false;
      break;
    }
  }

  public VCardBuilder appendNameProperties(List<ContentValues> paramList)
  {
    if (VCardConfig.isVersion40(this.mVCardType))
      this = appendNamePropertiesV40(paramList);
    do
    {
      return this;
      if ((paramList != null) && (!paramList.isEmpty()))
        break;
      if (VCardConfig.isVersion30(this.mVCardType))
      {
        appendLine("N", "");
        appendLine("FN", "");
        return this;
      }
    }
    while (!this.mIsDoCoMo);
    appendLine("N", "");
    return this;
    ContentValues localContentValues = getPrimaryContentValueWithStructuredName(paramList);
    String str1 = localContentValues.getAsString("data3");
    String str2 = localContentValues.getAsString("data5");
    String str3 = localContentValues.getAsString("data2");
    String str4 = localContentValues.getAsString("data4");
    String str5 = localContentValues.getAsString("data6");
    String str6 = localContentValues.getAsString("data1");
    boolean bool1;
    int i;
    String str7;
    label278: int j;
    label322: String str8;
    String str9;
    String str10;
    String str11;
    String str12;
    label366: String str13;
    if ((!TextUtils.isEmpty(str1)) || (!TextUtils.isEmpty(str3)))
    {
      String[] arrayOfString1 = { str1, str3, str2, str4, str5 };
      bool1 = shouldAppendCharsetParam(arrayOfString1);
      if (!this.mRefrainsQPToNameProperties)
      {
        if (VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] { str1 }))
          if (VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] { str3 }))
            if (VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] { str2 }))
              if (VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] { str4 }))
                if (VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] { str5 }))
                  break label617;
        i = 1;
        if (TextUtils.isEmpty(str6))
          break label623;
        str7 = str6;
        String[] arrayOfString2 = { str7 };
        boolean bool2 = shouldAppendCharsetParam(arrayOfString2);
        if (this.mRefrainsQPToNameProperties)
          break label647;
        if (VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] { str7 }))
          break label647;
        j = 1;
        if (i == 0)
          break label653;
        str8 = encodeQuotedPrintable(str1);
        str9 = encodeQuotedPrintable(str3);
        str10 = encodeQuotedPrintable(str2);
        str11 = encodeQuotedPrintable(str4);
        str12 = encodeQuotedPrintable(str5);
        if (j == 0)
          break label695;
        str13 = encodeQuotedPrintable(str7);
        label379: this.mBuilder.append("N");
        if (!this.mIsDoCoMo)
          break label706;
        if (bool1)
        {
          this.mBuilder.append(";");
          this.mBuilder.append(this.mVCardCharsetParameter);
        }
        if (i != 0)
        {
          this.mBuilder.append(";");
          this.mBuilder.append("ENCODING=QUOTED-PRINTABLE");
        }
        this.mBuilder.append(":");
        this.mBuilder.append(str7);
        this.mBuilder.append(";");
        this.mBuilder.append(";");
        this.mBuilder.append(";");
        this.mBuilder.append(";");
        label508: this.mBuilder.append("\r\n");
        this.mBuilder.append("FN");
        if (bool2)
        {
          this.mBuilder.append(";");
          this.mBuilder.append(this.mVCardCharsetParameter);
        }
        if (j != 0)
        {
          this.mBuilder.append(";");
          this.mBuilder.append("ENCODING=QUOTED-PRINTABLE");
        }
        this.mBuilder.append(":");
        this.mBuilder.append(str13);
        this.mBuilder.append("\r\n");
      }
    }
    while (true)
    {
      appendPhoneticNameFields(localContentValues);
      return this;
      label617: i = 0;
      break;
      label623: str7 = VCardUtils.constructNameFromElements(VCardConfig.getNameOrderType(this.mVCardType), str1, str2, str3, str4, str5);
      break label278;
      label647: j = 0;
      break label322;
      label653: str8 = escapeCharacters(str1);
      str9 = escapeCharacters(str3);
      str10 = escapeCharacters(str2);
      str11 = escapeCharacters(str4);
      str12 = escapeCharacters(str5);
      break label366;
      label695: str13 = escapeCharacters(str7);
      break label379;
      label706: if (bool1)
      {
        this.mBuilder.append(";");
        this.mBuilder.append(this.mVCardCharsetParameter);
      }
      if (i != 0)
      {
        this.mBuilder.append(";");
        this.mBuilder.append("ENCODING=QUOTED-PRINTABLE");
      }
      this.mBuilder.append(":");
      this.mBuilder.append(str8);
      this.mBuilder.append(";");
      this.mBuilder.append(str9);
      this.mBuilder.append(";");
      this.mBuilder.append(str10);
      this.mBuilder.append(";");
      this.mBuilder.append(str11);
      this.mBuilder.append(";");
      this.mBuilder.append(str12);
      break label508;
      if (!TextUtils.isEmpty(str6))
      {
        buildSinglePartNameField("N", str6);
        this.mBuilder.append(";");
        this.mBuilder.append(";");
        this.mBuilder.append(";");
        this.mBuilder.append(";");
        this.mBuilder.append("\r\n");
        buildSinglePartNameField("FN", str6);
        this.mBuilder.append("\r\n");
      }
      else if (VCardConfig.isVersion30(this.mVCardType))
      {
        appendLine("N", "");
        appendLine("FN", "");
      }
      else if (this.mIsDoCoMo)
      {
        appendLine("N", "");
      }
    }
  }

  public VCardBuilder appendPhones(List<ContentValues> paramList, VCardPhoneNumberTranslationCallback paramVCardPhoneNumberTranslationCallback)
  {
    int i = 0;
    if (paramList != null)
    {
      HashSet localHashSet = new HashSet();
      Iterator localIterator1 = paramList.iterator();
      label523: 
      while (localIterator1.hasNext())
      {
        ContentValues localContentValues = (ContentValues)localIterator1.next();
        Integer localInteger1 = localContentValues.getAsInteger("data2");
        String str1 = localContentValues.getAsString("data3");
        Integer localInteger2 = localContentValues.getAsInteger("is_primary");
        boolean bool;
        label89: String str2;
        label296: if (localInteger2 != null)
        {
          if (localInteger2.intValue() > 0)
          {
            bool = true;
            str2 = localContentValues.getAsString("data1");
            if (str2 != null)
              str2 = str2.trim();
            if (TextUtils.isEmpty(str2))
              continue;
            if (localInteger1 == null)
              break label202;
          }
        }
        else
        {
          label202: for (int j = localInteger1.intValue(); ; j = 1)
          {
            if (paramVCardPhoneNumberTranslationCallback == null)
              break label208;
            String str6 = paramVCardPhoneNumberTranslationCallback.onValueReceived(str2, j, str1, bool);
            if (localHashSet.contains(str6))
              break;
            localHashSet.add(str6);
            appendTelLine(Integer.valueOf(j), str1, str6, bool);
            break;
            bool = false;
            break label89;
            bool = false;
            break label89;
          }
          label208: if ((j == 6) || (VCardConfig.refrainPhoneNumberFormatting(this.mVCardType)))
          {
            i = 1;
            if (!localHashSet.contains(str2))
            {
              localHashSet.add(str2);
              appendTelLine(Integer.valueOf(j), str1, str2, bool);
            }
          }
          else
          {
            List localList = splitPhoneNumbers(str2);
            if (!localList.isEmpty())
            {
              i = 1;
              Iterator localIterator2 = localList.iterator();
              String str3;
              String str4;
              StringBuilder localStringBuilder;
              int n;
              while (localIterator2.hasNext())
              {
                str3 = (String)localIterator2.next();
                if (!localHashSet.contains(str3))
                {
                  str4 = str3.replace(',', 'p').replace(';', 'w');
                  if (!TextUtils.equals(str4, str3))
                    break label523;
                  localStringBuilder = new StringBuilder();
                  int k = str3.length();
                  for (int m = 0; m < k; m++)
                  {
                    char c = str3.charAt(m);
                    if ((Character.isDigit(c)) || (c == '+'))
                      localStringBuilder.append(c);
                  }
                  n = VCardUtils.getPhoneNumberFormat(this.mVCardType);
                }
              }
              for (String str5 = VCardUtils.PhoneNumberUtilsPort.formatNumber(localStringBuilder.toString(), n); ; str5 = str4)
              {
                if ((VCardConfig.isVersion40(this.mVCardType)) && (!TextUtils.isEmpty(str5)) && (!str5.startsWith("tel:")))
                  str5 = "tel:" + str5;
                localHashSet.add(str3);
                appendTelLine(Integer.valueOf(j), str1, str5, bool);
                break label296;
                break;
              }
            }
          }
        }
      }
    }
    if ((i == 0) && (this.mIsDoCoMo))
      appendTelLine(Integer.valueOf(1), "", "", false);
    return this;
  }

  public void appendTelLine(Integer paramInteger, String paramString1, String paramString2, boolean paramBoolean)
  {
    this.mBuilder.append("TEL");
    this.mBuilder.append(";");
    int i;
    ArrayList localArrayList;
    if (paramInteger == null)
    {
      i = 7;
      localArrayList = new ArrayList();
      switch (i)
      {
      case 8:
      case 14:
      case 16:
      case 19:
      default:
        label140: if (paramBoolean)
          localArrayList.add("PREF");
        if (localArrayList.isEmpty())
          appendUncommonPhoneType(this.mBuilder, Integer.valueOf(i));
        break;
      case 1:
      case 3:
      case 5:
      case 4:
      case 2:
      case 6:
      case 7:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 15:
      case 17:
      case 18:
      case 20:
      case 0:
      }
    }
    while (true)
    {
      this.mBuilder.append(":");
      this.mBuilder.append(paramString2);
      this.mBuilder.append("\r\n");
      return;
      i = paramInteger.intValue();
      break;
      localArrayList.addAll(Arrays.asList(new String[] { "HOME" }));
      break label140;
      localArrayList.addAll(Arrays.asList(new String[] { "WORK" }));
      break label140;
      localArrayList.addAll(Arrays.asList(new String[] { "HOME", "FAX" }));
      break label140;
      localArrayList.addAll(Arrays.asList(new String[] { "WORK", "FAX" }));
      break label140;
      localArrayList.add("CELL");
      break label140;
      if (this.mIsDoCoMo)
      {
        localArrayList.add("VOICE");
        break label140;
      }
      localArrayList.add("PAGER");
      break label140;
      localArrayList.add("VOICE");
      break label140;
      localArrayList.add("CAR");
      break label140;
      localArrayList.add("WORK");
      paramBoolean = true;
      break label140;
      localArrayList.add("ISDN");
      break label140;
      paramBoolean = true;
      break label140;
      localArrayList.add("FAX");
      break label140;
      localArrayList.add("TLX");
      break label140;
      localArrayList.addAll(Arrays.asList(new String[] { "WORK", "CELL" }));
      break label140;
      localArrayList.add("WORK");
      if (this.mIsDoCoMo)
      {
        localArrayList.add("VOICE");
        break label140;
      }
      localArrayList.add("PAGER");
      break label140;
      localArrayList.add("MSG");
      break label140;
      if (TextUtils.isEmpty(paramString1))
      {
        localArrayList.add("VOICE");
        break label140;
      }
      if (VCardUtils.isMobilePhoneLabel(paramString1))
      {
        localArrayList.add("CELL");
        break label140;
      }
      if (this.mIsV30OrV40)
      {
        localArrayList.add(paramString1);
        break label140;
      }
      String str = paramString1.toUpperCase(Locale.getDefault());
      if (VCardUtils.isValidInV21ButUnknownToContactsPhoteType(str))
      {
        localArrayList.add(str);
        break label140;
      }
      if (!VCardUtils.containsOnlyAlphaDigitHyphen(new String[] { paramString1 }))
        break label140;
      localArrayList.add("X-" + paramString1);
      break label140;
      appendTypeParameters(localArrayList);
    }
  }

  public void clear()
  {
    this.mBuilder = new StringBuilder();
    this.mEndAppended = false;
    appendLine("BEGIN", "VCARD");
    if (VCardConfig.isVersion40(this.mVCardType))
    {
      appendLine("VERSION", "4.0");
      return;
    }
    if (VCardConfig.isVersion30(this.mVCardType))
    {
      appendLine("VERSION", "3.0");
      return;
    }
    if (!VCardConfig.isVersion21(this.mVCardType))
      Log.w("vCard", "Unknown vCard version detected.");
    appendLine("VERSION", "2.1");
  }

  public String toString()
  {
    if (!this.mEndAppended)
    {
      if (this.mIsDoCoMo)
      {
        appendLine("X-CLASS", "PUBLIC");
        appendLine("X-REDUCTION", "");
        appendLine("X-NO", "");
        appendLine("X-DCM-HMN-MODE", "");
      }
      appendLine("END", "VCARD");
      this.mEndAppended = true;
    }
    return this.mBuilder.toString();
  }
}