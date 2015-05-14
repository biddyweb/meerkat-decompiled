package org.joda.time.field;

import java.io.Serializable;
import java.util.HashMap;
import org.joda.time.DurationField;
import org.joda.time.DurationFieldType;

public final class UnsupportedDurationField extends DurationField
  implements Serializable
{
  private static HashMap<DurationFieldType, UnsupportedDurationField> cCache;
  private static final long serialVersionUID = -6390301302770925357L;
  private final DurationFieldType iType;

  private UnsupportedDurationField(DurationFieldType paramDurationFieldType)
  {
    this.iType = paramDurationFieldType;
  }

  public static UnsupportedDurationField getInstance(DurationFieldType paramDurationFieldType)
  {
    try
    {
      if (cCache == null)
        cCache = new HashMap(7);
      for (UnsupportedDurationField localUnsupportedDurationField = null; ; localUnsupportedDurationField = (UnsupportedDurationField)cCache.get(paramDurationFieldType))
      {
        if (localUnsupportedDurationField == null)
        {
          localUnsupportedDurationField = new UnsupportedDurationField(paramDurationFieldType);
          cCache.put(paramDurationFieldType, localUnsupportedDurationField);
        }
        return localUnsupportedDurationField;
      }
    }
    finally
    {
    }
  }

  private Object readResolve()
  {
    return getInstance(this.iType);
  }

  private UnsupportedOperationException unsupported()
  {
    return new UnsupportedOperationException(this.iType + " field is unsupported");
  }

  public long add(long paramLong, int paramInt)
  {
    throw unsupported();
  }

  public long add(long paramLong1, long paramLong2)
  {
    throw unsupported();
  }

  public int compareTo(DurationField paramDurationField)
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    UnsupportedDurationField localUnsupportedDurationField;
    do
    {
      return true;
      if (!(paramObject instanceof UnsupportedDurationField))
        break label47;
      localUnsupportedDurationField = (UnsupportedDurationField)paramObject;
      if (localUnsupportedDurationField.getName() != null)
        break;
    }
    while (getName() == null);
    return false;
    return localUnsupportedDurationField.getName().equals(getName());
    label47: return false;
  }

  public int getDifference(long paramLong1, long paramLong2)
  {
    throw unsupported();
  }

  public long getDifferenceAsLong(long paramLong1, long paramLong2)
  {
    throw unsupported();
  }

  public long getMillis(int paramInt)
  {
    throw unsupported();
  }

  public long getMillis(int paramInt, long paramLong)
  {
    throw unsupported();
  }

  public long getMillis(long paramLong)
  {
    throw unsupported();
  }

  public long getMillis(long paramLong1, long paramLong2)
  {
    throw unsupported();
  }

  public String getName()
  {
    return this.iType.getName();
  }

  public final DurationFieldType getType()
  {
    return this.iType;
  }

  public long getUnitMillis()
  {
    return 0L;
  }

  public int getValue(long paramLong)
  {
    throw unsupported();
  }

  public int getValue(long paramLong1, long paramLong2)
  {
    throw unsupported();
  }

  public long getValueAsLong(long paramLong)
  {
    throw unsupported();
  }

  public long getValueAsLong(long paramLong1, long paramLong2)
  {
    throw unsupported();
  }

  public int hashCode()
  {
    return getName().hashCode();
  }

  public boolean isPrecise()
  {
    return true;
  }

  public boolean isSupported()
  {
    return false;
  }

  public String toString()
  {
    return "UnsupportedDurationField[" + getName() + ']';
  }
}