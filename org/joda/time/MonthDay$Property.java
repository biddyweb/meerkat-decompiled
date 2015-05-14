package org.joda.time;

import java.io.Serializable;
import java.util.Locale;
import org.joda.time.field.AbstractPartialFieldProperty;

public class MonthDay$Property extends AbstractPartialFieldProperty
  implements Serializable
{
  private static final long serialVersionUID = 5727734012190224363L;
  private final MonthDay iBase;
  private final int iFieldIndex;

  MonthDay$Property(MonthDay paramMonthDay, int paramInt)
  {
    this.iBase = paramMonthDay;
    this.iFieldIndex = paramInt;
  }

  public MonthDay addToCopy(int paramInt)
  {
    int[] arrayOfInt1 = this.iBase.getValues();
    int[] arrayOfInt2 = getField().add(this.iBase, this.iFieldIndex, arrayOfInt1, paramInt);
    return new MonthDay(this.iBase, arrayOfInt2);
  }

  public MonthDay addWrapFieldToCopy(int paramInt)
  {
    int[] arrayOfInt1 = this.iBase.getValues();
    int[] arrayOfInt2 = getField().addWrapField(this.iBase, this.iFieldIndex, arrayOfInt1, paramInt);
    return new MonthDay(this.iBase, arrayOfInt2);
  }

  public int get()
  {
    return this.iBase.getValue(this.iFieldIndex);
  }

  public DateTimeField getField()
  {
    return this.iBase.getField(this.iFieldIndex);
  }

  public MonthDay getMonthDay()
  {
    return this.iBase;
  }

  protected ReadablePartial getReadablePartial()
  {
    return this.iBase;
  }

  public MonthDay setCopy(int paramInt)
  {
    int[] arrayOfInt1 = this.iBase.getValues();
    int[] arrayOfInt2 = getField().set(this.iBase, this.iFieldIndex, arrayOfInt1, paramInt);
    return new MonthDay(this.iBase, arrayOfInt2);
  }

  public MonthDay setCopy(String paramString)
  {
    return setCopy(paramString, null);
  }

  public MonthDay setCopy(String paramString, Locale paramLocale)
  {
    int[] arrayOfInt1 = this.iBase.getValues();
    int[] arrayOfInt2 = getField().set(this.iBase, this.iFieldIndex, arrayOfInt1, paramString, paramLocale);
    return new MonthDay(this.iBase, arrayOfInt2);
  }
}