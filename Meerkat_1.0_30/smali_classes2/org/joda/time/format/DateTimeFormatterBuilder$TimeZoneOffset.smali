.class Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;
.super Ljava/lang/Object;
.source "DateTimeFormatterBuilder.java"

# interfaces
.implements Lorg/joda/time/format/InternalParser;
.implements Lorg/joda/time/format/InternalPrinter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/format/DateTimeFormatterBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TimeZoneOffset"
.end annotation


# instance fields
.field private final iMaxFields:I

.field private final iMinFields:I

.field private final iShowSeparators:Z

.field private final iZeroOffsetParseText:Ljava/lang/String;

.field private final iZeroOffsetPrintText:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;ZII)V
    .locals 1

    .prologue
    const/4 v0, 0x4

    .line 1963
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1964
    iput-object p1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetPrintText:Ljava/lang/String;

    .line 1965
    iput-object p2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetParseText:Ljava/lang/String;

    .line 1966
    iput-boolean p3, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iShowSeparators:Z

    .line 1967
    if-lez p4, :cond_0

    if-ge p5, p4, :cond_1

    .line 1968
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 1970
    :cond_1
    if-le p4, v0, :cond_2

    move p5, v0

    .line 1974
    :goto_0
    iput v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMinFields:I

    .line 1975
    iput p5, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMaxFields:I

    .line 1976
    return-void

    :cond_2
    move v0, p4

    goto :goto_0
.end method

.method private digitCount(Ljava/lang/CharSequence;II)I
    .locals 4

    .prologue
    .line 2232
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    sub-int/2addr v0, p2

    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 2233
    const/4 v1, 0x0

    .line 2234
    :goto_0
    if-lez v0, :cond_0

    .line 2235
    add-int v2, p2, v1

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 2236
    const/16 v3, 0x30

    if-lt v2, v3, :cond_0

    const/16 v3, 0x39

    if-le v2, v3, :cond_1

    .line 2241
    :cond_0
    return v1

    .line 2239
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 2234
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method


# virtual methods
.method public estimateParsedLength()I
    .locals 1

    .prologue
    .line 2053
    invoke-virtual {p0}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->estimatePrintedLength()I

    move-result v0

    return v0
.end method

.method public estimatePrintedLength()I
    .locals 2

    .prologue
    .line 1979
    iget v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMinFields:I

    add-int/lit8 v0, v0, 0x1

    shl-int/lit8 v0, v0, 0x1

    .line 1980
    iget-boolean v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iShowSeparators:Z

    if-eqz v1, :cond_0

    .line 1981
    iget v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMinFields:I

    add-int/lit8 v1, v1, -0x1

    add-int/2addr v0, v1

    .line 1983
    :cond_0
    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetPrintText:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetPrintText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v0, :cond_1

    .line 1984
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetPrintText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 1986
    :cond_1
    return v0
.end method

.method public parseInto(Lorg/joda/time/format/DateTimeParserBucket;Ljava/lang/CharSequence;I)I
    .locals 9

    .prologue
    const/16 v5, 0x2d

    const/16 v4, 0x2b

    const/4 v2, 0x0

    const/4 v1, 0x1

    const/4 v8, 0x2

    .line 2057
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v0

    sub-int v3, v0, p3

    .line 2060
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetParseText:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 2061
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetParseText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    .line 2063
    if-lez v3, :cond_1

    .line 2064
    invoke-interface {p2, p3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 2065
    if-eq v0, v5, :cond_0

    if-ne v0, v4, :cond_1

    .line 2080
    :cond_0
    if-gt v3, v1, :cond_3

    .line 2081
    xor-int/lit8 p3, p3, -0x1

    .line 2224
    :goto_0
    return p3

    .line 2069
    :cond_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/format/DateTimeParserBucket;->setOffset(Ljava/lang/Integer;)V

    goto :goto_0

    .line 2072
    :cond_2
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetParseText:Ljava/lang/String;

    invoke-static {p2, p3, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->csStartsWithIgnoreCase(Ljava/lang/CharSequence;ILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2073
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/format/DateTimeParserBucket;->setOffset(Ljava/lang/Integer;)V

    .line 2074
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetParseText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr p3, v0

    goto :goto_0

    .line 2085
    :cond_3
    invoke-interface {p2, p3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 2086
    if-ne v0, v5, :cond_4

    move v0, v1

    .line 2094
    :goto_1
    add-int/lit8 v3, v3, -0x1

    .line 2095
    add-int/lit8 v4, p3, 0x1

    .line 2109
    invoke-direct {p0, p2, v4, v8}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->digitCount(Ljava/lang/CharSequence;II)I

    move-result v5

    if-ge v5, v8, :cond_6

    .line 2111
    xor-int/lit8 p3, v4, -0x1

    goto :goto_0

    .line 2088
    :cond_4
    if-ne v0, v4, :cond_5

    move v0, v2

    .line 2089
    goto :goto_1

    .line 2091
    :cond_5
    xor-int/lit8 p3, p3, -0x1

    goto :goto_0

    .line 2116
    :cond_6
    invoke-static {p2, v4}, Lorg/joda/time/format/FormatUtils;->parseTwoDigits(Ljava/lang/CharSequence;I)I

    move-result v5

    .line 2117
    const/16 v6, 0x17

    if-le v5, v6, :cond_7

    .line 2118
    xor-int/lit8 p3, v4, -0x1

    goto :goto_0

    .line 2120
    :cond_7
    const v6, 0x36ee80

    mul-int/2addr v5, v6

    .line 2121
    add-int/lit8 v3, v3, -0x2

    .line 2122
    add-int/lit8 v4, v4, 0x2

    .line 2128
    if-gtz v3, :cond_8

    move v1, v5

    move p3, v4

    .line 2223
    :goto_2
    if-eqz v0, :cond_1a

    neg-int v0, v1

    :goto_3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/format/DateTimeParserBucket;->setOffset(Ljava/lang/Integer;)V

    goto :goto_0

    .line 2133
    :cond_8
    invoke-interface {p2, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    .line 2134
    const/16 v7, 0x3a

    if-ne v6, v7, :cond_a

    .line 2136
    add-int/lit8 v2, v3, -0x1

    .line 2137
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    move v3, v2

    move v2, v1

    .line 2146
    :cond_9
    invoke-direct {p0, p2, v4, v8}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->digitCount(Ljava/lang/CharSequence;II)I

    move-result v6

    .line 2147
    if-nez v6, :cond_c

    if-nez v2, :cond_c

    move v1, v5

    move p3, v4

    .line 2148
    goto :goto_2

    .line 2138
    :cond_a
    const/16 v7, 0x30

    if-lt v6, v7, :cond_b

    const/16 v7, 0x39

    if-le v6, v7, :cond_9

    :cond_b
    move v1, v5

    move p3, v4

    goto :goto_2

    .line 2149
    :cond_c
    if-ge v6, v8, :cond_d

    .line 2151
    xor-int/lit8 p3, v4, -0x1

    goto/16 :goto_0

    .line 2154
    :cond_d
    invoke-static {p2, v4}, Lorg/joda/time/format/FormatUtils;->parseTwoDigits(Ljava/lang/CharSequence;I)I

    move-result v6

    .line 2155
    const/16 v7, 0x3b

    if-le v6, v7, :cond_e

    .line 2156
    xor-int/lit8 p3, v4, -0x1

    goto/16 :goto_0

    .line 2158
    :cond_e
    const v7, 0xea60

    mul-int/2addr v6, v7

    add-int/2addr v5, v6

    .line 2159
    add-int/lit8 v3, v3, -0x2

    .line 2160
    add-int/lit8 v4, v4, 0x2

    .line 2164
    if-gtz v3, :cond_f

    move v1, v5

    move p3, v4

    .line 2165
    goto :goto_2

    .line 2168
    :cond_f
    if-eqz v2, :cond_11

    .line 2169
    invoke-interface {p2, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    const/16 v7, 0x3a

    if-eq v6, v7, :cond_10

    move v1, v5

    move p3, v4

    .line 2170
    goto :goto_2

    .line 2172
    :cond_10
    add-int/lit8 v3, v3, -0x1

    .line 2173
    add-int/lit8 v4, v4, 0x1

    .line 2176
    :cond_11
    invoke-direct {p0, p2, v4, v8}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->digitCount(Ljava/lang/CharSequence;II)I

    move-result v6

    .line 2177
    if-nez v6, :cond_12

    if-nez v2, :cond_12

    move v1, v5

    move p3, v4

    .line 2178
    goto :goto_2

    .line 2179
    :cond_12
    if-ge v6, v8, :cond_13

    .line 2181
    xor-int/lit8 p3, v4, -0x1

    goto/16 :goto_0

    .line 2184
    :cond_13
    invoke-static {p2, v4}, Lorg/joda/time/format/FormatUtils;->parseTwoDigits(Ljava/lang/CharSequence;I)I

    move-result v6

    .line 2185
    const/16 v7, 0x3b

    if-le v6, v7, :cond_14

    .line 2186
    xor-int/lit8 p3, v4, -0x1

    goto/16 :goto_0

    .line 2188
    :cond_14
    mul-int/lit16 v6, v6, 0x3e8

    add-int/2addr v5, v6

    .line 2189
    add-int/lit8 v6, v3, -0x2

    .line 2190
    add-int/lit8 v3, v4, 0x2

    .line 2194
    if-gtz v6, :cond_15

    move v1, v5

    move p3, v3

    .line 2195
    goto/16 :goto_2

    .line 2198
    :cond_15
    if-eqz v2, :cond_17

    .line 2199
    invoke-interface {p2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    const/16 v7, 0x2e

    if-eq v4, v7, :cond_16

    invoke-interface {p2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    const/16 v7, 0x2c

    if-eq v4, v7, :cond_16

    move v1, v5

    move p3, v3

    .line 2200
    goto/16 :goto_2

    .line 2202
    :cond_16
    add-int/lit8 v4, v6, -0x1

    .line 2203
    add-int/lit8 v3, v3, 0x1

    .line 2206
    :cond_17
    const/4 v4, 0x3

    invoke-direct {p0, p2, v3, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->digitCount(Ljava/lang/CharSequence;II)I

    move-result v6

    .line 2207
    if-nez v6, :cond_18

    if-nez v2, :cond_18

    move v1, v5

    move p3, v3

    .line 2208
    goto/16 :goto_2

    .line 2209
    :cond_18
    if-ge v6, v1, :cond_19

    .line 2211
    xor-int/lit8 p3, v3, -0x1

    goto/16 :goto_0

    .line 2214
    :cond_19
    add-int/lit8 v4, v3, 0x1

    invoke-interface {p2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    add-int/lit8 v2, v2, -0x30

    mul-int/lit8 v2, v2, 0x64

    add-int/2addr v2, v5

    .line 2215
    if-le v6, v1, :cond_1c

    .line 2216
    add-int/lit8 v3, v4, 0x1

    invoke-interface {p2, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    add-int/lit8 v1, v1, -0x30

    mul-int/lit8 v1, v1, 0xa

    add-int/2addr v1, v2

    .line 2217
    if-le v6, v8, :cond_1b

    .line 2218
    add-int/lit8 v4, v3, 0x1

    invoke-interface {p2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    add-int/lit8 v2, v2, -0x30

    add-int/2addr v1, v2

    move p3, v4

    goto/16 :goto_2

    :cond_1a
    move v0, v1

    .line 2223
    goto/16 :goto_3

    :cond_1b
    move p3, v3

    goto/16 :goto_2

    :cond_1c
    move v1, v2

    move p3, v4

    goto/16 :goto_2
.end method

.method public printTo(Ljava/lang/Appendable;JLorg/joda/time/Chronology;ILorg/joda/time/DateTimeZone;Ljava/util/Locale;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v6, 0xea60

    const/16 v5, 0x3a

    const/4 v2, 0x1

    const/4 v4, 0x3

    const/4 v3, 0x2

    .line 1992
    if-nez p6, :cond_1

    .line 2046
    :cond_0
    :goto_0
    return-void

    .line 1995
    :cond_1
    if-nez p5, :cond_2

    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetPrintText:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 1996
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetPrintText:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_0

    .line 1999
    :cond_2
    if-ltz p5, :cond_9

    .line 2000
    const/16 v0, 0x2b

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 2006
    :goto_1
    const v0, 0x36ee80

    div-int v0, p5, v0

    .line 2007
    invoke-static {p1, v0, v3}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/Appendable;II)V

    .line 2008
    iget v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMaxFields:I

    if-eq v1, v2, :cond_0

    .line 2011
    const v1, 0x36ee80

    mul-int/2addr v0, v1

    sub-int v0, p5, v0

    .line 2012
    if-nez v0, :cond_3

    iget v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMinFields:I

    if-le v1, v2, :cond_0

    .line 2016
    :cond_3
    div-int v1, v0, v6

    .line 2017
    iget-boolean v2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iShowSeparators:Z

    if-eqz v2, :cond_4

    .line 2018
    invoke-interface {p1, v5}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 2020
    :cond_4
    invoke-static {p1, v1, v3}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/Appendable;II)V

    .line 2021
    iget v2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMaxFields:I

    if-eq v2, v3, :cond_0

    .line 2024
    mul-int/2addr v1, v6

    sub-int/2addr v0, v1

    .line 2025
    if-nez v0, :cond_5

    iget v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMinFields:I

    if-le v1, v3, :cond_0

    .line 2029
    :cond_5
    div-int/lit16 v1, v0, 0x3e8

    .line 2030
    iget-boolean v2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iShowSeparators:Z

    if-eqz v2, :cond_6

    .line 2031
    invoke-interface {p1, v5}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 2033
    :cond_6
    invoke-static {p1, v1, v3}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/Appendable;II)V

    .line 2034
    iget v2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMaxFields:I

    if-eq v2, v4, :cond_0

    .line 2037
    mul-int/lit16 v1, v1, 0x3e8

    sub-int/2addr v0, v1

    .line 2038
    if-nez v0, :cond_7

    iget v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMinFields:I

    if-le v1, v4, :cond_0

    .line 2042
    :cond_7
    iget-boolean v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iShowSeparators:Z

    if-eqz v1, :cond_8

    .line 2043
    const/16 v1, 0x2e

    invoke-interface {p1, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 2045
    :cond_8
    invoke-static {p1, v0, v4}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/Appendable;II)V

    goto :goto_0

    .line 2002
    :cond_9
    const/16 v0, 0x2d

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 2003
    neg-int p5, p5

    goto :goto_1
.end method

.method public printTo(Ljava/lang/Appendable;Lorg/joda/time/ReadablePartial;Ljava/util/Locale;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2050
    return-void
.end method
