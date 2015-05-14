package org.joda.time.convert;

import org.joda.time.JodaTimePermission;

public final class ConverterManager
{
  private static ConverterManager INSTANCE;
  private ConverterSet iDurationConverters;
  private ConverterSet iInstantConverters;
  private ConverterSet iIntervalConverters;
  private ConverterSet iPartialConverters;
  private ConverterSet iPeriodConverters;

  protected ConverterManager()
  {
    Converter[] arrayOfConverter1 = new Converter[6];
    arrayOfConverter1[0] = ReadableInstantConverter.INSTANCE;
    arrayOfConverter1[1] = StringConverter.INSTANCE;
    arrayOfConverter1[2] = CalendarConverter.INSTANCE;
    arrayOfConverter1[3] = DateConverter.INSTANCE;
    arrayOfConverter1[4] = LongConverter.INSTANCE;
    arrayOfConverter1[5] = NullConverter.INSTANCE;
    this.iInstantConverters = new ConverterSet(arrayOfConverter1);
    Converter[] arrayOfConverter2 = new Converter[7];
    arrayOfConverter2[0] = ReadablePartialConverter.INSTANCE;
    arrayOfConverter2[1] = ReadableInstantConverter.INSTANCE;
    arrayOfConverter2[2] = StringConverter.INSTANCE;
    arrayOfConverter2[3] = CalendarConverter.INSTANCE;
    arrayOfConverter2[4] = DateConverter.INSTANCE;
    arrayOfConverter2[5] = LongConverter.INSTANCE;
    arrayOfConverter2[6] = NullConverter.INSTANCE;
    this.iPartialConverters = new ConverterSet(arrayOfConverter2);
    Converter[] arrayOfConverter3 = new Converter[5];
    arrayOfConverter3[0] = ReadableDurationConverter.INSTANCE;
    arrayOfConverter3[1] = ReadableIntervalConverter.INSTANCE;
    arrayOfConverter3[2] = StringConverter.INSTANCE;
    arrayOfConverter3[3] = LongConverter.INSTANCE;
    arrayOfConverter3[4] = NullConverter.INSTANCE;
    this.iDurationConverters = new ConverterSet(arrayOfConverter3);
    Converter[] arrayOfConverter4 = new Converter[5];
    arrayOfConverter4[0] = ReadableDurationConverter.INSTANCE;
    arrayOfConverter4[1] = ReadablePeriodConverter.INSTANCE;
    arrayOfConverter4[2] = ReadableIntervalConverter.INSTANCE;
    arrayOfConverter4[3] = StringConverter.INSTANCE;
    arrayOfConverter4[4] = NullConverter.INSTANCE;
    this.iPeriodConverters = new ConverterSet(arrayOfConverter4);
    Converter[] arrayOfConverter5 = new Converter[3];
    arrayOfConverter5[0] = ReadableIntervalConverter.INSTANCE;
    arrayOfConverter5[1] = StringConverter.INSTANCE;
    arrayOfConverter5[2] = NullConverter.INSTANCE;
    this.iIntervalConverters = new ConverterSet(arrayOfConverter5);
  }

  private void checkAlterDurationConverters()
    throws SecurityException
  {
    SecurityManager localSecurityManager = System.getSecurityManager();
    if (localSecurityManager != null)
      localSecurityManager.checkPermission(new JodaTimePermission("ConverterManager.alterDurationConverters"));
  }

  private void checkAlterInstantConverters()
    throws SecurityException
  {
    SecurityManager localSecurityManager = System.getSecurityManager();
    if (localSecurityManager != null)
      localSecurityManager.checkPermission(new JodaTimePermission("ConverterManager.alterInstantConverters"));
  }

  private void checkAlterIntervalConverters()
    throws SecurityException
  {
    SecurityManager localSecurityManager = System.getSecurityManager();
    if (localSecurityManager != null)
      localSecurityManager.checkPermission(new JodaTimePermission("ConverterManager.alterIntervalConverters"));
  }

  private void checkAlterPartialConverters()
    throws SecurityException
  {
    SecurityManager localSecurityManager = System.getSecurityManager();
    if (localSecurityManager != null)
      localSecurityManager.checkPermission(new JodaTimePermission("ConverterManager.alterPartialConverters"));
  }

  private void checkAlterPeriodConverters()
    throws SecurityException
  {
    SecurityManager localSecurityManager = System.getSecurityManager();
    if (localSecurityManager != null)
      localSecurityManager.checkPermission(new JodaTimePermission("ConverterManager.alterPeriodConverters"));
  }

  public static ConverterManager getInstance()
  {
    if (INSTANCE == null)
      INSTANCE = new ConverterManager();
    return INSTANCE;
  }

  public DurationConverter addDurationConverter(DurationConverter paramDurationConverter)
    throws SecurityException
  {
    checkAlterDurationConverters();
    if (paramDurationConverter == null)
      return null;
    DurationConverter[] arrayOfDurationConverter = new DurationConverter[1];
    this.iDurationConverters = this.iDurationConverters.add(paramDurationConverter, arrayOfDurationConverter);
    return arrayOfDurationConverter[0];
  }

  public InstantConverter addInstantConverter(InstantConverter paramInstantConverter)
    throws SecurityException
  {
    checkAlterInstantConverters();
    if (paramInstantConverter == null)
      return null;
    InstantConverter[] arrayOfInstantConverter = new InstantConverter[1];
    this.iInstantConverters = this.iInstantConverters.add(paramInstantConverter, arrayOfInstantConverter);
    return arrayOfInstantConverter[0];
  }

  public IntervalConverter addIntervalConverter(IntervalConverter paramIntervalConverter)
    throws SecurityException
  {
    checkAlterIntervalConverters();
    if (paramIntervalConverter == null)
      return null;
    IntervalConverter[] arrayOfIntervalConverter = new IntervalConverter[1];
    this.iIntervalConverters = this.iIntervalConverters.add(paramIntervalConverter, arrayOfIntervalConverter);
    return arrayOfIntervalConverter[0];
  }

  public PartialConverter addPartialConverter(PartialConverter paramPartialConverter)
    throws SecurityException
  {
    checkAlterPartialConverters();
    if (paramPartialConverter == null)
      return null;
    PartialConverter[] arrayOfPartialConverter = new PartialConverter[1];
    this.iPartialConverters = this.iPartialConverters.add(paramPartialConverter, arrayOfPartialConverter);
    return arrayOfPartialConverter[0];
  }

  public PeriodConverter addPeriodConverter(PeriodConverter paramPeriodConverter)
    throws SecurityException
  {
    checkAlterPeriodConverters();
    if (paramPeriodConverter == null)
      return null;
    PeriodConverter[] arrayOfPeriodConverter = new PeriodConverter[1];
    this.iPeriodConverters = this.iPeriodConverters.add(paramPeriodConverter, arrayOfPeriodConverter);
    return arrayOfPeriodConverter[0];
  }

  public DurationConverter getDurationConverter(Object paramObject)
  {
    ConverterSet localConverterSet = this.iDurationConverters;
    if (paramObject == null);
    for (Class localClass = null; ; localClass = paramObject.getClass())
    {
      DurationConverter localDurationConverter = (DurationConverter)localConverterSet.select(localClass);
      if (localDurationConverter == null)
        break;
      return localDurationConverter;
    }
    StringBuilder localStringBuilder = new StringBuilder().append("No duration converter found for type: ");
    if (paramObject == null);
    for (String str = "null"; ; str = paramObject.getClass().getName())
      throw new IllegalArgumentException(str);
  }

  public DurationConverter[] getDurationConverters()
  {
    ConverterSet localConverterSet = this.iDurationConverters;
    DurationConverter[] arrayOfDurationConverter = new DurationConverter[localConverterSet.size()];
    localConverterSet.copyInto(arrayOfDurationConverter);
    return arrayOfDurationConverter;
  }

  public InstantConverter getInstantConverter(Object paramObject)
  {
    ConverterSet localConverterSet = this.iInstantConverters;
    if (paramObject == null);
    for (Class localClass = null; ; localClass = paramObject.getClass())
    {
      InstantConverter localInstantConverter = (InstantConverter)localConverterSet.select(localClass);
      if (localInstantConverter == null)
        break;
      return localInstantConverter;
    }
    StringBuilder localStringBuilder = new StringBuilder().append("No instant converter found for type: ");
    if (paramObject == null);
    for (String str = "null"; ; str = paramObject.getClass().getName())
      throw new IllegalArgumentException(str);
  }

  public InstantConverter[] getInstantConverters()
  {
    ConverterSet localConverterSet = this.iInstantConverters;
    InstantConverter[] arrayOfInstantConverter = new InstantConverter[localConverterSet.size()];
    localConverterSet.copyInto(arrayOfInstantConverter);
    return arrayOfInstantConverter;
  }

  public IntervalConverter getIntervalConverter(Object paramObject)
  {
    ConverterSet localConverterSet = this.iIntervalConverters;
    if (paramObject == null);
    for (Class localClass = null; ; localClass = paramObject.getClass())
    {
      IntervalConverter localIntervalConverter = (IntervalConverter)localConverterSet.select(localClass);
      if (localIntervalConverter == null)
        break;
      return localIntervalConverter;
    }
    StringBuilder localStringBuilder = new StringBuilder().append("No interval converter found for type: ");
    if (paramObject == null);
    for (String str = "null"; ; str = paramObject.getClass().getName())
      throw new IllegalArgumentException(str);
  }

  public IntervalConverter[] getIntervalConverters()
  {
    ConverterSet localConverterSet = this.iIntervalConverters;
    IntervalConverter[] arrayOfIntervalConverter = new IntervalConverter[localConverterSet.size()];
    localConverterSet.copyInto(arrayOfIntervalConverter);
    return arrayOfIntervalConverter;
  }

  public PartialConverter getPartialConverter(Object paramObject)
  {
    ConverterSet localConverterSet = this.iPartialConverters;
    if (paramObject == null);
    for (Class localClass = null; ; localClass = paramObject.getClass())
    {
      PartialConverter localPartialConverter = (PartialConverter)localConverterSet.select(localClass);
      if (localPartialConverter == null)
        break;
      return localPartialConverter;
    }
    StringBuilder localStringBuilder = new StringBuilder().append("No partial converter found for type: ");
    if (paramObject == null);
    for (String str = "null"; ; str = paramObject.getClass().getName())
      throw new IllegalArgumentException(str);
  }

  public PartialConverter[] getPartialConverters()
  {
    ConverterSet localConverterSet = this.iPartialConverters;
    PartialConverter[] arrayOfPartialConverter = new PartialConverter[localConverterSet.size()];
    localConverterSet.copyInto(arrayOfPartialConverter);
    return arrayOfPartialConverter;
  }

  public PeriodConverter getPeriodConverter(Object paramObject)
  {
    ConverterSet localConverterSet = this.iPeriodConverters;
    if (paramObject == null);
    for (Class localClass = null; ; localClass = paramObject.getClass())
    {
      PeriodConverter localPeriodConverter = (PeriodConverter)localConverterSet.select(localClass);
      if (localPeriodConverter == null)
        break;
      return localPeriodConverter;
    }
    StringBuilder localStringBuilder = new StringBuilder().append("No period converter found for type: ");
    if (paramObject == null);
    for (String str = "null"; ; str = paramObject.getClass().getName())
      throw new IllegalArgumentException(str);
  }

  public PeriodConverter[] getPeriodConverters()
  {
    ConverterSet localConverterSet = this.iPeriodConverters;
    PeriodConverter[] arrayOfPeriodConverter = new PeriodConverter[localConverterSet.size()];
    localConverterSet.copyInto(arrayOfPeriodConverter);
    return arrayOfPeriodConverter;
  }

  public DurationConverter removeDurationConverter(DurationConverter paramDurationConverter)
    throws SecurityException
  {
    checkAlterDurationConverters();
    if (paramDurationConverter == null)
      return null;
    DurationConverter[] arrayOfDurationConverter = new DurationConverter[1];
    this.iDurationConverters = this.iDurationConverters.remove(paramDurationConverter, arrayOfDurationConverter);
    return arrayOfDurationConverter[0];
  }

  public InstantConverter removeInstantConverter(InstantConverter paramInstantConverter)
    throws SecurityException
  {
    checkAlterInstantConverters();
    if (paramInstantConverter == null)
      return null;
    InstantConverter[] arrayOfInstantConverter = new InstantConverter[1];
    this.iInstantConverters = this.iInstantConverters.remove(paramInstantConverter, arrayOfInstantConverter);
    return arrayOfInstantConverter[0];
  }

  public IntervalConverter removeIntervalConverter(IntervalConverter paramIntervalConverter)
    throws SecurityException
  {
    checkAlterIntervalConverters();
    if (paramIntervalConverter == null)
      return null;
    IntervalConverter[] arrayOfIntervalConverter = new IntervalConverter[1];
    this.iIntervalConverters = this.iIntervalConverters.remove(paramIntervalConverter, arrayOfIntervalConverter);
    return arrayOfIntervalConverter[0];
  }

  public PartialConverter removePartialConverter(PartialConverter paramPartialConverter)
    throws SecurityException
  {
    checkAlterPartialConverters();
    if (paramPartialConverter == null)
      return null;
    PartialConverter[] arrayOfPartialConverter = new PartialConverter[1];
    this.iPartialConverters = this.iPartialConverters.remove(paramPartialConverter, arrayOfPartialConverter);
    return arrayOfPartialConverter[0];
  }

  public PeriodConverter removePeriodConverter(PeriodConverter paramPeriodConverter)
    throws SecurityException
  {
    checkAlterPeriodConverters();
    if (paramPeriodConverter == null)
      return null;
    PeriodConverter[] arrayOfPeriodConverter = new PeriodConverter[1];
    this.iPeriodConverters = this.iPeriodConverters.remove(paramPeriodConverter, arrayOfPeriodConverter);
    return arrayOfPeriodConverter[0];
  }

  public String toString()
  {
    return "ConverterManager[" + this.iInstantConverters.size() + " instant," + this.iPartialConverters.size() + " partial," + this.iDurationConverters.size() + " duration," + this.iPeriodConverters.size() + " period," + this.iIntervalConverters.size() + " interval]";
  }
}