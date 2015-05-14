package org.joda.time.format;

import java.util.Arrays;
import java.util.Locale;
import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DateTimeUtils;
import org.joda.time.DateTimeZone;
import org.joda.time.DurationField;
import org.joda.time.DurationFieldType;
import org.joda.time.IllegalFieldValueException;
import org.joda.time.IllegalInstantException;

public class DateTimeParserBucket
{
  private final Chronology iChrono;
  private final Integer iDefaultPivotYear;
  private final int iDefaultYear;
  private final DateTimeZone iDefaultZone;
  private final Locale iLocale;
  private final long iMillis;
  private Integer iOffset;
  private Integer iPivotYear;
  private DateTimeParserBucket.SavedField[] iSavedFields;
  private int iSavedFieldsCount;
  private boolean iSavedFieldsShared;
  private Object iSavedState;
  private DateTimeZone iZone;

  @Deprecated
  public DateTimeParserBucket(long paramLong, Chronology paramChronology, Locale paramLocale)
  {
    this(paramLong, paramChronology, paramLocale, null, 2000);
  }

  @Deprecated
  public DateTimeParserBucket(long paramLong, Chronology paramChronology, Locale paramLocale, Integer paramInteger)
  {
    this(paramLong, paramChronology, paramLocale, paramInteger, 2000);
  }

  public DateTimeParserBucket(long paramLong, Chronology paramChronology, Locale paramLocale, Integer paramInteger, int paramInt)
  {
    Chronology localChronology = DateTimeUtils.getChronology(paramChronology);
    this.iMillis = paramLong;
    this.iDefaultZone = localChronology.getZone();
    this.iChrono = localChronology.withUTC();
    if (paramLocale == null)
      paramLocale = Locale.getDefault();
    this.iLocale = paramLocale;
    this.iDefaultYear = paramInt;
    this.iDefaultPivotYear = paramInteger;
    this.iZone = this.iDefaultZone;
    this.iPivotYear = this.iDefaultPivotYear;
    this.iSavedFields = new DateTimeParserBucket.SavedField[8];
  }

  static int compareReverse(DurationField paramDurationField1, DurationField paramDurationField2)
  {
    if ((paramDurationField1 == null) || (!paramDurationField1.isSupported()))
    {
      if ((paramDurationField2 == null) || (!paramDurationField2.isSupported()))
        return 0;
      return -1;
    }
    if ((paramDurationField2 == null) || (!paramDurationField2.isSupported()))
      return 1;
    return -paramDurationField1.compareTo(paramDurationField2);
  }

  private DateTimeParserBucket.SavedField obtainSaveField()
  {
    DateTimeParserBucket.SavedField[] arrayOfSavedField1 = this.iSavedFields;
    int i = this.iSavedFieldsCount;
    int j;
    DateTimeParserBucket.SavedField[] arrayOfSavedField2;
    if ((i == arrayOfSavedField1.length) || (this.iSavedFieldsShared))
      if (i == arrayOfSavedField1.length)
      {
        j = i * 2;
        arrayOfSavedField2 = new DateTimeParserBucket.SavedField[j];
        System.arraycopy(arrayOfSavedField1, 0, arrayOfSavedField2, 0, i);
        this.iSavedFields = arrayOfSavedField2;
        this.iSavedFieldsShared = false;
      }
    while (true)
    {
      this.iSavedState = null;
      DateTimeParserBucket.SavedField localSavedField1 = arrayOfSavedField2[i];
      DateTimeParserBucket.SavedField localSavedField2;
      if (localSavedField1 == null)
      {
        localSavedField2 = new DateTimeParserBucket.SavedField();
        arrayOfSavedField2[i] = localSavedField2;
      }
      for (DateTimeParserBucket.SavedField localSavedField3 = localSavedField2; ; localSavedField3 = localSavedField1)
      {
        this.iSavedFieldsCount = (i + 1);
        return localSavedField3;
        j = arrayOfSavedField1.length;
        break;
      }
      arrayOfSavedField2 = arrayOfSavedField1;
    }
  }

  private static void sort(DateTimeParserBucket.SavedField[] paramArrayOfSavedField, int paramInt)
  {
    int i = 0;
    if (paramInt > 10)
    {
      Arrays.sort(paramArrayOfSavedField, 0, paramInt);
      return;
    }
    while (true)
    {
      i++;
      if (i >= paramInt)
        break;
      for (int j = i; (j > 0) && (paramArrayOfSavedField[(j - 1)].compareTo(paramArrayOfSavedField[j]) > 0); j--)
      {
        DateTimeParserBucket.SavedField localSavedField = paramArrayOfSavedField[j];
        paramArrayOfSavedField[j] = paramArrayOfSavedField[(j - 1)];
        paramArrayOfSavedField[(j - 1)] = localSavedField;
      }
    }
  }

  public long computeMillis()
  {
    return computeMillis(false, (CharSequence)null);
  }

  public long computeMillis(boolean paramBoolean)
  {
    return computeMillis(paramBoolean, (CharSequence)null);
  }

  public long computeMillis(boolean paramBoolean, CharSequence paramCharSequence)
  {
    DateTimeParserBucket.SavedField[] arrayOfSavedField = this.iSavedFields;
    int i = this.iSavedFieldsCount;
    if (this.iSavedFieldsShared)
    {
      arrayOfSavedField = (DateTimeParserBucket.SavedField[])this.iSavedFields.clone();
      this.iSavedFields = arrayOfSavedField;
      this.iSavedFieldsShared = false;
    }
    sort(arrayOfSavedField, i);
    long l3;
    if (i > 0)
    {
      DurationField localDurationField1 = DurationFieldType.months().getField(this.iChrono);
      DurationField localDurationField2 = DurationFieldType.days().getField(this.iChrono);
      DurationField localDurationField3 = arrayOfSavedField[0].iField.getDurationField();
      if ((compareReverse(localDurationField3, localDurationField1) >= 0) && (compareReverse(localDurationField3, localDurationField2) <= 0))
      {
        saveField(DateTimeFieldType.year(), this.iDefaultYear);
        l3 = computeMillis(paramBoolean, paramCharSequence);
        return l3;
      }
    }
    long l1 = this.iMillis;
    int j = 0;
    label139: if (j < i);
    while (true)
    {
      try
      {
        l1 = arrayOfSavedField[j].set(l1, paramBoolean);
        j++;
        break label139;
        if (k < i)
        {
          DateTimeParserBucket.SavedField localSavedField = arrayOfSavedField[k];
          if (k == i - 1)
          {
            bool = true;
            long l2 = localSavedField.set(l1, bool);
            l1 = l2;
            k++;
            continue;
          }
          boolean bool = false;
          continue;
        }
      }
      catch (IllegalFieldValueException localIllegalFieldValueException)
      {
        if (paramCharSequence != null)
          localIllegalFieldValueException.prependMessage("Cannot parse \"" + paramCharSequence + '"');
        throw localIllegalFieldValueException;
      }
      do
      {
        l3 = l1;
        if (this.iOffset != null)
          return l3 - this.iOffset.intValue();
        if (this.iZone == null)
          break;
        int m = this.iZone.getOffsetFromLocal(l3);
        l3 -= m;
        if (m == this.iZone.getOffset(l3))
          break;
        String str = "Illegal instant due to time zone offset transition (" + this.iZone + ')';
        if (paramCharSequence != null)
          str = "Cannot parse \"" + paramCharSequence + "\": " + str;
        throw new IllegalInstantException(str);
      }
      while (!paramBoolean);
      int k = 0;
    }
  }

  public long computeMillis(boolean paramBoolean, String paramString)
  {
    return computeMillis(paramBoolean, paramString);
  }

  long doParseMillis(InternalParser paramInternalParser, CharSequence paramCharSequence)
  {
    int i = paramInternalParser.parseInto(this, paramCharSequence, 0);
    if (i >= 0)
    {
      if (i >= paramCharSequence.length())
        return computeMillis(true, paramCharSequence);
    }
    else
      i ^= -1;
    throw new IllegalArgumentException(FormatUtils.createErrorMessage(paramCharSequence.toString(), i));
  }

  public Chronology getChronology()
  {
    return this.iChrono;
  }

  public Locale getLocale()
  {
    return this.iLocale;
  }

  @Deprecated
  public int getOffset()
  {
    if (this.iOffset != null)
      return this.iOffset.intValue();
    return 0;
  }

  public Integer getOffsetInteger()
  {
    return this.iOffset;
  }

  public Integer getPivotYear()
  {
    return this.iPivotYear;
  }

  public DateTimeZone getZone()
  {
    return this.iZone;
  }

  public long parseMillis(DateTimeParser paramDateTimeParser, CharSequence paramCharSequence)
  {
    reset();
    return doParseMillis(DateTimeParserInternalParser.of(paramDateTimeParser), paramCharSequence);
  }

  public void reset()
  {
    this.iZone = this.iDefaultZone;
    this.iOffset = null;
    this.iPivotYear = this.iDefaultPivotYear;
    this.iSavedFieldsCount = 0;
    this.iSavedFieldsShared = false;
    this.iSavedState = null;
  }

  public boolean restoreState(Object paramObject)
  {
    if (((paramObject instanceof DateTimeParserBucket.SavedState)) && (((DateTimeParserBucket.SavedState)paramObject).restoreState(this)))
    {
      this.iSavedState = paramObject;
      return true;
    }
    return false;
  }

  public void saveField(DateTimeField paramDateTimeField, int paramInt)
  {
    obtainSaveField().init(paramDateTimeField, paramInt);
  }

  public void saveField(DateTimeFieldType paramDateTimeFieldType, int paramInt)
  {
    obtainSaveField().init(paramDateTimeFieldType.getField(this.iChrono), paramInt);
  }

  public void saveField(DateTimeFieldType paramDateTimeFieldType, String paramString, Locale paramLocale)
  {
    obtainSaveField().init(paramDateTimeFieldType.getField(this.iChrono), paramString, paramLocale);
  }

  public Object saveState()
  {
    if (this.iSavedState == null)
      this.iSavedState = new DateTimeParserBucket.SavedState(this);
    return this.iSavedState;
  }

  @Deprecated
  public void setOffset(int paramInt)
  {
    this.iSavedState = null;
    this.iOffset = Integer.valueOf(paramInt);
  }

  public void setOffset(Integer paramInteger)
  {
    this.iSavedState = null;
    this.iOffset = paramInteger;
  }

  @Deprecated
  public void setPivotYear(Integer paramInteger)
  {
    this.iPivotYear = paramInteger;
  }

  public void setZone(DateTimeZone paramDateTimeZone)
  {
    this.iSavedState = null;
    this.iZone = paramDateTimeZone;
  }
}