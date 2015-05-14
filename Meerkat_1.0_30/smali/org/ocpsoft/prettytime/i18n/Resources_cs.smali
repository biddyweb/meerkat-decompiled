.class public Lorg/ocpsoft/prettytime/i18n/Resources_cs;
.super Ljava/util/ListResourceBundle;
.source "Resources_cs.java"

# interfaces
.implements Lorg/ocpsoft/prettytime/impl/TimeFormatProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;,
        Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormat;,
        Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;
    }
.end annotation


# static fields
.field private static final OBJECTS:[[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 43
    const/16 v0, 0x67

    new-array v0, v0, [[Ljava/lang/Object;

    new-array v1, v6, [Ljava/lang/Object;

    const-string v2, "CenturyPattern"

    aput-object v2, v1, v4

    const-string v2, "%n %u"

    aput-object v2, v1, v5

    aput-object v1, v0, v4

    new-array v1, v6, [Ljava/lang/Object;

    const-string v2, "CenturyFuturePrefix"

    aput-object v2, v1, v4

    const-string v2, "za "

    aput-object v2, v1, v5

    aput-object v1, v0, v5

    new-array v1, v6, [Ljava/lang/Object;

    const-string v2, "CenturyFutureSuffix"

    aput-object v2, v1, v4

    const-string v2, ""

    aput-object v2, v1, v5

    aput-object v1, v0, v6

    const/4 v1, 0x3

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "CenturyPastPrefix"

    aput-object v3, v2, v4

    const-string v3, "p\u0159ed "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/4 v1, 0x4

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "CenturyPastSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/4 v1, 0x5

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "CenturySingularName"

    aput-object v3, v2, v4

    const-string v3, "stolet\u00ed"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/4 v1, 0x6

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "CenturyPluralName"

    aput-object v3, v2, v4

    const-string v3, "stolet\u00ed"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/4 v1, 0x7

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "CenturyPastSingularName"

    aput-object v3, v2, v4

    const-string v3, "stolet\u00edm"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x8

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "CenturyPastPluralName"

    aput-object v3, v2, v4

    const-string v3, "stolet\u00edmi"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x9

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "CenturyFutureSingularName"

    aput-object v3, v2, v4

    const-string v3, "stolet\u00ed"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xa

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "CenturyFuturePluralName"

    aput-object v3, v2, v4

    const-string v3, "stolet\u00ed"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xb

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DayPattern"

    aput-object v3, v2, v4

    const-string v3, "%n %u"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xc

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DayFuturePrefix"

    aput-object v3, v2, v4

    const-string v3, "za "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xd

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DayFutureSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xe

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DayPastPrefix"

    aput-object v3, v2, v4

    const-string v3, "p\u0159ed "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xf

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DayPastSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x10

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DaySingularName"

    aput-object v3, v2, v4

    const-string v3, "den"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x11

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DayPluralName"

    aput-object v3, v2, v4

    const-string v3, "dny"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x12

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DecadePattern"

    aput-object v3, v2, v4

    const-string v3, "%n %u"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x13

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DecadeFuturePrefix"

    aput-object v3, v2, v4

    const-string v3, "za "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x14

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DecadeFutureSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x15

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DecadePastPrefix"

    aput-object v3, v2, v4

    const-string v3, "p\u0159ed "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x16

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DecadePastSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x17

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DecadeSingularName"

    aput-object v3, v2, v4

    const-string v3, "desetilet\u00ed"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x18

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DecadePluralName"

    aput-object v3, v2, v4

    const-string v3, "desetilet\u00ed"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x19

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DecadePastSingularName"

    aput-object v3, v2, v4

    const-string v3, "desetilet\u00edm"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DecadePastPluralName"

    aput-object v3, v2, v4

    const-string v3, "desetilet\u00edmi"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DecadeFutureSingularName"

    aput-object v3, v2, v4

    const-string v3, "desetilet\u00ed"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "DecadeFuturePluralName"

    aput-object v3, v2, v4

    const-string v3, "desetilet\u00ed"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "HourPattern"

    aput-object v3, v2, v4

    const-string v3, "%n %u"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "HourFuturePrefix"

    aput-object v3, v2, v4

    const-string v3, "za "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "HourFutureSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x20

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "HourPastPrefix"

    aput-object v3, v2, v4

    const-string v3, "p\u0159ed"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x21

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "HourPastSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x22

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "HourSingularName"

    aput-object v3, v2, v4

    const-string v3, "hodina"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x23

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "HourPluralName"

    aput-object v3, v2, v4

    const-string v3, "hodiny"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x24

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "JustNowPattern"

    aput-object v3, v2, v4

    const-string v3, "%u"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x25

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "JustNowFuturePrefix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x26

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "JustNowFutureSuffix"

    aput-object v3, v2, v4

    const-string v3, "za chv\u00edli"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x27

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "JustNowPastPrefix"

    aput-object v3, v2, v4

    const-string v3, "p\u0159ed chv\u00edl\u00ed"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x28

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "JustNowPastSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x29

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "JustNowSingularName"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "JustNowPluralName"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillenniumPattern"

    aput-object v3, v2, v4

    const-string v3, "%n %u"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillenniumFuturePrefix"

    aput-object v3, v2, v4

    const-string v3, "za "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillenniumFutureSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillenniumPastPrefix"

    aput-object v3, v2, v4

    const-string v3, "p\u0159ed "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillenniumPastSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x30

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillenniumSingularName"

    aput-object v3, v2, v4

    const-string v3, "tis\u00edcilet\u00ed"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x31

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillenniumPluralName"

    aput-object v3, v2, v4

    const-string v3, "tis\u00edcilet\u00ed"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x32

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillisecondPattern"

    aput-object v3, v2, v4

    const-string v3, "%n %u"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x33

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillisecondFuturePrefix"

    aput-object v3, v2, v4

    const-string v3, "za "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x34

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillisecondFutureSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x35

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillisecondPastPrefix"

    aput-object v3, v2, v4

    const-string v3, "p\u0159ed "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x36

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillisecondPastSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x37

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillisecondSingularName"

    aput-object v3, v2, v4

    const-string v3, "milisekunda"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x38

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillisecondPluralName"

    aput-object v3, v2, v4

    const-string v3, "milisekundy"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x39

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillisecondPastSingularName"

    aput-object v3, v2, v4

    const-string v3, "milisekundou"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3a

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillisecondPastPluralName"

    aput-object v3, v2, v4

    const-string v3, "milisekundami"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3b

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillisecondFutureSingularName"

    aput-object v3, v2, v4

    const-string v3, "milisekundu"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3c

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MillisecondFuturePluralName"

    aput-object v3, v2, v4

    const-string v3, "milisekund"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3d

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MinutePattern"

    aput-object v3, v2, v4

    const-string v3, "%n %u"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3e

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MinuteFuturePrefix"

    aput-object v3, v2, v4

    const-string v3, "za "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3f

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MinuteFutureSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x40

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MinutePastPrefix"

    aput-object v3, v2, v4

    const-string v3, "p\u0159ed "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x41

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MinutePastSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x42

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MinuteSingularName"

    aput-object v3, v2, v4

    const-string v3, "minuta"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x43

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MinutePluralName"

    aput-object v3, v2, v4

    const-string v3, "minuty"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x44

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MonthPattern"

    aput-object v3, v2, v4

    const-string v3, "%n %u"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x45

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MonthFuturePrefix"

    aput-object v3, v2, v4

    const-string v3, "za "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x46

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MonthFutureSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x47

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MonthPastPrefix"

    aput-object v3, v2, v4

    const-string v3, "p\u0159ed "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x48

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MonthPastSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x49

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MonthSingularName"

    aput-object v3, v2, v4

    const-string v3, "m\u011bs\u00edc"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4a

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "MonthPluralName"

    aput-object v3, v2, v4

    const-string v3, "m\u011bs\u00edce"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4b

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "SecondPattern"

    aput-object v3, v2, v4

    const-string v3, "%n %u"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4c

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "SecondFuturePrefix"

    aput-object v3, v2, v4

    const-string v3, "za "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4d

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "SecondFutureSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4e

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "SecondPastPrefix"

    aput-object v3, v2, v4

    const-string v3, "p\u0159ed "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4f

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "SecondPastSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x50

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "SecondSingularName"

    aput-object v3, v2, v4

    const-string v3, "sekunda"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x51

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "SecondPluralName"

    aput-object v3, v2, v4

    const-string v3, "sekundy"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x52

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "WeekPattern"

    aput-object v3, v2, v4

    const-string v3, "%n %u"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x53

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "WeekFuturePrefix"

    aput-object v3, v2, v4

    const-string v3, "za "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x54

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "WeekFutureSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x55

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "WeekPastPrefix"

    aput-object v3, v2, v4

    const-string v3, "p\u0159ed "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x56

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "WeekPastSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x57

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "WeekSingularName"

    aput-object v3, v2, v4

    const-string v3, "t\u00fdden"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x58

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "WeekPluralName"

    aput-object v3, v2, v4

    const-string v3, "t\u00fddny"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x59

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "YearPattern"

    aput-object v3, v2, v4

    const-string v3, "%n %u"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5a

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "YearFuturePrefix"

    aput-object v3, v2, v4

    const-string v3, "za "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5b

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "YearFutureSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5c

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "YearPastPrefix"

    aput-object v3, v2, v4

    const-string v3, "p\u0159ed "

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5d

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "YearPastSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5e

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "YearSingularName"

    aput-object v3, v2, v4

    const-string v3, "rok"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5f

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "YearPluralName"

    aput-object v3, v2, v4

    const-string v3, "roky"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x60

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "AbstractTimeUnitPattern"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x61

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "AbstractTimeUnitFuturePrefix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x62

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "AbstractTimeUnitFutureSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x63

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "AbstractTimeUnitPastPrefix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x64

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "AbstractTimeUnitPastSuffix"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x65

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "AbstractTimeUnitSingularName"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x66

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "AbstractTimeUnitPluralName"

    aput-object v3, v2, v4

    const-string v3, ""

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    sput-object v0, Lorg/ocpsoft/prettytime/i18n/Resources_cs;->OBJECTS:[[Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/util/ListResourceBundle;-><init>()V

    .line 317
    return-void
.end method


# virtual methods
.method public getContents()[[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 164
    sget-object v0, Lorg/ocpsoft/prettytime/i18n/Resources_cs;->OBJECTS:[[Ljava/lang/Object;

    return-object v0
.end method

.method public getFormatFor(Lorg/ocpsoft/prettytime/TimeUnit;)Lorg/ocpsoft/prettytime/TimeFormat;
    .locals 8
    .param p1, "t"    # Lorg/ocpsoft/prettytime/TimeUnit;

    .prologue
    const-wide/16 v6, 0x4

    const-wide v4, 0x7fffffffffffffffL

    const-wide/16 v2, 0x1

    .line 169
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Minute;

    if-eqz v0, :cond_0

    .line 170
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    const-string v1, "Minute"

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "minutu"

    invoke-virtual {v0, v1, v2, v3}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "minuty"

    invoke-virtual {v0, v1, v6, v7}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "minut"

    invoke-virtual {v0, v1, v4, v5}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "minutou"

    invoke-virtual {v0, v1, v2, v3}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addPastName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "minutami"

    invoke-virtual {v0, v1, v4, v5}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addPastName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->build(Ljava/util/ResourceBundle;)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormat;

    move-result-object v0

    .line 219
    :goto_0
    return-object v0

    .line 177
    :cond_0
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Hour;

    if-eqz v0, :cond_1

    .line 178
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    const-string v1, "Hour"

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "hodinu"

    invoke-virtual {v0, v1, v2, v3}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "hodiny"

    invoke-virtual {v0, v1, v6, v7}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "hodin"

    invoke-virtual {v0, v1, v4, v5}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "hodinou"

    invoke-virtual {v0, v1, v2, v3}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addPastName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "hodinami"

    invoke-virtual {v0, v1, v4, v5}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addPastName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->build(Ljava/util/ResourceBundle;)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormat;

    move-result-object v0

    goto :goto_0

    .line 185
    :cond_1
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Day;

    if-eqz v0, :cond_2

    .line 186
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    const-string v1, "Day"

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "den"

    invoke-virtual {v0, v1, v2, v3}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "dny"

    invoke-virtual {v0, v1, v6, v7}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "dn\u00ed"

    invoke-virtual {v0, v1, v4, v5}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "dnem"

    invoke-virtual {v0, v1, v2, v3}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addPastName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "dny"

    invoke-virtual {v0, v1, v4, v5}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addPastName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->build(Ljava/util/ResourceBundle;)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormat;

    move-result-object v0

    goto :goto_0

    .line 193
    :cond_2
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Week;

    if-eqz v0, :cond_3

    .line 194
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    const-string v1, "Week"

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "t\u00fdden"

    invoke-virtual {v0, v1, v2, v3}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "t\u00fddny"

    invoke-virtual {v0, v1, v6, v7}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "t\u00fddn\u016f"

    invoke-virtual {v0, v1, v4, v5}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "t\u00fddnem"

    invoke-virtual {v0, v1, v2, v3}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addPastName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "t\u00fddny"

    invoke-virtual {v0, v1, v4, v5}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addPastName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->build(Ljava/util/ResourceBundle;)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormat;

    move-result-object v0

    goto/16 :goto_0

    .line 201
    :cond_3
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Month;

    if-eqz v0, :cond_4

    .line 202
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    const-string v1, "Month"

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "m\u011bs\u00edc"

    invoke-virtual {v0, v1, v2, v3}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "m\u011bs\u00edce"

    invoke-virtual {v0, v1, v6, v7}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "m\u011bs\u00edc\u016f"

    invoke-virtual {v0, v1, v4, v5}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "m\u011bs\u00edcem"

    invoke-virtual {v0, v1, v2, v3}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addPastName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "m\u011bs\u00edci"

    invoke-virtual {v0, v1, v4, v5}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addPastName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->build(Ljava/util/ResourceBundle;)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormat;

    move-result-object v0

    goto/16 :goto_0

    .line 209
    :cond_4
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Year;

    if-eqz v0, :cond_5

    .line 210
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    const-string v1, "Year"

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "rok"

    invoke-virtual {v0, v1, v2, v3}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "roky"

    invoke-virtual {v0, v1, v6, v7}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "let"

    invoke-virtual {v0, v1, v4, v5}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "rokem"

    invoke-virtual {v0, v1, v2, v3}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addPastName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    const-string v1, "roky"

    invoke-virtual {v0, v1, v4, v5}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addPastName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->build(Ljava/util/ResourceBundle;)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormat;

    move-result-object v0

    goto/16 :goto_0

    .line 219
    :cond_5
    const/4 v0, 0x0

    goto/16 :goto_0
.end method
