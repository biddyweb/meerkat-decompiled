.class final Lcom/twitter/sdk/android/tweetui/TweetDateUtils;
.super Ljava/lang/Object;
.source "TweetDateUtils.java"


# static fields
.field static final DATE_TIME_RFC822:Ljava/text/SimpleDateFormat;

.field static final INVALID_DATE:J = -0x1L

.field static final RELATIVE_DATE_FORMAT:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 16
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "EEE MMM dd HH:mm:ss Z yyyy"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/twitter/sdk/android/tweetui/TweetDateUtils;->DATE_TIME_RFC822:Ljava/text/SimpleDateFormat;

    .line 18
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "MM/dd/yy"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/twitter/sdk/android/tweetui/TweetDateUtils;->RELATIVE_DATE_FORMAT:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static apiTimeToLong(Ljava/lang/String;)J
    .locals 4
    .param p0, "apiTime"    # Ljava/lang/String;

    .prologue
    const-wide/16 v2, -0x1

    .line 25
    if-nez p0, :cond_0

    .line 30
    :goto_0
    return-wide v2

    .line 28
    :cond_0
    :try_start_0
    sget-object v1, Lcom/twitter/sdk/android/tweetui/TweetDateUtils;->DATE_TIME_RFC822:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    goto :goto_0

    .line 29
    :catch_0
    move-exception v0

    .line 30
    .local v0, "e":Ljava/text/ParseException;
    goto :goto_0
.end method

.method public static dotPrefix(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "timestamp"    # Ljava/lang/String;

    .prologue
    .line 42
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2022

    if-ne v0, v1, :cond_0

    .line 45
    .end local p0    # "timestamp":Ljava/lang/String;
    :goto_0
    return-object p0

    .restart local p0    # "timestamp":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u2022 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method static getRelativeTimeString(Landroid/content/res/Resources;JJ)Ljava/lang/String;
    .locals 15
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "currentTimeMillis"    # J
    .param p3, "timestamp"    # J

    .prologue
    .line 59
    sub-long v4, p1, p3

    .line 60
    .local v4, "diff":J
    const-wide/16 v10, 0x0

    cmp-long v10, v4, v10

    if-ltz v10, :cond_4

    .line 61
    const-wide/32 v10, 0xea60

    cmp-long v10, v4, v10

    if-gez v10, :cond_0

    .line 62
    const-wide/16 v10, 0x3e8

    div-long v10, v4, v10

    long-to-int v9, v10

    .line 63
    .local v9, "secs":I
    sget v10, Lcom/twitter/sdk/android/tweetui/R$plurals;->tw__time_secs:I

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {p0, v10, v9, v11}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 91
    .end local v9    # "secs":I
    :goto_0
    return-object v10

    .line 64
    :cond_0
    const-wide/32 v10, 0x36ee80

    cmp-long v10, v4, v10

    if-gez v10, :cond_1

    .line 65
    const-wide/32 v10, 0xea60

    div-long v10, v4, v10

    long-to-int v7, v10

    .line 66
    .local v7, "mins":I
    sget v10, Lcom/twitter/sdk/android/tweetui/R$plurals;->tw__time_mins:I

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {p0, v10, v7, v11}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    goto :goto_0

    .line 67
    .end local v7    # "mins":I
    :cond_1
    const-wide/32 v10, 0x5265c00

    cmp-long v10, v4, v10

    if-gez v10, :cond_2

    .line 68
    const-wide/32 v10, 0x36ee80

    div-long v10, v4, v10

    long-to-int v6, v10

    .line 69
    .local v6, "hours":I
    sget v10, Lcom/twitter/sdk/android/tweetui/R$plurals;->tw__time_hours:I

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {p0, v10, v6, v11}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    goto :goto_0

    .line 71
    .end local v6    # "hours":I
    :cond_2
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v8

    .line 72
    .local v8, "now":Ljava/util/Calendar;
    move-wide/from16 v0, p1

    invoke-virtual {v8, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 73
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 74
    .local v2, "c":Ljava/util/Calendar;
    move-wide/from16 v0, p3

    invoke-virtual {v2, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 75
    new-instance v3, Ljava/util/Date;

    move-wide/from16 v0, p3

    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 77
    .local v3, "d":Ljava/util/Date;
    const/4 v10, 0x1

    invoke-virtual {v8, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    const/4 v11, 0x1

    invoke-virtual {v2, v11}, Ljava/util/Calendar;->get(I)I

    move-result v11

    if-ne v10, v11, :cond_3

    .line 79
    sget-object v10, Lcom/twitter/sdk/android/tweetui/TweetDateUtils;->RELATIVE_DATE_FORMAT:Ljava/text/SimpleDateFormat;

    sget v11, Lcom/twitter/sdk/android/tweetui/R$string;->tw__relative_date_format_short:I

    invoke-virtual {p0, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/text/SimpleDateFormat;->applyPattern(Ljava/lang/String;)V

    .line 86
    :goto_1
    sget-object v10, Lcom/twitter/sdk/android/tweetui/TweetDateUtils;->RELATIVE_DATE_FORMAT:Ljava/text/SimpleDateFormat;

    invoke-virtual {v10, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v10

    goto :goto_0

    .line 83
    :cond_3
    sget-object v10, Lcom/twitter/sdk/android/tweetui/TweetDateUtils;->RELATIVE_DATE_FORMAT:Ljava/text/SimpleDateFormat;

    sget v11, Lcom/twitter/sdk/android/tweetui/R$string;->tw__relative_date_format_long:I

    invoke-virtual {p0, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/text/SimpleDateFormat;->applyPattern(Ljava/lang/String;)V

    goto :goto_1

    .line 89
    .end local v2    # "c":Ljava/util/Calendar;
    .end local v3    # "d":Ljava/util/Date;
    .end local v8    # "now":Ljava/util/Calendar;
    :cond_4
    sget-object v10, Lcom/twitter/sdk/android/tweetui/TweetDateUtils;->RELATIVE_DATE_FORMAT:Ljava/text/SimpleDateFormat;

    sget v11, Lcom/twitter/sdk/android/tweetui/R$string;->tw__relative_date_format_long:I

    invoke-virtual {p0, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/text/SimpleDateFormat;->applyPattern(Ljava/lang/String;)V

    .line 91
    sget-object v10, Lcom/twitter/sdk/android/tweetui/TweetDateUtils;->RELATIVE_DATE_FORMAT:Ljava/text/SimpleDateFormat;

    new-instance v11, Ljava/util/Date;

    move-wide/from16 v0, p3

    invoke-direct {v11, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v10, v11}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_0
.end method

.method static isValidTimestamp(Ljava/lang/String;)Z
    .locals 4
    .param p0, "timestamp"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-static {p0}, Lcom/twitter/sdk/android/tweetui/TweetDateUtils;->apiTimeToLong(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
