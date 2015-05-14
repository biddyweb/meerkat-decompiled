package org.joda.time.chrono;

import java.util.concurrent.ConcurrentHashMap;
import org.joda.time.Chronology;
import org.joda.time.DateTimeZone;

public final class GregorianChronology extends BasicGJChronology
{
  private static final int DAYS_0000_TO_1970 = 719527;
  private static final GregorianChronology INSTANCE_UTC = getInstance(DateTimeZone.UTC);
  private static final int MAX_YEAR = 292278993;
  private static final long MILLIS_PER_MONTH = 2629746000L;
  private static final long MILLIS_PER_YEAR = 31556952000L;
  private static final int MIN_YEAR = -292275054;
  private static final ConcurrentHashMap<DateTimeZone, GregorianChronology[]> cCache = new ConcurrentHashMap();
  private static final long serialVersionUID = -861407383323710522L;

  private GregorianChronology(Chronology paramChronology, Object paramObject, int paramInt)
  {
    super(paramChronology, paramObject, paramInt);
  }

  public static GregorianChronology getInstance()
  {
    return getInstance(DateTimeZone.getDefault(), 4);
  }

  public static GregorianChronology getInstance(DateTimeZone paramDateTimeZone)
  {
    return getInstance(paramDateTimeZone, 4);
  }

  // ERROR //
  public static GregorianChronology getInstance(DateTimeZone paramDateTimeZone, int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: ifnonnull +7 -> 8
    //   4: invokestatic 55\011org/joda/time/DateTimeZone:getDefault\011()Lorg/joda/time/DateTimeZone;
    //   7: astore_0
    //   8: getstatic 35\011org/joda/time/chrono/GregorianChronology:cCache\011Ljava/util/concurrent/ConcurrentHashMap;
    //   11: aload_0
    //   12: invokevirtual 64\011java/util/concurrent/ConcurrentHashMap:get\011(Ljava/lang/Object;)Ljava/lang/Object;
    //   15: checkcast 66\011[Lorg/joda/time/chrono/GregorianChronology;
    //   18: astore_2
    //   19: aload_2
    //   20: ifnonnull +156 -> 176
    //   23: bipush 7
    //   25: anewarray 2\011org/joda/time/chrono/GregorianChronology
    //   28: astore_3
    //   29: getstatic 35\011org/joda/time/chrono/GregorianChronology:cCache\011Ljava/util/concurrent/ConcurrentHashMap;
    //   32: aload_0
    //   33: aload_3
    //   34: invokevirtual 70\011java/util/concurrent/ConcurrentHashMap:putIfAbsent\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   37: checkcast 66\011[Lorg/joda/time/chrono/GregorianChronology;
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
    //   85: getstatic 41\011org/joda/time/DateTimeZone:UTC\011Lorg/joda/time/DateTimeZone;
    //   88: if_acmpne +56 -> 144
    //   91: new 2\011org/joda/time/chrono/GregorianChronology
    //   94: dup
    //   95: aconst_null
    //   96: aconst_null
    //   97: iload_1
    //   98: invokespecial 71\011org/joda/time/chrono/GregorianChronology:<init>\011(Lorg/joda/time/Chronology;Ljava/lang/Object;I)V
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
    //   117: new 73\011java/lang/IllegalArgumentException
    //   120: dup
    //   121: new 75\011java/lang/StringBuilder
    //   124: dup
    //   125: invokespecial 76\011java/lang/StringBuilder:<init>\011()V
    //   128: ldc 78
    //   130: invokevirtual 82\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   133: iload_1
    //   134: invokevirtual 85\011java/lang/StringBuilder:append\011(I)Ljava/lang/StringBuilder;
    //   137: invokevirtual 89\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   140: invokespecial 92\011java/lang/IllegalArgumentException:<init>\011(Ljava/lang/String;)V
    //   143: athrow
    //   144: new 2\011org/joda/time/chrono/GregorianChronology
    //   147: dup
    //   148: getstatic 41\011org/joda/time/DateTimeZone:UTC\011Lorg/joda/time/DateTimeZone;
    //   151: iload_1
    //   152: invokestatic 58\011org/joda/time/chrono/GregorianChronology:getInstance\011(Lorg/joda/time/DateTimeZone;I)Lorg/joda/time/chrono/GregorianChronology;
    //   155: aload_0
    //   156: invokestatic 97\011org/joda/time/chrono/ZonedChronology:getInstance\011(Lorg/joda/time/Chronology;Lorg/joda/time/DateTimeZone;)Lorg/joda/time/chrono/ZonedChronology;
    //   159: aconst_null
    //   160: iload_1
    //   161: invokespecial 71\011org/joda/time/chrono/GregorianChronology:<init>\011(Lorg/joda/time/Chronology;Ljava/lang/Object;I)V
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

  public static GregorianChronology getInstanceUTC()
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
      super.assemble(paramFields);
  }

  long calculateFirstDayOfYearMillis(int paramInt)
  {
    int i = paramInt / 100;
    int j;
    if (paramInt < 0)
      j = -1 + ((paramInt + 3 >> 2) - i + (i + 3 >> 2));
    while (true)
    {
      return 86400000L * (365L * paramInt + (j - 719527));
      j = (paramInt >> 2) - i + (i >> 2);
      if (isLeapYear(paramInt))
        j--;
    }
  }

  long getApproxMillisAtEpochDividedByTwo()
  {
    return 31083597720000L;
  }

  long getAverageMillisPerMonth()
  {
    return 2629746000L;
  }

  long getAverageMillisPerYear()
  {
    return 31556952000L;
  }

  long getAverageMillisPerYearDividedByTwo()
  {
    return 15778476000L;
  }

  int getMaxYear()
  {
    return 292278993;
  }

  int getMinYear()
  {
    return -292275054;
  }

  boolean isLeapYear(int paramInt)
  {
    return ((paramInt & 0x3) == 0) && ((paramInt % 100 != 0) || (paramInt % 400 == 0));
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