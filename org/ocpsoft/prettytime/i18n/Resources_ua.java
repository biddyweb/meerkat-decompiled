package org.ocpsoft.prettytime.i18n;

import java.lang.reflect.Array;
import java.util.ListResourceBundle;
import org.ocpsoft.prettytime.Duration;
import org.ocpsoft.prettytime.TimeFormat;
import org.ocpsoft.prettytime.TimeUnit;
import org.ocpsoft.prettytime.impl.TimeFormatProvider;
import org.ocpsoft.prettytime.units.Century;
import org.ocpsoft.prettytime.units.Day;
import org.ocpsoft.prettytime.units.Decade;
import org.ocpsoft.prettytime.units.Hour;
import org.ocpsoft.prettytime.units.JustNow;
import org.ocpsoft.prettytime.units.Millennium;
import org.ocpsoft.prettytime.units.Millisecond;
import org.ocpsoft.prettytime.units.Minute;
import org.ocpsoft.prettytime.units.Month;
import org.ocpsoft.prettytime.units.Second;
import org.ocpsoft.prettytime.units.Week;
import org.ocpsoft.prettytime.units.Year;

public class Resources_ua extends ListResourceBundle
  implements TimeFormatProvider
{
  private static final Object[][] OBJECTS = (Object[][])Array.newInstance(Object.class, new int[] { 0, 0 });
  private static final int slavicPluralForms = 3;
  private static final int tolerance = 50;

  public Object[][] getContents()
  {
    return OBJECTS;
  }

  public TimeFormat getFormatFor(TimeUnit paramTimeUnit)
  {
    if ((paramTimeUnit instanceof JustNow))
      return new TimeFormat()
      {
        private String performFormat(Duration paramAnonymousDuration)
        {
          if (paramAnonymousDuration.isInFuture())
            return "\u0437\u0430\u0440\u0430\u0437";
          if (paramAnonymousDuration.isInPast())
            return "\u0449\u043E\u0439\u043D\u043E";
          return null;
        }

        public String decorate(Duration paramAnonymousDuration, String paramAnonymousString)
        {
          return paramAnonymousString;
        }

        public String decorateUnrounded(Duration paramAnonymousDuration, String paramAnonymousString)
        {
          return paramAnonymousString;
        }

        public String format(Duration paramAnonymousDuration)
        {
          return performFormat(paramAnonymousDuration);
        }

        public String formatUnrounded(Duration paramAnonymousDuration)
        {
          return performFormat(paramAnonymousDuration);
        }
      };
    if ((paramTimeUnit instanceof Century))
      return new TimeFormatAided(new String[] { "\u0441\u0442\u043E\u043B\u0456\u0442\u0442\u044F", "\u0441\u0442\u043E\u043B\u0456\u0442\u0442\u044F", "\u0441\u0442\u043E\u043B\u0456\u0442\u0442\u044C" });
    if ((paramTimeUnit instanceof Day))
      return new TimeFormatAided(new String[] { "\u0434\u0435\u043D\u044C", "\u0434\u043D\u0456", "\u0434\u043D\u0456\u0432" });
    if ((paramTimeUnit instanceof Decade))
      return new TimeFormatAided(new String[] { "\u0434\u0435\u0441\u044F\u0442\u0438\u043B\u0456\u0442\u0442\u044F", "\u0434\u0435\u0441\u044F\u0442\u0438\u043B\u0456\u0442\u0442\u044F", "\u0434\u0435\u0441\u044F\u0442\u0438\u043B\u0456\u0442\u044C" });
    if ((paramTimeUnit instanceof Hour))
      return new TimeFormatAided(new String[] { "\u0433\u043E\u0434\u0438\u043D\u0443", "\u0433\u043E\u0434\u0438\u043D\u0438", "\u0433\u043E\u0434\u0438\u043D" });
    if ((paramTimeUnit instanceof Millennium))
      return new TimeFormatAided(new String[] { "\u0442\u0438\u0441\u044F\u0447\u043E\u043B\u0456\u0442\u0442\u044F", "\u0442\u0438\u0441\u044F\u0447\u043E\u043B\u0456\u0442\u0442\u044F", "\u0442\u0438\u0441\u044F\u0447\u043E\u043B\u0456\u0442\u044C" });
    if ((paramTimeUnit instanceof Millisecond))
      return new TimeFormatAided(new String[] { "\u043C\u0456\u043B\u0456\u0441\u0435\u043A\u0443\u043D\u0434\u0443", "\u043C\u0456\u043B\u0456\u0441\u0435\u043A\u0443\u043D\u0434\u0438", "\u043C\u0456\u043B\u0456\u0441\u0435\u043A\u0443\u043D\u0434" });
    if ((paramTimeUnit instanceof Minute))
      return new TimeFormatAided(new String[] { "\u0445\u0432\u0438\u043B\u0438\u043D\u0443", "\u0445\u0432\u0438\u043B\u0438\u043D\u0438", "\u0445\u0432\u0438\u043B\u0438\u043D" });
    if ((paramTimeUnit instanceof Month))
      return new TimeFormatAided(new String[] { "\u043C\u0456\u0441\u044F\u0446\u044C", "\u043C\u0456\u0441\u044F\u0446\u0456", "\u043C\u0456\u0441\u044F\u0446\u0456\u0432" });
    if ((paramTimeUnit instanceof Second))
      return new TimeFormatAided(new String[] { "\u0441\u0435\u043A\u0443\u043D\u0434\u0443", "\u0441\u0435\u043A\u0443\u043D\u0434\u0438", "\u0441\u0435\u043A\u0443\u043D\u0434" });
    if ((paramTimeUnit instanceof Week))
      return new TimeFormatAided(new String[] { "\u0442\u0438\u0436\u0434\u0435\u043D\u044C", "\u0442\u0438\u0436\u043D\u0456", "\u0442\u0438\u0436\u043D\u0456\u0432" });
    if ((paramTimeUnit instanceof Year))
      return new TimeFormatAided(new String[] { "\u0440\u0456\u043A", "\u0440\u043E\u043A\u0438", "\u0440\u043E\u043A\u0456\u0432" });
    return null;
  }

  private static class TimeFormatAided
    implements TimeFormat
  {
    private final String[] pluarls;

    public TimeFormatAided(String[] paramArrayOfString)
    {
      if (paramArrayOfString.length != 3)
        throw new IllegalArgumentException("Wrong plural forms number for slavic language!");
      this.pluarls = paramArrayOfString;
    }

    private String performDecoration(boolean paramBoolean1, boolean paramBoolean2, long paramLong, String paramString)
    {
      int i;
      if ((paramLong % 10L == 1L) && (paramLong % 100L != 11L))
        i = 0;
      while (i > 3)
      {
        throw new IllegalStateException("Wrong plural index was calculated somehow for slavic language");
        if ((paramLong % 10L >= 2L) && (paramLong % 10L <= 4L) && ((paramLong % 100L < 10L) || (paramLong % 100L >= 20L)))
          i = 1;
        else
          i = 2;
      }
      StringBuilder localStringBuilder = new StringBuilder();
      if (paramBoolean2)
        localStringBuilder.append("\u0447\u0435\u0440\u0435\u0437 ");
      localStringBuilder.append(paramString);
      localStringBuilder.append(' ');
      localStringBuilder.append(this.pluarls[i]);
      if (paramBoolean1)
        localStringBuilder.append(" \u0442\u043E\u043C\u0443");
      return localStringBuilder.toString();
    }

    public String decorate(Duration paramDuration, String paramString)
    {
      return performDecoration(paramDuration.isInPast(), paramDuration.isInFuture(), paramDuration.getQuantityRounded(50), paramString);
    }

    public String decorateUnrounded(Duration paramDuration, String paramString)
    {
      return performDecoration(paramDuration.isInPast(), paramDuration.isInFuture(), paramDuration.getQuantity(), paramString);
    }

    public String format(Duration paramDuration)
    {
      long l = paramDuration.getQuantityRounded(50);
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append(l);
      return localStringBuilder.toString();
    }

    public String formatUnrounded(Duration paramDuration)
    {
      long l = paramDuration.getQuantity();
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append(l);
      return localStringBuilder.toString();
    }
  }
}