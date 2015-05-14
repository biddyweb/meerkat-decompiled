package org.joda.time.format;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.joda.time.DurationFieldType;
import org.joda.time.PeriodType;
import org.joda.time.ReadWritablePeriod;
import org.joda.time.ReadablePeriod;

public class PeriodFormatterBuilder
{
  private static final int DAYS = 3;
  private static final int HOURS = 4;
  private static final int MAX_FIELD = 9;
  private static final int MILLIS = 7;
  private static final int MINUTES = 5;
  private static final int MONTHS = 1;
  private static final ConcurrentMap<String, Pattern> PATTERNS = new ConcurrentHashMap();
  private static final int PRINT_ZERO_ALWAYS = 4;
  private static final int PRINT_ZERO_IF_SUPPORTED = 3;
  private static final int PRINT_ZERO_NEVER = 5;
  private static final int PRINT_ZERO_RARELY_FIRST = 1;
  private static final int PRINT_ZERO_RARELY_LAST = 2;
  private static final int SECONDS = 6;
  private static final int SECONDS_MILLIS = 8;
  private static final int SECONDS_OPTIONAL_MILLIS = 9;
  private static final int WEEKS = 2;
  private static final int YEARS;
  private List<Object> iElementPairs;
  private FieldFormatter[] iFieldFormatters;
  private int iMaxParsedDigits;
  private int iMinPrintedDigits;
  private boolean iNotParser;
  private boolean iNotPrinter;
  private PeriodFieldAffix iPrefix;
  private int iPrintZeroSetting;
  private boolean iRejectSignedValues;

  public PeriodFormatterBuilder()
  {
    clear();
  }

  private PeriodFormatterBuilder append0(PeriodPrinter paramPeriodPrinter, PeriodParser paramPeriodParser)
  {
    boolean bool1 = true;
    this.iElementPairs.add(paramPeriodPrinter);
    this.iElementPairs.add(paramPeriodParser);
    boolean bool2 = this.iNotPrinter;
    boolean bool3;
    boolean bool4;
    if (paramPeriodPrinter == null)
    {
      bool3 = bool1;
      this.iNotPrinter = (bool3 | bool2);
      bool4 = this.iNotParser;
      if (paramPeriodParser != null)
        break label72;
    }
    while (true)
    {
      this.iNotParser = (bool4 | bool1);
      return this;
      bool3 = false;
      break;
      label72: bool1 = false;
    }
  }

  private void appendField(int paramInt)
  {
    appendField(paramInt, this.iMinPrintedDigits);
  }

  private void appendField(int paramInt1, int paramInt2)
  {
    FieldFormatter localFieldFormatter = new FieldFormatter(paramInt2, this.iPrintZeroSetting, this.iMaxParsedDigits, this.iRejectSignedValues, paramInt1, this.iFieldFormatters, this.iPrefix, null);
    append0(localFieldFormatter, localFieldFormatter);
    this.iFieldFormatters[paramInt1] = localFieldFormatter;
    this.iPrefix = null;
  }

  private PeriodFormatterBuilder appendPrefix(PeriodFieldAffix paramPeriodFieldAffix)
  {
    if (paramPeriodFieldAffix == null)
      throw new IllegalArgumentException();
    if (this.iPrefix != null)
      paramPeriodFieldAffix = new CompositeAffix(this.iPrefix, paramPeriodFieldAffix);
    this.iPrefix = paramPeriodFieldAffix;
    return this;
  }

  private PeriodFormatterBuilder appendSeparator(String paramString1, String paramString2, String[] paramArrayOfString, boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((paramString1 == null) || (paramString2 == null))
      throw new IllegalArgumentException();
    clearPrefix();
    List localList1 = this.iElementPairs;
    if (localList1.size() == 0)
    {
      if ((paramBoolean2) && (!paramBoolean1))
      {
        Separator localSeparator3 = new Separator(paramString1, paramString2, paramArrayOfString, Literal.EMPTY, Literal.EMPTY, paramBoolean1, paramBoolean2);
        append0(localSeparator3, localSeparator3);
      }
      return this;
    }
    int i = localList1.size();
    int j = i - 1;
    Separator localSeparator1;
    List localList2;
    if (j >= 0)
      if ((localList1.get(j) instanceof Separator))
      {
        localSeparator1 = (Separator)localList1.get(j);
        localList2 = localList1.subList(j + 1, localList1.size());
      }
    while (true)
    {
      if ((localSeparator1 != null) && (localList2.size() == 0))
      {
        throw new IllegalStateException("Cannot have two adjacent separators");
        i = j - 1;
        break;
      }
      Object[] arrayOfObject = createComposite(localList2);
      localList2.clear();
      Separator localSeparator2 = new Separator(paramString1, paramString2, paramArrayOfString, (PeriodPrinter)arrayOfObject[0], (PeriodParser)arrayOfObject[1], paramBoolean1, paramBoolean2);
      localList2.add(localSeparator2);
      localList2.add(localSeparator2);
      return this;
      localList2 = localList1;
      localSeparator1 = null;
    }
  }

  private PeriodFormatterBuilder appendSuffix(PeriodFieldAffix paramPeriodFieldAffix)
  {
    Object localObject4;
    Object localObject1;
    if (this.iElementPairs.size() > 0)
    {
      Object localObject3 = this.iElementPairs.get(-2 + this.iElementPairs.size());
      localObject4 = this.iElementPairs.get(-1 + this.iElementPairs.size());
      localObject1 = localObject3;
    }
    for (Object localObject2 = localObject4; (localObject1 == null) || (localObject2 == null) || (localObject1 != localObject2) || (!(localObject1 instanceof FieldFormatter)); localObject2 = null)
    {
      throw new IllegalStateException("No field to apply suffix to");
      localObject1 = null;
    }
    clearPrefix();
    FieldFormatter localFieldFormatter = new FieldFormatter((FieldFormatter)localObject1, paramPeriodFieldAffix);
    this.iElementPairs.set(-2 + this.iElementPairs.size(), localFieldFormatter);
    this.iElementPairs.set(-1 + this.iElementPairs.size(), localFieldFormatter);
    this.iFieldFormatters[localFieldFormatter.getFieldType()] = localFieldFormatter;
    return this;
  }

  private void clearPrefix()
    throws IllegalStateException
  {
    if (this.iPrefix != null)
      throw new IllegalStateException("Prefix not followed by field");
    this.iPrefix = null;
  }

  private static Object[] createComposite(List<Object> paramList)
  {
    switch (paramList.size())
    {
    default:
      Composite localComposite = new Composite(paramList);
      return new Object[] { localComposite, localComposite };
    case 0:
      Object[] arrayOfObject2 = new Object[2];
      arrayOfObject2[0] = Literal.EMPTY;
      arrayOfObject2[1] = Literal.EMPTY;
      return arrayOfObject2;
    case 1:
    }
    Object[] arrayOfObject1 = new Object[2];
    arrayOfObject1[0] = paramList.get(0);
    arrayOfObject1[1] = paramList.get(1);
    return arrayOfObject1;
  }

  private static PeriodFormatter toFormatter(List<Object> paramList, boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((paramBoolean1) && (paramBoolean2))
      throw new IllegalStateException("Builder has created neither a printer nor a parser");
    int i = paramList.size();
    if ((i >= 2) && ((paramList.get(0) instanceof Separator)))
    {
      Separator localSeparator1 = (Separator)paramList.get(0);
      if ((localSeparator1.iAfterParser == null) && (localSeparator1.iAfterPrinter == null))
      {
        PeriodFormatter localPeriodFormatter = toFormatter(paramList.subList(2, i), paramBoolean1, paramBoolean2);
        Separator localSeparator2 = localSeparator1.finish(localPeriodFormatter.getPrinter(), localPeriodFormatter.getParser());
        return new PeriodFormatter(localSeparator2, localSeparator2);
      }
    }
    Object[] arrayOfObject = createComposite(paramList);
    if (paramBoolean1)
      return new PeriodFormatter(null, (PeriodParser)arrayOfObject[1]);
    if (paramBoolean2)
      return new PeriodFormatter((PeriodPrinter)arrayOfObject[0], null);
    return new PeriodFormatter((PeriodPrinter)arrayOfObject[0], (PeriodParser)arrayOfObject[1]);
  }

  public PeriodFormatterBuilder append(PeriodFormatter paramPeriodFormatter)
  {
    if (paramPeriodFormatter == null)
      throw new IllegalArgumentException("No formatter supplied");
    clearPrefix();
    append0(paramPeriodFormatter.getPrinter(), paramPeriodFormatter.getParser());
    return this;
  }

  public PeriodFormatterBuilder append(PeriodPrinter paramPeriodPrinter, PeriodParser paramPeriodParser)
  {
    if ((paramPeriodPrinter == null) && (paramPeriodParser == null))
      throw new IllegalArgumentException("No printer or parser supplied");
    clearPrefix();
    append0(paramPeriodPrinter, paramPeriodParser);
    return this;
  }

  public PeriodFormatterBuilder appendDays()
  {
    appendField(3);
    return this;
  }

  public PeriodFormatterBuilder appendHours()
  {
    appendField(4);
    return this;
  }

  public PeriodFormatterBuilder appendLiteral(String paramString)
  {
    if (paramString == null)
      throw new IllegalArgumentException("Literal must not be null");
    clearPrefix();
    Literal localLiteral = new Literal(paramString);
    append0(localLiteral, localLiteral);
    return this;
  }

  public PeriodFormatterBuilder appendMillis()
  {
    appendField(7);
    return this;
  }

  public PeriodFormatterBuilder appendMillis3Digit()
  {
    appendField(7, 3);
    return this;
  }

  public PeriodFormatterBuilder appendMinutes()
  {
    appendField(5);
    return this;
  }

  public PeriodFormatterBuilder appendMonths()
  {
    appendField(1);
    return this;
  }

  public PeriodFormatterBuilder appendPrefix(String paramString)
  {
    if (paramString == null)
      throw new IllegalArgumentException();
    return appendPrefix(new SimpleAffix(paramString));
  }

  public PeriodFormatterBuilder appendPrefix(String paramString1, String paramString2)
  {
    if ((paramString1 == null) || (paramString2 == null))
      throw new IllegalArgumentException();
    return appendPrefix(new PluralAffix(paramString1, paramString2));
  }

  public PeriodFormatterBuilder appendPrefix(String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    if ((paramArrayOfString1 == null) || (paramArrayOfString2 == null) || (paramArrayOfString1.length < 1) || (paramArrayOfString1.length != paramArrayOfString2.length))
      throw new IllegalArgumentException();
    return appendPrefix(new RegExAffix(paramArrayOfString1, paramArrayOfString2));
  }

  public PeriodFormatterBuilder appendSeconds()
  {
    appendField(6);
    return this;
  }

  public PeriodFormatterBuilder appendSecondsWithMillis()
  {
    appendField(8);
    return this;
  }

  public PeriodFormatterBuilder appendSecondsWithOptionalMillis()
  {
    appendField(9);
    return this;
  }

  public PeriodFormatterBuilder appendSeparator(String paramString)
  {
    return appendSeparator(paramString, paramString, null, true, true);
  }

  public PeriodFormatterBuilder appendSeparator(String paramString1, String paramString2)
  {
    return appendSeparator(paramString1, paramString2, null, true, true);
  }

  public PeriodFormatterBuilder appendSeparator(String paramString1, String paramString2, String[] paramArrayOfString)
  {
    return appendSeparator(paramString1, paramString2, paramArrayOfString, true, true);
  }

  public PeriodFormatterBuilder appendSeparatorIfFieldsAfter(String paramString)
  {
    return appendSeparator(paramString, paramString, null, false, true);
  }

  public PeriodFormatterBuilder appendSeparatorIfFieldsBefore(String paramString)
  {
    return appendSeparator(paramString, paramString, null, true, false);
  }

  public PeriodFormatterBuilder appendSuffix(String paramString)
  {
    if (paramString == null)
      throw new IllegalArgumentException();
    return appendSuffix(new SimpleAffix(paramString));
  }

  public PeriodFormatterBuilder appendSuffix(String paramString1, String paramString2)
  {
    if ((paramString1 == null) || (paramString2 == null))
      throw new IllegalArgumentException();
    return appendSuffix(new PluralAffix(paramString1, paramString2));
  }

  public PeriodFormatterBuilder appendSuffix(String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    if ((paramArrayOfString1 == null) || (paramArrayOfString2 == null) || (paramArrayOfString1.length < 1) || (paramArrayOfString1.length != paramArrayOfString2.length))
      throw new IllegalArgumentException();
    return appendSuffix(new RegExAffix(paramArrayOfString1, paramArrayOfString2));
  }

  public PeriodFormatterBuilder appendWeeks()
  {
    appendField(2);
    return this;
  }

  public PeriodFormatterBuilder appendYears()
  {
    appendField(0);
    return this;
  }

  public void clear()
  {
    this.iMinPrintedDigits = 1;
    this.iPrintZeroSetting = 2;
    this.iMaxParsedDigits = 10;
    this.iRejectSignedValues = false;
    this.iPrefix = null;
    if (this.iElementPairs == null)
      this.iElementPairs = new ArrayList();
    while (true)
    {
      this.iNotPrinter = false;
      this.iNotParser = false;
      this.iFieldFormatters = new FieldFormatter[10];
      return;
      this.iElementPairs.clear();
    }
  }

  public PeriodFormatterBuilder maximumParsedDigits(int paramInt)
  {
    this.iMaxParsedDigits = paramInt;
    return this;
  }

  public PeriodFormatterBuilder minimumPrintedDigits(int paramInt)
  {
    this.iMinPrintedDigits = paramInt;
    return this;
  }

  public PeriodFormatterBuilder printZeroAlways()
  {
    this.iPrintZeroSetting = 4;
    return this;
  }

  public PeriodFormatterBuilder printZeroIfSupported()
  {
    this.iPrintZeroSetting = 3;
    return this;
  }

  public PeriodFormatterBuilder printZeroNever()
  {
    this.iPrintZeroSetting = 5;
    return this;
  }

  public PeriodFormatterBuilder printZeroRarelyFirst()
  {
    this.iPrintZeroSetting = 1;
    return this;
  }

  public PeriodFormatterBuilder printZeroRarelyLast()
  {
    this.iPrintZeroSetting = 2;
    return this;
  }

  public PeriodFormatterBuilder rejectSignedValues(boolean paramBoolean)
  {
    this.iRejectSignedValues = paramBoolean;
    return this;
  }

  public PeriodFormatter toFormatter()
  {
    PeriodFormatter localPeriodFormatter = toFormatter(this.iElementPairs, this.iNotPrinter, this.iNotParser);
    for (FieldFormatter localFieldFormatter : this.iFieldFormatters)
      if (localFieldFormatter != null)
        localFieldFormatter.finish(this.iFieldFormatters);
    this.iFieldFormatters = ((FieldFormatter[])this.iFieldFormatters.clone());
    return localPeriodFormatter;
  }

  public PeriodParser toParser()
  {
    if (this.iNotParser)
      return null;
    return toFormatter().getParser();
  }

  public PeriodPrinter toPrinter()
  {
    if (this.iNotPrinter)
      return null;
    return toFormatter().getPrinter();
  }

  static class Composite
    implements PeriodPrinter, PeriodParser
  {
    private final PeriodParser[] iParsers;
    private final PeriodPrinter[] iPrinters;

    Composite(List<Object> paramList)
    {
      ArrayList localArrayList1 = new ArrayList();
      ArrayList localArrayList2 = new ArrayList();
      decompose(paramList, localArrayList1, localArrayList2);
      if (localArrayList1.size() <= 0);
      for (this.iPrinters = null; localArrayList2.size() <= 0; this.iPrinters = ((PeriodPrinter[])localArrayList1.toArray(new PeriodParser[localArrayList1.size()])))
      {
        this.iParsers = null;
        return;
      }
      this.iParsers = ((PeriodParser[])localArrayList2.toArray(new PeriodParser[localArrayList2.size()]));
    }

    private void addArrayToList(List<Object> paramList, Object[] paramArrayOfObject)
    {
      if (paramArrayOfObject != null)
        for (int i = 0; i < paramArrayOfObject.length; i++)
          paramList.add(paramArrayOfObject[i]);
    }

    private void decompose(List<Object> paramList1, List<Object> paramList2, List<Object> paramList3)
    {
      int i = paramList1.size();
      int j = 0;
      if (j < i)
      {
        Object localObject1 = paramList1.get(j);
        label57: Object localObject2;
        if ((localObject1 instanceof PeriodParser))
        {
          if ((localObject1 instanceof Composite))
            addArrayToList(paramList2, ((Composite)localObject1).iPrinters);
        }
        else
        {
          localObject2 = paramList1.get(j + 1);
          if ((localObject2 instanceof PeriodParser))
          {
            if (!(localObject2 instanceof Composite))
              break label116;
            addArrayToList(paramList3, ((Composite)localObject2).iParsers);
          }
        }
        while (true)
        {
          j += 2;
          break;
          paramList2.add(localObject1);
          break label57;
          label116: paramList3.add(localObject2);
        }
      }
    }

    public int calculatePrintedLength(ReadablePeriod paramReadablePeriod, Locale paramLocale)
    {
      int i = 0;
      PeriodPrinter[] arrayOfPeriodPrinter = this.iPrinters;
      int j = arrayOfPeriodPrinter.length;
      while (true)
      {
        j--;
        if (j < 0)
          break;
        i += arrayOfPeriodPrinter[j].calculatePrintedLength(paramReadablePeriod, paramLocale);
      }
      return i;
    }

    public int countFieldsToPrint(ReadablePeriod paramReadablePeriod, int paramInt, Locale paramLocale)
    {
      int i = 0;
      PeriodPrinter[] arrayOfPeriodPrinter = this.iPrinters;
      int j = arrayOfPeriodPrinter.length;
      while (i < paramInt)
      {
        j--;
        if (j < 0)
          break;
        i += arrayOfPeriodPrinter[j].countFieldsToPrint(paramReadablePeriod, 2147483647, paramLocale);
      }
      return i;
    }

    public int parseInto(ReadWritablePeriod paramReadWritablePeriod, String paramString, int paramInt, Locale paramLocale)
    {
      PeriodParser[] arrayOfPeriodParser = this.iParsers;
      if (arrayOfPeriodParser == null)
        throw new UnsupportedOperationException();
      int i = arrayOfPeriodParser.length;
      for (int j = 0; (j < i) && (paramInt >= 0); j++)
        paramInt = arrayOfPeriodParser[j].parseInto(paramReadWritablePeriod, paramString, paramInt, paramLocale);
      return paramInt;
    }

    public void printTo(Writer paramWriter, ReadablePeriod paramReadablePeriod, Locale paramLocale)
      throws IOException
    {
      PeriodPrinter[] arrayOfPeriodPrinter = this.iPrinters;
      int i = arrayOfPeriodPrinter.length;
      for (int j = 0; j < i; j++)
        arrayOfPeriodPrinter[j].printTo(paramWriter, paramReadablePeriod, paramLocale);
    }

    public void printTo(StringBuffer paramStringBuffer, ReadablePeriod paramReadablePeriod, Locale paramLocale)
    {
      PeriodPrinter[] arrayOfPeriodPrinter = this.iPrinters;
      int i = arrayOfPeriodPrinter.length;
      for (int j = 0; j < i; j++)
        arrayOfPeriodPrinter[j].printTo(paramStringBuffer, paramReadablePeriod, paramLocale);
    }
  }

  static class CompositeAffix extends PeriodFormatterBuilder.IgnorableAffix
  {
    private final PeriodFormatterBuilder.PeriodFieldAffix iLeft;
    private final String[] iLeftRightCombinations;
    private final PeriodFormatterBuilder.PeriodFieldAffix iRight;

    CompositeAffix(PeriodFormatterBuilder.PeriodFieldAffix paramPeriodFieldAffix1, PeriodFormatterBuilder.PeriodFieldAffix paramPeriodFieldAffix2)
    {
      this.iLeft = paramPeriodFieldAffix1;
      this.iRight = paramPeriodFieldAffix2;
      HashSet localHashSet = new HashSet();
      for (String str1 : this.iLeft.getAffixes())
        for (String str2 : this.iRight.getAffixes())
          localHashSet.add(str1 + str2);
      this.iLeftRightCombinations = ((String[])localHashSet.toArray(new String[localHashSet.size()]));
    }

    public int calculatePrintedLength(int paramInt)
    {
      return this.iLeft.calculatePrintedLength(paramInt) + this.iRight.calculatePrintedLength(paramInt);
    }

    public String[] getAffixes()
    {
      return (String[])this.iLeftRightCombinations.clone();
    }

    public int parse(String paramString, int paramInt)
    {
      int i = this.iLeft.parse(paramString, paramInt);
      if (i >= 0)
      {
        i = this.iRight.parse(paramString, i);
        if ((i >= 0) && (matchesOtherAffix(parse(paramString, i) - i, paramString, paramInt)))
          i = paramInt ^ 0xFFFFFFFF;
      }
      return i;
    }

    public void printTo(Writer paramWriter, int paramInt)
      throws IOException
    {
      this.iLeft.printTo(paramWriter, paramInt);
      this.iRight.printTo(paramWriter, paramInt);
    }

    public void printTo(StringBuffer paramStringBuffer, int paramInt)
    {
      this.iLeft.printTo(paramStringBuffer, paramInt);
      this.iRight.printTo(paramStringBuffer, paramInt);
    }

    public int scan(String paramString, int paramInt)
    {
      int i = this.iLeft.scan(paramString, paramInt);
      if (i >= 0)
      {
        int j = this.iRight.scan(paramString, this.iLeft.parse(paramString, i));
        if ((j < 0) || (!matchesOtherAffix(this.iRight.parse(paramString, j) - i, paramString, paramInt)))
        {
          if (i > 0)
            return i;
          return j;
        }
      }
      return paramInt ^ 0xFFFFFFFF;
    }
  }

  static class FieldFormatter
    implements PeriodPrinter, PeriodParser
  {
    private final FieldFormatter[] iFieldFormatters;
    private final int iFieldType;
    private final int iMaxParsedDigits;
    private final int iMinPrintedDigits;
    private final PeriodFormatterBuilder.PeriodFieldAffix iPrefix;
    private final int iPrintZeroSetting;
    private final boolean iRejectSignedValues;
    private final PeriodFormatterBuilder.PeriodFieldAffix iSuffix;

    FieldFormatter(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, int paramInt4, FieldFormatter[] paramArrayOfFieldFormatter, PeriodFormatterBuilder.PeriodFieldAffix paramPeriodFieldAffix1, PeriodFormatterBuilder.PeriodFieldAffix paramPeriodFieldAffix2)
    {
      this.iMinPrintedDigits = paramInt1;
      this.iPrintZeroSetting = paramInt2;
      this.iMaxParsedDigits = paramInt3;
      this.iRejectSignedValues = paramBoolean;
      this.iFieldType = paramInt4;
      this.iFieldFormatters = paramArrayOfFieldFormatter;
      this.iPrefix = paramPeriodFieldAffix1;
      this.iSuffix = paramPeriodFieldAffix2;
    }

    FieldFormatter(FieldFormatter paramFieldFormatter, PeriodFormatterBuilder.PeriodFieldAffix paramPeriodFieldAffix)
    {
      this.iMinPrintedDigits = paramFieldFormatter.iMinPrintedDigits;
      this.iPrintZeroSetting = paramFieldFormatter.iPrintZeroSetting;
      this.iMaxParsedDigits = paramFieldFormatter.iMaxParsedDigits;
      this.iRejectSignedValues = paramFieldFormatter.iRejectSignedValues;
      this.iFieldType = paramFieldFormatter.iFieldType;
      this.iFieldFormatters = paramFieldFormatter.iFieldFormatters;
      this.iPrefix = paramFieldFormatter.iPrefix;
      if (paramFieldFormatter.iSuffix != null)
        paramPeriodFieldAffix = new PeriodFormatterBuilder.CompositeAffix(paramFieldFormatter.iSuffix, paramPeriodFieldAffix);
      this.iSuffix = paramPeriodFieldAffix;
    }

    private int parseInt(String paramString, int paramInt1, int paramInt2)
    {
      int i;
      if (paramInt2 >= 10)
        i = Integer.parseInt(paramString.substring(paramInt1, paramInt1 + paramInt2));
      int j;
      int m;
      do
      {
        do
        {
          return i;
          i = 0;
        }
        while (paramInt2 <= 0);
        j = paramInt1 + 1;
        k = paramString.charAt(paramInt1);
        m = paramInt2 - 1;
        if (k != 45)
          break;
        m--;
        i = 0;
      }
      while (m < 0);
      int i1 = 1;
      int n = j + 1;
      int k = paramString.charAt(j);
      int i2;
      while (true)
      {
        i2 = k - 48;
        int i3 = n;
        while (true)
        {
          int i4 = m - 1;
          if (m <= 0)
            break;
          int i5 = (i2 << 3) + (i2 << 1);
          int i6 = i3 + 1;
          i2 = -48 + (i5 + paramString.charAt(i3));
          i3 = i6;
          m = i4;
        }
        n = j;
        i1 = 0;
      }
      if (i1 != 0)
        return -i2;
      return i2;
    }

    public int calculatePrintedLength(ReadablePeriod paramReadablePeriod, Locale paramLocale)
    {
      long l = getFieldValue(paramReadablePeriod);
      if (l == 9223372036854775807L)
      {
        i = 0;
        return i;
      }
      int i = Math.max(FormatUtils.calculateDigitCount(l), this.iMinPrintedDigits);
      if (this.iFieldType >= 8)
        if (l >= 0L)
          break label142;
      label142: for (int k = Math.max(i, 5); ; k = Math.max(i, 4))
      {
        i = k + 1;
        if ((this.iFieldType == 9) && (Math.abs(l) % 1000L == 0L))
          i -= 4;
        l /= 1000L;
        int j = (int)l;
        if (this.iPrefix != null)
          i += this.iPrefix.calculatePrintedLength(j);
        if (this.iSuffix == null)
          break;
        return i + this.iSuffix.calculatePrintedLength(j);
      }
    }

    public int countFieldsToPrint(ReadablePeriod paramReadablePeriod, int paramInt, Locale paramLocale)
    {
      if (paramInt <= 0);
      while ((this.iPrintZeroSetting != 4) && (getFieldValue(paramReadablePeriod) == 9223372036854775807L))
        return 0;
      return 1;
    }

    public void finish(FieldFormatter[] paramArrayOfFieldFormatter)
    {
      HashSet localHashSet1 = new HashSet();
      HashSet localHashSet2 = new HashSet();
      int i = paramArrayOfFieldFormatter.length;
      for (int j = 0; j < i; j++)
      {
        FieldFormatter localFieldFormatter = paramArrayOfFieldFormatter[j];
        if ((localFieldFormatter != null) && (!equals(localFieldFormatter)))
        {
          localHashSet1.add(localFieldFormatter.iPrefix);
          localHashSet2.add(localFieldFormatter.iSuffix);
        }
      }
      if (this.iPrefix != null)
        this.iPrefix.finish(localHashSet1);
      if (this.iSuffix != null)
        this.iSuffix.finish(localHashSet2);
    }

    int getFieldType()
    {
      return this.iFieldType;
    }

    long getFieldValue(ReadablePeriod paramReadablePeriod)
    {
      if (this.iPrintZeroSetting == 4);
      for (PeriodType localPeriodType = null; (localPeriodType != null) && (!isSupported(localPeriodType, this.iFieldType)); localPeriodType = paramReadablePeriod.getPeriodType())
        return 9223372036854775807L;
      long l;
      switch (this.iFieldType)
      {
      default:
        return 9223372036854775807L;
      case 0:
        l = paramReadablePeriod.get(DurationFieldType.years());
        label116: if (l == 0L)
          switch (this.iPrintZeroSetting)
          {
          case 5:
          case 3:
          case 4:
          default:
          case 2:
          case 1:
          }
        break;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      }
      label160: label436: 
      while (true)
      {
        return l;
        l = paramReadablePeriod.get(DurationFieldType.months());
        break label116;
        l = paramReadablePeriod.get(DurationFieldType.weeks());
        break label116;
        l = paramReadablePeriod.get(DurationFieldType.days());
        break label116;
        l = paramReadablePeriod.get(DurationFieldType.hours());
        break label116;
        l = paramReadablePeriod.get(DurationFieldType.minutes());
        break label116;
        l = paramReadablePeriod.get(DurationFieldType.seconds());
        break label116;
        l = paramReadablePeriod.get(DurationFieldType.millis());
        break label116;
        int i = paramReadablePeriod.get(DurationFieldType.seconds());
        int j = paramReadablePeriod.get(DurationFieldType.millis());
        l = 1000L * i + j;
        break label116;
        if ((!isZero(paramReadablePeriod)) || (this.iFieldFormatters[this.iFieldType] != this))
          break;
        for (int m = 1 + this.iFieldType; ; m++)
        {
          if (m > 9)
            break label160;
          if ((isSupported(localPeriodType, m)) && (this.iFieldFormatters[m] != null))
            break;
        }
        if ((!isZero(paramReadablePeriod)) || (this.iFieldFormatters[this.iFieldType] != this))
          break;
        for (int k = -1 + Math.min(this.iFieldType, 8); ; k--)
        {
          if ((k < 0) || (k > 9))
            break label436;
          if ((isSupported(localPeriodType, k)) && (this.iFieldFormatters[k] != null))
            break;
        }
      }
    }

    boolean isSupported(PeriodType paramPeriodType, int paramInt)
    {
      switch (paramInt)
      {
      default:
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      }
      do
      {
        return false;
        return paramPeriodType.isSupported(DurationFieldType.years());
        return paramPeriodType.isSupported(DurationFieldType.months());
        return paramPeriodType.isSupported(DurationFieldType.weeks());
        return paramPeriodType.isSupported(DurationFieldType.days());
        return paramPeriodType.isSupported(DurationFieldType.hours());
        return paramPeriodType.isSupported(DurationFieldType.minutes());
        return paramPeriodType.isSupported(DurationFieldType.seconds());
        return paramPeriodType.isSupported(DurationFieldType.millis());
      }
      while ((!paramPeriodType.isSupported(DurationFieldType.seconds())) && (!paramPeriodType.isSupported(DurationFieldType.millis())));
      return true;
    }

    boolean isZero(ReadablePeriod paramReadablePeriod)
    {
      int i = paramReadablePeriod.size();
      for (int j = 0; j < i; j++)
        if (paramReadablePeriod.getValue(j) != 0)
          return false;
      return true;
    }

    public int parseInto(ReadWritablePeriod paramReadWritablePeriod, String paramString, int paramInt, Locale paramLocale)
    {
      int i;
      if (this.iPrintZeroSetting == 4)
      {
        i = 1;
        if (paramInt < paramString.length())
          break label36;
        if (i != 0)
          paramInt ^= -1;
      }
      label139: label663: label665: label669: 
      while (true)
      {
        return paramInt;
        i = 0;
        break;
        label36: int i12;
        if (this.iPrefix != null)
        {
          paramInt = this.iPrefix.parse(paramString, paramInt);
          if (paramInt >= 0)
            i = 1;
        }
        else
        {
          if ((this.iSuffix == null) || (i != 0))
            break label665;
          i12 = this.iSuffix.scan(paramString, paramInt);
          if (i12 < 0)
            break label264;
          i = 1;
        }
        for (int j = i12; ; j = -1)
        {
          if ((i == 0) && (!isSupported(paramReadWritablePeriod.getPeriodType(), this.iFieldType)))
            break label669;
          int k;
          int m;
          int n;
          int i1;
          int i2;
          int i3;
          int i9;
          if (j > 0)
          {
            k = Math.min(this.iMaxParsedDigits, j - paramInt);
            m = -1;
            n = 0;
            i1 = k;
            i2 = 0;
            i3 = paramInt;
            if (i2 < i1)
            {
              i9 = paramString.charAt(i3 + i2);
              if ((i2 != 0) || ((i9 != 45) && (i9 != 43)) || (this.iRejectSignedValues))
                break label334;
              if (i9 != 45)
                break label295;
            }
          }
          label295: for (int i10 = 1; ; i10 = 0)
          {
            if (i2 + 1 < i1)
            {
              int i11 = paramString.charAt(1 + (i3 + i2));
              if ((i11 >= 48) && (i11 <= 57))
                break label301;
            }
            label245: if (n != 0)
              break label422;
            return i3 ^ 0xFFFFFFFF;
            if (i != 0)
              break;
            return paramInt ^ 0xFFFFFFFF;
            if (i == 0)
              return i12 ^ 0xFFFFFFFF;
            return i12;
            k = Math.min(this.iMaxParsedDigits, paramString.length() - paramInt);
            break label139;
          }
          label301: if (i10 != 0)
            i2++;
          while (true)
          {
            i1 = Math.min(i1 + 1, paramString.length() - i3);
            break;
            i3++;
          }
          label334: if ((i9 >= 48) && (i9 <= 57))
            n = 1;
          while (true)
          {
            i2++;
            break;
            if (((i9 != 46) && (i9 != 44)) || ((this.iFieldType != 8) && (this.iFieldType != 9)) || (m >= 0))
              break label245;
            m = 1 + (i3 + i2);
            i1 = Math.min(i1 + 1, paramString.length() - i3);
          }
          label422: if ((j >= 0) && (i3 + i2 != j))
            return i3;
          if ((this.iFieldType != 8) && (this.iFieldType != 9))
            setFieldValue(paramReadWritablePeriod, this.iFieldType, parseInt(paramString, i3, i2));
          while (true)
          {
            int i8 = i2 + i3;
            if ((i8 >= 0) && (this.iSuffix != null))
              i8 = this.iSuffix.parse(paramString, i8);
            return i8;
            if (m >= 0)
              break;
            setFieldValue(paramReadWritablePeriod, 6, parseInt(paramString, i3, i2));
            setFieldValue(paramReadWritablePeriod, 7, 0);
          }
          int i4 = parseInt(paramString, i3, -1 + (m - i3));
          setFieldValue(paramReadWritablePeriod, 6, i4);
          int i5 = i3 + i2 - m;
          int i7;
          if (i5 <= 0)
            i7 = 0;
          while (true)
          {
            setFieldValue(paramReadWritablePeriod, 7, i7);
            break;
            if (i5 >= 3)
              i7 = parseInt(paramString, m, 3);
            while (true)
            {
              if (i4 >= 0)
                break label663;
              i7 = -i7;
              break;
              int i6 = parseInt(paramString, m, i5);
              if (i5 == 1)
                i7 = i6 * 100;
              else
                i7 = i6 * 10;
            }
          }
        }
      }
    }

    public void printTo(Writer paramWriter, ReadablePeriod paramReadablePeriod, Locale paramLocale)
      throws IOException
    {
      long l = getFieldValue(paramReadablePeriod);
      if (l == 9223372036854775807L)
        return;
      int i = (int)l;
      if (this.iFieldType >= 8)
        i = (int)(l / 1000L);
      if (this.iPrefix != null)
        this.iPrefix.printTo(paramWriter, i);
      int j = this.iMinPrintedDigits;
      if (j <= 1)
        FormatUtils.writeUnpaddedInteger(paramWriter, i);
      while (true)
      {
        if (this.iFieldType >= 8)
        {
          int k = (int)(Math.abs(l) % 1000L);
          if ((this.iFieldType == 8) || (k > 0))
          {
            paramWriter.write(46);
            FormatUtils.writePaddedInteger(paramWriter, k, 3);
          }
        }
        if (this.iSuffix == null)
          break;
        this.iSuffix.printTo(paramWriter, i);
        return;
        FormatUtils.writePaddedInteger(paramWriter, i, j);
      }
    }

    public void printTo(StringBuffer paramStringBuffer, ReadablePeriod paramReadablePeriod, Locale paramLocale)
    {
      long l = getFieldValue(paramReadablePeriod);
      if (l == 9223372036854775807L)
        return;
      int i = (int)l;
      if (this.iFieldType >= 8)
        i = (int)(l / 1000L);
      if (this.iPrefix != null)
        this.iPrefix.printTo(paramStringBuffer, i);
      int j = paramStringBuffer.length();
      int k = this.iMinPrintedDigits;
      if (k <= 1)
        FormatUtils.appendUnpaddedInteger(paramStringBuffer, i);
      while (true)
      {
        if (this.iFieldType >= 8)
        {
          int m = (int)(Math.abs(l) % 1000L);
          if ((this.iFieldType == 8) || (m > 0))
          {
            if ((l < 0L) && (l > -1000L))
              paramStringBuffer.insert(j, '-');
            paramStringBuffer.append('.');
            FormatUtils.appendPaddedInteger(paramStringBuffer, m, 3);
          }
        }
        if (this.iSuffix == null)
          break;
        this.iSuffix.printTo(paramStringBuffer, i);
        return;
        FormatUtils.appendPaddedInteger(paramStringBuffer, i, k);
      }
    }

    void setFieldValue(ReadWritablePeriod paramReadWritablePeriod, int paramInt1, int paramInt2)
    {
      switch (paramInt1)
      {
      default:
        return;
      case 0:
        paramReadWritablePeriod.setYears(paramInt2);
        return;
      case 1:
        paramReadWritablePeriod.setMonths(paramInt2);
        return;
      case 2:
        paramReadWritablePeriod.setWeeks(paramInt2);
        return;
      case 3:
        paramReadWritablePeriod.setDays(paramInt2);
        return;
      case 4:
        paramReadWritablePeriod.setHours(paramInt2);
        return;
      case 5:
        paramReadWritablePeriod.setMinutes(paramInt2);
        return;
      case 6:
        paramReadWritablePeriod.setSeconds(paramInt2);
        return;
      case 7:
      }
      paramReadWritablePeriod.setMillis(paramInt2);
    }
  }

  static abstract class IgnorableAffix
    implements PeriodFormatterBuilder.PeriodFieldAffix
  {
    private volatile String[] iOtherAffixes;

    public void finish(Set<PeriodFormatterBuilder.PeriodFieldAffix> paramSet)
    {
      int i;
      Object localObject1;
      int k;
      Object localObject2;
      if (this.iOtherAffixes == null)
      {
        i = 2147483647;
        localObject1 = null;
        String[] arrayOfString1 = getAffixes();
        int j = arrayOfString1.length;
        k = 0;
        if (k < j)
        {
          localObject2 = arrayOfString1[k];
          if (((String)localObject2).length() >= i)
            break label211;
        }
      }
      for (int i1 = ((String)localObject2).length(); ; i1 = i)
      {
        k++;
        i = i1;
        localObject1 = localObject2;
        break;
        HashSet localHashSet = new HashSet();
        Iterator localIterator = paramSet.iterator();
        while (localIterator.hasNext())
        {
          PeriodFormatterBuilder.PeriodFieldAffix localPeriodFieldAffix = (PeriodFormatterBuilder.PeriodFieldAffix)localIterator.next();
          if (localPeriodFieldAffix != null)
            for (String str : localPeriodFieldAffix.getAffixes())
              if ((str.length() > i) || ((str.equalsIgnoreCase(localObject1)) && (!str.equals(localObject1))))
                localHashSet.add(str);
        }
        this.iOtherAffixes = ((String[])localHashSet.toArray(new String[localHashSet.size()]));
        return;
        label211: localObject2 = localObject1;
      }
    }

    protected boolean matchesOtherAffix(int paramInt1, String paramString, int paramInt2)
    {
      if (this.iOtherAffixes != null)
        for (String str : this.iOtherAffixes)
        {
          int k = str.length();
          if (((paramInt1 < k) && (paramString.regionMatches(true, paramInt2, str, 0, k))) || ((paramInt1 == k) && (paramString.regionMatches(false, paramInt2, str, 0, k))))
            return true;
        }
      return false;
    }
  }

  static class Literal
    implements PeriodPrinter, PeriodParser
  {
    static final Literal EMPTY = new Literal("");
    private final String iText;

    Literal(String paramString)
    {
      this.iText = paramString;
    }

    public int calculatePrintedLength(ReadablePeriod paramReadablePeriod, Locale paramLocale)
    {
      return this.iText.length();
    }

    public int countFieldsToPrint(ReadablePeriod paramReadablePeriod, int paramInt, Locale paramLocale)
    {
      return 0;
    }

    public int parseInto(ReadWritablePeriod paramReadWritablePeriod, String paramString, int paramInt, Locale paramLocale)
    {
      if (paramString.regionMatches(true, paramInt, this.iText, 0, this.iText.length()))
        return paramInt + this.iText.length();
      return paramInt ^ 0xFFFFFFFF;
    }

    public void printTo(Writer paramWriter, ReadablePeriod paramReadablePeriod, Locale paramLocale)
      throws IOException
    {
      paramWriter.write(this.iText);
    }

    public void printTo(StringBuffer paramStringBuffer, ReadablePeriod paramReadablePeriod, Locale paramLocale)
    {
      paramStringBuffer.append(this.iText);
    }
  }

  static abstract interface PeriodFieldAffix
  {
    public abstract int calculatePrintedLength(int paramInt);

    public abstract void finish(Set<PeriodFieldAffix> paramSet);

    public abstract String[] getAffixes();

    public abstract int parse(String paramString, int paramInt);

    public abstract void printTo(Writer paramWriter, int paramInt)
      throws IOException;

    public abstract void printTo(StringBuffer paramStringBuffer, int paramInt);

    public abstract int scan(String paramString, int paramInt);
  }

  static class PluralAffix extends PeriodFormatterBuilder.IgnorableAffix
  {
    private final String iPluralText;
    private final String iSingularText;

    PluralAffix(String paramString1, String paramString2)
    {
      this.iSingularText = paramString1;
      this.iPluralText = paramString2;
    }

    public int calculatePrintedLength(int paramInt)
    {
      if (paramInt == 1);
      for (String str = this.iSingularText; ; str = this.iPluralText)
        return str.length();
    }

    public String[] getAffixes()
    {
      String[] arrayOfString = new String[2];
      arrayOfString[0] = this.iSingularText;
      arrayOfString[1] = this.iPluralText;
      return arrayOfString;
    }

    public int parse(String paramString, int paramInt)
    {
      String str1 = this.iPluralText;
      String str2 = this.iSingularText;
      String str3;
      if (str1.length() < str2.length())
        str3 = str1;
      for (String str4 = str2; ; str4 = str1)
      {
        if ((paramString.regionMatches(true, paramInt, str4, 0, str4.length())) && (!matchesOtherAffix(str4.length(), paramString, paramInt)))
          return paramInt + str4.length();
        int i = str3.length();
        if ((paramString.regionMatches(true, paramInt, str3, 0, i)) && (!matchesOtherAffix(str3.length(), paramString, paramInt)))
          return paramInt + str3.length();
        return paramInt ^ 0xFFFFFFFF;
        str3 = str2;
      }
    }

    public void printTo(Writer paramWriter, int paramInt)
      throws IOException
    {
      if (paramInt == 1);
      for (String str = this.iSingularText; ; str = this.iPluralText)
      {
        paramWriter.write(str);
        return;
      }
    }

    public void printTo(StringBuffer paramStringBuffer, int paramInt)
    {
      if (paramInt == 1);
      for (String str = this.iSingularText; ; str = this.iPluralText)
      {
        paramStringBuffer.append(str);
        return;
      }
    }

    public int scan(String paramString, int paramInt)
    {
      Object localObject1 = this.iPluralText;
      String str = this.iSingularText;
      Object localObject2;
      if (((String)localObject1).length() < str.length())
        localObject2 = str;
      while (true)
      {
        int i = ((String)localObject2).length();
        int j = ((String)localObject1).length();
        int k = paramString.length();
        for (int m = paramInt; m < k; m++)
        {
          if ((paramString.regionMatches(true, m, (String)localObject2, 0, i)) && (!matchesOtherAffix(((String)localObject2).length(), paramString, m)));
          while ((paramString.regionMatches(true, m, (String)localObject1, 0, j)) && (!matchesOtherAffix(((String)localObject1).length(), paramString, m)))
            return m;
        }
        return paramInt ^ 0xFFFFFFFF;
        localObject2 = localObject1;
        localObject1 = str;
      }
    }
  }

  static class RegExAffix extends PeriodFormatterBuilder.IgnorableAffix
  {
    private static final Comparator<String> LENGTH_DESC_COMPARATOR = new Comparator()
    {
      public int compare(String paramAnonymousString1, String paramAnonymousString2)
      {
        return paramAnonymousString2.length() - paramAnonymousString1.length();
      }
    };
    private final Pattern[] iPatterns;
    private final String[] iSuffixes;
    private final String[] iSuffixesSortedDescByLength;

    RegExAffix(String[] paramArrayOfString1, String[] paramArrayOfString2)
    {
      this.iSuffixes = ((String[])paramArrayOfString2.clone());
      this.iPatterns = new Pattern[paramArrayOfString1.length];
      for (int i = 0; i < paramArrayOfString1.length; i++)
      {
        Pattern localPattern = (Pattern)PeriodFormatterBuilder.PATTERNS.get(paramArrayOfString1[i]);
        if (localPattern == null)
        {
          localPattern = Pattern.compile(paramArrayOfString1[i]);
          PeriodFormatterBuilder.PATTERNS.putIfAbsent(paramArrayOfString1[i], localPattern);
        }
        this.iPatterns[i] = localPattern;
      }
      this.iSuffixesSortedDescByLength = ((String[])this.iSuffixes.clone());
      Arrays.sort(this.iSuffixesSortedDescByLength, LENGTH_DESC_COMPARATOR);
    }

    private int selectSuffixIndex(int paramInt)
    {
      String str = String.valueOf(paramInt);
      for (int i = 0; i < this.iPatterns.length; i++)
        if (this.iPatterns[i].matcher(str).matches())
          return i;
      return -1 + this.iPatterns.length;
    }

    public int calculatePrintedLength(int paramInt)
    {
      return this.iSuffixes[selectSuffixIndex(paramInt)].length();
    }

    public String[] getAffixes()
    {
      return (String[])this.iSuffixes.clone();
    }

    public int parse(String paramString, int paramInt)
    {
      for (String str : this.iSuffixesSortedDescByLength)
        if ((paramString.regionMatches(true, paramInt, str, 0, str.length())) && (!matchesOtherAffix(str.length(), paramString, paramInt)))
          return paramInt + str.length();
      return paramInt ^ 0xFFFFFFFF;
    }

    public void printTo(Writer paramWriter, int paramInt)
      throws IOException
    {
      paramWriter.write(this.iSuffixes[selectSuffixIndex(paramInt)]);
    }

    public void printTo(StringBuffer paramStringBuffer, int paramInt)
    {
      paramStringBuffer.append(this.iSuffixes[selectSuffixIndex(paramInt)]);
    }

    public int scan(String paramString, int paramInt)
    {
      int i = paramString.length();
      for (int j = paramInt; j < i; j++)
        for (String str : this.iSuffixesSortedDescByLength)
          if ((paramString.regionMatches(true, j, str, 0, str.length())) && (!matchesOtherAffix(str.length(), paramString, j)))
            return j;
      return paramInt ^ 0xFFFFFFFF;
    }
  }

  static class Separator
    implements PeriodPrinter, PeriodParser
  {
    private volatile PeriodParser iAfterParser;
    private volatile PeriodPrinter iAfterPrinter;
    private final PeriodParser iBeforeParser;
    private final PeriodPrinter iBeforePrinter;
    private final String iFinalText;
    private final String[] iParsedForms;
    private final String iText;
    private final boolean iUseAfter;
    private final boolean iUseBefore;

    Separator(String paramString1, String paramString2, String[] paramArrayOfString, PeriodPrinter paramPeriodPrinter, PeriodParser paramPeriodParser, boolean paramBoolean1, boolean paramBoolean2)
    {
      this.iText = paramString1;
      this.iFinalText = paramString2;
      if (((paramString2 == null) || (paramString1.equals(paramString2))) && ((paramArrayOfString == null) || (paramArrayOfString.length == 0)));
      ArrayList localArrayList;
      for (this.iParsedForms = new String[] { paramString1 }; ; this.iParsedForms = ((String[])localArrayList.toArray(new String[localArrayList.size()])))
      {
        this.iBeforePrinter = paramPeriodPrinter;
        this.iBeforeParser = paramPeriodParser;
        this.iUseBefore = paramBoolean1;
        this.iUseAfter = paramBoolean2;
        return;
        TreeSet localTreeSet = new TreeSet(String.CASE_INSENSITIVE_ORDER);
        localTreeSet.add(paramString1);
        localTreeSet.add(paramString2);
        if (paramArrayOfString != null)
        {
          int i = paramArrayOfString.length;
          while (true)
          {
            i--;
            if (i < 0)
              break;
            localTreeSet.add(paramArrayOfString[i]);
          }
        }
        localArrayList = new ArrayList(localTreeSet);
        Collections.reverse(localArrayList);
      }
    }

    public int calculatePrintedLength(ReadablePeriod paramReadablePeriod, Locale paramLocale)
    {
      PeriodPrinter localPeriodPrinter1 = this.iBeforePrinter;
      PeriodPrinter localPeriodPrinter2 = this.iAfterPrinter;
      int i = localPeriodPrinter1.calculatePrintedLength(paramReadablePeriod, paramLocale) + localPeriodPrinter2.calculatePrintedLength(paramReadablePeriod, paramLocale);
      String str;
      if (this.iUseBefore)
        if (localPeriodPrinter1.countFieldsToPrint(paramReadablePeriod, 1, paramLocale) > 0)
        {
          if (!this.iUseAfter)
            break label112;
          int j = localPeriodPrinter2.countFieldsToPrint(paramReadablePeriod, 2, paramLocale);
          if (j <= 0)
            break label154;
          if (j <= 1)
            break label103;
          str = this.iText;
        }
      label154: for (int k = i + str.length(); ; k = i)
      {
        i = k;
        label103: label112: 
        do
        {
          return i;
          str = this.iFinalText;
          break;
          return i + this.iText.length();
        }
        while ((!this.iUseAfter) || (localPeriodPrinter2.countFieldsToPrint(paramReadablePeriod, 1, paramLocale) <= 0));
        return i + this.iText.length();
      }
    }

    public int countFieldsToPrint(ReadablePeriod paramReadablePeriod, int paramInt, Locale paramLocale)
    {
      int i = this.iBeforePrinter.countFieldsToPrint(paramReadablePeriod, paramInt, paramLocale);
      if (i < paramInt)
        i += this.iAfterPrinter.countFieldsToPrint(paramReadablePeriod, paramInt, paramLocale);
      return i;
    }

    Separator finish(PeriodPrinter paramPeriodPrinter, PeriodParser paramPeriodParser)
    {
      this.iAfterPrinter = paramPeriodPrinter;
      this.iAfterParser = paramPeriodParser;
      return this;
    }

    public int parseInto(ReadWritablePeriod paramReadWritablePeriod, String paramString, int paramInt, Locale paramLocale)
    {
      boolean bool = true;
      int i = this.iBeforeParser.parseInto(paramReadWritablePeriod, paramString, paramInt, paramLocale);
      if (i < 0)
        return i;
      int n;
      String str;
      int j;
      if (i > paramInt)
      {
        String[] arrayOfString = this.iParsedForms;
        int m = arrayOfString.length;
        n = 0;
        if (n < m)
        {
          str = arrayOfString[n];
          if ((str == null) || (str.length() == 0) || (paramString.regionMatches(bool, i, str, 0, str.length())))
          {
            j = 0;
            if (str == null)
              label101: i += j;
          }
        }
      }
      while (true)
      {
        int k = this.iAfterParser.parseInto(paramReadWritablePeriod, paramString, i, paramLocale);
        if (k < 0)
        {
          return k;
          j = str.length();
          break label101;
          n++;
          break;
        }
        if ((bool) && (k == i) && (j > 0))
          return i ^ 0xFFFFFFFF;
        if ((k > i) && (!bool) && (!this.iUseBefore))
          return i ^ 0xFFFFFFFF;
        return k;
        j = -1;
        bool = false;
      }
    }

    public void printTo(Writer paramWriter, ReadablePeriod paramReadablePeriod, Locale paramLocale)
      throws IOException
    {
      PeriodPrinter localPeriodPrinter1 = this.iBeforePrinter;
      PeriodPrinter localPeriodPrinter2 = this.iAfterPrinter;
      localPeriodPrinter1.printTo(paramWriter, paramReadablePeriod, paramLocale);
      String str;
      if (this.iUseBefore)
        if (localPeriodPrinter1.countFieldsToPrint(paramReadablePeriod, 1, paramLocale) > 0)
        {
          if (!this.iUseAfter)
            break label104;
          int i = localPeriodPrinter2.countFieldsToPrint(paramReadablePeriod, 2, paramLocale);
          if (i > 0)
          {
            if (i <= 1)
              break label95;
            str = this.iText;
            paramWriter.write(str);
          }
        }
      while (true)
      {
        localPeriodPrinter2.printTo(paramWriter, paramReadablePeriod, paramLocale);
        return;
        label95: str = this.iFinalText;
        break;
        label104: paramWriter.write(this.iText);
        continue;
        if ((this.iUseAfter) && (localPeriodPrinter2.countFieldsToPrint(paramReadablePeriod, 1, paramLocale) > 0))
          paramWriter.write(this.iText);
      }
    }

    public void printTo(StringBuffer paramStringBuffer, ReadablePeriod paramReadablePeriod, Locale paramLocale)
    {
      PeriodPrinter localPeriodPrinter1 = this.iBeforePrinter;
      PeriodPrinter localPeriodPrinter2 = this.iAfterPrinter;
      localPeriodPrinter1.printTo(paramStringBuffer, paramReadablePeriod, paramLocale);
      String str;
      if (this.iUseBefore)
        if (localPeriodPrinter1.countFieldsToPrint(paramReadablePeriod, 1, paramLocale) > 0)
        {
          if (!this.iUseAfter)
            break label105;
          int i = localPeriodPrinter2.countFieldsToPrint(paramReadablePeriod, 2, paramLocale);
          if (i > 0)
          {
            if (i <= 1)
              break label96;
            str = this.iText;
            paramStringBuffer.append(str);
          }
        }
      while (true)
      {
        localPeriodPrinter2.printTo(paramStringBuffer, paramReadablePeriod, paramLocale);
        return;
        label96: str = this.iFinalText;
        break;
        label105: paramStringBuffer.append(this.iText);
        continue;
        if ((this.iUseAfter) && (localPeriodPrinter2.countFieldsToPrint(paramReadablePeriod, 1, paramLocale) > 0))
          paramStringBuffer.append(this.iText);
      }
    }
  }

  static class SimpleAffix extends PeriodFormatterBuilder.IgnorableAffix
  {
    private final String iText;

    SimpleAffix(String paramString)
    {
      this.iText = paramString;
    }

    public int calculatePrintedLength(int paramInt)
    {
      return this.iText.length();
    }

    public String[] getAffixes()
    {
      String[] arrayOfString = new String[1];
      arrayOfString[0] = this.iText;
      return arrayOfString;
    }

    public int parse(String paramString, int paramInt)
    {
      String str = this.iText;
      int i = str.length();
      if ((paramString.regionMatches(true, paramInt, str, 0, i)) && (!matchesOtherAffix(i, paramString, paramInt)))
        return paramInt + i;
      return paramInt ^ 0xFFFFFFFF;
    }

    public void printTo(Writer paramWriter, int paramInt)
      throws IOException
    {
      paramWriter.write(this.iText);
    }

    public void printTo(StringBuffer paramStringBuffer, int paramInt)
    {
      paramStringBuffer.append(this.iText);
    }

    public int scan(String paramString, int paramInt)
    {
      String str = this.iText;
      int i = str.length();
      int j = paramString.length();
      for (int k = paramInt; ; k++)
      {
        if (k < j)
          if ((paramString.regionMatches(true, k, str, 0, i)) && (!matchesOtherAffix(i, paramString, k)))
            return k;
        switch (paramString.charAt(k))
        {
        case '/':
        default:
          return paramInt ^ 0xFFFFFFFF;
        case '+':
        case ',':
        case '-':
        case '.':
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        }
      }
    }
  }
}