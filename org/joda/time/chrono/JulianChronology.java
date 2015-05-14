package org.joda.time.chrono;

import java.util.concurrent.ConcurrentHashMap;
import org.joda.time.Chronology;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DateTimeZone;
import org.joda.time.IllegalFieldValueException;
import org.joda.time.field.SkipDateTimeField;

public final class JulianChronology extends BasicGJChronology
{
  private static final JulianChronology INSTANCE_UTC = getInstance(DateTimeZone.UTC);
  private static final int MAX_YEAR = 292272992;
  private static final long MILLIS_PER_MONTH = 2629800000L;
  private static final long MILLIS_PER_YEAR = 31557600000L;
  private static final int MIN_YEAR = -292269054;
  private static final ConcurrentHashMap<DateTimeZone, JulianChronology[]> cCache = new ConcurrentHashMap();
  private static final long serialVersionUID = -8731039522547897247L;

  JulianChronology(Chronology paramChronology, Object paramObject, int paramInt)
  {
    super(paramChronology, paramObject, paramInt);
  }

  static int adjustYearForSet(int paramInt)
  {
    if (paramInt <= 0)
    {
      if (paramInt == 0)
        throw new IllegalFieldValueException(DateTimeFieldType.year(), Integer.valueOf(paramInt), null, null);
      paramInt++;
    }
    return paramInt;
  }

  public static JulianChronology getInstance()
  {
    return getInstance(DateTimeZone.getDefault(), 4);
  }

  public static JulianChronology getInstance(DateTimeZone paramDateTimeZone)
  {
    return getInstance(paramDateTimeZone, 4);
  }

  // ERROR //
  public static JulianChronology getInstance(DateTimeZone paramDateTimeZone, int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: ifnonnull +7 -> 8
    //   4: invokestatic 72\011org/joda/time/DateTimeZone:getDefault\011()Lorg/joda/time/DateTimeZone;
    //   7: astore_0
    //   8: getstatic 33\011org/joda/time/chrono/JulianChronology:cCache\011Ljava/util/concurrent/ConcurrentHashMap;
    //   11: aload_0
    //   12: invokevirtual 81\011java/util/concurrent/ConcurrentHashMap:get\011(Ljava/lang/Object;)Ljava/lang/Object;
    //   15: checkcast 83\011[Lorg/joda/time/chrono/JulianChronology;
    //   18: astore_2
    //   19: aload_2
    //   20: ifnonnull +156 -> 176
    //   23: bipush 7
    //   25: anewarray 2\011org/joda/time/chrono/JulianChronology
    //   28: astore_3
    //   29: getstatic 33\011org/joda/time/chrono/JulianChronology:cCache\011Ljava/util/concurrent/ConcurrentHashMap;
    //   32: aload_0
    //   33: aload_3
    //   34: invokevirtual 87\011java/util/concurrent/ConcurrentHashMap:putIfAbsent\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   37: checkcast 83\011[Lorg/joda/time/chrono/JulianChronology;
    //   40: astore 9
    //   42: aload 9
    //   44: ifnull +6 -> 50
    //   47: aload 9
    //   49: astore_3
    //   50: iload_1
    //   51: iconst_1
    //   52: isub
    //   53: istore 4
    //   55: aload_3
    //   56: iload 4
    //   58: aaload
    //   59: astore 6
    //   61: aload 6
    //   63: ifnonnull +49 -> 112
    //   66: aload_3
    //   67: monitorenter
    //   68: iload_1
    //   69: iconst_1
    //   70: isub
    //   71: istore 7
    //   73: aload_3
    //   74: iload 7
    //   76: aaload
    //   77: astore 6
    //   79: aload 6
    //   81: ifnonnull +29 -> 110
    //   84: aload_0
    //   85: getstatic 39\011org/joda/time/DateTimeZone:UTC\011Lorg/joda/time/DateTimeZone;
    //   88: if_acmpne +56 -> 144
    //   91: new 2\011org/joda/time/chrono/JulianChronology
    //   94: dup
    //   95: aconst_null
    //   96: aconst_null
    //   97: iload_1
    //   98: invokespecial 88\011org/joda/time/chrono/JulianChronology:<init>\011(Lorg/joda/time/Chronology;Ljava/lang/Object;I)V
    //   101: astore 6
    //   103: aload_3
    //   104: iload_1
    //   105: iconst_1
    //   106: isub
    //   107: aload 6
    //   109: aastore
    //   110: aload_3
    //   111: monitorexit
    //   112: aload 6
    //   114: areturn
    //   115: astore 5
    //   117: new 90\011java/lang/IllegalArgumentException
    //   120: dup
    //   121: new 92\011java/lang/StringBuilder
    //   124: dup
    //   125: invokespecial 93\011java/lang/StringBuilder:<init>\011()V
    //   128: ldc 95
    //   130: invokevirtual 99\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   133: iload_1
    //   134: invokevirtual 102\011java/lang/StringBuilder:append\011(I)Ljava/lang/StringBuilder;
    //   137: invokevirtual 106\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   140: invokespecial 109\011java/lang/IllegalArgumentException:<init>\011(Ljava/lang/String;)V
    //   143: athrow
    //   144: new 2\011org/joda/time/chrono/JulianChronology
    //   147: dup
    //   148: getstatic 39\011org/joda/time/DateTimeZone:UTC\011Lorg/joda/time/DateTimeZone;
    //   151: iload_1
    //   152: invokestatic 75\011org/joda/time/chrono/JulianChronology:getInstance\011(Lorg/joda/time/DateTimeZone;I)Lorg/joda/time/chrono/JulianChronology;
    //   155: aload_0
    //   156: invokestatic 114\011org/joda/time/chrono/ZonedChronology:getInstance\011(Lorg/joda/time/Chronology;Lorg/joda/time/DateTimeZone;)Lorg/joda/time/chrono/ZonedChronology;
    //   159: aconst_null
    //   160: iload_1
    //   161: invokespecial 88\011org/joda/time/chrono/JulianChronology:<init>\011(Lorg/joda/time/Chronology;Ljava/lang/Object;I)V
    //   164: astore 6
    //   166: goto -63 -> 103
    //   169: astore 8
    //   171: aload_3
    //   172: monitorexit
    //   173: aload 8
    //   175: athrow
    //   176: aload_2
    //   177: astore_3
    //   178: goto -128 -> 50
    //
    // Exception table:
    //   from\011to\011target\011type
    //   55\01161\011115\011java/lang/ArrayIndexOutOfBoundsException
    //   73\01179\011169\011finally
    //   84\011103\011169\011finally
    //   103\011110\011169\011finally
    //   110\011112\011169\011finally
    //   144\011166\011169\011finally
    //   171\011173\011169\011finally
  }

  public static JulianChronology getInstanceUTC()
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
    }
  }

  long calculateFirstDayOfYearMillis(int paramInt)
  {
    int i = paramInt - 1968;
    int j;
    if (i <= 0)
      j = i + 3 >> 2;
    while (true)
    {
      return 86400000L * (365L * i + j) - 62035200000L;
      j = i >> 2;
      if (!isLeapYear(paramInt))
        j++;
    }
  }

  long getApproxMillisAtEpochDividedByTwo()
  {
    return 31083663600000L;
  }

  long getAverageMillisPerMonth()
  {
    return 2629800000L;
  }

  long getAverageMillisPerYear()
  {
    return 31557600000L;
  }

  long getAverageMillisPerYearDividedByTwo()
  {
    return 15778800000L;
  }

  long getDateMidnightMillis(int paramInt1, int paramInt2, int paramInt3)
    throws IllegalArgumentException
  {
    return super.getDateMidnightMillis(adjustYearForSet(paramInt1), paramInt2, paramInt3);
  }

  int getMaxYear()
  {
    return 292272992;
  }

  int getMinYear()
  {
    return -292269054;
  }

  boolean isLeapYear(int paramInt)
  {
    return (paramInt & 0x3) == 0;
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