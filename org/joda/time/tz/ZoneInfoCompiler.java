package org.joda.time.tz;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.TreeMap;
import org.joda.time.Chronology;
import org.joda.time.DateTime;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeZone;
import org.joda.time.LocalDate;
import org.joda.time.MutableDateTime;
import org.joda.time.chrono.ISOChronology;
import org.joda.time.chrono.LenientChronology;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

public class ZoneInfoCompiler
{
  static Chronology cLenientISO;
  static DateTimeOfYear cStartOfYear;
  static ThreadLocal<Boolean> cVerbose = new ThreadLocal()
  {
    protected Boolean initialValue()
    {
      return Boolean.FALSE;
    }
  };
  private List<String> iLinks = new ArrayList();
  private Map<String, RuleSet> iRuleSets = new HashMap();
  private List<Zone> iZones = new ArrayList();

  static Chronology getLenientISOChronology()
  {
    if (cLenientISO == null)
      cLenientISO = LenientChronology.getInstance(ISOChronology.getInstanceUTC());
    return cLenientISO;
  }

  static DateTimeOfYear getStartOfYear()
  {
    if (cStartOfYear == null)
      cStartOfYear = new DateTimeOfYear();
    return cStartOfYear;
  }

  public static void main(String[] paramArrayOfString)
    throws Exception
  {
    File localFile1 = null;
    int i = 0;
    if (paramArrayOfString.length == 0)
    {
      printUsage();
      return;
    }
    int j = 0;
    boolean bool = false;
    File localFile2 = null;
    while (true)
    {
      if (j < paramArrayOfString.length)
      {
        try
        {
          if ("-src".equals(paramArrayOfString[j]))
          {
            j++;
            localFile2 = new File(paramArrayOfString[j]);
          }
          else if ("-dst".equals(paramArrayOfString[j]))
          {
            j++;
            localFile1 = new File(paramArrayOfString[j]);
          }
        }
        catch (IndexOutOfBoundsException localIndexOutOfBoundsException)
        {
          printUsage();
          return;
        }
        if ("-verbose".equals(paramArrayOfString[j]))
        {
          bool = true;
          break label222;
        }
        if ("-?".equals(paramArrayOfString[j]))
        {
          printUsage();
          return;
        }
      }
      if (j >= paramArrayOfString.length)
      {
        printUsage();
        return;
      }
      File[] arrayOfFile = new File[paramArrayOfString.length - j];
      if (j < paramArrayOfString.length)
      {
        if (localFile2 == null);
        for (File localFile3 = new File(paramArrayOfString[j]); ; localFile3 = new File(localFile2, paramArrayOfString[j]))
        {
          arrayOfFile[i] = localFile3;
          j++;
          i++;
          break;
        }
      }
      cVerbose.set(Boolean.valueOf(bool));
      new ZoneInfoCompiler().compile(localFile1, arrayOfFile);
      return;
      label222: j++;
    }
  }

  static int parseDayOfWeek(String paramString)
  {
    DateTimeField localDateTimeField = ISOChronology.getInstanceUTC().dayOfWeek();
    return localDateTimeField.get(localDateTimeField.set(0L, paramString, Locale.ENGLISH));
  }

  static int parseMonth(String paramString)
  {
    DateTimeField localDateTimeField = ISOChronology.getInstanceUTC().monthOfYear();
    return localDateTimeField.get(localDateTimeField.set(0L, paramString, Locale.ENGLISH));
  }

  static String parseOptional(String paramString)
  {
    if (paramString.equals("-"))
      paramString = null;
    return paramString;
  }

  static int parseTime(String paramString)
  {
    DateTimeFormatter localDateTimeFormatter = ISODateTimeFormat.hourMinuteSecondFraction();
    MutableDateTime localMutableDateTime = new MutableDateTime(0L, getLenientISOChronology());
    boolean bool = paramString.startsWith("-");
    int i = 0;
    if (bool)
      i = 1;
    if (localDateTimeFormatter.parseInto(localMutableDateTime, paramString, i) == (i ^ 0xFFFFFFFF))
      throw new IllegalArgumentException(paramString);
    int j = (int)localMutableDateTime.getMillis();
    if (i == 1)
      return -j;
    return j;
  }

  static int parseYear(String paramString, int paramInt)
  {
    String str = paramString.toLowerCase();
    if ((str.equals("minimum")) || (str.equals("min")))
      paramInt = -2147483648;
    do
    {
      return paramInt;
      if ((str.equals("maximum")) || (str.equals("max")))
        return 2147483647;
    }
    while (str.equals("only"));
    return Integer.parseInt(str);
  }

  static char parseZoneChar(char paramChar)
  {
    switch (paramChar)
    {
    default:
      return 'w';
    case 'S':
    case 's':
      return 's';
    case 'G':
    case 'U':
    case 'Z':
    case 'g':
    case 'u':
    case 'z':
    }
    return 'u';
  }

  private static void printUsage()
  {
    System.out.println("Usage: java org.joda.time.tz.ZoneInfoCompiler <options> <source files>");
    System.out.println("where possible options include:");
    System.out.println("  -src <directory>    Specify where to read source files");
    System.out.println("  -dst <directory>    Specify where to write generated files");
    System.out.println("  -verbose            Output verbosely (default false)");
  }

  static boolean test(String paramString, DateTimeZone paramDateTimeZone)
  {
    if (!paramString.equals(paramDateTimeZone.getID()))
      return true;
    long l1 = ISOChronology.getInstanceUTC().year().set(0L, 1850);
    long l2 = ISOChronology.getInstanceUTC().year().set(0L, 2050);
    int i = paramDateTimeZone.getOffset(l1);
    Object localObject = paramDateTimeZone.getNameKey(l1);
    ArrayList localArrayList = new ArrayList();
    long l3 = l1;
    int j = i;
    long l4 = paramDateTimeZone.nextTransition(l3);
    long l5;
    long l6;
    int k;
    if ((l4 == l3) || (l4 > l2))
    {
      l5 = ISOChronology.getInstanceUTC().year().set(0L, 2050);
      l6 = ISOChronology.getInstanceUTC().year().set(0L, 1850);
      k = localArrayList.size();
    }
    while (true)
    {
      int m = k - 1;
      long l7;
      if (m >= 0)
      {
        l7 = paramDateTimeZone.previousTransition(l5);
        if ((l7 != l5) && (l7 >= l6));
      }
      else
      {
        return true;
        int n = paramDateTimeZone.getOffset(l4);
        String str = paramDateTimeZone.getNameKey(l4);
        if ((j == n) && (((String)localObject).equals(str)))
        {
          System.out.println("*d* Error in " + paramDateTimeZone.getID() + " " + new DateTime(l4, ISOChronology.getInstanceUTC()));
          return false;
        }
        if ((str == null) || ((str.length() < 3) && (!"??".equals(str))))
        {
          System.out.println("*s* Error in " + paramDateTimeZone.getID() + " " + new DateTime(l4, ISOChronology.getInstanceUTC()) + ", nameKey=" + str);
          return false;
        }
        localArrayList.add(Long.valueOf(l4));
        localObject = str;
        j = n;
        l3 = l4;
        break;
      }
      long l8 = ((Long)localArrayList.get(m)).longValue();
      if (l8 - 1L != l7)
      {
        System.out.println("*r* Error in " + paramDateTimeZone.getID() + " " + new DateTime(l7, ISOChronology.getInstanceUTC()) + " != " + new DateTime(l8 - 1L, ISOChronology.getInstanceUTC()));
        return false;
      }
      k = m;
      l5 = l7;
    }
  }

  public static boolean verbose()
  {
    return ((Boolean)cVerbose.get()).booleanValue();
  }

  static void writeZoneInfoMap(DataOutputStream paramDataOutputStream, Map<String, DateTimeZone> paramMap)
    throws IOException
  {
    HashMap localHashMap = new HashMap(paramMap.size());
    TreeMap localTreeMap = new TreeMap();
    Iterator localIterator1 = paramMap.entrySet().iterator();
    short s2;
    for (short s1 = 0; localIterator1.hasNext(); s1 = s2)
    {
      Map.Entry localEntry2 = (Map.Entry)localIterator1.next();
      String str1 = (String)localEntry2.getKey();
      if (!localHashMap.containsKey(str1))
      {
        Short localShort2 = Short.valueOf(s1);
        localHashMap.put(str1, localShort2);
        localTreeMap.put(localShort2, str1);
        s1 = (short)(s1 + 1);
        if (s1 == 0)
          throw new InternalError("Too many time zone ids");
      }
      String str2 = ((DateTimeZone)localEntry2.getValue()).getID();
      if (!localHashMap.containsKey(str2))
      {
        Short localShort1 = Short.valueOf(s1);
        localHashMap.put(str2, localShort1);
        localTreeMap.put(localShort1, str2);
        s2 = (short)(s1 + 1);
        if (s2 == 0)
          throw new InternalError("Too many time zone ids");
      }
      else
      {
        s2 = s1;
      }
    }
    paramDataOutputStream.writeShort(localTreeMap.size());
    Iterator localIterator2 = localTreeMap.values().iterator();
    while (localIterator2.hasNext())
      paramDataOutputStream.writeUTF((String)localIterator2.next());
    paramDataOutputStream.writeShort(paramMap.size());
    Iterator localIterator3 = paramMap.entrySet().iterator();
    while (localIterator3.hasNext())
    {
      Map.Entry localEntry1 = (Map.Entry)localIterator3.next();
      paramDataOutputStream.writeShort(((Short)localHashMap.get((String)localEntry1.getKey())).shortValue());
      paramDataOutputStream.writeShort(((Short)localHashMap.get(((DateTimeZone)localEntry1.getValue()).getID())).shortValue());
    }
  }

  public Map<String, DateTimeZone> compile(File paramFile, File[] paramArrayOfFile)
    throws IOException
  {
    if (paramArrayOfFile != null)
      for (int m = 0; m < paramArrayOfFile.length; m++)
      {
        BufferedReader localBufferedReader = new BufferedReader(new FileReader(paramArrayOfFile[m]));
        parseDataFile(localBufferedReader);
        localBufferedReader.close();
      }
    if (paramFile != null)
    {
      if ((!paramFile.exists()) && (!paramFile.mkdirs()))
        throw new IOException("Destination directory doesn't exist and cannot be created: " + paramFile);
      if (!paramFile.isDirectory())
        throw new IOException("Destination is not a directory: " + paramFile);
    }
    TreeMap localTreeMap1 = new TreeMap();
    System.out.println("Writing zoneinfo files");
    int i = 0;
    int j;
    while (true)
    {
      Zone localZone;
      DateTimeZoneBuilder localDateTimeZoneBuilder;
      DateTimeZone localDateTimeZone2;
      File localFile2;
      FileOutputStream localFileOutputStream;
      if (i < this.iZones.size())
      {
        localZone = (Zone)this.iZones.get(i);
        localDateTimeZoneBuilder = new DateTimeZoneBuilder();
        localZone.addToBuilder(localDateTimeZoneBuilder, this.iRuleSets);
        localDateTimeZone2 = localDateTimeZoneBuilder.toDateTimeZone(localZone.iName, true);
        if (test(localDateTimeZone2.getID(), localDateTimeZone2))
        {
          localTreeMap1.put(localDateTimeZone2.getID(), localDateTimeZone2);
          if (paramFile != null)
          {
            if (verbose())
              System.out.println("Writing " + localDateTimeZone2.getID());
            localFile2 = new File(paramFile, localDateTimeZone2.getID());
            if (!localFile2.getParentFile().exists())
              localFile2.getParentFile().mkdirs();
            localFileOutputStream = new FileOutputStream(localFile2);
          }
        }
      }
      try
      {
        localDateTimeZoneBuilder.writeTo(localZone.iName, localFileOutputStream);
        localFileOutputStream.close();
        FileInputStream localFileInputStream = new FileInputStream(localFile2);
        DateTimeZone localDateTimeZone3 = DateTimeZoneBuilder.readFrom(localFileInputStream, localDateTimeZone2.getID());
        localFileInputStream.close();
        if (!localDateTimeZone2.equals(localDateTimeZone3))
          System.out.println("*e* Error in " + localDateTimeZone2.getID() + ": Didn't read properly from file");
        i++;
      }
      finally
      {
        localFileOutputStream.close();
      }
    }
    while (j < 2)
    {
      int k = 0;
      if (k < this.iLinks.size())
      {
        String str1 = (String)this.iLinks.get(k);
        String str2 = (String)this.iLinks.get(k + 1);
        DateTimeZone localDateTimeZone1 = (DateTimeZone)localTreeMap1.get(str1);
        if (localDateTimeZone1 == null)
          if (j > 0)
            System.out.println("Cannot find time zone '" + str1 + "' to link alias '" + str2 + "' to");
        while (true)
        {
          k += 2;
          break;
          localTreeMap1.put(str2, localDateTimeZone1);
        }
      }
      j++;
    }
    DataOutputStream localDataOutputStream;
    if (paramFile != null)
    {
      System.out.println("Writing ZoneInfoMap");
      File localFile1 = new File(paramFile, "ZoneInfoMap");
      if (!localFile1.getParentFile().exists())
        localFile1.getParentFile().mkdirs();
      localDataOutputStream = new DataOutputStream(new FileOutputStream(localFile1));
    }
    try
    {
      TreeMap localTreeMap2 = new TreeMap(String.CASE_INSENSITIVE_ORDER);
      localTreeMap2.putAll(localTreeMap1);
      writeZoneInfoMap(localDataOutputStream, localTreeMap2);
      return localTreeMap1;
    }
    finally
    {
      localDataOutputStream.close();
    }
  }

  public void parseDataFile(BufferedReader paramBufferedReader)
    throws IOException
  {
    Object localObject = null;
    while (true)
    {
      String str1 = paramBufferedReader.readLine();
      if (str1 == null)
        break;
      String str2 = str1.trim();
      if ((str2.length() != 0) && (str2.charAt(0) != '#'))
      {
        int i = str1.indexOf('#');
        if (i >= 0)
          str1 = str1.substring(0, i);
        StringTokenizer localStringTokenizer = new StringTokenizer(str1, " \t");
        if ((Character.isWhitespace(str1.charAt(0))) && (localStringTokenizer.hasMoreTokens()))
        {
          if (localObject != null)
            ((Zone)localObject).chain(localStringTokenizer);
        }
        else
        {
          if (localObject != null)
            this.iZones.add(localObject);
          if (localStringTokenizer.hasMoreTokens())
          {
            String str3 = localStringTokenizer.nextToken();
            if (str3.equalsIgnoreCase("Rule"))
            {
              Rule localRule = new Rule(localStringTokenizer);
              RuleSet localRuleSet1 = (RuleSet)this.iRuleSets.get(localRule.iName);
              if (localRuleSet1 == null)
              {
                RuleSet localRuleSet2 = new RuleSet(localRule);
                this.iRuleSets.put(localRule.iName, localRuleSet2);
              }
              while (true)
              {
                localObject = null;
                break;
                localRuleSet1.addRule(localRule);
              }
            }
            if (str3.equalsIgnoreCase("Zone"))
            {
              localObject = new Zone(localStringTokenizer);
            }
            else if (str3.equalsIgnoreCase("Link"))
            {
              this.iLinks.add(localStringTokenizer.nextToken());
              this.iLinks.add(localStringTokenizer.nextToken());
              localObject = null;
            }
            else
            {
              System.out.println("Unknown line: " + str1);
            }
          }
          else
          {
            localObject = null;
          }
        }
      }
    }
    if (localObject != null)
      this.iZones.add(localObject);
  }

  static class DateTimeOfYear
  {
    public final boolean iAdvanceDayOfWeek;
    public final int iDayOfMonth;
    public final int iDayOfWeek;
    public final int iMillisOfDay;
    public final int iMonthOfYear;
    public final char iZoneChar;

    DateTimeOfYear()
    {
      this.iMonthOfYear = 1;
      this.iDayOfMonth = 1;
      this.iDayOfWeek = 0;
      this.iAdvanceDayOfWeek = false;
      this.iMillisOfDay = 0;
      this.iZoneChar = 'w';
    }

    DateTimeOfYear(StringTokenizer paramStringTokenizer)
    {
      int i1;
      String str1;
      int n;
      int j;
      boolean bool2;
      String str2;
      char c2;
      int m;
      int k;
      boolean bool1;
      char c1;
      if (paramStringTokenizer.hasMoreTokens())
      {
        i1 = ZoneInfoCompiler.parseMonth(paramStringTokenizer.nextToken());
        if (paramStringTokenizer.hasMoreTokens())
        {
          str1 = paramStringTokenizer.nextToken();
          if (str1.startsWith("last"))
          {
            n = ZoneInfoCompiler.parseDayOfWeek(str1.substring(4));
            j = -1;
            bool2 = false;
            if (!paramStringTokenizer.hasMoreTokens())
              break label445;
            str2 = paramStringTokenizer.nextToken();
            c2 = ZoneInfoCompiler.parseZoneChar(str2.charAt(-1 + str2.length()));
            if (!str2.equals("24:00"))
              break label424;
            if ((i1 != 12) || (j != 31))
              break label312;
            m = ZoneInfoCompiler.parseTime("23:59:59.999");
            k = i1;
            bool1 = bool2;
            c1 = c2;
          }
        }
      }
      while (true)
      {
        while (true)
        {
          this.iMonthOfYear = k;
          this.iDayOfMonth = j;
          this.iDayOfWeek = n;
          this.iAdvanceDayOfWeek = bool1;
          this.iMillisOfDay = m;
          this.iZoneChar = c1;
          return;
          try
          {
            int i9 = Integer.parseInt(str1);
            j = i9;
            bool2 = false;
            n = 0;
          }
          catch (NumberFormatException localNumberFormatException)
          {
            int i2 = str1.indexOf(">=");
            if (i2 > 0)
            {
              int i7 = Integer.parseInt(str1.substring(i2 + 2));
              int i8 = ZoneInfoCompiler.parseDayOfWeek(str1.substring(0, i2));
              j = i7;
              n = i8;
              bool2 = i;
              break;
            }
            int i3 = str1.indexOf("<=");
            if (i3 > 0)
            {
              int i4 = Integer.parseInt(str1.substring(i3 + 2));
              int i5 = ZoneInfoCompiler.parseDayOfWeek(str1.substring(0, i3));
              j = i4;
              n = i5;
              bool2 = false;
              break;
            }
            throw new IllegalArgumentException(str1);
          }
        }
        label312: LocalDate localLocalDate;
        if (j == -1)
        {
          localLocalDate = new LocalDate(2001, i1, i).plusMonths(i);
          label337: if ((j == -1) || (n == 0))
            break label419;
        }
        while (true)
        {
          int i6 = localLocalDate.getMonthOfYear();
          j = localLocalDate.getDayOfMonth();
          if (n != 0)
            n = 1 + (1 + (n - 1)) % 7;
          k = i6;
          c1 = c2;
          bool1 = i;
          m = 0;
          break;
          localLocalDate = new LocalDate(2001, i1, j).plusDays(i);
          break label337;
          label419: i = 0;
        }
        label424: m = ZoneInfoCompiler.parseTime(str2);
        k = i1;
        bool1 = bool2;
        c1 = c2;
        continue;
        label445: k = i1;
        bool1 = bool2;
        c1 = 'w';
        m = 0;
        continue;
        c1 = 'w';
        j = i;
        k = i1;
        bool1 = false;
        m = 0;
        n = 0;
        continue;
        c1 = 'w';
        j = i;
        k = i;
        bool1 = false;
        m = 0;
        n = 0;
      }
    }

    public void addCutover(DateTimeZoneBuilder paramDateTimeZoneBuilder, int paramInt)
    {
      paramDateTimeZoneBuilder.addCutover(paramInt, this.iZoneChar, this.iMonthOfYear, this.iDayOfMonth, this.iDayOfWeek, this.iAdvanceDayOfWeek, this.iMillisOfDay);
    }

    public void addRecurring(DateTimeZoneBuilder paramDateTimeZoneBuilder, String paramString, int paramInt1, int paramInt2, int paramInt3)
    {
      paramDateTimeZoneBuilder.addRecurringSavings(paramString, paramInt1, paramInt2, paramInt3, this.iZoneChar, this.iMonthOfYear, this.iDayOfMonth, this.iDayOfWeek, this.iAdvanceDayOfWeek, this.iMillisOfDay);
    }

    public String toString()
    {
      return "MonthOfYear: " + this.iMonthOfYear + "\n" + "DayOfMonth: " + this.iDayOfMonth + "\n" + "DayOfWeek: " + this.iDayOfWeek + "\n" + "AdvanceDayOfWeek: " + this.iAdvanceDayOfWeek + "\n" + "MillisOfDay: " + this.iMillisOfDay + "\n" + "ZoneChar: " + this.iZoneChar + "\n";
    }
  }

  private static class Rule
  {
    public final ZoneInfoCompiler.DateTimeOfYear iDateTimeOfYear;
    public final int iFromYear;
    public final String iLetterS;
    public final String iName;
    public final int iSaveMillis;
    public final int iToYear;
    public final String iType;

    Rule(StringTokenizer paramStringTokenizer)
    {
      this.iName = paramStringTokenizer.nextToken().intern();
      this.iFromYear = ZoneInfoCompiler.parseYear(paramStringTokenizer.nextToken(), 0);
      this.iToYear = ZoneInfoCompiler.parseYear(paramStringTokenizer.nextToken(), this.iFromYear);
      if (this.iToYear < this.iFromYear)
        throw new IllegalArgumentException();
      this.iType = ZoneInfoCompiler.parseOptional(paramStringTokenizer.nextToken());
      this.iDateTimeOfYear = new ZoneInfoCompiler.DateTimeOfYear(paramStringTokenizer);
      this.iSaveMillis = ZoneInfoCompiler.parseTime(paramStringTokenizer.nextToken());
      this.iLetterS = ZoneInfoCompiler.parseOptional(paramStringTokenizer.nextToken());
    }

    private String formatName(String paramString)
    {
      int i = paramString.indexOf('/');
      if (i > 0)
        if (this.iSaveMillis == 0)
          paramString = paramString.substring(0, i).intern();
      int j;
      do
      {
        return paramString;
        return paramString.substring(i + 1).intern();
        j = paramString.indexOf("%s");
      }
      while (j < 0);
      String str1 = paramString.substring(0, j);
      String str2 = paramString.substring(j + 2);
      if (this.iLetterS == null);
      for (String str3 = str1.concat(str2); ; str3 = str1 + this.iLetterS + str2)
        return str3.intern();
    }

    public void addRecurring(DateTimeZoneBuilder paramDateTimeZoneBuilder, String paramString)
    {
      String str = formatName(paramString);
      this.iDateTimeOfYear.addRecurring(paramDateTimeZoneBuilder, str, this.iSaveMillis, this.iFromYear, this.iToYear);
    }

    public String toString()
    {
      return "[Rule]\nName: " + this.iName + "\n" + "FromYear: " + this.iFromYear + "\n" + "ToYear: " + this.iToYear + "\n" + "Type: " + this.iType + "\n" + this.iDateTimeOfYear + "SaveMillis: " + this.iSaveMillis + "\n" + "LetterS: " + this.iLetterS + "\n";
    }
  }

  private static class RuleSet
  {
    private List<ZoneInfoCompiler.Rule> iRules = new ArrayList();

    RuleSet(ZoneInfoCompiler.Rule paramRule)
    {
      this.iRules.add(paramRule);
    }

    public void addRecurring(DateTimeZoneBuilder paramDateTimeZoneBuilder, String paramString)
    {
      for (int i = 0; i < this.iRules.size(); i++)
        ((ZoneInfoCompiler.Rule)this.iRules.get(i)).addRecurring(paramDateTimeZoneBuilder, paramString);
    }

    void addRule(ZoneInfoCompiler.Rule paramRule)
    {
      if (!paramRule.iName.equals(((ZoneInfoCompiler.Rule)this.iRules.get(0)).iName))
        throw new IllegalArgumentException("Rule name mismatch");
      this.iRules.add(paramRule);
    }
  }

  private static class Zone
  {
    public final String iFormat;
    public final String iName;
    private Zone iNext;
    public final int iOffsetMillis;
    public final String iRules;
    public final ZoneInfoCompiler.DateTimeOfYear iUntilDateTimeOfYear;
    public final int iUntilYear;

    private Zone(String paramString, StringTokenizer paramStringTokenizer)
    {
      this.iName = paramString.intern();
      this.iOffsetMillis = ZoneInfoCompiler.parseTime(paramStringTokenizer.nextToken());
      this.iRules = ZoneInfoCompiler.parseOptional(paramStringTokenizer.nextToken());
      this.iFormat = paramStringTokenizer.nextToken().intern();
      int i = 2147483647;
      ZoneInfoCompiler.DateTimeOfYear localDateTimeOfYear = ZoneInfoCompiler.getStartOfYear();
      if (paramStringTokenizer.hasMoreTokens())
      {
        i = Integer.parseInt(paramStringTokenizer.nextToken());
        if (paramStringTokenizer.hasMoreTokens())
          localDateTimeOfYear = new ZoneInfoCompiler.DateTimeOfYear(paramStringTokenizer);
      }
      this.iUntilYear = i;
      this.iUntilDateTimeOfYear = localDateTimeOfYear;
    }

    Zone(StringTokenizer paramStringTokenizer)
    {
      this(paramStringTokenizer.nextToken(), paramStringTokenizer);
    }

    private static void addToBuilder(Zone paramZone, DateTimeZoneBuilder paramDateTimeZoneBuilder, Map<String, ZoneInfoCompiler.RuleSet> paramMap)
    {
      while (true)
      {
        if (paramZone != null)
        {
          paramDateTimeZoneBuilder.setStandardOffset(paramZone.iOffsetMillis);
          if (paramZone.iRules != null)
            break label40;
          paramDateTimeZoneBuilder.setFixedSavings(paramZone.iFormat, 0);
        }
        while (paramZone.iUntilYear == 2147483647)
        {
          return;
          try
          {
            label40: int i = ZoneInfoCompiler.parseTime(paramZone.iRules);
            paramDateTimeZoneBuilder.setFixedSavings(paramZone.iFormat, i);
          }
          catch (Exception localException)
          {
            ZoneInfoCompiler.RuleSet localRuleSet = (ZoneInfoCompiler.RuleSet)paramMap.get(paramZone.iRules);
            if (localRuleSet == null)
              throw new IllegalArgumentException("Rules not found: " + paramZone.iRules);
            localRuleSet.addRecurring(paramDateTimeZoneBuilder, paramZone.iFormat);
          }
        }
        paramZone.iUntilDateTimeOfYear.addCutover(paramDateTimeZoneBuilder, paramZone.iUntilYear);
        paramZone = paramZone.iNext;
      }
    }

    public void addToBuilder(DateTimeZoneBuilder paramDateTimeZoneBuilder, Map<String, ZoneInfoCompiler.RuleSet> paramMap)
    {
      addToBuilder(this, paramDateTimeZoneBuilder, paramMap);
    }

    void chain(StringTokenizer paramStringTokenizer)
    {
      if (this.iNext != null)
      {
        this.iNext.chain(paramStringTokenizer);
        return;
      }
      this.iNext = new Zone(this.iName, paramStringTokenizer);
    }

    public String toString()
    {
      String str = "[Zone]\nName: " + this.iName + "\n" + "OffsetMillis: " + this.iOffsetMillis + "\n" + "Rules: " + this.iRules + "\n" + "Format: " + this.iFormat + "\n" + "UntilYear: " + this.iUntilYear + "\n" + this.iUntilDateTimeOfYear;
      if (this.iNext == null)
        return str;
      return str + "...\n" + this.iNext.toString();
    }
  }
}