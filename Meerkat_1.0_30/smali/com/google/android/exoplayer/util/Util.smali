.class public final Lcom/google/android/exoplayer/util/Util;
.super Ljava/lang/Object;
.source "Util.java"


# static fields
.field public static final SDK_INT:I

.field private static final XS_DATE_TIME_PATTERN:Ljava/util/regex/Pattern;

.field private static final XS_DURATION_PATTERN:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    sput v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    .line 52
    const-string v0, "(\\d\\d\\d\\d)\\-(\\d\\d)\\-(\\d\\d)[Tt](\\d\\d):(\\d\\d):(\\d\\d)(\\.(\\d+))?([Zz]|((\\+|\\-)(\\d\\d):(\\d\\d)))?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/util/Util;->XS_DATE_TIME_PATTERN:Ljava/util/regex/Pattern;

    .line 57
    const-string v0, "^(-)?P(([0-9]*)Y)?(([0-9]*)M)?(([0-9]*)D)?(T(([0-9]*)H)?(([0-9]*)M)?(([0-9.]*)S)?)?$"

    .line 58
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/util/Util;->XS_DURATION_PATTERN:Ljava/util/regex/Pattern;

    .line 57
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "o1"    # Ljava/lang/Object;
    .param p1, "o2"    # Ljava/lang/Object;

    .prologue
    .line 81
    if-nez p0, :cond_1

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public static binarySearchCeil(Ljava/util/List;Ljava/lang/Object;ZZ)I
    .locals 2
    .param p2, "inclusive"    # Z
    .param p3, "stayInBounds"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<+",
            "Ljava/lang/Comparable",
            "<-TT;>;>;TT;ZZ)I"
        }
    .end annotation

    .prologue
    .line 264
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<+Ljava/lang/Comparable<-TT;>;>;"
    .local p1, "key":Ljava/lang/Object;, "TT;"
    invoke-static {p0, p1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v0

    .line 265
    .local v0, "index":I
    if-gez v0, :cond_2

    xor-int/lit8 v0, v0, -0x1

    .line 266
    :cond_0
    :goto_0
    if-eqz p3, :cond_1

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .end local v0    # "index":I
    :cond_1
    return v0

    .line 265
    .restart local v0    # "index":I
    :cond_2
    if-nez p2, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static binarySearchCeil([JJZZ)I
    .locals 3
    .param p0, "a"    # [J
    .param p1, "key"    # J
    .param p3, "inclusive"    # Z
    .param p4, "stayInBounds"    # Z

    .prologue
    .line 221
    invoke-static {p0, p1, p2}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v0

    .line 222
    .local v0, "index":I
    if-gez v0, :cond_2

    xor-int/lit8 v0, v0, -0x1

    .line 223
    :cond_0
    :goto_0
    if-eqz p4, :cond_1

    array-length v1, p0

    add-int/lit8 v1, v1, -0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .end local v0    # "index":I
    :cond_1
    return v0

    .line 222
    .restart local v0    # "index":I
    :cond_2
    if-nez p3, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static binarySearchFloor(Ljava/util/List;Ljava/lang/Object;ZZ)I
    .locals 2
    .param p2, "inclusive"    # Z
    .param p3, "stayInBounds"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<+",
            "Ljava/lang/Comparable",
            "<-TT;>;>;TT;ZZ)I"
        }
    .end annotation

    .prologue
    .line 242
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<+Ljava/lang/Comparable<-TT;>;>;"
    .local p1, "key":Ljava/lang/Object;, "TT;"
    invoke-static {p0, p1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v0

    .line 243
    .local v0, "index":I
    if-gez v0, :cond_2

    add-int/lit8 v1, v0, 0x2

    neg-int v0, v1

    .line 244
    :cond_0
    :goto_0
    if-eqz p3, :cond_1

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .end local v0    # "index":I
    :cond_1
    return v0

    .line 243
    .restart local v0    # "index":I
    :cond_2
    if-nez p2, :cond_0

    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public static binarySearchFloor([JJZZ)I
    .locals 3
    .param p0, "a"    # [J
    .param p1, "key"    # J
    .param p3, "inclusive"    # Z
    .param p4, "stayInBounds"    # Z

    .prologue
    .line 200
    invoke-static {p0, p1, p2}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v0

    .line 201
    .local v0, "index":I
    if-gez v0, :cond_2

    add-int/lit8 v1, v0, 0x2

    neg-int v0, v1

    .line 202
    :cond_0
    :goto_0
    if-eqz p4, :cond_1

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .end local v0    # "index":I
    :cond_1
    return v0

    .line 201
    .restart local v0    # "index":I
    :cond_2
    if-nez p3, :cond_0

    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public static closeQuietly(Lcom/google/android/exoplayer/upstream/DataSource;)V
    .locals 1
    .param p0, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;

    .prologue
    .line 121
    :try_start_0
    invoke-interface {p0}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    :goto_0
    return-void

    .line 122
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static getMergedUri(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;
    .locals 3
    .param p0, "baseUri"    # Landroid/net/Uri;
    .param p1, "stringUri"    # Ljava/lang/String;

    .prologue
    .line 164
    if-nez p1, :cond_0

    .line 182
    .end local p0    # "baseUri":Landroid/net/Uri;
    :goto_0
    return-object p0

    .line 167
    .restart local p0    # "baseUri":Landroid/net/Uri;
    :cond_0
    if-nez p0, :cond_1

    .line 168
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    goto :goto_0

    .line 170
    :cond_1
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 171
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 172
    new-instance v1, Landroid/net/Uri$Builder;

    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    .line 173
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    .line 174
    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    .line 175
    invoke-virtual {v1, p1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    .line 176
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    goto :goto_0

    .line 178
    :cond_2
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 179
    .local v0, "uri":Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/net/Uri;->isAbsolute()Z

    move-result v1

    if-eqz v1, :cond_3

    move-object p0, v0

    .line 180
    goto :goto_0

    .line 182
    :cond_3
    invoke-static {p0, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    goto :goto_0
.end method

.method public static isUrlLocalFile(Ljava/net/URL;)Z
    .locals 2
    .param p0, "url"    # Ljava/net/URL;

    .prologue
    .line 69
    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "file"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static newSingleThreadExecutor(Ljava/lang/String;)Ljava/util/concurrent/ExecutorService;
    .locals 1
    .param p0, "threadName"    # Ljava/lang/String;

    .prologue
    .line 91
    new-instance v0, Lcom/google/android/exoplayer/util/Util$1;

    invoke-direct {v0, p0}, Lcom/google/android/exoplayer/util/Util$1;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method public static newSingleThreadScheduledExecutor(Ljava/lang/String;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1
    .param p0, "threadName"    # Ljava/lang/String;

    .prologue
    .line 106
    new-instance v0, Lcom/google/android/exoplayer/util/Util$2;

    invoke-direct {v0, p0}, Lcom/google/android/exoplayer/util/Util$2;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    return-object v0
.end method

.method public static parseBaseUri(Ljava/lang/String;)Landroid/net/Uri;
    .locals 2
    .param p0, "uriString"    # Ljava/lang/String;

    .prologue
    .line 145
    const/4 v0, 0x0

    const/16 v1, 0x2f

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public static parseXsDateTime(Ljava/lang/String;)J
    .locals 14
    .param p0, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x9

    const/16 v13, 0x8

    const/4 v12, 0x3

    .line 308
    sget-object v1, Lcom/google/android/exoplayer/util/Util;->XS_DATE_TIME_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    .line 309
    .local v8, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_0

    .line 310
    new-instance v1, Ljava/text/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid date/time format: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 314
    :cond_0
    invoke-virtual {v8, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_4

    .line 316
    const/4 v9, 0x0

    .line 327
    .local v9, "timezoneShift":I
    :cond_1
    :goto_0
    new-instance v0, Ljava/util/GregorianCalendar;

    const-string v1, "GMT"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 329
    .local v0, "dateTime":Ljava/util/Calendar;
    invoke-virtual {v0}, Ljava/util/Calendar;->clear()V

    .line 331
    const/4 v1, 0x1

    invoke-virtual {v8, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x2

    .line 332
    invoke-virtual {v8, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    .line 333
    invoke-virtual {v8, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x4

    .line 334
    invoke-virtual {v8, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x5

    .line 335
    invoke-virtual {v8, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x6

    .line 336
    invoke-virtual {v8, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 331
    invoke-virtual/range {v0 .. v6}, Ljava/util/Calendar;->set(IIIIII)V

    .line 337
    invoke-virtual {v8, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 338
    new-instance v7, Ljava/math/BigDecimal;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "0."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v8, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 340
    .local v7, "bd":Ljava/math/BigDecimal;
    const/16 v1, 0xe

    invoke-virtual {v7, v12}, Ljava/math/BigDecimal;->movePointRight(I)Ljava/math/BigDecimal;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigDecimal;->intValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 343
    .end local v7    # "bd":Ljava/math/BigDecimal;
    :cond_2
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v10

    .line 344
    .local v10, "time":J
    if-eqz v9, :cond_3

    .line 345
    const v1, 0xea60

    mul-int/2addr v1, v9

    int-to-long v2, v1

    sub-long/2addr v10, v2

    .line 348
    :cond_3
    return-wide v10

    .line 317
    .end local v0    # "dateTime":Ljava/util/Calendar;
    .end local v9    # "timezoneShift":I
    .end local v10    # "time":J
    :cond_4
    invoke-virtual {v8, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Z"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 318
    const/4 v9, 0x0

    .restart local v9    # "timezoneShift":I
    goto/16 :goto_0

    .line 320
    .end local v9    # "timezoneShift":I
    :cond_5
    const/16 v1, 0xc

    invoke-virtual {v8, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    mul-int/lit8 v1, v1, 0x3c

    const/16 v2, 0xd

    .line 321
    invoke-virtual {v8, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    add-int v9, v1, v2

    .line 322
    .restart local v9    # "timezoneShift":I
    const/16 v1, 0xb

    invoke-virtual {v8, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 323
    mul-int/lit8 v9, v9, -0x1

    goto/16 :goto_0
.end method

.method public static parseXsDuration(Ljava/lang/String;)J
    .locals 18
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 276
    sget-object v14, Lcom/google/android/exoplayer/util/Util;->XS_DURATION_PATTERN:Ljava/util/regex/Pattern;

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    .line 277
    .local v8, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v14

    if-eqz v14, :cond_8

    .line 278
    const/4 v14, 0x1

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_1

    const/4 v11, 0x1

    .line 281
    .local v11, "negated":Z
    :goto_0
    const/4 v14, 0x3

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    .line 282
    .local v13, "years":Ljava/lang/String;
    if-eqz v13, :cond_2

    invoke-static {v13}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v14

    const-wide v16, 0x417e1852c0000000L    # 3.1556908E7

    mul-double v6, v14, v16

    .line 283
    .local v6, "durationSeconds":D
    :goto_1
    const/4 v14, 0x5

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    .line 284
    .local v10, "months":Ljava/lang/String;
    if-eqz v10, :cond_3

    invoke-static {v10}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v14

    const-wide v16, 0x4144103580000000L    # 2629739.0

    mul-double v14, v14, v16

    :goto_2
    add-double/2addr v6, v14

    .line 285
    const/4 v14, 0x7

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 286
    .local v2, "days":Ljava/lang/String;
    if-eqz v2, :cond_4

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v14

    const-wide v16, 0x40f5180000000000L    # 86400.0

    mul-double v14, v14, v16

    :goto_3
    add-double/2addr v6, v14

    .line 287
    const/16 v14, 0xa

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    .line 288
    .local v3, "hours":Ljava/lang/String;
    if-eqz v3, :cond_5

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v14

    const-wide v16, 0x40ac200000000000L    # 3600.0

    mul-double v14, v14, v16

    :goto_4
    add-double/2addr v6, v14

    .line 289
    const/16 v14, 0xc

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    .line 290
    .local v9, "minutes":Ljava/lang/String;
    if-eqz v9, :cond_6

    invoke-static {v9}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v14

    const-wide/high16 v16, 0x404e000000000000L    # 60.0

    mul-double v14, v14, v16

    :goto_5
    add-double/2addr v6, v14

    .line 291
    const/16 v14, 0xe

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    .line 292
    .local v12, "seconds":Ljava/lang/String;
    if-eqz v12, :cond_7

    invoke-static {v12}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v14

    :goto_6
    add-double/2addr v6, v14

    .line 293
    const-wide v14, 0x408f400000000000L    # 1000.0

    mul-double/2addr v14, v6

    double-to-long v4, v14

    .line 294
    .local v4, "durationMillis":J
    if-eqz v11, :cond_0

    neg-long v4, v4

    .line 296
    .end local v2    # "days":Ljava/lang/String;
    .end local v3    # "hours":Ljava/lang/String;
    .end local v4    # "durationMillis":J
    .end local v6    # "durationSeconds":D
    .end local v9    # "minutes":Ljava/lang/String;
    .end local v10    # "months":Ljava/lang/String;
    .end local v11    # "negated":Z
    .end local v12    # "seconds":Ljava/lang/String;
    .end local v13    # "years":Ljava/lang/String;
    :cond_0
    :goto_7
    return-wide v4

    .line 278
    :cond_1
    const/4 v11, 0x0

    goto :goto_0

    .line 282
    .restart local v11    # "negated":Z
    .restart local v13    # "years":Ljava/lang/String;
    :cond_2
    const-wide/16 v6, 0x0

    goto :goto_1

    .line 284
    .restart local v6    # "durationSeconds":D
    .restart local v10    # "months":Ljava/lang/String;
    :cond_3
    const-wide/16 v14, 0x0

    goto :goto_2

    .line 286
    .restart local v2    # "days":Ljava/lang/String;
    :cond_4
    const-wide/16 v14, 0x0

    goto :goto_3

    .line 288
    .restart local v3    # "hours":Ljava/lang/String;
    :cond_5
    const-wide/16 v14, 0x0

    goto :goto_4

    .line 290
    .restart local v9    # "minutes":Ljava/lang/String;
    :cond_6
    const-wide/16 v14, 0x0

    goto :goto_5

    .line 292
    .restart local v12    # "seconds":Ljava/lang/String;
    :cond_7
    const-wide/16 v14, 0x0

    goto :goto_6

    .line 296
    .end local v2    # "days":Ljava/lang/String;
    .end local v3    # "hours":Ljava/lang/String;
    .end local v6    # "durationSeconds":D
    .end local v9    # "minutes":Ljava/lang/String;
    .end local v10    # "months":Ljava/lang/String;
    .end local v11    # "negated":Z
    .end local v12    # "seconds":Ljava/lang/String;
    .end local v13    # "years":Ljava/lang/String;
    :cond_8
    invoke-static/range {p0 .. p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v14

    const-wide v16, 0x40ac200000000000L    # 3600.0

    mul-double v14, v14, v16

    const-wide v16, 0x408f400000000000L    # 1000.0

    mul-double v14, v14, v16

    double-to-long v4, v14

    goto :goto_7
.end method

.method public static scaleLargeTimestamp(JJJ)J
    .locals 8
    .param p0, "timestamp"    # J
    .param p2, "multiplier"    # J
    .param p4, "divisor"    # J

    .prologue
    const-wide/16 v6, 0x0

    .line 363
    cmp-long v4, p4, p2

    if-ltz v4, :cond_0

    rem-long v4, p4, p2

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    .line 364
    div-long v0, p4, p2

    .line 365
    .local v0, "divisionFactor":J
    div-long v4, p0, v0

    .line 371
    .end local v0    # "divisionFactor":J
    :goto_0
    return-wide v4

    .line 366
    :cond_0
    cmp-long v4, p4, p2

    if-gez v4, :cond_1

    rem-long v4, p2, p4

    cmp-long v4, v4, v6

    if-nez v4, :cond_1

    .line 367
    div-long v2, p2, p4

    .line 368
    .local v2, "multiplicationFactor":J
    mul-long v4, p0, v2

    goto :goto_0

    .line 370
    .end local v2    # "multiplicationFactor":J
    :cond_1
    long-to-double v4, p2

    long-to-double v6, p4

    div-double v2, v4, v6

    .line 371
    .local v2, "multiplicationFactor":D
    long-to-double v4, p0

    mul-double/2addr v4, v2

    double-to-long v4, v4

    goto :goto_0
.end method

.method public static scaleLargeTimestamps(Ljava/util/List;JJ)[J
    .locals 11
    .param p1, "multiplier"    # J
    .param p3, "divisor"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;JJ)[J"
        }
    .end annotation

    .prologue
    .local p0, "timestamps":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    const-wide/16 v8, 0x0

    .line 384
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v6

    new-array v3, v6, [J

    .line 385
    .local v3, "scaledTimestamps":[J
    cmp-long v6, p3, p1

    if-ltz v6, :cond_0

    rem-long v6, p3, p1

    cmp-long v6, v6, v8

    if-nez v6, :cond_0

    .line 386
    div-long v0, p3, p1

    .line 387
    .local v0, "divisionFactor":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v6, v3

    if-ge v2, v6, :cond_2

    .line 388
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    div-long/2addr v6, v0

    aput-wide v6, v3, v2

    .line 387
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 390
    .end local v0    # "divisionFactor":J
    .end local v2    # "i":I
    :cond_0
    cmp-long v6, p3, p1

    if-gez v6, :cond_1

    rem-long v6, p1, p3

    cmp-long v6, v6, v8

    if-nez v6, :cond_1

    .line 391
    div-long v4, p1, p3

    .line 392
    .local v4, "multiplicationFactor":J
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_1
    array-length v6, v3

    if-ge v2, v6, :cond_2

    .line 393
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    mul-long/2addr v6, v4

    aput-wide v6, v3, v2

    .line 392
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 396
    .end local v2    # "i":I
    .end local v4    # "multiplicationFactor":J
    :cond_1
    long-to-double v6, p1

    long-to-double v8, p3

    div-double v4, v6, v8

    .line 397
    .local v4, "multiplicationFactor":D
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_2
    array-length v6, v3

    if-ge v2, v6, :cond_2

    .line 398
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    long-to-double v6, v6

    mul-double/2addr v6, v4

    double-to-long v6, v6

    aput-wide v6, v3, v2

    .line 397
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 401
    .end local v4    # "multiplicationFactor":D
    :cond_2
    return-object v3
.end method

.method public static scaleLargeTimestampsInPlace([JJJ)V
    .locals 11
    .param p0, "timestamps"    # [J
    .param p1, "multiplier"    # J
    .param p3, "divisor"    # J

    .prologue
    const-wide/16 v8, 0x0

    .line 412
    cmp-long v3, p3, p1

    if-ltz v3, :cond_0

    rem-long v6, p3, p1

    cmp-long v3, v6, v8

    if-nez v3, :cond_0

    .line 413
    div-long v0, p3, p1

    .line 414
    .local v0, "divisionFactor":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_2

    .line 415
    aget-wide v6, p0, v2

    div-long/2addr v6, v0

    aput-wide v6, p0, v2

    .line 414
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 417
    .end local v0    # "divisionFactor":J
    .end local v2    # "i":I
    :cond_0
    cmp-long v3, p3, p1

    if-gez v3, :cond_1

    rem-long v6, p1, p3

    cmp-long v3, v6, v8

    if-nez v3, :cond_1

    .line 418
    div-long v4, p1, p3

    .line 419
    .local v4, "multiplicationFactor":J
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_1
    array-length v3, p0

    if-ge v2, v3, :cond_2

    .line 420
    aget-wide v6, p0, v2

    mul-long/2addr v6, v4

    aput-wide v6, p0, v2

    .line 419
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 423
    .end local v2    # "i":I
    .end local v4    # "multiplicationFactor":J
    :cond_1
    long-to-double v6, p1

    long-to-double v8, p3

    div-double v4, v6, v8

    .line 424
    .local v4, "multiplicationFactor":D
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_2
    array-length v3, p0

    if-ge v2, v3, :cond_2

    .line 425
    aget-wide v6, p0, v2

    long-to-double v6, v6

    mul-double/2addr v6, v4

    double-to-long v6, v6

    aput-wide v6, p0, v2

    .line 424
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 428
    .end local v4    # "multiplicationFactor":D
    :cond_2
    return-void
.end method

.method public static toArray(Ljava/util/List;)[I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)[I"
        }
    .end annotation

    .prologue
    .line 437
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    if-nez p0, :cond_1

    .line 438
    const/4 v1, 0x0

    .line 445
    :cond_0
    return-object v1

    .line 440
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    .line 441
    .local v2, "length":I
    new-array v1, v2, [I

    .line 442
    .local v1, "intArray":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 443
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v1, v0

    .line 442
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static toLowerInvariant(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 134
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
