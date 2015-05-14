package org.joda.time.tz;

import java.io.DataInput;
import java.io.DataInputStream;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.Set;
import org.joda.time.Chronology;
import org.joda.time.DateTime;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeUtils;
import org.joda.time.DateTimeZone;
import org.joda.time.Period;
import org.joda.time.PeriodType;
import org.joda.time.chrono.ISOChronology;

public class DateTimeZoneBuilder
{
  private final ArrayList<RuleSet> iRuleSets = new ArrayList(10);

  private boolean addTransition(ArrayList<Transition> paramArrayList, Transition paramTransition)
  {
    int i = paramArrayList.size();
    boolean bool2;
    if (i == 0)
    {
      paramArrayList.add(paramTransition);
      bool2 = true;
    }
    Transition localTransition;
    boolean bool1;
    do
    {
      return bool2;
      localTransition = (Transition)paramArrayList.get(i - 1);
      bool1 = paramTransition.isTransitionFrom(localTransition);
      bool2 = false;
    }
    while (!bool1);
    int j = 0;
    if (i >= 2)
      j = ((Transition)paramArrayList.get(i - 2)).getWallOffset();
    int k = localTransition.getWallOffset();
    long l = localTransition.getMillis() + j;
    if (paramTransition.getMillis() + k != l)
    {
      paramArrayList.add(paramTransition);
      return true;
    }
    paramArrayList.remove(i - 1);
    return addTransition(paramArrayList, paramTransition);
  }

  private static DateTimeZone buildFixedZone(String paramString1, String paramString2, int paramInt1, int paramInt2)
  {
    if (("UTC".equals(paramString1)) && (paramString1.equals(paramString2)) && (paramInt1 == 0) && (paramInt2 == 0))
      return DateTimeZone.UTC;
    return new FixedDateTimeZone(paramString1, paramString2, paramInt1, paramInt2);
  }

  private RuleSet getLastRuleSet()
  {
    if (this.iRuleSets.size() == 0)
      addCutover(-2147483648, 'w', 1, 1, 0, false, 0);
    return (RuleSet)this.iRuleSets.get(-1 + this.iRuleSets.size());
  }

  public static DateTimeZone readFrom(DataInput paramDataInput, String paramString)
    throws IOException
  {
    switch (paramDataInput.readUnsignedByte())
    {
    default:
      throw new IOException("Invalid encoding");
    case 70:
      Object localObject = new FixedDateTimeZone(paramString, paramDataInput.readUTF(), (int)readMillis(paramDataInput), (int)readMillis(paramDataInput));
      if (((DateTimeZone)localObject).equals(DateTimeZone.UTC))
        localObject = DateTimeZone.UTC;
      return localObject;
    case 67:
      return CachedDateTimeZone.forZone(PrecalculatedZone.readFrom(paramDataInput, paramString));
    case 80:
    }
    return PrecalculatedZone.readFrom(paramDataInput, paramString);
  }

  public static DateTimeZone readFrom(InputStream paramInputStream, String paramString)
    throws IOException
  {
    if ((paramInputStream instanceof DataInput))
      return readFrom((DataInput)paramInputStream, paramString);
    return readFrom(new DataInputStream(paramInputStream), paramString);
  }

  static long readMillis(DataInput paramDataInput)
    throws IOException
  {
    int i = paramDataInput.readUnsignedByte();
    switch (i >> 6)
    {
    default:
      return 1800000L * (i << 26 >> 26);
    case 1:
      return 60000L * (i << 26 >> 2 | paramDataInput.readUnsignedByte() << 16 | paramDataInput.readUnsignedByte() << 8 | paramDataInput.readUnsignedByte());
    case 2:
      return 1000L * (i << 58 >> 26 | paramDataInput.readUnsignedByte() << 24 | paramDataInput.readUnsignedByte() << 16 | paramDataInput.readUnsignedByte() << 8 | paramDataInput.readUnsignedByte());
    case 3:
    }
    return paramDataInput.readLong();
  }

  static void writeMillis(DataOutput paramDataOutput, long paramLong)
    throws IOException
  {
    if (paramLong % 1800000L == 0L)
    {
      long l3 = paramLong / 1800000L;
      if (l3 << 58 >> 58 == l3)
      {
        paramDataOutput.writeByte((int)(l3 & 0x3F));
        return;
      }
    }
    if (paramLong % 60000L == 0L)
    {
      long l2 = paramLong / 60000L;
      if (l2 << 34 >> 34 == l2)
      {
        paramDataOutput.writeInt(0x40000000 | (int)(l2 & 0x3FFFFFFF));
        return;
      }
    }
    if (paramLong % 1000L == 0L)
    {
      long l1 = paramLong / 1000L;
      if (l1 << 26 >> 26 == l1)
      {
        paramDataOutput.writeByte(0x80 | (int)(0x3F & l1 >> 32));
        paramDataOutput.writeInt((int)(l1 & 0xFFFFFFFF));
        return;
      }
    }
    if (paramLong < 0L);
    for (int i = 255; ; i = 192)
    {
      paramDataOutput.writeByte(i);
      paramDataOutput.writeLong(paramLong);
      return;
    }
  }

  public DateTimeZoneBuilder addCutover(int paramInt1, char paramChar, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean, int paramInt5)
  {
    if (this.iRuleSets.size() > 0)
    {
      OfYear localOfYear = new OfYear(paramChar, paramInt2, paramInt3, paramInt4, paramBoolean, paramInt5);
      ((RuleSet)this.iRuleSets.get(-1 + this.iRuleSets.size())).setUpperLimit(paramInt1, localOfYear);
    }
    this.iRuleSets.add(new RuleSet());
    return this;
  }

  public DateTimeZoneBuilder addRecurringSavings(String paramString, int paramInt1, int paramInt2, int paramInt3, char paramChar, int paramInt4, int paramInt5, int paramInt6, boolean paramBoolean, int paramInt7)
  {
    if (paramInt2 <= paramInt3)
    {
      Rule localRule = new Rule(new Recurrence(new OfYear(paramChar, paramInt4, paramInt5, paramInt6, paramBoolean, paramInt7), paramString, paramInt1), paramInt2, paramInt3);
      getLastRuleSet().addRule(localRule);
    }
    return this;
  }

  public DateTimeZoneBuilder setFixedSavings(String paramString, int paramInt)
  {
    getLastRuleSet().setFixedSavings(paramString, paramInt);
    return this;
  }

  public DateTimeZoneBuilder setStandardOffset(int paramInt)
  {
    getLastRuleSet().setStandardOffset(paramInt);
    return this;
  }

  public DateTimeZone toDateTimeZone(String paramString, boolean paramBoolean)
  {
    if (paramString == null)
      throw new IllegalArgumentException();
    ArrayList localArrayList = new ArrayList();
    Object localObject1 = null;
    long l1 = -9223372036854775808L;
    int i = this.iRuleSets.size();
    int j = 0;
    while (j < i)
    {
      RuleSet localRuleSet1 = (RuleSet)this.iRuleSets.get(j);
      Transition localTransition2 = localRuleSet1.firstTransition(l1);
      long l4;
      if (localTransition2 == null)
      {
        l4 = l1;
        j++;
        l1 = l4;
      }
      else
      {
        addTransition(localArrayList, localTransition2);
        long l2 = localTransition2.getMillis();
        int k = localTransition2.getSaveMillis();
        RuleSet localRuleSet2 = new RuleSet(localRuleSet1);
        int m = k;
        for (Object localObject2 = localObject1; ; localObject2 = localRuleSet2.buildTailZone(paramString))
          do
          {
            Transition localTransition3 = localRuleSet2.nextTransition(l2, m);
            if ((localTransition3 == null) || ((addTransition(localArrayList, localTransition3)) && (localObject2 != null)))
            {
              long l3 = localRuleSet2.getUpperLimit(m);
              localObject1 = localObject2;
              l4 = l3;
              break;
            }
            l2 = localTransition3.getMillis();
            m = localTransition3.getSaveMillis();
          }
          while ((localObject2 != null) || (j != i - 1));
      }
    }
    if (localArrayList.size() == 0)
      if (localObject1 == null);
    do
    {
      return localObject1;
      return buildFixedZone(paramString, "UTC", 0, 0);
      if ((localArrayList.size() == 1) && (localObject1 == null))
      {
        Transition localTransition1 = (Transition)localArrayList.get(0);
        return buildFixedZone(paramString, localTransition1.getNameKey(), localTransition1.getWallOffset(), localTransition1.getStandardOffset());
      }
      localObject1 = PrecalculatedZone.create(paramString, paramBoolean, localArrayList, (DSTZone)localObject1);
    }
    while (!((PrecalculatedZone)localObject1).isCachable());
    return CachedDateTimeZone.forZone((DateTimeZone)localObject1);
  }

  public void writeTo(String paramString, DataOutput paramDataOutput)
    throws IOException
  {
    DateTimeZone localDateTimeZone = toDateTimeZone(paramString, false);
    if ((localDateTimeZone instanceof FixedDateTimeZone))
    {
      paramDataOutput.writeByte(70);
      paramDataOutput.writeUTF(localDateTimeZone.getNameKey(0L));
      writeMillis(paramDataOutput, localDateTimeZone.getOffset(0L));
      writeMillis(paramDataOutput, localDateTimeZone.getStandardOffset(0L));
      return;
    }
    if ((localDateTimeZone instanceof CachedDateTimeZone))
    {
      paramDataOutput.writeByte(67);
      localDateTimeZone = ((CachedDateTimeZone)localDateTimeZone).getUncachedZone();
    }
    while (true)
    {
      ((PrecalculatedZone)localDateTimeZone).writeTo(paramDataOutput);
      return;
      paramDataOutput.writeByte(80);
    }
  }

  public void writeTo(String paramString, OutputStream paramOutputStream)
    throws IOException
  {
    if ((paramOutputStream instanceof DataOutput))
    {
      writeTo(paramString, (DataOutput)paramOutputStream);
      return;
    }
    writeTo(paramString, new DataOutputStream(paramOutputStream));
  }

  private static final class DSTZone extends DateTimeZone
  {
    private static final long serialVersionUID = 6941492635554961361L;
    final DateTimeZoneBuilder.Recurrence iEndRecurrence;
    final int iStandardOffset;
    final DateTimeZoneBuilder.Recurrence iStartRecurrence;

    DSTZone(String paramString, int paramInt, DateTimeZoneBuilder.Recurrence paramRecurrence1, DateTimeZoneBuilder.Recurrence paramRecurrence2)
    {
      super();
      this.iStandardOffset = paramInt;
      this.iStartRecurrence = paramRecurrence1;
      this.iEndRecurrence = paramRecurrence2;
    }

    // ERROR //
    private DateTimeZoneBuilder.Recurrence findMatchingRecurrence(long paramLong)
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 20\011org/joda/time/tz/DateTimeZoneBuilder$DSTZone:iStandardOffset\011I
      //   4: istore_3
      //   5: aload_0
      //   6: getfield 22\011org/joda/time/tz/DateTimeZoneBuilder$DSTZone:iStartRecurrence\011Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;
      //   9: astore 4
      //   11: aload_0
      //   12: getfield 24\011org/joda/time/tz/DateTimeZoneBuilder$DSTZone:iEndRecurrence\011Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;
      //   15: astore 5
      //   17: aload 4
      //   19: lload_1
      //   20: iload_3
      //   21: aload 5
      //   23: invokevirtual 36\011org/joda/time/tz/DateTimeZoneBuilder$Recurrence:getSaveMillis\011()I
      //   26: invokevirtual 40\011org/joda/time/tz/DateTimeZoneBuilder$Recurrence:next\011(JII)J
      //   29: lstore 14
      //   31: lload 14
      //   33: lstore 7
      //   35: aload 5
      //   37: lload_1
      //   38: iload_3
      //   39: aload 4
      //   41: invokevirtual 36\011org/joda/time/tz/DateTimeZoneBuilder$Recurrence:getSaveMillis\011()I
      //   44: invokevirtual 40\011org/joda/time/tz/DateTimeZoneBuilder$Recurrence:next\011(JII)J
      //   47: lstore 11
      //   49: lload 11
      //   51: lstore_1
      //   52: lload 7
      //   54: lload_1
      //   55: lcmp
      //   56: ifle +22 -> 78
      //   59: aload 4
      //   61: areturn
      //   62: astore 13
      //   64: lload_1
      //   65: lstore 7
      //   67: goto -32 -> 35
      //   70: astore 6
      //   72: lload_1
      //   73: lstore 7
      //   75: goto -40 -> 35
      //   78: aload 5
      //   80: areturn
      //   81: astore 10
      //   83: goto -31 -> 52
      //   86: astore 9
      //   88: goto -36 -> 52
      //
      // Exception table:
      //   from\011to\011target\011type
      //   17\01131\01162\011java/lang/IllegalArgumentException
      //   17\01131\01170\011java/lang/ArithmeticException
      //   35\01149\01181\011java/lang/ArithmeticException
      //   35\01149\01186\011java/lang/IllegalArgumentException
    }

    static DSTZone readFrom(DataInput paramDataInput, String paramString)
      throws IOException
    {
      return new DSTZone(paramString, (int)DateTimeZoneBuilder.readMillis(paramDataInput), DateTimeZoneBuilder.Recurrence.readFrom(paramDataInput), DateTimeZoneBuilder.Recurrence.readFrom(paramDataInput));
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      DSTZone localDSTZone;
      do
      {
        return true;
        if (!(paramObject instanceof DSTZone))
          break;
        localDSTZone = (DSTZone)paramObject;
      }
      while ((getID().equals(localDSTZone.getID())) && (this.iStandardOffset == localDSTZone.iStandardOffset) && (this.iStartRecurrence.equals(localDSTZone.iStartRecurrence)) && (this.iEndRecurrence.equals(localDSTZone.iEndRecurrence)));
      return false;
      return false;
    }

    public String getNameKey(long paramLong)
    {
      return findMatchingRecurrence(paramLong).getNameKey();
    }

    public int getOffset(long paramLong)
    {
      return this.iStandardOffset + findMatchingRecurrence(paramLong).getSaveMillis();
    }

    public int getStandardOffset(long paramLong)
    {
      return this.iStandardOffset;
    }

    public boolean isFixed()
    {
      return false;
    }

    // ERROR //
    public long nextTransition(long paramLong)
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 20\011org/joda/time/tz/DateTimeZoneBuilder$DSTZone:iStandardOffset\011I
      //   4: istore_3
      //   5: aload_0
      //   6: getfield 22\011org/joda/time/tz/DateTimeZoneBuilder$DSTZone:iStartRecurrence\011Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;
      //   9: astore 4
      //   11: aload_0
      //   12: getfield 24\011org/joda/time/tz/DateTimeZoneBuilder$DSTZone:iEndRecurrence\011Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;
      //   15: astore 5
      //   17: aload 4
      //   19: lload_1
      //   20: iload_3
      //   21: aload 5
      //   23: invokevirtual 36\011org/joda/time/tz/DateTimeZoneBuilder$Recurrence:getSaveMillis\011()I
      //   26: invokevirtual 40\011org/joda/time/tz/DateTimeZoneBuilder$Recurrence:next\011(JII)J
      //   29: lstore 16
      //   31: lload 16
      //   33: lstore 18
      //   35: lload_1
      //   36: lconst_0
      //   37: lcmp
      //   38: ifle +13 -> 51
      //   41: lload 18
      //   43: lconst_0
      //   44: lcmp
      //   45: ifge +6 -> 51
      //   48: lload_1
      //   49: lstore 18
      //   51: lload 18
      //   53: lstore 7
      //   55: aload 5
      //   57: lload_1
      //   58: iload_3
      //   59: aload 4
      //   61: invokevirtual 36\011org/joda/time/tz/DateTimeZoneBuilder$Recurrence:getSaveMillis\011()I
      //   64: invokevirtual 40\011org/joda/time/tz/DateTimeZoneBuilder$Recurrence:next\011(JII)J
      //   67: lstore 13
      //   69: lload_1
      //   70: lconst_0
      //   71: lcmp
      //   72: ifle +59 -> 131
      //   75: lload 13
      //   77: lconst_0
      //   78: lcmp
      //   79: ifge +52 -> 131
      //   82: lload_1
      //   83: lstore 10
      //   85: lload 7
      //   87: lload 10
      //   89: lcmp
      //   90: ifle +38 -> 128
      //   93: lload 10
      //   95: lreturn
      //   96: astore 15
      //   98: lload_1
      //   99: lstore 7
      //   101: goto -46 -> 55
      //   104: astore 6
      //   106: lload_1
      //   107: lstore 7
      //   109: goto -54 -> 55
      //   112: astore 12
      //   114: lload_1
      //   115: lstore 10
      //   117: goto -32 -> 85
      //   120: astore 9
      //   122: lload_1
      //   123: lstore 10
      //   125: goto -40 -> 85
      //   128: lload 7
      //   130: lreturn
      //   131: lload 13
      //   133: lstore_1
      //   134: goto -52 -> 82
      //
      // Exception table:
      //   from\011to\011target\011type
      //   17\01131\01196\011java/lang/IllegalArgumentException
      //   17\01131\011104\011java/lang/ArithmeticException
      //   55\01169\011112\011java/lang/IllegalArgumentException
      //   55\01169\011120\011java/lang/ArithmeticException
    }

    // ERROR //
    public long previousTransition(long paramLong)
    {
      // Byte code:
      //   0: lload_1
      //   1: lconst_1
      //   2: ladd
      //   3: lstore_3
      //   4: aload_0
      //   5: getfield 20\011org/joda/time/tz/DateTimeZoneBuilder$DSTZone:iStandardOffset\011I
      //   8: istore 5
      //   10: aload_0
      //   11: getfield 22\011org/joda/time/tz/DateTimeZoneBuilder$DSTZone:iStartRecurrence\011Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;
      //   14: astore 6
      //   16: aload_0
      //   17: getfield 24\011org/joda/time/tz/DateTimeZoneBuilder$DSTZone:iEndRecurrence\011Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;
      //   20: astore 7
      //   22: aload 6
      //   24: lload_3
      //   25: iload 5
      //   27: aload 7
      //   29: invokevirtual 36\011org/joda/time/tz/DateTimeZoneBuilder$Recurrence:getSaveMillis\011()I
      //   32: invokevirtual 83\011org/joda/time/tz/DateTimeZoneBuilder$Recurrence:previous\011(JII)J
      //   35: lstore 18
      //   37: lload 18
      //   39: lstore 20
      //   41: lload_3
      //   42: lconst_0
      //   43: lcmp
      //   44: ifge +13 -> 57
      //   47: lload 20
      //   49: lconst_0
      //   50: lcmp
      //   51: ifle +6 -> 57
      //   54: lload_3
      //   55: lstore 20
      //   57: lload 20
      //   59: lstore 9
      //   61: aload 7
      //   63: lload_3
      //   64: iload 5
      //   66: aload 6
      //   68: invokevirtual 36\011org/joda/time/tz/DateTimeZoneBuilder$Recurrence:getSaveMillis\011()I
      //   71: invokevirtual 83\011org/joda/time/tz/DateTimeZoneBuilder$Recurrence:previous\011(JII)J
      //   74: lstore 15
      //   76: lload_3
      //   77: lconst_0
      //   78: lcmp
      //   79: ifge +62 -> 141
      //   82: lload 15
      //   84: lconst_0
      //   85: lcmp
      //   86: ifle +55 -> 141
      //   89: lload_3
      //   90: lstore 12
      //   92: lload 9
      //   94: lload 12
      //   96: lcmp
      //   97: ifle +7 -> 104
      //   100: lload 9
      //   102: lstore 12
      //   104: lload 12
      //   106: lconst_1
      //   107: lsub
      //   108: lreturn
      //   109: astore 17
      //   111: lload_3
      //   112: lstore 9
      //   114: goto -53 -> 61
      //   117: astore 8
      //   119: lload_3
      //   120: lstore 9
      //   122: goto -61 -> 61
      //   125: astore 14
      //   127: lload_3
      //   128: lstore 12
      //   130: goto -38 -> 92
      //   133: astore 11
      //   135: lload_3
      //   136: lstore 12
      //   138: goto -46 -> 92
      //   141: lload 15
      //   143: lstore_3
      //   144: goto -55 -> 89
      //
      // Exception table:
      //   from\011to\011target\011type
      //   22\01137\011109\011java/lang/IllegalArgumentException
      //   22\01137\011117\011java/lang/ArithmeticException
      //   61\01176\011125\011java/lang/IllegalArgumentException
      //   61\01176\011133\011java/lang/ArithmeticException
    }

    public void writeTo(DataOutput paramDataOutput)
      throws IOException
    {
      DateTimeZoneBuilder.writeMillis(paramDataOutput, this.iStandardOffset);
      this.iStartRecurrence.writeTo(paramDataOutput);
      this.iEndRecurrence.writeTo(paramDataOutput);
    }
  }

  private static final class OfYear
  {
    final boolean iAdvance;
    final int iDayOfMonth;
    final int iDayOfWeek;
    final int iMillisOfDay;
    final char iMode;
    final int iMonthOfYear;

    OfYear(char paramChar, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, int paramInt4)
    {
      if ((paramChar != 'u') && (paramChar != 'w') && (paramChar != 's'))
        throw new IllegalArgumentException("Unknown mode: " + paramChar);
      this.iMode = paramChar;
      this.iMonthOfYear = paramInt1;
      this.iDayOfMonth = paramInt2;
      this.iDayOfWeek = paramInt3;
      this.iAdvance = paramBoolean;
      this.iMillisOfDay = paramInt4;
    }

    static OfYear readFrom(DataInput paramDataInput)
      throws IOException
    {
      return new OfYear((char)paramDataInput.readUnsignedByte(), paramDataInput.readUnsignedByte(), paramDataInput.readByte(), paramDataInput.readUnsignedByte(), paramDataInput.readBoolean(), (int)DateTimeZoneBuilder.readMillis(paramDataInput));
    }

    private long setDayOfMonth(Chronology paramChronology, long paramLong)
    {
      if (this.iDayOfMonth >= 0)
        return paramChronology.dayOfMonth().set(paramLong, this.iDayOfMonth);
      long l1 = paramChronology.dayOfMonth().set(paramLong, 1);
      long l2 = paramChronology.monthOfYear().add(l1, 1);
      return paramChronology.dayOfMonth().add(l2, this.iDayOfMonth);
    }

    private long setDayOfMonthNext(Chronology paramChronology, long paramLong)
    {
      try
      {
        long l = setDayOfMonth(paramChronology, paramLong);
        return l;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        if ((this.iMonthOfYear == 2) && (this.iDayOfMonth == 29))
        {
          while (!paramChronology.year().isLeap(paramLong))
            paramLong = paramChronology.year().add(paramLong, 1);
          return setDayOfMonth(paramChronology, paramLong);
        }
        throw localIllegalArgumentException;
      }
    }

    private long setDayOfMonthPrevious(Chronology paramChronology, long paramLong)
    {
      try
      {
        long l = setDayOfMonth(paramChronology, paramLong);
        return l;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        if ((this.iMonthOfYear == 2) && (this.iDayOfMonth == 29))
        {
          while (!paramChronology.year().isLeap(paramLong))
            paramLong = paramChronology.year().add(paramLong, -1);
          return setDayOfMonth(paramChronology, paramLong);
        }
        throw localIllegalArgumentException;
      }
    }

    private long setDayOfWeek(Chronology paramChronology, long paramLong)
    {
      int i = paramChronology.dayOfWeek().get(paramLong);
      int j = this.iDayOfWeek - i;
      if (j != 0)
      {
        if (!this.iAdvance)
          break label52;
        if (j < 0)
          j += 7;
      }
      while (true)
      {
        paramLong = paramChronology.dayOfWeek().add(paramLong, j);
        return paramLong;
        label52: if (j > 0)
          j -= 7;
      }
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      OfYear localOfYear;
      do
      {
        return true;
        if (!(paramObject instanceof OfYear))
          break;
        localOfYear = (OfYear)paramObject;
      }
      while ((this.iMode == localOfYear.iMode) && (this.iMonthOfYear == localOfYear.iMonthOfYear) && (this.iDayOfMonth == localOfYear.iDayOfMonth) && (this.iDayOfWeek == localOfYear.iDayOfWeek) && (this.iAdvance == localOfYear.iAdvance) && (this.iMillisOfDay == localOfYear.iMillisOfDay));
      return false;
      return false;
    }

    public long next(long paramLong, int paramInt1, int paramInt2)
    {
      long l1;
      ISOChronology localISOChronology;
      long l4;
      if (this.iMode == 'w')
      {
        paramInt1 += paramInt2;
        l1 = paramLong + paramInt1;
        localISOChronology = ISOChronology.getInstanceUTC();
        long l2 = localISOChronology.monthOfYear().set(l1, this.iMonthOfYear);
        long l3 = localISOChronology.millisOfDay().set(l2, 0);
        l4 = setDayOfMonthNext(localISOChronology, localISOChronology.millisOfDay().add(l3, this.iMillisOfDay));
        if (this.iDayOfWeek != 0)
          break label130;
        if (l4 <= l1)
          l4 = setDayOfMonthNext(localISOChronology, localISOChronology.year().add(l4, 1));
      }
      while (true)
      {
        return l4 - paramInt1;
        if (this.iMode == 's')
          break;
        paramInt1 = 0;
        break;
        label130: l4 = setDayOfWeek(localISOChronology, l4);
        if (l4 <= l1)
        {
          long l5 = localISOChronology.year().add(l4, 1);
          l4 = setDayOfWeek(localISOChronology, setDayOfMonthNext(localISOChronology, localISOChronology.monthOfYear().set(l5, this.iMonthOfYear)));
        }
      }
    }

    public long previous(long paramLong, int paramInt1, int paramInt2)
    {
      long l1;
      ISOChronology localISOChronology;
      long l4;
      if (this.iMode == 'w')
      {
        paramInt1 += paramInt2;
        l1 = paramLong + paramInt1;
        localISOChronology = ISOChronology.getInstanceUTC();
        long l2 = localISOChronology.monthOfYear().set(l1, this.iMonthOfYear);
        long l3 = localISOChronology.millisOfDay().set(l2, 0);
        l4 = setDayOfMonthPrevious(localISOChronology, localISOChronology.millisOfDay().add(l3, this.iMillisOfDay));
        if (this.iDayOfWeek != 0)
          break label130;
        if (l4 >= l1)
          l4 = setDayOfMonthPrevious(localISOChronology, localISOChronology.year().add(l4, -1));
      }
      while (true)
      {
        return l4 - paramInt1;
        if (this.iMode == 's')
          break;
        paramInt1 = 0;
        break;
        label130: l4 = setDayOfWeek(localISOChronology, l4);
        if (l4 >= l1)
        {
          long l5 = localISOChronology.year().add(l4, -1);
          l4 = setDayOfWeek(localISOChronology, setDayOfMonthPrevious(localISOChronology, localISOChronology.monthOfYear().set(l5, this.iMonthOfYear)));
        }
      }
    }

    public long setInstant(int paramInt1, int paramInt2, int paramInt3)
    {
      if (this.iMode == 'w')
        paramInt2 += paramInt3;
      while (true)
      {
        ISOChronology localISOChronology = ISOChronology.getInstanceUTC();
        long l1 = localISOChronology.year().set(0L, paramInt1);
        long l2 = localISOChronology.monthOfYear().set(l1, this.iMonthOfYear);
        long l3 = setDayOfMonth(localISOChronology, localISOChronology.millisOfDay().set(l2, this.iMillisOfDay));
        if (this.iDayOfWeek != 0)
          l3 = setDayOfWeek(localISOChronology, l3);
        return l3 - paramInt2;
        if (this.iMode != 's')
          paramInt2 = 0;
      }
    }

    public void writeTo(DataOutput paramDataOutput)
      throws IOException
    {
      paramDataOutput.writeByte(this.iMode);
      paramDataOutput.writeByte(this.iMonthOfYear);
      paramDataOutput.writeByte(this.iDayOfMonth);
      paramDataOutput.writeByte(this.iDayOfWeek);
      paramDataOutput.writeBoolean(this.iAdvance);
      DateTimeZoneBuilder.writeMillis(paramDataOutput, this.iMillisOfDay);
    }
  }

  private static final class PrecalculatedZone extends DateTimeZone
  {
    private static final long serialVersionUID = 7811976468055766265L;
    private final String[] iNameKeys;
    private final int[] iStandardOffsets;
    private final DateTimeZoneBuilder.DSTZone iTailZone;
    private final long[] iTransitions;
    private final int[] iWallOffsets;

    private PrecalculatedZone(String paramString, long[] paramArrayOfLong, int[] paramArrayOfInt1, int[] paramArrayOfInt2, String[] paramArrayOfString, DateTimeZoneBuilder.DSTZone paramDSTZone)
    {
      super();
      this.iTransitions = paramArrayOfLong;
      this.iWallOffsets = paramArrayOfInt1;
      this.iStandardOffsets = paramArrayOfInt2;
      this.iNameKeys = paramArrayOfString;
      this.iTailZone = paramDSTZone;
    }

    static PrecalculatedZone create(String paramString, boolean paramBoolean, ArrayList<DateTimeZoneBuilder.Transition> paramArrayList, DateTimeZoneBuilder.DSTZone paramDSTZone)
    {
      int i = paramArrayList.size();
      if (i == 0)
        throw new IllegalArgumentException();
      long[] arrayOfLong = new long[i];
      int[] arrayOfInt1 = new int[i];
      int[] arrayOfInt2 = new int[i];
      String[] arrayOfString1 = new String[i];
      Object localObject1 = null;
      int j = 0;
      while (j < i)
      {
        DateTimeZoneBuilder.Transition localTransition = (DateTimeZoneBuilder.Transition)paramArrayList.get(j);
        if (!localTransition.isTransitionFrom((DateTimeZoneBuilder.Transition)localObject1))
          throw new IllegalArgumentException(paramString);
        arrayOfLong[j] = localTransition.getMillis();
        arrayOfInt1[j] = localTransition.getWallOffset();
        arrayOfInt2[j] = localTransition.getStandardOffset();
        arrayOfString1[j] = localTransition.getNameKey();
        j++;
        localObject1 = localTransition;
      }
      String[] arrayOfString2 = new String[5];
      String[][] arrayOfString = new DateFormatSymbols(Locale.ENGLISH).getZoneStrings();
      int k = 0;
      Object localObject2 = arrayOfString2;
      Object localObject3;
      if (k < arrayOfString.length)
      {
        localObject3 = arrayOfString[k];
        if ((localObject3 == null) || (localObject3.length != 5) || (!paramString.equals(localObject3[0])))
          break label740;
      }
      while (true)
      {
        k++;
        localObject2 = localObject3;
        break;
        ISOChronology localISOChronology = ISOChronology.getInstanceUTC();
        int m = 0;
        if (m < -1 + arrayOfString1.length)
        {
          String str2 = arrayOfString1[m];
          String str3 = arrayOfString1[(m + 1)];
          long l1 = arrayOfInt1[m];
          long l2 = arrayOfInt1[(m + 1)];
          long l3 = arrayOfInt2[m];
          long l4 = arrayOfInt2[(m + 1)];
          Period localPeriod = new Period(arrayOfLong[m], arrayOfLong[(m + 1)], PeriodType.yearMonthDay(), localISOChronology);
          if ((l1 != l2) && (l3 == l4) && (str2.equals(str3)) && (localPeriod.getYears() == 0) && (localPeriod.getMonths() > 4) && (localPeriod.getMonths() < 8) && (str2.equals(localObject2[2])) && (str2.equals(localObject2[4])))
          {
            if (ZoneInfoCompiler.verbose())
            {
              System.out.println("Fixing duplicate name key - " + str3);
              System.out.println("     - " + new DateTime(arrayOfLong[m], localISOChronology) + " - " + new DateTime(arrayOfLong[(m + 1)], localISOChronology));
            }
            if (l1 <= l2)
              break label522;
            arrayOfString1[m] = (str2 + "-Summer").intern();
          }
          while (true)
          {
            m++;
            break;
            label522: if (l1 < l2)
            {
              arrayOfString1[(m + 1)] = (str3 + "-Summer").intern();
              m++;
            }
          }
        }
        DateTimeZoneBuilder.DSTZone localDSTZone;
        if ((paramDSTZone != null) && (paramDSTZone.iStartRecurrence.getNameKey().equals(paramDSTZone.iEndRecurrence.getNameKey())))
        {
          if (ZoneInfoCompiler.verbose())
            System.out.println("Fixing duplicate recurrent name key - " + paramDSTZone.iStartRecurrence.getNameKey());
          if (paramDSTZone.iStartRecurrence.getSaveMillis() > 0)
            localDSTZone = new DateTimeZoneBuilder.DSTZone(paramDSTZone.getID(), paramDSTZone.iStandardOffset, paramDSTZone.iStartRecurrence.renameAppend("-Summer"), paramDSTZone.iEndRecurrence);
        }
        while (true)
        {
          if (paramBoolean);
          for (String str1 = paramString; ; str1 = "")
          {
            return new PrecalculatedZone(str1, arrayOfLong, arrayOfInt1, arrayOfInt2, arrayOfString1, localDSTZone);
            localDSTZone = new DateTimeZoneBuilder.DSTZone(paramDSTZone.getID(), paramDSTZone.iStandardOffset, paramDSTZone.iStartRecurrence, paramDSTZone.iEndRecurrence.renameAppend("-Summer"));
            break;
          }
          localDSTZone = paramDSTZone;
        }
        label740: localObject3 = localObject2;
      }
    }

    static PrecalculatedZone readFrom(DataInput paramDataInput, String paramString)
      throws IOException
    {
      int i = paramDataInput.readUnsignedShort();
      String[] arrayOfString1 = new String[i];
      for (int j = 0; j < i; j++)
        arrayOfString1[j] = paramDataInput.readUTF();
      int k = paramDataInput.readInt();
      long[] arrayOfLong = new long[k];
      int[] arrayOfInt1 = new int[k];
      int[] arrayOfInt2 = new int[k];
      String[] arrayOfString2 = new String[k];
      int m = 0;
      while (m < k)
      {
        arrayOfLong[m] = DateTimeZoneBuilder.readMillis(paramDataInput);
        arrayOfInt1[m] = ((int)DateTimeZoneBuilder.readMillis(paramDataInput));
        arrayOfInt2[m] = ((int)DateTimeZoneBuilder.readMillis(paramDataInput));
        if (i < 256);
        try
        {
          int n;
          for (int i1 = paramDataInput.readUnsignedByte(); ; i1 = n)
          {
            arrayOfString2[m] = arrayOfString1[i1];
            m++;
            break;
            n = paramDataInput.readUnsignedShort();
          }
        }
        catch (ArrayIndexOutOfBoundsException localArrayIndexOutOfBoundsException)
        {
          throw new IOException("Invalid encoding");
        }
      }
      boolean bool = paramDataInput.readBoolean();
      DateTimeZoneBuilder.DSTZone localDSTZone = null;
      if (bool)
        localDSTZone = DateTimeZoneBuilder.DSTZone.readFrom(paramDataInput, paramString);
      return new PrecalculatedZone(paramString, arrayOfLong, arrayOfInt1, arrayOfInt2, arrayOfString2, localDSTZone);
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      PrecalculatedZone localPrecalculatedZone;
      do
      {
        return true;
        if (!(paramObject instanceof PrecalculatedZone))
          break label121;
        localPrecalculatedZone = (PrecalculatedZone)paramObject;
        if ((!getID().equals(localPrecalculatedZone.getID())) || (!Arrays.equals(this.iTransitions, localPrecalculatedZone.iTransitions)) || (!Arrays.equals(this.iNameKeys, localPrecalculatedZone.iNameKeys)) || (!Arrays.equals(this.iWallOffsets, localPrecalculatedZone.iWallOffsets)) || (!Arrays.equals(this.iStandardOffsets, localPrecalculatedZone.iStandardOffsets)))
          break;
        if (this.iTailZone != null)
          break label105;
      }
      while (localPrecalculatedZone.iTailZone == null);
      label105: 
      while (!this.iTailZone.equals(localPrecalculatedZone.iTailZone))
        return false;
      return true;
      label121: return false;
    }

    public String getNameKey(long paramLong)
    {
      long[] arrayOfLong = this.iTransitions;
      int i = Arrays.binarySearch(arrayOfLong, paramLong);
      if (i >= 0)
        return this.iNameKeys[i];
      int j = i ^ 0xFFFFFFFF;
      if (j < arrayOfLong.length)
      {
        if (j > 0)
          return this.iNameKeys[(j - 1)];
        return "UTC";
      }
      if (this.iTailZone == null)
        return this.iNameKeys[(j - 1)];
      return this.iTailZone.getNameKey(paramLong);
    }

    public int getOffset(long paramLong)
    {
      long[] arrayOfLong = this.iTransitions;
      int i = Arrays.binarySearch(arrayOfLong, paramLong);
      if (i >= 0)
        return this.iWallOffsets[i];
      int j = i ^ 0xFFFFFFFF;
      if (j < arrayOfLong.length)
      {
        if (j > 0)
          return this.iWallOffsets[(j - 1)];
        return 0;
      }
      if (this.iTailZone == null)
        return this.iWallOffsets[(j - 1)];
      return this.iTailZone.getOffset(paramLong);
    }

    public int getStandardOffset(long paramLong)
    {
      long[] arrayOfLong = this.iTransitions;
      int i = Arrays.binarySearch(arrayOfLong, paramLong);
      if (i >= 0)
        return this.iStandardOffsets[i];
      int j = i ^ 0xFFFFFFFF;
      if (j < arrayOfLong.length)
      {
        if (j > 0)
          return this.iStandardOffsets[(j - 1)];
        return 0;
      }
      if (this.iTailZone == null)
        return this.iStandardOffsets[(j - 1)];
      return this.iTailZone.getStandardOffset(paramLong);
    }

    public boolean isCachable()
    {
      if (this.iTailZone != null);
      double d;
      int j;
      do
      {
        return true;
        long[] arrayOfLong = this.iTransitions;
        if (arrayOfLong.length <= 1)
          return false;
        d = 0.0D;
        int i = 1;
        j = 0;
        while (i < arrayOfLong.length)
        {
          long l = arrayOfLong[i] - arrayOfLong[(i - 1)];
          if (l < 63158400000L)
          {
            d += l;
            j++;
          }
          i++;
        }
      }
      while ((j > 0) && (d / j / 86400000.0D >= 25.0D));
      return false;
    }

    public boolean isFixed()
    {
      return false;
    }

    public long nextTransition(long paramLong)
    {
      long[] arrayOfLong = this.iTransitions;
      int i = Arrays.binarySearch(arrayOfLong, paramLong);
      int j;
      if (i >= 0)
      {
        j = i + 1;
        if (j >= arrayOfLong.length)
          break label46;
        paramLong = arrayOfLong[j];
      }
      label46: 
      while (this.iTailZone == null)
      {
        return paramLong;
        j = i ^ 0xFFFFFFFF;
        break;
      }
      long l = arrayOfLong[(-1 + arrayOfLong.length)];
      if (paramLong < l)
        paramLong = l;
      return this.iTailZone.nextTransition(paramLong);
    }

    public long previousTransition(long paramLong)
    {
      long[] arrayOfLong = this.iTransitions;
      int i = Arrays.binarySearch(arrayOfLong, paramLong);
      if (i >= 0)
        if (paramLong > -9223372036854775808L)
          paramLong -= 1L;
      long l1;
      do
      {
        int j;
        long l3;
        do
        {
          do
          {
            return paramLong;
            j = i ^ 0xFFFFFFFF;
            if (j >= arrayOfLong.length)
              break;
          }
          while (j <= 0);
          l3 = arrayOfLong[(j - 1)];
        }
        while (l3 <= -9223372036854775808L);
        return l3 - 1L;
        if (this.iTailZone != null)
        {
          long l2 = this.iTailZone.previousTransition(paramLong);
          if (l2 < paramLong)
            return l2;
        }
        l1 = arrayOfLong[(j - 1)];
      }
      while (l1 <= -9223372036854775808L);
      return l1 - 1L;
    }

    public void writeTo(DataOutput paramDataOutput)
      throws IOException
    {
      int i = this.iTransitions.length;
      HashSet localHashSet = new HashSet();
      for (int j = 0; j < i; j++)
        localHashSet.add(this.iNameKeys[j]);
      int k = localHashSet.size();
      if (k > 65535)
        throw new UnsupportedOperationException("String pool is too large");
      String[] arrayOfString = new String[k];
      Iterator localIterator = localHashSet.iterator();
      for (int m = 0; localIterator.hasNext(); m++)
        arrayOfString[m] = ((String)localIterator.next());
      paramDataOutput.writeShort(k);
      for (int n = 0; n < k; n++)
        paramDataOutput.writeUTF(arrayOfString[n]);
      paramDataOutput.writeInt(i);
      int i1 = 0;
      if (i1 < i)
      {
        DateTimeZoneBuilder.writeMillis(paramDataOutput, this.iTransitions[i1]);
        DateTimeZoneBuilder.writeMillis(paramDataOutput, this.iWallOffsets[i1]);
        DateTimeZoneBuilder.writeMillis(paramDataOutput, this.iStandardOffsets[i1]);
        String str = this.iNameKeys[i1];
        for (int i2 = 0; ; i2++)
        {
          if (i2 < k)
          {
            if (!arrayOfString[i2].equals(str))
              continue;
            if (k >= 256)
              break label259;
            paramDataOutput.writeByte(i2);
          }
          while (true)
          {
            i1++;
            break;
            label259: paramDataOutput.writeShort(i2);
          }
        }
      }
      DateTimeZoneBuilder.DSTZone localDSTZone = this.iTailZone;
      boolean bool = false;
      if (localDSTZone != null)
        bool = true;
      paramDataOutput.writeBoolean(bool);
      if (this.iTailZone != null)
        this.iTailZone.writeTo(paramDataOutput);
    }
  }

  private static final class Recurrence
  {
    final String iNameKey;
    final DateTimeZoneBuilder.OfYear iOfYear;
    final int iSaveMillis;

    Recurrence(DateTimeZoneBuilder.OfYear paramOfYear, String paramString, int paramInt)
    {
      this.iOfYear = paramOfYear;
      this.iNameKey = paramString;
      this.iSaveMillis = paramInt;
    }

    static Recurrence readFrom(DataInput paramDataInput)
      throws IOException
    {
      return new Recurrence(DateTimeZoneBuilder.OfYear.readFrom(paramDataInput), paramDataInput.readUTF(), (int)DateTimeZoneBuilder.readMillis(paramDataInput));
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      Recurrence localRecurrence;
      do
      {
        return true;
        if (!(paramObject instanceof Recurrence))
          break;
        localRecurrence = (Recurrence)paramObject;
      }
      while ((this.iSaveMillis == localRecurrence.iSaveMillis) && (this.iNameKey.equals(localRecurrence.iNameKey)) && (this.iOfYear.equals(localRecurrence.iOfYear)));
      return false;
      return false;
    }

    public String getNameKey()
    {
      return this.iNameKey;
    }

    public DateTimeZoneBuilder.OfYear getOfYear()
    {
      return this.iOfYear;
    }

    public int getSaveMillis()
    {
      return this.iSaveMillis;
    }

    public long next(long paramLong, int paramInt1, int paramInt2)
    {
      return this.iOfYear.next(paramLong, paramInt1, paramInt2);
    }

    public long previous(long paramLong, int paramInt1, int paramInt2)
    {
      return this.iOfYear.previous(paramLong, paramInt1, paramInt2);
    }

    Recurrence rename(String paramString)
    {
      return new Recurrence(this.iOfYear, paramString, this.iSaveMillis);
    }

    Recurrence renameAppend(String paramString)
    {
      return rename((this.iNameKey + paramString).intern());
    }

    public void writeTo(DataOutput paramDataOutput)
      throws IOException
    {
      this.iOfYear.writeTo(paramDataOutput);
      paramDataOutput.writeUTF(this.iNameKey);
      DateTimeZoneBuilder.writeMillis(paramDataOutput, this.iSaveMillis);
    }
  }

  private static final class Rule
  {
    final int iFromYear;
    final DateTimeZoneBuilder.Recurrence iRecurrence;
    final int iToYear;

    Rule(DateTimeZoneBuilder.Recurrence paramRecurrence, int paramInt1, int paramInt2)
    {
      this.iRecurrence = paramRecurrence;
      this.iFromYear = paramInt1;
      this.iToYear = paramInt2;
    }

    public int getFromYear()
    {
      return this.iFromYear;
    }

    public String getNameKey()
    {
      return this.iRecurrence.getNameKey();
    }

    public DateTimeZoneBuilder.OfYear getOfYear()
    {
      return this.iRecurrence.getOfYear();
    }

    public int getSaveMillis()
    {
      return this.iRecurrence.getSaveMillis();
    }

    public int getToYear()
    {
      return this.iToYear;
    }

    public long next(long paramLong, int paramInt1, int paramInt2)
    {
      ISOChronology localISOChronology = ISOChronology.getInstanceUTC();
      int i = paramInt1 + paramInt2;
      int j;
      if (paramLong == -9223372036854775808L)
      {
        j = -2147483648;
        if (j >= this.iFromYear)
          break label118;
      }
      label118: for (long l1 = localISOChronology.year().set(0L, this.iFromYear) - i - 1L; ; l1 = paramLong)
      {
        long l2 = this.iRecurrence.next(l1, paramInt1, paramInt2);
        if ((l2 > paramLong) && (localISOChronology.year().get(l2 + i) > this.iToYear))
        {
          return paramLong;
          j = localISOChronology.year().get(paramLong + i);
          break;
        }
        return l2;
      }
    }
  }

  private static final class RuleSet
  {
    private static final int YEAR_LIMIT = 100 + ISOChronology.getInstanceUTC().year().get(l);
    private String iInitialNameKey;
    private int iInitialSaveMillis;
    private ArrayList<DateTimeZoneBuilder.Rule> iRules;
    private int iStandardOffset;
    private DateTimeZoneBuilder.OfYear iUpperOfYear;
    private int iUpperYear;

    static
    {
      long l = DateTimeUtils.currentTimeMillis();
    }

    RuleSet()
    {
      this.iRules = new ArrayList(10);
      this.iUpperYear = 2147483647;
    }

    RuleSet(RuleSet paramRuleSet)
    {
      this.iStandardOffset = paramRuleSet.iStandardOffset;
      this.iRules = new ArrayList(paramRuleSet.iRules);
      this.iInitialNameKey = paramRuleSet.iInitialNameKey;
      this.iInitialSaveMillis = paramRuleSet.iInitialSaveMillis;
      this.iUpperYear = paramRuleSet.iUpperYear;
      this.iUpperOfYear = paramRuleSet.iUpperOfYear;
    }

    public void addRule(DateTimeZoneBuilder.Rule paramRule)
    {
      if (!this.iRules.contains(paramRule))
        this.iRules.add(paramRule);
    }

    public DateTimeZoneBuilder.DSTZone buildTailZone(String paramString)
    {
      if (this.iRules.size() == 2)
      {
        DateTimeZoneBuilder.Rule localRule1 = (DateTimeZoneBuilder.Rule)this.iRules.get(0);
        DateTimeZoneBuilder.Rule localRule2 = (DateTimeZoneBuilder.Rule)this.iRules.get(1);
        if ((localRule1.getToYear() == 2147483647) && (localRule2.getToYear() == 2147483647))
          return new DateTimeZoneBuilder.DSTZone(paramString, this.iStandardOffset, localRule1.iRecurrence, localRule2.iRecurrence);
      }
      return null;
    }

    public DateTimeZoneBuilder.Transition firstTransition(long paramLong)
    {
      if (this.iInitialNameKey != null)
        return new DateTimeZoneBuilder.Transition(paramLong, this.iInitialNameKey, this.iStandardOffset + this.iInitialSaveMillis, this.iStandardOffset);
      ArrayList localArrayList = new ArrayList(this.iRules);
      long l = -9223372036854775808L;
      int i = 0;
      label105: DateTimeZoneBuilder.Transition localTransition2;
      for (Object localObject = null; ; localObject = localTransition2)
      {
        DateTimeZoneBuilder.Transition localTransition1 = nextTransition(l, i);
        if (localTransition1 != null)
        {
          l = localTransition1.getMillis();
          if (l != paramLong)
            break label105;
          localObject = new DateTimeZoneBuilder.Transition(paramLong, localTransition1);
        }
        while (true)
        {
          this.iRules = localArrayList;
          return localObject;
          if (l <= paramLong)
            break;
          if (localObject == null)
          {
            Iterator localIterator = localArrayList.iterator();
            while (localIterator.hasNext())
            {
              DateTimeZoneBuilder.Rule localRule = (DateTimeZoneBuilder.Rule)localIterator.next();
              if (localRule.getSaveMillis() == 0)
                localObject = new DateTimeZoneBuilder.Transition(paramLong, localRule, this.iStandardOffset);
            }
          }
          if (localObject == null)
            localObject = new DateTimeZoneBuilder.Transition(paramLong, localTransition1.getNameKey(), this.iStandardOffset, this.iStandardOffset);
        }
        localTransition2 = new DateTimeZoneBuilder.Transition(paramLong, localTransition1);
        i = localTransition1.getSaveMillis();
      }
    }

    public int getStandardOffset()
    {
      return this.iStandardOffset;
    }

    public long getUpperLimit(int paramInt)
    {
      if (this.iUpperYear == 2147483647)
        return 9223372036854775807L;
      return this.iUpperOfYear.setInstant(this.iUpperYear, this.iStandardOffset, paramInt);
    }

    public DateTimeZoneBuilder.Transition nextTransition(long paramLong, int paramInt)
    {
      ISOChronology localISOChronology = ISOChronology.getInstanceUTC();
      long l1 = 9223372036854775807L;
      Iterator localIterator = this.iRules.iterator();
      Object localObject1 = null;
      long l2;
      Object localObject2;
      while (localIterator.hasNext())
      {
        DateTimeZoneBuilder.Rule localRule = (DateTimeZoneBuilder.Rule)localIterator.next();
        l2 = localRule.next(paramLong, this.iStandardOffset, paramInt);
        if (l2 <= paramLong)
        {
          localIterator.remove();
        }
        else
        {
          if (l2 > l1)
            break label171;
          localObject2 = localRule;
        }
      }
      for (long l3 = l2; ; l3 = l1)
      {
        l1 = l3;
        localObject1 = localObject2;
        break;
        if (localObject1 == null);
        while ((localISOChronology.year().get(l1) >= YEAR_LIMIT) || ((this.iUpperYear < 2147483647) && (l1 >= this.iUpperOfYear.setInstant(this.iUpperYear, this.iStandardOffset, paramInt))))
          return null;
        return new DateTimeZoneBuilder.Transition(l1, localObject1, this.iStandardOffset);
        label171: localObject2 = localObject1;
      }
    }

    public void setFixedSavings(String paramString, int paramInt)
    {
      this.iInitialNameKey = paramString;
      this.iInitialSaveMillis = paramInt;
    }

    public void setStandardOffset(int paramInt)
    {
      this.iStandardOffset = paramInt;
    }

    public void setUpperLimit(int paramInt, DateTimeZoneBuilder.OfYear paramOfYear)
    {
      this.iUpperYear = paramInt;
      this.iUpperOfYear = paramOfYear;
    }
  }

  private static final class Transition
  {
    private final long iMillis;
    private final String iNameKey;
    private final int iStandardOffset;
    private final int iWallOffset;

    Transition(long paramLong, String paramString, int paramInt1, int paramInt2)
    {
      this.iMillis = paramLong;
      this.iNameKey = paramString;
      this.iWallOffset = paramInt1;
      this.iStandardOffset = paramInt2;
    }

    Transition(long paramLong, DateTimeZoneBuilder.Rule paramRule, int paramInt)
    {
      this.iMillis = paramLong;
      this.iNameKey = paramRule.getNameKey();
      this.iWallOffset = (paramInt + paramRule.getSaveMillis());
      this.iStandardOffset = paramInt;
    }

    Transition(long paramLong, Transition paramTransition)
    {
      this.iMillis = paramLong;
      this.iNameKey = paramTransition.iNameKey;
      this.iWallOffset = paramTransition.iWallOffset;
      this.iStandardOffset = paramTransition.iStandardOffset;
    }

    public long getMillis()
    {
      return this.iMillis;
    }

    public String getNameKey()
    {
      return this.iNameKey;
    }

    public int getSaveMillis()
    {
      return this.iWallOffset - this.iStandardOffset;
    }

    public int getStandardOffset()
    {
      return this.iStandardOffset;
    }

    public int getWallOffset()
    {
      return this.iWallOffset;
    }

    public boolean isTransitionFrom(Transition paramTransition)
    {
      if (paramTransition == null);
      while ((this.iMillis > paramTransition.iMillis) && ((this.iWallOffset != paramTransition.iWallOffset) || (!this.iNameKey.equals(paramTransition.iNameKey))))
        return true;
      return false;
    }
  }
}