package org.joda.time.format;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DateTimeUtils;
import org.joda.time.DateTimeZone;
import org.joda.time.DurationField;
import org.joda.time.MutableDateTime;
import org.joda.time.MutableDateTime.Property;
import org.joda.time.ReadablePartial;
import org.joda.time.field.MillisDurationField;
import org.joda.time.field.PreciseDateTimeField;

public class DateTimeFormatterBuilder
{
  private ArrayList<Object> iElementPairs = new ArrayList();
  private Object iFormatter;

  private DateTimeFormatterBuilder append0(Object paramObject)
  {
    this.iFormatter = null;
    this.iElementPairs.add(paramObject);
    this.iElementPairs.add(paramObject);
    return this;
  }

  private DateTimeFormatterBuilder append0(InternalPrinter paramInternalPrinter, InternalParser paramInternalParser)
  {
    this.iFormatter = null;
    this.iElementPairs.add(paramInternalPrinter);
    this.iElementPairs.add(paramInternalParser);
    return this;
  }

  static void appendUnknownString(Appendable paramAppendable, int paramInt)
    throws IOException
  {
    while (true)
    {
      paramInt--;
      if (paramInt < 0)
        break;
      paramAppendable.append(65533);
    }
  }

  private void checkParser(DateTimeParser paramDateTimeParser)
  {
    if (paramDateTimeParser == null)
      throw new IllegalArgumentException("No parser supplied");
  }

  private void checkPrinter(DateTimePrinter paramDateTimePrinter)
  {
    if (paramDateTimePrinter == null)
      throw new IllegalArgumentException("No printer supplied");
  }

  static boolean csStartsWith(CharSequence paramCharSequence, int paramInt, String paramString)
  {
    int i = paramString.length();
    if (paramCharSequence.length() - paramInt < i)
      return false;
    for (int j = 0; ; j++)
    {
      if (j >= i)
        break label53;
      if (paramCharSequence.charAt(paramInt + j) != paramString.charAt(j))
        break;
    }
    label53: return true;
  }

  static boolean csStartsWithIgnoreCase(CharSequence paramCharSequence, int paramInt, String paramString)
  {
    int i = paramString.length();
    if (paramCharSequence.length() - paramInt < i)
      return false;
    for (int j = 0; ; j++)
    {
      if (j >= i)
        break label95;
      char c1 = paramCharSequence.charAt(paramInt + j);
      char c2 = paramString.charAt(j);
      if (c1 != c2)
      {
        char c3 = Character.toUpperCase(c1);
        char c4 = Character.toUpperCase(c2);
        if ((c3 != c4) && (Character.toLowerCase(c3) != Character.toLowerCase(c4)))
          break;
      }
    }
    label95: return true;
  }

  private Object getFormatter()
  {
    Object localObject1 = this.iFormatter;
    Object localObject2;
    Object localObject3;
    if (localObject1 == null)
      if (this.iElementPairs.size() == 2)
      {
        localObject2 = this.iElementPairs.get(0);
        localObject3 = this.iElementPairs.get(1);
        if (localObject2 == null)
          break label76;
        if ((localObject2 != localObject3) && (localObject3 != null));
      }
    label76: for (localObject1 = localObject2; ; localObject1 = localObject3)
    {
      if (localObject1 == null)
        localObject1 = new Composite(this.iElementPairs);
      this.iFormatter = localObject1;
      return localObject1;
    }
  }

  private boolean isFormatter(Object paramObject)
  {
    return (isPrinter(paramObject)) || (isParser(paramObject));
  }

  private boolean isParser(Object paramObject)
  {
    if ((paramObject instanceof InternalParser))
    {
      if ((paramObject instanceof Composite))
        return ((Composite)paramObject).isParser();
      return true;
    }
    return false;
  }

  private boolean isPrinter(Object paramObject)
  {
    if ((paramObject instanceof InternalPrinter))
    {
      if ((paramObject instanceof Composite))
        return ((Composite)paramObject).isPrinter();
      return true;
    }
    return false;
  }

  public DateTimeFormatterBuilder append(DateTimeFormatter paramDateTimeFormatter)
  {
    if (paramDateTimeFormatter == null)
      throw new IllegalArgumentException("No formatter supplied");
    return append0(paramDateTimeFormatter.getPrinter0(), paramDateTimeFormatter.getParser0());
  }

  public DateTimeFormatterBuilder append(DateTimeParser paramDateTimeParser)
  {
    checkParser(paramDateTimeParser);
    return append0(null, DateTimeParserInternalParser.of(paramDateTimeParser));
  }

  public DateTimeFormatterBuilder append(DateTimePrinter paramDateTimePrinter)
  {
    checkPrinter(paramDateTimePrinter);
    return append0(DateTimePrinterInternalPrinter.of(paramDateTimePrinter), null);
  }

  public DateTimeFormatterBuilder append(DateTimePrinter paramDateTimePrinter, DateTimeParser paramDateTimeParser)
  {
    checkPrinter(paramDateTimePrinter);
    checkParser(paramDateTimeParser);
    return append0(DateTimePrinterInternalPrinter.of(paramDateTimePrinter), DateTimeParserInternalParser.of(paramDateTimeParser));
  }

  public DateTimeFormatterBuilder append(DateTimePrinter paramDateTimePrinter, DateTimeParser[] paramArrayOfDateTimeParser)
  {
    int i = 0;
    if (paramDateTimePrinter != null)
      checkPrinter(paramDateTimePrinter);
    if (paramArrayOfDateTimeParser == null)
      throw new IllegalArgumentException("No parsers supplied");
    int j = paramArrayOfDateTimeParser.length;
    if (j == 1)
    {
      if (paramArrayOfDateTimeParser[0] == null)
        throw new IllegalArgumentException("No parser supplied");
      return append0(DateTimePrinterInternalPrinter.of(paramDateTimePrinter), DateTimeParserInternalParser.of(paramArrayOfDateTimeParser[0]));
    }
    InternalParser[] arrayOfInternalParser = new InternalParser[j];
    while (i < j - 1)
    {
      InternalParser localInternalParser = DateTimeParserInternalParser.of(paramArrayOfDateTimeParser[i]);
      arrayOfInternalParser[i] = localInternalParser;
      if (localInternalParser == null)
        throw new IllegalArgumentException("Incomplete parser array");
      i++;
    }
    arrayOfInternalParser[i] = DateTimeParserInternalParser.of(paramArrayOfDateTimeParser[i]);
    return append0(DateTimePrinterInternalPrinter.of(paramDateTimePrinter), new MatchingParser(arrayOfInternalParser));
  }

  public DateTimeFormatterBuilder appendCenturyOfEra(int paramInt1, int paramInt2)
  {
    return appendSignedDecimal(DateTimeFieldType.centuryOfEra(), paramInt1, paramInt2);
  }

  public DateTimeFormatterBuilder appendClockhourOfDay(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.clockhourOfDay(), paramInt, 2);
  }

  public DateTimeFormatterBuilder appendClockhourOfHalfday(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.clockhourOfHalfday(), paramInt, 2);
  }

  public DateTimeFormatterBuilder appendDayOfMonth(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.dayOfMonth(), paramInt, 2);
  }

  public DateTimeFormatterBuilder appendDayOfWeek(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.dayOfWeek(), paramInt, 1);
  }

  public DateTimeFormatterBuilder appendDayOfWeekShortText()
  {
    return appendShortText(DateTimeFieldType.dayOfWeek());
  }

  public DateTimeFormatterBuilder appendDayOfWeekText()
  {
    return appendText(DateTimeFieldType.dayOfWeek());
  }

  public DateTimeFormatterBuilder appendDayOfYear(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.dayOfYear(), paramInt, 3);
  }

  public DateTimeFormatterBuilder appendDecimal(DateTimeFieldType paramDateTimeFieldType, int paramInt1, int paramInt2)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("Field type must not be null");
    if (paramInt2 < paramInt1)
      paramInt2 = paramInt1;
    if ((paramInt1 < 0) || (paramInt2 <= 0))
      throw new IllegalArgumentException();
    if (paramInt1 <= 1)
      return append0(new UnpaddedNumber(paramDateTimeFieldType, paramInt2, false));
    return append0(new PaddedNumber(paramDateTimeFieldType, paramInt2, false, paramInt1));
  }

  public DateTimeFormatterBuilder appendEraText()
  {
    return appendText(DateTimeFieldType.era());
  }

  public DateTimeFormatterBuilder appendFixedDecimal(DateTimeFieldType paramDateTimeFieldType, int paramInt)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("Field type must not be null");
    if (paramInt <= 0)
      throw new IllegalArgumentException("Illegal number of digits: " + paramInt);
    return append0(new FixedNumber(paramDateTimeFieldType, paramInt, false));
  }

  public DateTimeFormatterBuilder appendFixedSignedDecimal(DateTimeFieldType paramDateTimeFieldType, int paramInt)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("Field type must not be null");
    if (paramInt <= 0)
      throw new IllegalArgumentException("Illegal number of digits: " + paramInt);
    return append0(new FixedNumber(paramDateTimeFieldType, paramInt, true));
  }

  public DateTimeFormatterBuilder appendFraction(DateTimeFieldType paramDateTimeFieldType, int paramInt1, int paramInt2)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("Field type must not be null");
    if (paramInt2 < paramInt1)
      paramInt2 = paramInt1;
    if ((paramInt1 < 0) || (paramInt2 <= 0))
      throw new IllegalArgumentException();
    return append0(new Fraction(paramDateTimeFieldType, paramInt1, paramInt2));
  }

  public DateTimeFormatterBuilder appendFractionOfDay(int paramInt1, int paramInt2)
  {
    return appendFraction(DateTimeFieldType.dayOfYear(), paramInt1, paramInt2);
  }

  public DateTimeFormatterBuilder appendFractionOfHour(int paramInt1, int paramInt2)
  {
    return appendFraction(DateTimeFieldType.hourOfDay(), paramInt1, paramInt2);
  }

  public DateTimeFormatterBuilder appendFractionOfMinute(int paramInt1, int paramInt2)
  {
    return appendFraction(DateTimeFieldType.minuteOfDay(), paramInt1, paramInt2);
  }

  public DateTimeFormatterBuilder appendFractionOfSecond(int paramInt1, int paramInt2)
  {
    return appendFraction(DateTimeFieldType.secondOfDay(), paramInt1, paramInt2);
  }

  public DateTimeFormatterBuilder appendHalfdayOfDayText()
  {
    return appendText(DateTimeFieldType.halfdayOfDay());
  }

  public DateTimeFormatterBuilder appendHourOfDay(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.hourOfDay(), paramInt, 2);
  }

  public DateTimeFormatterBuilder appendHourOfHalfday(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.hourOfHalfday(), paramInt, 2);
  }

  public DateTimeFormatterBuilder appendLiteral(char paramChar)
  {
    return append0(new CharacterLiteral(paramChar));
  }

  public DateTimeFormatterBuilder appendLiteral(String paramString)
  {
    if (paramString == null)
      throw new IllegalArgumentException("Literal must not be null");
    switch (paramString.length())
    {
    default:
      this = append0(new StringLiteral(paramString));
    case 0:
      return this;
    case 1:
    }
    return append0(new CharacterLiteral(paramString.charAt(0)));
  }

  public DateTimeFormatterBuilder appendMillisOfDay(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.millisOfDay(), paramInt, 8);
  }

  public DateTimeFormatterBuilder appendMillisOfSecond(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.millisOfSecond(), paramInt, 3);
  }

  public DateTimeFormatterBuilder appendMinuteOfDay(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.minuteOfDay(), paramInt, 4);
  }

  public DateTimeFormatterBuilder appendMinuteOfHour(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.minuteOfHour(), paramInt, 2);
  }

  public DateTimeFormatterBuilder appendMonthOfYear(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.monthOfYear(), paramInt, 2);
  }

  public DateTimeFormatterBuilder appendMonthOfYearShortText()
  {
    return appendShortText(DateTimeFieldType.monthOfYear());
  }

  public DateTimeFormatterBuilder appendMonthOfYearText()
  {
    return appendText(DateTimeFieldType.monthOfYear());
  }

  public DateTimeFormatterBuilder appendOptional(DateTimeParser paramDateTimeParser)
  {
    checkParser(paramDateTimeParser);
    InternalParser[] arrayOfInternalParser = new InternalParser[2];
    arrayOfInternalParser[0] = DateTimeParserInternalParser.of(paramDateTimeParser);
    arrayOfInternalParser[1] = null;
    return append0(null, new MatchingParser(arrayOfInternalParser));
  }

  public DateTimeFormatterBuilder appendPattern(String paramString)
  {
    DateTimeFormat.appendPatternTo(this, paramString);
    return this;
  }

  public DateTimeFormatterBuilder appendSecondOfDay(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.secondOfDay(), paramInt, 5);
  }

  public DateTimeFormatterBuilder appendSecondOfMinute(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.secondOfMinute(), paramInt, 2);
  }

  public DateTimeFormatterBuilder appendShortText(DateTimeFieldType paramDateTimeFieldType)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("Field type must not be null");
    return append0(new TextField(paramDateTimeFieldType, true));
  }

  public DateTimeFormatterBuilder appendSignedDecimal(DateTimeFieldType paramDateTimeFieldType, int paramInt1, int paramInt2)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("Field type must not be null");
    if (paramInt2 < paramInt1)
      paramInt2 = paramInt1;
    if ((paramInt1 < 0) || (paramInt2 <= 0))
      throw new IllegalArgumentException();
    if (paramInt1 <= 1)
      return append0(new UnpaddedNumber(paramDateTimeFieldType, paramInt2, true));
    return append0(new PaddedNumber(paramDateTimeFieldType, paramInt2, true, paramInt1));
  }

  public DateTimeFormatterBuilder appendText(DateTimeFieldType paramDateTimeFieldType)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("Field type must not be null");
    return append0(new TextField(paramDateTimeFieldType, false));
  }

  public DateTimeFormatterBuilder appendTimeZoneId()
  {
    return append0(TimeZoneId.INSTANCE, TimeZoneId.INSTANCE);
  }

  public DateTimeFormatterBuilder appendTimeZoneName()
  {
    return append0(new TimeZoneName(0, null), null);
  }

  public DateTimeFormatterBuilder appendTimeZoneName(Map<String, DateTimeZone> paramMap)
  {
    TimeZoneName localTimeZoneName = new TimeZoneName(0, paramMap);
    return append0(localTimeZoneName, localTimeZoneName);
  }

  public DateTimeFormatterBuilder appendTimeZoneOffset(String paramString1, String paramString2, boolean paramBoolean, int paramInt1, int paramInt2)
  {
    return append0(new TimeZoneOffset(paramString1, paramString2, paramBoolean, paramInt1, paramInt2));
  }

  public DateTimeFormatterBuilder appendTimeZoneOffset(String paramString, boolean paramBoolean, int paramInt1, int paramInt2)
  {
    return append0(new TimeZoneOffset(paramString, paramString, paramBoolean, paramInt1, paramInt2));
  }

  public DateTimeFormatterBuilder appendTimeZoneShortName()
  {
    return append0(new TimeZoneName(1, null), null);
  }

  public DateTimeFormatterBuilder appendTimeZoneShortName(Map<String, DateTimeZone> paramMap)
  {
    TimeZoneName localTimeZoneName = new TimeZoneName(1, paramMap);
    return append0(localTimeZoneName, localTimeZoneName);
  }

  public DateTimeFormatterBuilder appendTwoDigitWeekyear(int paramInt)
  {
    return appendTwoDigitWeekyear(paramInt, false);
  }

  public DateTimeFormatterBuilder appendTwoDigitWeekyear(int paramInt, boolean paramBoolean)
  {
    return append0(new TwoDigitYear(DateTimeFieldType.weekyear(), paramInt, paramBoolean));
  }

  public DateTimeFormatterBuilder appendTwoDigitYear(int paramInt)
  {
    return appendTwoDigitYear(paramInt, false);
  }

  public DateTimeFormatterBuilder appendTwoDigitYear(int paramInt, boolean paramBoolean)
  {
    return append0(new TwoDigitYear(DateTimeFieldType.year(), paramInt, paramBoolean));
  }

  public DateTimeFormatterBuilder appendWeekOfWeekyear(int paramInt)
  {
    return appendDecimal(DateTimeFieldType.weekOfWeekyear(), paramInt, 2);
  }

  public DateTimeFormatterBuilder appendWeekyear(int paramInt1, int paramInt2)
  {
    return appendSignedDecimal(DateTimeFieldType.weekyear(), paramInt1, paramInt2);
  }

  public DateTimeFormatterBuilder appendYear(int paramInt1, int paramInt2)
  {
    return appendSignedDecimal(DateTimeFieldType.year(), paramInt1, paramInt2);
  }

  public DateTimeFormatterBuilder appendYearOfCentury(int paramInt1, int paramInt2)
  {
    return appendDecimal(DateTimeFieldType.yearOfCentury(), paramInt1, paramInt2);
  }

  public DateTimeFormatterBuilder appendYearOfEra(int paramInt1, int paramInt2)
  {
    return appendDecimal(DateTimeFieldType.yearOfEra(), paramInt1, paramInt2);
  }

  public boolean canBuildFormatter()
  {
    return isFormatter(getFormatter());
  }

  public boolean canBuildParser()
  {
    return isParser(getFormatter());
  }

  public boolean canBuildPrinter()
  {
    return isPrinter(getFormatter());
  }

  public void clear()
  {
    this.iFormatter = null;
    this.iElementPairs.clear();
  }

  public DateTimeFormatter toFormatter()
  {
    Object localObject = getFormatter();
    if (isPrinter(localObject));
    for (InternalPrinter localInternalPrinter = (InternalPrinter)localObject; ; localInternalPrinter = null)
    {
      if (isParser(localObject));
      for (InternalParser localInternalParser = (InternalParser)localObject; ; localInternalParser = null)
      {
        if ((localInternalPrinter != null) || (localInternalParser != null))
          return new DateTimeFormatter(localInternalPrinter, localInternalParser);
        throw new UnsupportedOperationException("Both printing and parsing not supported");
      }
    }
  }

  public DateTimeParser toParser()
  {
    Object localObject = getFormatter();
    if (isParser(localObject))
      return InternalParserDateTimeParser.of((InternalParser)localObject);
    throw new UnsupportedOperationException("Parsing is not supported");
  }

  public DateTimePrinter toPrinter()
  {
    Object localObject = getFormatter();
    if (isPrinter(localObject))
      return InternalPrinterDateTimePrinter.of((InternalPrinter)localObject);
    throw new UnsupportedOperationException("Printing is not supported");
  }

  static class CharacterLiteral
    implements InternalPrinter, InternalParser
  {
    private final char iValue;

    CharacterLiteral(char paramChar)
    {
      this.iValue = paramChar;
    }

    public int estimateParsedLength()
    {
      return 1;
    }

    public int estimatePrintedLength()
    {
      return 1;
    }

    public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
    {
      if (paramInt >= paramCharSequence.length())
        return paramInt ^ 0xFFFFFFFF;
      char c1 = paramCharSequence.charAt(paramInt);
      char c2 = this.iValue;
      if (c1 != c2)
      {
        char c3 = Character.toUpperCase(c1);
        char c4 = Character.toUpperCase(c2);
        if ((c3 != c4) && (Character.toLowerCase(c3) != Character.toLowerCase(c4)))
          return paramInt ^ 0xFFFFFFFF;
      }
      return paramInt + 1;
    }

    public void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
      throws IOException
    {
      paramAppendable.append(this.iValue);
    }

    public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial, Locale paramLocale)
      throws IOException
    {
      paramAppendable.append(this.iValue);
    }
  }

  static class Composite
    implements InternalPrinter, InternalParser
  {
    private final int iParsedLengthEstimate;
    private final InternalParser[] iParsers;
    private final int iPrintedLengthEstimate;
    private final InternalPrinter[] iPrinters;

    Composite(List<Object> paramList)
    {
      ArrayList localArrayList1 = new ArrayList();
      ArrayList localArrayList2 = new ArrayList();
      decompose(paramList, localArrayList1, localArrayList2);
      if ((localArrayList1.contains(null)) || (localArrayList1.isEmpty()))
        this.iPrinters = null;
      int i1;
      for (this.iPrintedLengthEstimate = 0; (localArrayList2.contains(null)) || (localArrayList2.isEmpty()); this.iPrintedLengthEstimate = i1)
      {
        this.iParsers = null;
        this.iParsedLengthEstimate = 0;
        return;
        int m = localArrayList1.size();
        this.iPrinters = new InternalParser[m];
        int n = 0;
        i1 = 0;
        while (n < m)
        {
          InternalPrinter localInternalPrinter = (InternalParser)localArrayList1.get(n);
          i1 += localInternalPrinter.estimatePrintedLength();
          this.iPrinters[n] = localInternalPrinter;
          n++;
        }
      }
      int j = localArrayList2.size();
      this.iParsers = new InternalParser[j];
      int k = 0;
      while (i < j)
      {
        InternalParser localInternalParser = (InternalParser)localArrayList2.get(i);
        k += localInternalParser.estimateParsedLength();
        this.iParsers[i] = localInternalParser;
        i++;
      }
      this.iParsedLengthEstimate = k;
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
        label49: Object localObject2;
        if ((localObject1 instanceof Composite))
        {
          addArrayToList(paramList2, ((Composite)localObject1).iPrinters);
          localObject2 = paramList1.get(j + 1);
          if (!(localObject2 instanceof Composite))
            break label100;
          addArrayToList(paramList3, ((Composite)localObject2).iParsers);
        }
        while (true)
        {
          j += 2;
          break;
          paramList2.add(localObject1);
          break label49;
          label100: paramList3.add(localObject2);
        }
      }
    }

    public int estimateParsedLength()
    {
      return this.iParsedLengthEstimate;
    }

    public int estimatePrintedLength()
    {
      return this.iPrintedLengthEstimate;
    }

    boolean isParser()
    {
      return this.iParsers != null;
    }

    boolean isPrinter()
    {
      return this.iPrinters != null;
    }

    public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
    {
      InternalParser[] arrayOfInternalParser = this.iParsers;
      if (arrayOfInternalParser == null)
        throw new UnsupportedOperationException();
      int i = arrayOfInternalParser.length;
      for (int j = 0; (j < i) && (paramInt >= 0); j++)
        paramInt = arrayOfInternalParser[j].parseInto(paramDateTimeParserBucket, paramCharSequence, paramInt);
      return paramInt;
    }

    public void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
      throws IOException
    {
      InternalPrinter[] arrayOfInternalPrinter = this.iPrinters;
      if (arrayOfInternalPrinter == null)
        throw new UnsupportedOperationException();
      if (paramLocale == null);
      for (Locale localLocale = Locale.getDefault(); ; localLocale = paramLocale)
      {
        int i = arrayOfInternalPrinter.length;
        for (int j = 0; j < i; j++)
          arrayOfInternalPrinter[j].printTo(paramAppendable, paramLong, paramChronology, paramInt, paramDateTimeZone, localLocale);
        return;
      }
    }

    public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial, Locale paramLocale)
      throws IOException
    {
      InternalPrinter[] arrayOfInternalPrinter = this.iPrinters;
      if (arrayOfInternalPrinter == null)
        throw new UnsupportedOperationException();
      if (paramLocale == null)
        paramLocale = Locale.getDefault();
      int i = arrayOfInternalPrinter.length;
      for (int j = 0; j < i; j++)
        arrayOfInternalPrinter[j].printTo(paramAppendable, paramReadablePartial, paramLocale);
    }
  }

  static class FixedNumber extends DateTimeFormatterBuilder.PaddedNumber
  {
    protected FixedNumber(DateTimeFieldType paramDateTimeFieldType, int paramInt, boolean paramBoolean)
    {
      super(paramInt, paramBoolean, paramInt);
    }

    public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
    {
      int i = super.parseInto(paramDateTimeParserBucket, paramCharSequence, paramInt);
      if (i < 0);
      int j;
      do
      {
        do
        {
          return i;
          j = paramInt + this.iMaxParsedDigits;
        }
        while (i == j);
        if (this.iSigned)
        {
          int k = paramCharSequence.charAt(paramInt);
          if ((k == 45) || (k == 43))
            j++;
        }
        if (i > j)
          return 0xFFFFFFFF ^ j + 1;
      }
      while (i >= j);
      return i ^ 0xFFFFFFFF;
    }
  }

  static class Fraction
    implements InternalPrinter, InternalParser
  {
    private final DateTimeFieldType iFieldType;
    protected int iMaxDigits;
    protected int iMinDigits;

    protected Fraction(DateTimeFieldType paramDateTimeFieldType, int paramInt1, int paramInt2)
    {
      this.iFieldType = paramDateTimeFieldType;
      if (paramInt2 > 18)
        paramInt2 = 18;
      this.iMinDigits = paramInt1;
      this.iMaxDigits = paramInt2;
    }

    private long[] getFractionData(long paramLong, DateTimeField paramDateTimeField)
    {
      long l1 = paramDateTimeField.getDurationField().getUnitMillis();
      for (int i = this.iMaxDigits; ; i--)
      {
        long l2;
        switch (i)
        {
        default:
          l2 = 1L;
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        }
        while (l1 * l2 / l2 == l1)
        {
          long[] arrayOfLong = new long[2];
          arrayOfLong[0] = (l2 * paramLong / l1);
          arrayOfLong[1] = i;
          return arrayOfLong;
          l2 = 10L;
          continue;
          l2 = 100L;
          continue;
          l2 = 1000L;
          continue;
          l2 = 10000L;
          continue;
          l2 = 100000L;
          continue;
          l2 = 1000000L;
          continue;
          l2 = 10000000L;
          continue;
          l2 = 100000000L;
          continue;
          l2 = 1000000000L;
          continue;
          l2 = 10000000000L;
          continue;
          l2 = 100000000000L;
          continue;
          l2 = 1000000000000L;
          continue;
          l2 = 10000000000000L;
          continue;
          l2 = 100000000000000L;
          continue;
          l2 = 1000000000000000L;
          continue;
          l2 = 10000000000000000L;
          continue;
          l2 = 100000000000000000L;
          continue;
          l2 = 1000000000000000000L;
        }
      }
    }

    public int estimateParsedLength()
    {
      return this.iMaxDigits;
    }

    public int estimatePrintedLength()
    {
      return this.iMaxDigits;
    }

    public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
    {
      DateTimeField localDateTimeField = this.iFieldType.getField(paramDateTimeParserBucket.getChronology());
      int i = Math.min(this.iMaxDigits, paramCharSequence.length() - paramInt);
      long l1 = 0L;
      long l2 = 10L * localDateTimeField.getDurationField().getUnitMillis();
      int j = 0;
      long l3;
      while (true)
      {
        int k;
        if (j < i)
        {
          k = paramCharSequence.charAt(paramInt + j);
          if ((k >= 48) && (k <= 57));
        }
        else
        {
          l3 = l1 / 10L;
          if (j != 0)
            break;
          return paramInt ^ 0xFFFFFFFF;
        }
        j++;
        l2 /= 10L;
        l1 += l2 * (k - 48);
      }
      if (l3 > 2147483647L)
        return paramInt ^ 0xFFFFFFFF;
      paramDateTimeParserBucket.saveField(new PreciseDateTimeField(DateTimeFieldType.millisOfSecond(), MillisDurationField.INSTANCE, localDateTimeField.getDurationField()), (int)l3);
      return j + paramInt;
    }

    protected void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology)
      throws IOException
    {
      DateTimeField localDateTimeField = this.iFieldType.getField(paramChronology);
      int i = this.iMinDigits;
      long l1;
      try
      {
        l1 = localDateTimeField.remainder(paramLong);
        if (l1 != 0L)
          break label61;
        while (true)
        {
          i--;
          if (i < 0)
            break;
          paramAppendable.append('0');
        }
      }
      catch (RuntimeException localRuntimeException)
      {
        DateTimeFormatterBuilder.appendUnknownString(paramAppendable, i);
      }
      return;
      label61: long[] arrayOfLong = getFractionData(l1, localDateTimeField);
      long l2 = arrayOfLong[0];
      int j = (int)arrayOfLong[1];
      if ((0x7FFFFFFF & l2) == l2);
      int k;
      for (String str = Integer.toString((int)l2); ; str = Long.toString(l2))
      {
        k = str.length();
        while (k < j)
        {
          paramAppendable.append('0');
          i--;
          j--;
        }
      }
      if (i < j)
        while (true)
        {
          if ((i >= j) || (k <= 1) || (str.charAt(k - 1) != '0'))
          {
            if (k >= str.length())
              break label229;
            for (int m = 0; m < k; m++)
              paramAppendable.append(str.charAt(m));
            break;
          }
          j--;
          k--;
        }
      label229: paramAppendable.append(str);
    }

    public void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
      throws IOException
    {
      printTo(paramAppendable, paramLong, paramChronology);
    }

    public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial, Locale paramLocale)
      throws IOException
    {
      printTo(paramAppendable, paramReadablePartial.getChronology().set(paramReadablePartial, 0L), paramReadablePartial.getChronology());
    }
  }

  static class MatchingParser
    implements InternalParser
  {
    private final int iParsedLengthEstimate;
    private final InternalParser[] iParsers;

    MatchingParser(InternalParser[] paramArrayOfInternalParser)
    {
      this.iParsers = paramArrayOfInternalParser;
      int i = 0;
      int j = paramArrayOfInternalParser.length;
      int k = j - 1;
      int m;
      if (k >= 0)
      {
        InternalParser localInternalParser = paramArrayOfInternalParser[k];
        if (localInternalParser == null)
          break label65;
        m = localInternalParser.estimateParsedLength();
        if (m <= i)
          break label65;
      }
      while (true)
      {
        i = m;
        j = k;
        break;
        this.iParsedLengthEstimate = i;
        return;
        label65: m = i;
      }
    }

    public int estimateParsedLength()
    {
      return this.iParsedLengthEstimate;
    }

    public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
    {
      InternalParser[] arrayOfInternalParser = this.iParsers;
      int i = arrayOfInternalParser.length;
      Object localObject1 = paramDateTimeParserBucket.saveState();
      Object localObject2 = null;
      int j = 0;
      int k = paramInt;
      int m = paramInt;
      InternalParser localInternalParser;
      if (j < i)
      {
        localInternalParser = arrayOfInternalParser[j];
        if (localInternalParser == null)
          if (m <= paramInt)
            return paramInt;
      }
      for (int n = 1; ; n = 0)
      {
        int i1;
        Object localObject3;
        int i2;
        if ((m > paramInt) || ((m == paramInt) && (n != 0)))
        {
          if (localObject2 != null)
            paramDateTimeParserBucket.restoreState(localObject2);
          return m;
          i1 = localInternalParser.parseInto(paramDateTimeParserBucket, paramCharSequence, paramInt);
          if (i1 >= paramInt)
          {
            if (i1 <= m)
              break label218;
            if ((i1 >= paramCharSequence.length()) || (j + 1 >= i) || (arrayOfInternalParser[(j + 1)] == null))
              return i1;
            localObject3 = paramDateTimeParserBucket.saveState();
            i2 = i1;
          }
        }
        while (true)
        {
          paramDateTimeParserBucket.restoreState(localObject1);
          j++;
          m = i2;
          localObject2 = localObject3;
          break;
          if (i1 < 0)
          {
            int i3 = i1 ^ 0xFFFFFFFF;
            if (i3 > k)
            {
              k = i3;
              localObject3 = localObject2;
              i2 = m;
              continue;
              return k ^ 0xFFFFFFFF;
            }
          }
          else
          {
            label218: localObject3 = localObject2;
            i2 = m;
          }
        }
      }
    }
  }

  static abstract class NumberFormatter
    implements InternalPrinter, InternalParser
  {
    protected final DateTimeFieldType iFieldType;
    protected final int iMaxParsedDigits;
    protected final boolean iSigned;

    NumberFormatter(DateTimeFieldType paramDateTimeFieldType, int paramInt, boolean paramBoolean)
    {
      this.iFieldType = paramDateTimeFieldType;
      this.iMaxParsedDigits = paramInt;
      this.iSigned = paramBoolean;
    }

    public int estimateParsedLength()
    {
      return this.iMaxParsedDigits;
    }

    public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
    {
      int i = Math.min(this.iMaxParsedDigits, paramCharSequence.length() - paramInt);
      int j = 0;
      int k = i;
      int m = paramInt;
      int n = 0;
      int i11;
      label86: int i1;
      if (n < k)
      {
        i11 = paramCharSequence.charAt(m + n);
        if ((n == 0) && ((i11 == 45) || (i11 == 43)) && (this.iSigned))
          if (i11 == 45)
          {
            j = 1;
            if (n + 1 >= k)
              break label374;
            int i12 = paramCharSequence.charAt(1 + (m + n));
            if (i12 < 48)
              break label374;
            if (i12 <= 57)
              break label144;
            i1 = j;
          }
      }
      while (true)
      {
        if (n == 0)
        {
          return m ^ 0xFFFFFFFF;
          j = 0;
          break label86;
          label144: if (j != 0)
            n++;
          while (true)
          {
            k = Math.min(k + 1, paramCharSequence.length() - m);
            break;
            m++;
          }
          if (i11 < 48)
            break label374;
          if (i11 > 57)
          {
            i1 = j;
            continue;
          }
          n++;
          break;
        }
        int i7;
        int i6;
        if (n >= 9)
        {
          int i10 = m + n;
          i7 = Integer.parseInt(paramCharSequence.subSequence(m, i10).toString());
          i6 = i10;
          paramDateTimeParserBucket.saveField(this.iFieldType, i7);
          return i6;
        }
        if (i1 != 0);
        for (int i2 = m + 1; ; i2 = m)
        {
          int i3 = i2 + 1;
          try
          {
            int i4 = paramCharSequence.charAt(i2);
            int i5 = i4 - 48;
            i6 = m + n;
            i7 = i5;
            while (i3 < i6)
            {
              int i8 = (i7 << 3) + (i7 << 1);
              int i9 = i3 + 1;
              i7 = -48 + (i8 + paramCharSequence.charAt(i3));
              i3 = i9;
            }
          }
          catch (StringIndexOutOfBoundsException localStringIndexOutOfBoundsException)
          {
            return m ^ 0xFFFFFFFF;
          }
          if (i1 == 0)
            break;
          i7 = -i7;
          break;
        }
        label374: i1 = j;
      }
    }
  }

  static class PaddedNumber extends DateTimeFormatterBuilder.NumberFormatter
  {
    protected final int iMinPrintedDigits;

    protected PaddedNumber(DateTimeFieldType paramDateTimeFieldType, int paramInt1, boolean paramBoolean, int paramInt2)
    {
      super(paramInt1, paramBoolean);
      this.iMinPrintedDigits = paramInt2;
    }

    public int estimatePrintedLength()
    {
      return this.iMaxParsedDigits;
    }

    public void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
      throws IOException
    {
      try
      {
        FormatUtils.appendPaddedInteger(paramAppendable, this.iFieldType.getField(paramChronology).get(paramLong), this.iMinPrintedDigits);
        return;
      }
      catch (RuntimeException localRuntimeException)
      {
        DateTimeFormatterBuilder.appendUnknownString(paramAppendable, this.iMinPrintedDigits);
      }
    }

    public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial, Locale paramLocale)
      throws IOException
    {
      if (paramReadablePartial.isSupported(this.iFieldType))
        try
        {
          FormatUtils.appendPaddedInteger(paramAppendable, paramReadablePartial.get(this.iFieldType), this.iMinPrintedDigits);
          return;
        }
        catch (RuntimeException localRuntimeException)
        {
          DateTimeFormatterBuilder.appendUnknownString(paramAppendable, this.iMinPrintedDigits);
          return;
        }
      DateTimeFormatterBuilder.appendUnknownString(paramAppendable, this.iMinPrintedDigits);
    }
  }

  static class StringLiteral
    implements InternalPrinter, InternalParser
  {
    private final String iValue;

    StringLiteral(String paramString)
    {
      this.iValue = paramString;
    }

    public int estimateParsedLength()
    {
      return this.iValue.length();
    }

    public int estimatePrintedLength()
    {
      return this.iValue.length();
    }

    public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
    {
      if (DateTimeFormatterBuilder.csStartsWithIgnoreCase(paramCharSequence, paramInt, this.iValue))
        return paramInt + this.iValue.length();
      return paramInt ^ 0xFFFFFFFF;
    }

    public void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
      throws IOException
    {
      paramAppendable.append(this.iValue);
    }

    public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial, Locale paramLocale)
      throws IOException
    {
      paramAppendable.append(this.iValue);
    }
  }

  static class TextField
    implements InternalPrinter, InternalParser
  {
    private static Map<Locale, Map<DateTimeFieldType, Object[]>> cParseCache = new ConcurrentHashMap();
    private final DateTimeFieldType iFieldType;
    private final boolean iShort;

    TextField(DateTimeFieldType paramDateTimeFieldType, boolean paramBoolean)
    {
      this.iFieldType = paramDateTimeFieldType;
      this.iShort = paramBoolean;
    }

    private String print(long paramLong, Chronology paramChronology, Locale paramLocale)
    {
      DateTimeField localDateTimeField = this.iFieldType.getField(paramChronology);
      if (this.iShort)
        return localDateTimeField.getAsShortText(paramLong, paramLocale);
      return localDateTimeField.getAsText(paramLong, paramLocale);
    }

    private String print(ReadablePartial paramReadablePartial, Locale paramLocale)
    {
      if (paramReadablePartial.isSupported(this.iFieldType))
      {
        DateTimeField localDateTimeField = this.iFieldType.getField(paramReadablePartial.getChronology());
        if (this.iShort)
          return localDateTimeField.getAsShortText(paramReadablePartial, paramLocale);
        return localDateTimeField.getAsText(paramReadablePartial, paramLocale);
      }
      return "\uFFFD";
    }

    public int estimateParsedLength()
    {
      return estimatePrintedLength();
    }

    public int estimatePrintedLength()
    {
      if (this.iShort)
        return 6;
      return 20;
    }

    public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
    {
      Locale localLocale = paramDateTimeParserBucket.getLocale();
      Map localMap = (Map)cParseCache.get(localLocale);
      ConcurrentHashMap localConcurrentHashMap1;
      if (localMap == null)
      {
        localConcurrentHashMap1 = new ConcurrentHashMap();
        cParseCache.put(localLocale, localConcurrentHashMap1);
      }
      for (Object localObject1 = localConcurrentHashMap1; ; localObject1 = localMap)
      {
        Object[] arrayOfObject1 = (Object[])((Map)localObject1).get(this.iFieldType);
        int k;
        Object localObject2;
        if (arrayOfObject1 == null)
        {
          ConcurrentHashMap localConcurrentHashMap2 = new ConcurrentHashMap(32);
          MutableDateTime.Property localProperty = new MutableDateTime(0L, DateTimeZone.UTC).property(this.iFieldType);
          int i = localProperty.getMinimumValueOverall();
          int j = localProperty.getMaximumValueOverall();
          if (j - i > 32)
            return paramInt ^ 0xFFFFFFFF;
          k = localProperty.getMaximumTextLength(localLocale);
          while (i <= j)
          {
            localProperty.set(i);
            localConcurrentHashMap2.put(localProperty.getAsShortText(localLocale), Boolean.TRUE);
            localConcurrentHashMap2.put(localProperty.getAsShortText(localLocale).toLowerCase(localLocale), Boolean.TRUE);
            localConcurrentHashMap2.put(localProperty.getAsShortText(localLocale).toUpperCase(localLocale), Boolean.TRUE);
            localConcurrentHashMap2.put(localProperty.getAsText(localLocale), Boolean.TRUE);
            localConcurrentHashMap2.put(localProperty.getAsText(localLocale).toLowerCase(localLocale), Boolean.TRUE);
            localConcurrentHashMap2.put(localProperty.getAsText(localLocale).toUpperCase(localLocale), Boolean.TRUE);
            i++;
          }
          if (("en".equals(localLocale.getLanguage())) && (this.iFieldType == DateTimeFieldType.era()))
          {
            localConcurrentHashMap2.put("BCE", Boolean.TRUE);
            localConcurrentHashMap2.put("bce", Boolean.TRUE);
            localConcurrentHashMap2.put("CE", Boolean.TRUE);
            localConcurrentHashMap2.put("ce", Boolean.TRUE);
            k = 3;
          }
          Object[] arrayOfObject2 = new Object[2];
          arrayOfObject2[0] = localConcurrentHashMap2;
          arrayOfObject2[1] = Integer.valueOf(k);
          ((Map)localObject1).put(this.iFieldType, arrayOfObject2);
          localObject2 = localConcurrentHashMap2;
        }
        for (int m = Math.min(paramCharSequence.length(), k + paramInt); ; m--)
        {
          if (m <= paramInt)
            break label499;
          String str = paramCharSequence.subSequence(paramInt, m).toString();
          if (((Map)localObject2).containsKey(str))
          {
            paramDateTimeParserBucket.saveField(this.iFieldType, str, localLocale);
            return m;
            localObject2 = (Map)arrayOfObject1[0];
            k = ((Integer)arrayOfObject1[1]).intValue();
            break;
          }
        }
        label499: return paramInt ^ 0xFFFFFFFF;
      }
    }

    public void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
      throws IOException
    {
      try
      {
        paramAppendable.append(print(paramLong, paramChronology, paramLocale));
        return;
      }
      catch (RuntimeException localRuntimeException)
      {
        paramAppendable.append(65533);
      }
    }

    public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial, Locale paramLocale)
      throws IOException
    {
      try
      {
        paramAppendable.append(print(paramReadablePartial, paramLocale));
        return;
      }
      catch (RuntimeException localRuntimeException)
      {
        paramAppendable.append(65533);
      }
    }
  }

  static enum TimeZoneId
    implements InternalPrinter, InternalParser
  {
    static final Set<String> ALL_IDS;
    static final int MAX_LENGTH = i;

    static
    {
      TimeZoneId[] arrayOfTimeZoneId = new TimeZoneId[1];
      arrayOfTimeZoneId[0] = INSTANCE;
      $VALUES = arrayOfTimeZoneId;
      ALL_IDS = DateTimeZone.getAvailableIDs();
      Iterator localIterator = ALL_IDS.iterator();
      for (int i = 0; localIterator.hasNext(); i = Math.max(i, ((String)localIterator.next()).length()));
    }

    public int estimateParsedLength()
    {
      return MAX_LENGTH;
    }

    public int estimatePrintedLength()
    {
      return MAX_LENGTH;
    }

    public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
    {
      Object localObject1 = null;
      Iterator localIterator = ALL_IDS.iterator();
      Object localObject2;
      if (localIterator.hasNext())
      {
        localObject2 = (String)localIterator.next();
        if ((!DateTimeFormatterBuilder.csStartsWith(paramCharSequence, paramInt, (String)localObject2)) || ((localObject1 != null) && (((String)localObject2).length() <= localObject1.length())))
          break label96;
      }
      while (true)
      {
        localObject1 = localObject2;
        break;
        if (localObject1 != null)
        {
          paramDateTimeParserBucket.setZone(DateTimeZone.forID(localObject1));
          return paramInt + localObject1.length();
        }
        return paramInt ^ 0xFFFFFFFF;
        label96: localObject2 = localObject1;
      }
    }

    public void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
      throws IOException
    {
      if (paramDateTimeZone != null);
      for (String str = paramDateTimeZone.getID(); ; str = "")
      {
        paramAppendable.append(str);
        return;
      }
    }

    public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial, Locale paramLocale)
      throws IOException
    {
    }
  }

  static class TimeZoneName
    implements InternalPrinter, InternalParser
  {
    static final int LONG_NAME = 0;
    static final int SHORT_NAME = 1;
    private final Map<String, DateTimeZone> iParseLookup;
    private final int iType;

    TimeZoneName(int paramInt, Map<String, DateTimeZone> paramMap)
    {
      this.iType = paramInt;
      this.iParseLookup = paramMap;
    }

    private String print(long paramLong, DateTimeZone paramDateTimeZone, Locale paramLocale)
    {
      if (paramDateTimeZone == null)
        return "";
      switch (this.iType)
      {
      default:
        return "";
      case 0:
        return paramDateTimeZone.getName(paramLong, paramLocale);
      case 1:
      }
      return paramDateTimeZone.getShortName(paramLong, paramLocale);
    }

    public int estimateParsedLength()
    {
      if (this.iType == 1)
        return 4;
      return 20;
    }

    public int estimatePrintedLength()
    {
      if (this.iType == 1)
        return 4;
      return 20;
    }

    public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
    {
      Map localMap1 = this.iParseLookup;
      Map localMap2;
      Object localObject1;
      label32: Object localObject2;
      if (localMap1 != null)
      {
        localMap2 = localMap1;
        localObject1 = null;
        Iterator localIterator = localMap2.keySet().iterator();
        if (!localIterator.hasNext())
          break label97;
        localObject2 = (String)localIterator.next();
        if ((!DateTimeFormatterBuilder.csStartsWith(paramCharSequence, paramInt, (String)localObject2)) || ((localObject1 != null) && (((String)localObject2).length() <= localObject1.length())))
          break label130;
      }
      while (true)
      {
        localObject1 = localObject2;
        break label32;
        localMap2 = DateTimeUtils.getDefaultTimeZoneNames();
        break;
        label97: if (localObject1 != null)
        {
          paramDateTimeParserBucket.setZone((DateTimeZone)localMap2.get(localObject1));
          return paramInt + localObject1.length();
        }
        return paramInt ^ 0xFFFFFFFF;
        label130: localObject2 = localObject1;
      }
    }

    public void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
      throws IOException
    {
      paramAppendable.append(print(paramLong - paramInt, paramDateTimeZone, paramLocale));
    }

    public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial, Locale paramLocale)
      throws IOException
    {
    }
  }

  static class TimeZoneOffset
    implements InternalPrinter, InternalParser
  {
    private final int iMaxFields;
    private final int iMinFields;
    private final boolean iShowSeparators;
    private final String iZeroOffsetParseText;
    private final String iZeroOffsetPrintText;

    TimeZoneOffset(String paramString1, String paramString2, boolean paramBoolean, int paramInt1, int paramInt2)
    {
      this.iZeroOffsetPrintText = paramString1;
      this.iZeroOffsetParseText = paramString2;
      this.iShowSeparators = paramBoolean;
      if ((paramInt1 <= 0) || (paramInt2 < paramInt1))
        throw new IllegalArgumentException();
      if (paramInt1 > i)
        paramInt2 = i;
      while (true)
      {
        this.iMinFields = i;
        this.iMaxFields = paramInt2;
        return;
        i = paramInt1;
      }
    }

    private int digitCount(CharSequence paramCharSequence, int paramInt1, int paramInt2)
    {
      int i = Math.min(paramCharSequence.length() - paramInt1, paramInt2);
      int j = 0;
      while (true)
      {
        if (i > 0)
        {
          int k = paramCharSequence.charAt(paramInt1 + j);
          if ((k >= 48) && (k <= 57));
        }
        else
        {
          return j;
        }
        j++;
        i--;
      }
    }

    public int estimateParsedLength()
    {
      return estimatePrintedLength();
    }

    public int estimatePrintedLength()
    {
      int i = 1 + this.iMinFields << 1;
      if (this.iShowSeparators)
        i += -1 + this.iMinFields;
      if ((this.iZeroOffsetPrintText != null) && (this.iZeroOffsetPrintText.length() > i))
        i = this.iZeroOffsetPrintText.length();
      return i;
    }

    public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
    {
      int i = paramCharSequence.length() - paramInt;
      if (this.iZeroOffsetParseText != null)
      {
        if (this.iZeroOffsetParseText.length() != 0)
          break label75;
        if (i <= 0)
          break label65;
        int i26 = paramCharSequence.charAt(paramInt);
        if ((i26 != 45) && (i26 != 43))
          break label65;
      }
      while (i <= 1)
      {
        return paramInt ^ 0xFFFFFFFF;
        label65: paramDateTimeParserBucket.setOffset(Integer.valueOf(0));
        return paramInt;
        label75: if (DateTimeFormatterBuilder.csStartsWithIgnoreCase(paramCharSequence, paramInt, this.iZeroOffsetParseText))
        {
          paramDateTimeParserBucket.setOffset(Integer.valueOf(0));
          return paramInt + this.iZeroOffsetParseText.length();
        }
      }
      int j = paramCharSequence.charAt(paramInt);
      if (j == 45);
      int m;
      int n;
      for (int k = 1; ; k = 0)
      {
        m = i - 1;
        n = paramInt + 1;
        if (digitCount(paramCharSequence, n, 2) >= 2)
          break label169;
        return n ^ 0xFFFFFFFF;
        if (j != 43)
          break;
      }
      return paramInt ^ 0xFFFFFFFF;
      label169: int i1 = FormatUtils.parseTwoDigits(paramCharSequence, n);
      if (i1 > 23)
        return n ^ 0xFFFFFFFF;
      int i2 = i1 * 3600000;
      int i3 = m - 2;
      int i4 = n + 2;
      int i7;
      int i8;
      if (i3 <= 0)
      {
        i7 = i2;
        i8 = i4;
      }
      while (true)
      {
        if (k != 0);
        label324: label335: int i21;
        int i22;
        int i23;
        for (int i9 = -i7; ; i9 = i7)
        {
          paramDateTimeParserBucket.setOffset(Integer.valueOf(i9));
          return i8;
          int i5 = paramCharSequence.charAt(i4);
          int i6;
          if (i5 == 58)
          {
            int i25 = i3 - 1;
            i4++;
            i3 = i25;
            i6 = 1;
          }
          int i10;
          do
          {
            i10 = digitCount(paramCharSequence, i4, 2);
            if ((i10 != 0) || (i6 != 0))
              break label335;
            i7 = i2;
            i8 = i4;
            break;
            if (i5 < 48)
              break label324;
            i6 = 0;
          }
          while (i5 <= 57);
          i7 = i2;
          i8 = i4;
          break;
          if (i10 < 2)
            return i4 ^ 0xFFFFFFFF;
          int i11 = FormatUtils.parseTwoDigits(paramCharSequence, i4);
          if (i11 > 59)
            return i4 ^ 0xFFFFFFFF;
          int i12 = i2 + i11 * 60000;
          int i13 = i3 - 2;
          int i14 = i4 + 2;
          if (i13 <= 0)
          {
            i7 = i12;
            i8 = i14;
            break;
          }
          if (i6 != 0)
          {
            if (paramCharSequence.charAt(i14) != ':')
            {
              i7 = i12;
              i8 = i14;
              break;
            }
            i13--;
            i14++;
          }
          int i15 = digitCount(paramCharSequence, i14, 2);
          if ((i15 == 0) && (i6 == 0))
          {
            i7 = i12;
            i8 = i14;
            break;
          }
          if (i15 < 2)
            return i14 ^ 0xFFFFFFFF;
          int i16 = FormatUtils.parseTwoDigits(paramCharSequence, i14);
          if (i16 > 59)
            return i14 ^ 0xFFFFFFFF;
          int i17 = i12 + i16 * 1000;
          int i18 = i13 - 2;
          int i19 = i14 + 2;
          if (i18 <= 0)
          {
            i7 = i17;
            i8 = i19;
            break;
          }
          if (i6 != 0)
          {
            if ((paramCharSequence.charAt(i19) != '.') && (paramCharSequence.charAt(i19) != ','))
            {
              i7 = i17;
              i8 = i19;
              break;
            }
            (i18 - 1);
            i19++;
          }
          int i20 = digitCount(paramCharSequence, i19, 3);
          if ((i20 == 0) && (i6 == 0))
          {
            i7 = i17;
            i8 = i19;
            break;
          }
          if (i20 < 1)
            return i19 ^ 0xFFFFFFFF;
          i21 = i19 + 1;
          i22 = i17 + 100 * ('\0*0' + paramCharSequence.charAt(i19));
          if (i20 <= 1)
            break label737;
          i23 = i21 + 1;
          i7 = i22 + 10 * ('\0*0' + paramCharSequence.charAt(i21));
          if (i20 <= 2)
            break label730;
          int i24 = i23 + 1;
          i7 += '\0*0' + paramCharSequence.charAt(i23);
          i8 = i24;
          break;
        }
        label730: i8 = i23;
        continue;
        label737: i7 = i22;
        i8 = i21;
      }
    }

    public void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
      throws IOException
    {
      if (paramDateTimeZone == null)
        return;
      if ((paramInt == 0) && (this.iZeroOffsetPrintText != null))
      {
        paramAppendable.append(this.iZeroOffsetPrintText);
        return;
      }
      if (paramInt >= 0)
        paramAppendable.append('+');
      while (true)
      {
        int i = paramInt / 3600000;
        FormatUtils.appendPaddedInteger(paramAppendable, i, 2);
        if (this.iMaxFields == 1)
          break;
        int j = paramInt - i * 3600000;
        if ((j == 0) && (this.iMinFields <= 1))
          break;
        int k = j / 60000;
        if (this.iShowSeparators)
          paramAppendable.append(':');
        FormatUtils.appendPaddedInteger(paramAppendable, k, 2);
        if (this.iMaxFields == 2)
          break;
        int m = j - k * 60000;
        if ((m == 0) && (this.iMinFields <= 2))
          break;
        int n = m / 1000;
        if (this.iShowSeparators)
          paramAppendable.append(':');
        FormatUtils.appendPaddedInteger(paramAppendable, n, 2);
        if (this.iMaxFields == 3)
          break;
        int i1 = m - n * 1000;
        if ((i1 == 0) && (this.iMinFields <= 3))
          break;
        if (this.iShowSeparators)
          paramAppendable.append('.');
        FormatUtils.appendPaddedInteger(paramAppendable, i1, 3);
        return;
        paramAppendable.append('-');
        paramInt = -paramInt;
      }
    }

    public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial, Locale paramLocale)
      throws IOException
    {
    }
  }

  static class TwoDigitYear
    implements InternalPrinter, InternalParser
  {
    private final boolean iLenientParse;
    private final int iPivot;
    private final DateTimeFieldType iType;

    TwoDigitYear(DateTimeFieldType paramDateTimeFieldType, int paramInt, boolean paramBoolean)
    {
      this.iType = paramDateTimeFieldType;
      this.iPivot = paramInt;
      this.iLenientParse = paramBoolean;
    }

    private int getTwoDigitYear(long paramLong, Chronology paramChronology)
    {
      try
      {
        int i = this.iType.getField(paramChronology).get(paramLong);
        if (i < 0)
          i = -i;
        int j = i % 100;
        return j;
      }
      catch (RuntimeException localRuntimeException)
      {
      }
      return -1;
    }

    private int getTwoDigitYear(ReadablePartial paramReadablePartial)
    {
      if (paramReadablePartial.isSupported(this.iType))
        try
        {
          int i = paramReadablePartial.get(this.iType);
          if (i < 0)
            i = -i;
          int j = i % 100;
          return j;
        }
        catch (RuntimeException localRuntimeException)
        {
        }
      return -1;
    }

    public int estimateParsedLength()
    {
      if (this.iLenientParse)
        return 4;
      return 2;
    }

    public int estimatePrintedLength()
    {
      return 2;
    }

    public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
    {
      int i = paramCharSequence.length() - paramInt;
      int j;
      int k;
      label116: int i5;
      int i6;
      if (!this.iLenientParse)
      {
        if (Math.min(2, i) < 2)
          return paramInt ^ 0xFFFFFFFF;
      }
      else
      {
        j = 0;
        k = 0;
        int m = 0;
        int n = i;
        while (true)
          if (j < n)
          {
            int i19 = paramCharSequence.charAt(paramInt + j);
            if ((j == 0) && ((i19 == 45) || (i19 == 43)))
            {
              if (i19 == 45);
              for (int i20 = 1; ; i20 = 0)
              {
                if (i20 == 0)
                  break label116;
                j++;
                k = i20;
                m = 1;
                break;
              }
              paramInt++;
              int i21 = n - 1;
              m = 1;
              n = i21;
              k = i20;
            }
            else if ((i19 >= 48) && (i19 <= 57));
          }
          else
          {
            if (j != 0)
              break;
            return paramInt ^ 0xFFFFFFFF;
            j++;
          }
        if ((m != 0) || (j != 2))
        {
          if (j >= 9)
          {
            i5 = paramInt + j;
            i6 = Integer.parseInt(paramCharSequence.subSequence(paramInt, i5).toString());
            paramDateTimeParserBucket.saveField(this.iType, i6);
            return i5;
          }
          if (k == 0)
            break label512;
        }
      }
      label512: for (int i1 = paramInt + 1; ; i1 = paramInt)
      {
        int i2 = i1 + 1;
        try
        {
          int i3 = paramCharSequence.charAt(i1);
          int i4 = i3 - 48;
          i5 = paramInt + j;
          i6 = i4;
          int i9;
          for (int i7 = i2; i7 < i5; i7 = i9)
          {
            int i8 = (i6 << 3) + (i6 << 1);
            i9 = i7 + 1;
            i6 = -48 + (i8 + paramCharSequence.charAt(i7));
          }
        }
        catch (StringIndexOutOfBoundsException localStringIndexOutOfBoundsException)
        {
          return paramInt ^ 0xFFFFFFFF;
        }
        if (k == 0)
          break;
        i6 = -i6;
        break;
        int i10 = paramCharSequence.charAt(paramInt);
        if ((i10 < 48) || (i10 > 57))
          return paramInt ^ 0xFFFFFFFF;
        int i11 = i10 - 48;
        int i12 = paramCharSequence.charAt(paramInt + 1);
        if ((i12 < 48) || (i12 > 57))
          return paramInt ^ 0xFFFFFFFF;
        int i13 = -48 + (i12 + ((i11 << 3) + (i11 << 1)));
        int i14 = this.iPivot;
        if (paramDateTimeParserBucket.getPivotYear() != null)
          i14 = paramDateTimeParserBucket.getPivotYear().intValue();
        int i15 = i14 - 50;
        if (i15 >= 0);
        for (int i16 = i15 % 100; ; i16 = 99 + (i15 + 1) % 100)
        {
          int i17 = 0;
          if (i13 < i16)
            i17 = 100;
          int i18 = i13 + (i17 + i15 - i16);
          paramDateTimeParserBucket.saveField(this.iType, i18);
          return paramInt + 2;
        }
      }
    }

    public void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
      throws IOException
    {
      int i = getTwoDigitYear(paramLong, paramChronology);
      if (i < 0)
      {
        paramAppendable.append(65533);
        paramAppendable.append(65533);
        return;
      }
      FormatUtils.appendPaddedInteger(paramAppendable, i, 2);
    }

    public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial, Locale paramLocale)
      throws IOException
    {
      int i = getTwoDigitYear(paramReadablePartial);
      if (i < 0)
      {
        paramAppendable.append(65533);
        paramAppendable.append(65533);
        return;
      }
      FormatUtils.appendPaddedInteger(paramAppendable, i, 2);
    }
  }

  static class UnpaddedNumber extends DateTimeFormatterBuilder.NumberFormatter
  {
    protected UnpaddedNumber(DateTimeFieldType paramDateTimeFieldType, int paramInt, boolean paramBoolean)
    {
      super(paramInt, paramBoolean);
    }

    public int estimatePrintedLength()
    {
      return this.iMaxParsedDigits;
    }

    public void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
      throws IOException
    {
      try
      {
        FormatUtils.appendUnpaddedInteger(paramAppendable, this.iFieldType.getField(paramChronology).get(paramLong));
        return;
      }
      catch (RuntimeException localRuntimeException)
      {
        paramAppendable.append(65533);
      }
    }

    public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial, Locale paramLocale)
      throws IOException
    {
      if (paramReadablePartial.isSupported(this.iFieldType))
        try
        {
          FormatUtils.appendUnpaddedInteger(paramAppendable, paramReadablePartial.get(this.iFieldType));
          return;
        }
        catch (RuntimeException localRuntimeException)
        {
          paramAppendable.append(65533);
          return;
        }
      paramAppendable.append(65533);
    }
  }
}