package org.joda.time.base;

import java.io.Serializable;
import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeUtils;
import org.joda.time.DateTimeZone;
import org.joda.time.ReadableDateTime;
import org.joda.time.chrono.ISOChronology;
import org.joda.time.convert.ConverterManager;
import org.joda.time.convert.InstantConverter;

public abstract class BaseDateTime extends AbstractDateTime
  implements ReadableDateTime, Serializable
{
  private static final long serialVersionUID = -6728882245981L;
  private volatile Chronology iChronology;
  private volatile long iMillis;

  public BaseDateTime()
  {
    this(DateTimeUtils.currentTimeMillis(), ISOChronology.getInstance());
  }

  public BaseDateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7)
  {
    this(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, ISOChronology.getInstance());
  }

  public BaseDateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, Chronology paramChronology)
  {
    this.iChronology = checkChronology(paramChronology);
    this.iMillis = checkInstant(this.iChronology.getDateTimeMillis(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7), this.iChronology);
  }

  public BaseDateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, DateTimeZone paramDateTimeZone)
  {
    this(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, ISOChronology.getInstance(paramDateTimeZone));
  }

  public BaseDateTime(long paramLong)
  {
    this(paramLong, ISOChronology.getInstance());
  }

  public BaseDateTime(long paramLong, Chronology paramChronology)
  {
    this.iChronology = checkChronology(paramChronology);
    this.iMillis = checkInstant(paramLong, this.iChronology);
    if (this.iChronology.year().isSupported())
      this.iChronology.year().set(this.iMillis, this.iChronology.year().get(this.iMillis));
  }

  public BaseDateTime(long paramLong, DateTimeZone paramDateTimeZone)
  {
    this(paramLong, ISOChronology.getInstance(paramDateTimeZone));
  }

  public BaseDateTime(Object paramObject, Chronology paramChronology)
  {
    InstantConverter localInstantConverter = ConverterManager.getInstance().getInstantConverter(paramObject);
    this.iChronology = checkChronology(localInstantConverter.getChronology(paramObject, paramChronology));
    this.iMillis = checkInstant(localInstantConverter.getInstantMillis(paramObject, paramChronology), this.iChronology);
  }

  public BaseDateTime(Object paramObject, DateTimeZone paramDateTimeZone)
  {
    InstantConverter localInstantConverter = ConverterManager.getInstance().getInstantConverter(paramObject);
    Chronology localChronology = checkChronology(localInstantConverter.getChronology(paramObject, paramDateTimeZone));
    this.iChronology = localChronology;
    this.iMillis = checkInstant(localInstantConverter.getInstantMillis(paramObject, localChronology), localChronology);
  }

  public BaseDateTime(Chronology paramChronology)
  {
    this(DateTimeUtils.currentTimeMillis(), paramChronology);
  }

  public BaseDateTime(DateTimeZone paramDateTimeZone)
  {
    this(DateTimeUtils.currentTimeMillis(), ISOChronology.getInstance(paramDateTimeZone));
  }

  protected Chronology checkChronology(Chronology paramChronology)
  {
    return DateTimeUtils.getChronology(paramChronology);
  }

  protected long checkInstant(long paramLong, Chronology paramChronology)
  {
    return paramLong;
  }

  public Chronology getChronology()
  {
    return this.iChronology;
  }

  public long getMillis()
  {
    return this.iMillis;
  }

  protected void setChronology(Chronology paramChronology)
  {
    this.iChronology = checkChronology(paramChronology);
  }

  protected void setMillis(long paramLong)
  {
    this.iMillis = checkInstant(paramLong, this.iChronology);
  }
}