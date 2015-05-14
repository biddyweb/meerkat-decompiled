package org.joda.time.chrono;

import java.util.concurrent.ConcurrentHashMap;
import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeZone;
import org.joda.time.field.SkipDateTimeField;

public final class CopticChronology extends BasicFixedMonthChronology
{
  public static final int AM = 1;
  private static final DateTimeField ERA_FIELD = new BasicSingleEraDateTimeField("AM");
  private static final CopticChronology INSTANCE_UTC = getInstance(DateTimeZone.UTC);
  private static final int MAX_YEAR = 292272708;
  private static final int MIN_YEAR = -292269337;
  private static final ConcurrentHashMap<DateTimeZone, CopticChronology[]> cCache = new ConcurrentHashMap();
  private static final long serialVersionUID = -5972804258688333942L;

  CopticChronology(Chronology paramChronology, Object paramObject, int paramInt)
  {
    super(paramChronology, paramObject, paramInt);
  }

  public static CopticChronology getInstance()
  {
    return getInstance(DateTimeZone.getDefault(), 4);
  }

  public static CopticChronology getInstance(DateTimeZone paramDateTimeZone)
  {
    return getInstance(paramDateTimeZone, 4);
  }

  // ERROR //
  public static CopticChronology getInstance(DateTimeZone paramDateTimeZone, int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: ifnonnull +7 -> 8
    //   4: invokestatic 59\011org/joda/time/DateTimeZone:getDefault\011()Lorg/joda/time/DateTimeZone;
    //   7: astore_0
    //   8: getstatic 39\011org/joda/time/chrono/CopticChronology:cCache\011Ljava/util/concurrent/ConcurrentHashMap;
    //   11: aload_0
    //   12: invokevirtual 68\011java/util/concurrent/ConcurrentHashMap:get\011(Ljava/lang/Object;)Ljava/lang/Object;
    //   15: checkcast 70\011[Lorg/joda/time/chrono/CopticChronology;
    //   18: astore_2
    //   19: aload_2
    //   20: ifnonnull +197 -> 217
    //   23: bipush 7
    //   25: anewarray 2\011org/joda/time/chrono/CopticChronology
    //   28: astore 10
    //   30: getstatic 39\011org/joda/time/chrono/CopticChronology:cCache\011Ljava/util/concurrent/ConcurrentHashMap;
    //   33: aload_0
    //   34: aload 10
    //   36: invokevirtual 74\011java/util/concurrent/ConcurrentHashMap:putIfAbsent\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   39: checkcast 70\011[Lorg/joda/time/chrono/CopticChronology;
    //   42: astore 11
    //   44: aload 11
    //   46: ifnull +165 -> 211
    //   49: aload 11
    //   51: astore_3
    //   52: iload_1
    //   53: iconst_1
    //   54: isub
    //   55: istore 4
    //   57: aload_3
    //   58: iload 4
    //   60: aaload
    //   61: astore 6
    //   63: aload 6
    //   65: ifnonnull +82 -> 147
    //   68: aload_3
    //   69: monitorenter
    //   70: iload_1
    //   71: iconst_1
    //   72: isub
    //   73: istore 7
    //   75: aload_3
    //   76: iload 7
    //   78: aaload
    //   79: astore 6
    //   81: aload 6
    //   83: ifnonnull +62 -> 145
    //   86: aload_0
    //   87: getstatic 45\011org/joda/time/DateTimeZone:UTC\011Lorg/joda/time/DateTimeZone;
    //   90: if_acmpne +89 -> 179
    //   93: new 2\011org/joda/time/chrono/CopticChronology
    //   96: dup
    //   97: aconst_null
    //   98: aconst_null
    //   99: iload_1
    //   100: invokespecial 75\011org/joda/time/chrono/CopticChronology:<init>\011(Lorg/joda/time/Chronology;Ljava/lang/Object;I)V
    //   103: astore 9
    //   105: new 2\011org/joda/time/chrono/CopticChronology
    //   108: dup
    //   109: aload 9
    //   111: new 77\011org/joda/time/DateTime
    //   114: dup
    //   115: iconst_1
    //   116: iconst_1
    //   117: iconst_1
    //   118: iconst_0
    //   119: iconst_0
    //   120: iconst_0
    //   121: iconst_0
    //   122: aload 9
    //   124: invokespecial 80\011org/joda/time/DateTime:<init>\011(IIIIIIILorg/joda/time/Chronology;)V
    //   127: aconst_null
    //   128: invokestatic 85\011org/joda/time/chrono/LimitChronology:getInstance\011(Lorg/joda/time/Chronology;Lorg/joda/time/ReadableDateTime;Lorg/joda/time/ReadableDateTime;)Lorg/joda/time/chrono/LimitChronology;
    //   131: aconst_null
    //   132: iload_1
    //   133: invokespecial 75\011org/joda/time/chrono/CopticChronology:<init>\011(Lorg/joda/time/Chronology;Ljava/lang/Object;I)V
    //   136: astore 6
    //   138: aload_3
    //   139: iload_1
    //   140: iconst_1
    //   141: isub
    //   142: aload 6
    //   144: aastore
    //   145: aload_3
    //   146: monitorexit
    //   147: aload 6
    //   149: areturn
    //   150: astore 5
    //   152: new 87\011java/lang/IllegalArgumentException
    //   155: dup
    //   156: new 89\011java/lang/StringBuilder
    //   159: dup
    //   160: invokespecial 90\011java/lang/StringBuilder:<init>\011()V
    //   163: ldc 92
    //   165: invokevirtual 96\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   168: iload_1
    //   169: invokevirtual 99\011java/lang/StringBuilder:append\011(I)Ljava/lang/StringBuilder;
    //   172: invokevirtual 103\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   175: invokespecial 104\011java/lang/IllegalArgumentException:<init>\011(Ljava/lang/String;)V
    //   178: athrow
    //   179: new 2\011org/joda/time/chrono/CopticChronology
    //   182: dup
    //   183: getstatic 45\011org/joda/time/DateTimeZone:UTC\011Lorg/joda/time/DateTimeZone;
    //   186: iload_1
    //   187: invokestatic 62\011org/joda/time/chrono/CopticChronology:getInstance\011(Lorg/joda/time/DateTimeZone;I)Lorg/joda/time/chrono/CopticChronology;
    //   190: aload_0
    //   191: invokestatic 109\011org/joda/time/chrono/ZonedChronology:getInstance\011(Lorg/joda/time/Chronology;Lorg/joda/time/DateTimeZone;)Lorg/joda/time/chrono/ZonedChronology;
    //   194: aconst_null
    //   195: iload_1
    //   196: invokespecial 75\011org/joda/time/chrono/CopticChronology:<init>\011(Lorg/joda/time/Chronology;Ljava/lang/Object;I)V
    //   199: astore 6
    //   201: goto -63 -> 138
    //   204: astore 8
    //   206: aload_3
    //   207: monitorexit
    //   208: aload 8
    //   210: athrow
    //   211: aload 10
    //   213: astore_3
    //   214: goto -162 -> 52
    //   217: aload_2
    //   218: astore_3
    //   219: goto -167 -> 52
    //
    // Exception table:
    //   from\011to\011target\011type
    //   57\01163\011150\011java/lang/ArrayIndexOutOfBoundsException
    //   75\01181\011204\011finally
    //   86\011138\011204\011finally
    //   138\011145\011204\011finally
    //   145\011147\011204\011finally
    //   179\011201\011204\011finally
    //   206\011208\011204\011finally
  }

  public static CopticChronology getInstanceUTC()
  {
    return INSTANCE_UTC;
  }

  private Object readResolve()
  {
    Chronology localChronology = getBase();
    int i = getMinimumDaysInFirstWeek();
    if (i == 0)
      i = 4;
    if (localChronology == null)
      return getInstance(DateTimeZone.UTC, i);
    return getInstance(localChronology.getZone(), i);
  }

  protected void assemble(AssembledChronology.Fields paramFields)
  {
    if (getBase() == null)
    {
      super.assemble(paramFields);
      paramFields.year = new SkipDateTimeField(this, paramFields.year);
      paramFields.weekyear = new SkipDateTimeField(this, paramFields.weekyear);
      paramFields.era = ERA_FIELD;
      paramFields.monthOfYear = new BasicMonthOfYearDateTimeField(this, 13);
      paramFields.months = paramFields.monthOfYear.getDurationField();
    }
  }

  long calculateFirstDayOfYearMillis(int paramInt)
  {
    int i = paramInt - 1687;
    int j;
    if (i <= 0)
      j = i + 3 >> 2;
    while (true)
    {
      return 21859200000L + 86400000L * (365L * i + j);
      j = i >> 2;
      if (!isLeapYear(paramInt))
        j++;
    }
  }

  long getApproxMillisAtEpochDividedByTwo()
  {
    return 26607895200000L;
  }

  int getMaxYear()
  {
    return 292272708;
  }

  int getMinYear()
  {
    return -292269337;
  }

  boolean isLeapDay(long paramLong)
  {
    return (dayOfMonth().get(paramLong) == 6) && (monthOfYear().isLeap(paramLong));
  }

  public Chronology withUTC()
  {
    return INSTANCE_UTC;
  }

  public Chronology withZone(DateTimeZone paramDateTimeZone)
  {
    if (paramDateTimeZone == null)
      paramDateTimeZone = DateTimeZone.getDefault();
    if (paramDateTimeZone == getZone())
      return this;
    return getInstance(paramDateTimeZone);
  }
}