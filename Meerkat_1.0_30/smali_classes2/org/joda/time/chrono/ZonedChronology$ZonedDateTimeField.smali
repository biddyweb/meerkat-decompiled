.class final Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;
.super Lorg/joda/time/field/BaseDateTimeField;
.source "ZonedChronology.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/chrono/ZonedChronology;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ZonedDateTimeField"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3714abfdb535d742L


# instance fields
.field final iDurationField:Lorg/joda/time/DurationField;

.field final iField:Lorg/joda/time/DateTimeField;

.field final iLeapDurationField:Lorg/joda/time/DurationField;

.field final iRangeDurationField:Lorg/joda/time/DurationField;

.field final iTimeField:Z

.field final iZone:Lorg/joda/time/DateTimeZone;


# direct methods
.method constructor <init>(Lorg/joda/time/DateTimeField;Lorg/joda/time/DateTimeZone;Lorg/joda/time/DurationField;Lorg/joda/time/DurationField;Lorg/joda/time/DurationField;)V
    .locals 1

    .prologue
    .line 405
    invoke-virtual {p1}, Lorg/joda/time/DateTimeField;->getType()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/joda/time/field/BaseDateTimeField;-><init>(Lorg/joda/time/DateTimeFieldType;)V

    .line 406
    invoke-virtual {p1}, Lorg/joda/time/DateTimeField;->isSupported()Z

    move-result v0

    if-nez v0, :cond_0

    .line 407
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 409
    :cond_0
    iput-object p1, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    .line 410
    iput-object p2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    .line 411
    iput-object p3, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iDurationField:Lorg/joda/time/DurationField;

    .line 412
    invoke-static {p3}, Lorg/joda/time/chrono/ZonedChronology;->useTimeArithmetic(Lorg/joda/time/DurationField;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iTimeField:Z

    .line 413
    iput-object p4, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iRangeDurationField:Lorg/joda/time/DurationField;

    .line 414
    iput-object p5, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iLeapDurationField:Lorg/joda/time/DurationField;

    .line 415
    return-void
.end method

.method private getOffsetToAdd(J)I
    .locals 7

    .prologue
    const-wide/16 v4, 0x0

    .line 608
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v0

    .line 609
    int-to-long v2, v0

    add-long/2addr v2, p1

    .line 611
    xor-long/2addr v2, p1

    cmp-long v1, v2, v4

    if-gez v1, :cond_0

    int-to-long v2, v0

    xor-long/2addr v2, p1

    cmp-long v1, v2, v4

    if-ltz v1, :cond_0

    .line 612
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "Adding time zone offset caused overflow"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 614
    :cond_0
    return v0
.end method


# virtual methods
.method public add(JI)J
    .locals 7

    .prologue
    .line 445
    iget-boolean v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iTimeField:Z

    if-eqz v0, :cond_0

    .line 446
    invoke-direct {p0, p1, p2}, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->getOffsetToAdd(J)I

    move-result v0

    .line 447
    iget-object v1, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    int-to-long v2, v0

    add-long/2addr v2, p1

    invoke-virtual {v1, v2, v3, p3}, Lorg/joda/time/DateTimeField;->add(JI)J

    move-result-wide v2

    .line 448
    int-to-long v0, v0

    sub-long v0, v2, v0

    .line 452
    :goto_0
    return-wide v0

    .line 450
    :cond_0
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 451
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1, p3}, Lorg/joda/time/DateTimeField;->add(JI)J

    move-result-wide v1

    .line 452
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    const/4 v3, 0x0

    move-wide v4, p1

    invoke-virtual/range {v0 .. v5}, Lorg/joda/time/DateTimeZone;->convertLocalToUTC(JZJ)J

    move-result-wide v0

    goto :goto_0
.end method

.method public add(JJ)J
    .locals 7

    .prologue
    .line 457
    iget-boolean v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iTimeField:Z

    if-eqz v0, :cond_0

    .line 458
    invoke-direct {p0, p1, p2}, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->getOffsetToAdd(J)I

    move-result v0

    .line 459
    iget-object v1, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    int-to-long v2, v0

    add-long/2addr v2, p1

    invoke-virtual {v1, v2, v3, p3, p4}, Lorg/joda/time/DateTimeField;->add(JJ)J

    move-result-wide v2

    .line 460
    int-to-long v0, v0

    sub-long v0, v2, v0

    .line 464
    :goto_0
    return-wide v0

    .line 462
    :cond_0
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 463
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1, p3, p4}, Lorg/joda/time/DateTimeField;->add(JJ)J

    move-result-wide v1

    .line 464
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    const/4 v3, 0x0

    move-wide v4, p1

    invoke-virtual/range {v0 .. v5}, Lorg/joda/time/DateTimeZone;->convertLocalToUTC(JZJ)J

    move-result-wide v0

    goto :goto_0
.end method

.method public addWrapField(JI)J
    .locals 7

    .prologue
    .line 469
    iget-boolean v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iTimeField:Z

    if-eqz v0, :cond_0

    .line 470
    invoke-direct {p0, p1, p2}, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->getOffsetToAdd(J)I

    move-result v0

    .line 471
    iget-object v1, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    int-to-long v2, v0

    add-long/2addr v2, p1

    invoke-virtual {v1, v2, v3, p3}, Lorg/joda/time/DateTimeField;->addWrapField(JI)J

    move-result-wide v2

    .line 472
    int-to-long v0, v0

    sub-long v0, v2, v0

    .line 476
    :goto_0
    return-wide v0

    .line 474
    :cond_0
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 475
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1, p3}, Lorg/joda/time/DateTimeField;->addWrapField(JI)J

    move-result-wide v1

    .line 476
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    const/4 v3, 0x0

    move-wide v4, p1

    invoke-virtual/range {v0 .. v5}, Lorg/joda/time/DateTimeZone;->convertLocalToUTC(JZJ)J

    move-result-wide v0

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 619
    if-ne p0, p1, :cond_1

    .line 628
    :cond_0
    :goto_0
    return v0

    .line 621
    :cond_1
    instance-of v2, p1, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;

    if-eqz v2, :cond_3

    .line 622
    check-cast p1, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;

    .line 623
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    iget-object v3, p1, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    iget-object v3, p1, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v2, v3}, Lorg/joda/time/DateTimeZone;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iDurationField:Lorg/joda/time/DurationField;

    iget-object v3, p1, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iDurationField:Lorg/joda/time/DurationField;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iRangeDurationField:Lorg/joda/time/DurationField;

    iget-object v3, p1, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iRangeDurationField:Lorg/joda/time/DurationField;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    move v0, v1

    .line 628
    goto :goto_0
.end method

.method public get(J)I
    .locals 3

    .prologue
    .line 422
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 423
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    return v0
.end method

.method public getAsShortText(ILjava/util/Locale;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 441
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->getAsShortText(ILjava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAsShortText(JLjava/util/Locale;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 432
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 433
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1, p3}, Lorg/joda/time/DateTimeField;->getAsShortText(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAsText(ILjava/util/Locale;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 437
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->getAsText(ILjava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAsText(JLjava/util/Locale;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 427
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 428
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1, p3}, Lorg/joda/time/DateTimeField;->getAsText(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDifference(JJ)I
    .locals 7

    .prologue
    .line 501
    invoke-direct {p0, p3, p4}, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->getOffsetToAdd(J)I

    move-result v1

    .line 502
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    iget-boolean v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iTimeField:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    int-to-long v4, v0

    add-long/2addr v4, p1

    int-to-long v0, v1

    add-long/2addr v0, p3

    invoke-virtual {v2, v4, v5, v0, v1}, Lorg/joda/time/DateTimeField;->getDifference(JJ)I

    move-result v0

    return v0

    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->getOffsetToAdd(J)I

    move-result v0

    goto :goto_0
.end method

.method public getDifferenceAsLong(JJ)J
    .locals 7

    .prologue
    .line 508
    invoke-direct {p0, p3, p4}, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->getOffsetToAdd(J)I

    move-result v1

    .line 509
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    iget-boolean v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iTimeField:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    int-to-long v4, v0

    add-long/2addr v4, p1

    int-to-long v0, v1

    add-long/2addr v0, p3

    invoke-virtual {v2, v4, v5, v0, v1}, Lorg/joda/time/DateTimeField;->getDifferenceAsLong(JJ)J

    move-result-wide v0

    return-wide v0

    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->getOffsetToAdd(J)I

    move-result v0

    goto :goto_0
.end method

.method public final getDurationField()Lorg/joda/time/DurationField;
    .locals 1

    .prologue
    .line 515
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iDurationField:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public getLeapAmount(J)I
    .locals 3

    .prologue
    .line 528
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 529
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1}, Lorg/joda/time/DateTimeField;->getLeapAmount(J)I

    move-result v0

    return v0
.end method

.method public final getLeapDurationField()Lorg/joda/time/DurationField;
    .locals 1

    .prologue
    .line 533
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iLeapDurationField:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public getMaximumShortTextLength(Ljava/util/Locale;)I
    .locals 1

    .prologue
    .line 604
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0, p1}, Lorg/joda/time/DateTimeField;->getMaximumShortTextLength(Ljava/util/Locale;)I

    move-result v0

    return v0
.end method

.method public getMaximumTextLength(Ljava/util/Locale;)I
    .locals 1

    .prologue
    .line 600
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0, p1}, Lorg/joda/time/DateTimeField;->getMaximumTextLength(Ljava/util/Locale;)I

    move-result v0

    return v0
.end method

.method public getMaximumValue()I
    .locals 1

    .prologue
    .line 583
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0}, Lorg/joda/time/DateTimeField;->getMaximumValue()I

    move-result v0

    return v0
.end method

.method public getMaximumValue(J)I
    .locals 3

    .prologue
    .line 587
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 588
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1}, Lorg/joda/time/DateTimeField;->getMaximumValue(J)I

    move-result v0

    return v0
.end method

.method public getMaximumValue(Lorg/joda/time/ReadablePartial;)I
    .locals 1

    .prologue
    .line 592
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0, p1}, Lorg/joda/time/DateTimeField;->getMaximumValue(Lorg/joda/time/ReadablePartial;)I

    move-result v0

    return v0
.end method

.method public getMaximumValue(Lorg/joda/time/ReadablePartial;[I)I
    .locals 1

    .prologue
    .line 596
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->getMaximumValue(Lorg/joda/time/ReadablePartial;[I)I

    move-result v0

    return v0
.end method

.method public getMinimumValue()I
    .locals 1

    .prologue
    .line 566
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0}, Lorg/joda/time/DateTimeField;->getMinimumValue()I

    move-result v0

    return v0
.end method

.method public getMinimumValue(J)I
    .locals 3

    .prologue
    .line 570
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 571
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1}, Lorg/joda/time/DateTimeField;->getMinimumValue(J)I

    move-result v0

    return v0
.end method

.method public getMinimumValue(Lorg/joda/time/ReadablePartial;)I
    .locals 1

    .prologue
    .line 575
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0, p1}, Lorg/joda/time/DateTimeField;->getMinimumValue(Lorg/joda/time/ReadablePartial;)I

    move-result v0

    return v0
.end method

.method public getMinimumValue(Lorg/joda/time/ReadablePartial;[I)I
    .locals 1

    .prologue
    .line 579
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->getMinimumValue(Lorg/joda/time/ReadablePartial;[I)I

    move-result v0

    return v0
.end method

.method public final getRangeDurationField()Lorg/joda/time/DurationField;
    .locals 1

    .prologue
    .line 519
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iRangeDurationField:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 633
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object v1, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v1}, Lorg/joda/time/DateTimeZone;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public isLeap(J)Z
    .locals 3

    .prologue
    .line 523
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 524
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1}, Lorg/joda/time/DateTimeField;->isLeap(J)Z

    move-result v0

    return v0
.end method

.method public isLenient()Z
    .locals 1

    .prologue
    .line 418
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0}, Lorg/joda/time/DateTimeField;->isLenient()Z

    move-result v0

    return v0
.end method

.method public remainder(J)J
    .locals 3

    .prologue
    .line 561
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 562
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1}, Lorg/joda/time/DateTimeField;->remainder(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public roundCeiling(J)J
    .locals 7

    .prologue
    .line 549
    iget-boolean v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iTimeField:Z

    if-eqz v0, :cond_0

    .line 550
    invoke-direct {p0, p1, p2}, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->getOffsetToAdd(J)I

    move-result v0

    .line 551
    iget-object v1, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    int-to-long v2, v0

    add-long/2addr v2, p1

    invoke-virtual {v1, v2, v3}, Lorg/joda/time/DateTimeField;->roundCeiling(J)J

    move-result-wide v2

    .line 552
    int-to-long v0, v0

    sub-long v0, v2, v0

    .line 556
    :goto_0
    return-wide v0

    .line 554
    :cond_0
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 555
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1}, Lorg/joda/time/DateTimeField;->roundCeiling(J)J

    move-result-wide v1

    .line 556
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    const/4 v3, 0x0

    move-wide v4, p1

    invoke-virtual/range {v0 .. v5}, Lorg/joda/time/DateTimeZone;->convertLocalToUTC(JZJ)J

    move-result-wide v0

    goto :goto_0
.end method

.method public roundFloor(J)J
    .locals 7

    .prologue
    .line 537
    iget-boolean v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iTimeField:Z

    if-eqz v0, :cond_0

    .line 538
    invoke-direct {p0, p1, p2}, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->getOffsetToAdd(J)I

    move-result v0

    .line 539
    iget-object v1, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    int-to-long v2, v0

    add-long/2addr v2, p1

    invoke-virtual {v1, v2, v3}, Lorg/joda/time/DateTimeField;->roundFloor(J)J

    move-result-wide v2

    .line 540
    int-to-long v0, v0

    sub-long v0, v2, v0

    .line 544
    :goto_0
    return-wide v0

    .line 542
    :cond_0
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 543
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1}, Lorg/joda/time/DateTimeField;->roundFloor(J)J

    move-result-wide v1

    .line 544
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    const/4 v3, 0x0

    move-wide v4, p1

    invoke-virtual/range {v0 .. v5}, Lorg/joda/time/DateTimeZone;->convertLocalToUTC(JZJ)J

    move-result-wide v0

    goto :goto_0
.end method

.method public set(JI)J
    .locals 7

    .prologue
    .line 481
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 482
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1, p3}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v1

    .line 483
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    const/4 v3, 0x0

    move-wide v4, p1

    invoke-virtual/range {v0 .. v5}, Lorg/joda/time/DateTimeZone;->convertLocalToUTC(JZJ)J

    move-result-wide v4

    .line 484
    invoke-virtual {p0, v4, v5}, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->get(J)I

    move-result v0

    if-eq v0, p3, :cond_0

    .line 485
    new-instance v0, Lorg/joda/time/IllegalInstantException;

    iget-object v3, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v3}, Lorg/joda/time/DateTimeZone;->getID()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/joda/time/IllegalInstantException;-><init>(JLjava/lang/String;)V

    .line 486
    new-instance v1, Lorg/joda/time/IllegalFieldValueException;

    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2}, Lorg/joda/time/DateTimeField;->getType()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0}, Lorg/joda/time/IllegalInstantException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lorg/joda/time/IllegalFieldValueException;-><init>(Lorg/joda/time/DateTimeFieldType;Ljava/lang/Number;Ljava/lang/String;)V

    .line 487
    invoke-virtual {v1, v0}, Lorg/joda/time/IllegalFieldValueException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 488
    throw v1

    .line 490
    :cond_0
    return-wide v4
.end method

.method public set(JLjava/lang/String;Ljava/util/Locale;)J
    .locals 7

    .prologue
    .line 495
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v0

    .line 496
    iget-object v2, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1, p3, p4}, Lorg/joda/time/DateTimeField;->set(JLjava/lang/String;Ljava/util/Locale;)J

    move-result-wide v1

    .line 497
    iget-object v0, p0, Lorg/joda/time/chrono/ZonedChronology$ZonedDateTimeField;->iZone:Lorg/joda/time/DateTimeZone;

    const/4 v3, 0x0

    move-wide v4, p1

    invoke-virtual/range {v0 .. v5}, Lorg/joda/time/DateTimeZone;->convertLocalToUTC(JZJ)J

    move-result-wide v0

    return-wide v0
.end method
