.class public Lorg/ocpsoft/prettytime/PrettyTime;
.super Ljava/lang/Object;
.source "PrettyTime.java"


# instance fields
.field private volatile locale:Ljava/util/Locale;

.field private mCachedUnits:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/ocpsoft/prettytime/TimeUnit;",
            ">;"
        }
    .end annotation
.end field

.field private volatile reference:Ljava/util/Date;

.field private volatile units:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/ocpsoft/prettytime/TimeUnit;",
            "Lorg/ocpsoft/prettytime/TimeFormat;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    iput-object v0, p0, Lorg/ocpsoft/prettytime/PrettyTime;->locale:Ljava/util/Locale;

    .line 63
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/ocpsoft/prettytime/PrettyTime;->units:Ljava/util/Map;

    .line 71
    invoke-direct {p0}, Lorg/ocpsoft/prettytime/PrettyTime;->initTimeUnits()V

    .line 72
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;)V
    .locals 0
    .param p1, "reference"    # Ljava/util/Date;

    .prologue
    .line 84
    invoke-direct {p0}, Lorg/ocpsoft/prettytime/PrettyTime;-><init>()V

    .line 85
    invoke-virtual {p0, p1}, Lorg/ocpsoft/prettytime/PrettyTime;->setReference(Ljava/util/Date;)Lorg/ocpsoft/prettytime/PrettyTime;

    .line 86
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Ljava/util/Locale;)V
    .locals 0
    .param p1, "reference"    # Ljava/util/Date;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 105
    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/PrettyTime;-><init>(Ljava/util/Locale;)V

    .line 106
    invoke-virtual {p0, p1}, Lorg/ocpsoft/prettytime/PrettyTime;->setReference(Ljava/util/Date;)Lorg/ocpsoft/prettytime/PrettyTime;

    .line 107
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;)V
    .locals 1
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    iput-object v0, p0, Lorg/ocpsoft/prettytime/PrettyTime;->locale:Ljava/util/Locale;

    .line 63
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/ocpsoft/prettytime/PrettyTime;->units:Ljava/util/Map;

    .line 93
    invoke-virtual {p0, p1}, Lorg/ocpsoft/prettytime/PrettyTime;->setLocale(Ljava/util/Locale;)Lorg/ocpsoft/prettytime/PrettyTime;

    .line 94
    invoke-direct {p0}, Lorg/ocpsoft/prettytime/PrettyTime;->initTimeUnits()V

    .line 95
    return-void
.end method

.method private addUnit(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V
    .locals 1
    .param p1, "unit"    # Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    .prologue
    .line 143
    new-instance v0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;

    invoke-direct {v0, p1}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;-><init>(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V

    invoke-virtual {p0, p1, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->registerUnit(Lorg/ocpsoft/prettytime/TimeUnit;Lorg/ocpsoft/prettytime/TimeFormat;)Lorg/ocpsoft/prettytime/PrettyTime;

    .line 144
    return-void
.end method

.method private calculateDuration(J)Lorg/ocpsoft/prettytime/Duration;
    .locals 17
    .param p1, "difference"    # J

    .prologue
    .line 148
    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    .line 151
    .local v0, "absoluteDifference":J
    invoke-virtual/range {p0 .. p0}, Lorg/ocpsoft/prettytime/PrettyTime;->getUnits()Ljava/util/List;

    move-result-object v4

    .line 153
    .local v4, "localUnits":Ljava/util/List;, "Ljava/util/List<Lorg/ocpsoft/prettytime/TimeUnit;>;"
    new-instance v5, Lorg/ocpsoft/prettytime/impl/DurationImpl;

    invoke-direct {v5}, Lorg/ocpsoft/prettytime/impl/DurationImpl;-><init>()V

    .line 155
    .local v5, "result":Lorg/ocpsoft/prettytime/impl/DurationImpl;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v11

    if-ge v2, v11, :cond_2

    .line 157
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/ocpsoft/prettytime/TimeUnit;

    .line 158
    .local v10, "unit":Lorg/ocpsoft/prettytime/TimeUnit;
    invoke-interface {v10}, Lorg/ocpsoft/prettytime/TimeUnit;->getMillisPerUnit()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Math;->abs(J)J

    move-result-wide v6

    .line 159
    .local v6, "millisPerUnit":J
    invoke-interface {v10}, Lorg/ocpsoft/prettytime/TimeUnit;->getMaxQuantity()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Math;->abs(J)J

    move-result-wide v8

    .line 161
    .local v8, "quantity":J
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    if-ne v2, v11, :cond_3

    const/4 v3, 0x1

    .line 163
    .local v3, "isLastUnit":Z
    :goto_1
    const-wide/16 v12, 0x0

    cmp-long v11, v12, v8

    if-nez v11, :cond_0

    if-nez v3, :cond_0

    .line 165
    add-int/lit8 v11, v2, 0x1

    invoke-interface {v4, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/ocpsoft/prettytime/TimeUnit;

    invoke-interface {v11}, Lorg/ocpsoft/prettytime/TimeUnit;->getMillisPerUnit()J

    move-result-wide v12

    invoke-interface {v10}, Lorg/ocpsoft/prettytime/TimeUnit;->getMillisPerUnit()J

    move-result-wide v14

    div-long v8, v12, v14

    .line 169
    :cond_0
    mul-long v12, v6, v8

    cmp-long v11, v12, v0

    if-gtz v11, :cond_1

    if-eqz v3, :cond_5

    .line 171
    :cond_1
    invoke-virtual {v5, v10}, Lorg/ocpsoft/prettytime/impl/DurationImpl;->setUnit(Lorg/ocpsoft/prettytime/TimeUnit;)V

    .line 172
    cmp-long v11, v6, v0

    if-lez v11, :cond_4

    .line 175
    invoke-direct/range {p0 .. p2}, Lorg/ocpsoft/prettytime/PrettyTime;->getSign(J)J

    move-result-wide v12

    invoke-virtual {v5, v12, v13}, Lorg/ocpsoft/prettytime/impl/DurationImpl;->setQuantity(J)V

    .line 176
    const-wide/16 v12, 0x0

    invoke-virtual {v5, v12, v13}, Lorg/ocpsoft/prettytime/impl/DurationImpl;->setDelta(J)V

    .line 187
    .end local v3    # "isLastUnit":Z
    .end local v6    # "millisPerUnit":J
    .end local v8    # "quantity":J
    .end local v10    # "unit":Lorg/ocpsoft/prettytime/TimeUnit;
    :cond_2
    :goto_2
    return-object v5

    .line 161
    .restart local v6    # "millisPerUnit":J
    .restart local v8    # "quantity":J
    .restart local v10    # "unit":Lorg/ocpsoft/prettytime/TimeUnit;
    :cond_3
    const/4 v3, 0x0

    goto :goto_1

    .line 180
    .restart local v3    # "isLastUnit":Z
    :cond_4
    div-long v12, p1, v6

    invoke-virtual {v5, v12, v13}, Lorg/ocpsoft/prettytime/impl/DurationImpl;->setQuantity(J)V

    .line 181
    invoke-virtual {v5}, Lorg/ocpsoft/prettytime/impl/DurationImpl;->getQuantity()J

    move-result-wide v12

    mul-long/2addr v12, v6

    sub-long v12, p1, v12

    invoke-virtual {v5, v12, v13}, Lorg/ocpsoft/prettytime/impl/DurationImpl;->setDelta(J)V

    goto :goto_2

    .line 155
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private getSign(J)J
    .locals 3
    .param p1, "difference"    # J

    .prologue
    .line 192
    const-wide/16 v0, 0x0

    cmp-long v0, v0, p1

    if-lez v0, :cond_0

    .line 194
    const-wide/16 v0, -0x1

    .line 198
    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x1

    goto :goto_0
.end method

.method private initTimeUnits()V
    .locals 1

    .prologue
    .line 127
    new-instance v0, Lorg/ocpsoft/prettytime/units/JustNow;

    invoke-direct {v0}, Lorg/ocpsoft/prettytime/units/JustNow;-><init>()V

    invoke-direct {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->addUnit(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V

    .line 128
    new-instance v0, Lorg/ocpsoft/prettytime/units/Millisecond;

    invoke-direct {v0}, Lorg/ocpsoft/prettytime/units/Millisecond;-><init>()V

    invoke-direct {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->addUnit(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V

    .line 129
    new-instance v0, Lorg/ocpsoft/prettytime/units/Second;

    invoke-direct {v0}, Lorg/ocpsoft/prettytime/units/Second;-><init>()V

    invoke-direct {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->addUnit(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V

    .line 130
    new-instance v0, Lorg/ocpsoft/prettytime/units/Minute;

    invoke-direct {v0}, Lorg/ocpsoft/prettytime/units/Minute;-><init>()V

    invoke-direct {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->addUnit(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V

    .line 131
    new-instance v0, Lorg/ocpsoft/prettytime/units/Hour;

    invoke-direct {v0}, Lorg/ocpsoft/prettytime/units/Hour;-><init>()V

    invoke-direct {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->addUnit(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V

    .line 132
    new-instance v0, Lorg/ocpsoft/prettytime/units/Day;

    invoke-direct {v0}, Lorg/ocpsoft/prettytime/units/Day;-><init>()V

    invoke-direct {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->addUnit(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V

    .line 133
    new-instance v0, Lorg/ocpsoft/prettytime/units/Week;

    invoke-direct {v0}, Lorg/ocpsoft/prettytime/units/Week;-><init>()V

    invoke-direct {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->addUnit(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V

    .line 134
    new-instance v0, Lorg/ocpsoft/prettytime/units/Month;

    invoke-direct {v0}, Lorg/ocpsoft/prettytime/units/Month;-><init>()V

    invoke-direct {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->addUnit(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V

    .line 135
    new-instance v0, Lorg/ocpsoft/prettytime/units/Year;

    invoke-direct {v0}, Lorg/ocpsoft/prettytime/units/Year;-><init>()V

    invoke-direct {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->addUnit(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V

    .line 136
    new-instance v0, Lorg/ocpsoft/prettytime/units/Decade;

    invoke-direct {v0}, Lorg/ocpsoft/prettytime/units/Decade;-><init>()V

    invoke-direct {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->addUnit(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V

    .line 137
    new-instance v0, Lorg/ocpsoft/prettytime/units/Century;

    invoke-direct {v0}, Lorg/ocpsoft/prettytime/units/Century;-><init>()V

    invoke-direct {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->addUnit(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V

    .line 138
    new-instance v0, Lorg/ocpsoft/prettytime/units/Millennium;

    invoke-direct {v0}, Lorg/ocpsoft/prettytime/units/Millennium;-><init>()V

    invoke-direct {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->addUnit(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V

    .line 139
    return-void
.end method


# virtual methods
.method public approximateDuration(Ljava/util/Date;)Lorg/ocpsoft/prettytime/Duration;
    .locals 8
    .param p1, "then"    # Ljava/util/Date;

    .prologue
    .line 114
    if-nez p1, :cond_0

    .line 115
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Date to approximate must not be null."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 117
    :cond_0
    iget-object v2, p0, Lorg/ocpsoft/prettytime/PrettyTime;->reference:Ljava/util/Date;

    .line 118
    .local v2, "ref":Ljava/util/Date;
    if-nez v2, :cond_1

    .line 119
    new-instance v2, Ljava/util/Date;

    .end local v2    # "ref":Ljava/util/Date;
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 121
    .restart local v2    # "ref":Ljava/util/Date;
    :cond_1
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    sub-long v0, v4, v6

    .line 122
    .local v0, "difference":J
    invoke-direct {p0, v0, v1}, Lorg/ocpsoft/prettytime/PrettyTime;->calculateDuration(J)Lorg/ocpsoft/prettytime/Duration;

    move-result-object v3

    return-object v3
.end method

.method public calculatePreciseDuration(Ljava/util/Date;)Ljava/util/List;
    .locals 10
    .param p1, "then"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Date;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/ocpsoft/prettytime/Duration;",
            ">;"
        }
    .end annotation

    .prologue
    .line 217
    if-nez p1, :cond_0

    .line 218
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Date to calculate must not be null."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 219
    :cond_0
    iget-object v5, p0, Lorg/ocpsoft/prettytime/PrettyTime;->reference:Ljava/util/Date;

    if-nez v5, :cond_1

    .line 220
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    iput-object v5, p0, Lorg/ocpsoft/prettytime/PrettyTime;->reference:Ljava/util/Date;

    .line 222
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 223
    .local v4, "result":Ljava/util/List;, "Ljava/util/List<Lorg/ocpsoft/prettytime/Duration;>;"
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    iget-object v5, p0, Lorg/ocpsoft/prettytime/PrettyTime;->reference:Ljava/util/Date;

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    sub-long v0, v6, v8

    .line 224
    .local v0, "difference":J
    invoke-direct {p0, v0, v1}, Lorg/ocpsoft/prettytime/PrettyTime;->calculateDuration(J)Lorg/ocpsoft/prettytime/Duration;

    move-result-object v2

    .line 225
    .local v2, "duration":Lorg/ocpsoft/prettytime/Duration;
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 226
    :goto_0
    const-wide/16 v6, 0x0

    invoke-interface {v2}, Lorg/ocpsoft/prettytime/Duration;->getDelta()J

    move-result-wide v8

    cmp-long v5, v6, v8

    if-eqz v5, :cond_2

    .line 228
    invoke-interface {v2}, Lorg/ocpsoft/prettytime/Duration;->getDelta()J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lorg/ocpsoft/prettytime/PrettyTime;->calculateDuration(J)Lorg/ocpsoft/prettytime/Duration;

    move-result-object v2

    .line 229
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_3

    .line 231
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/ocpsoft/prettytime/Duration;

    .line 232
    .local v3, "last":Lorg/ocpsoft/prettytime/Duration;
    invoke-interface {v3}, Lorg/ocpsoft/prettytime/Duration;->getUnit()Lorg/ocpsoft/prettytime/TimeUnit;

    move-result-object v5

    invoke-interface {v2}, Lorg/ocpsoft/prettytime/Duration;->getUnit()Lorg/ocpsoft/prettytime/TimeUnit;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 239
    .end local v3    # "last":Lorg/ocpsoft/prettytime/Duration;
    :cond_2
    return-object v4

    .line 237
    :cond_3
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public clearUnits()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/ocpsoft/prettytime/TimeUnit;",
            ">;"
        }
    .end annotation

    .prologue
    .line 551
    invoke-virtual {p0}, Lorg/ocpsoft/prettytime/PrettyTime;->getUnits()Ljava/util/List;

    move-result-object v0

    .line 553
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lorg/ocpsoft/prettytime/TimeUnit;>;"
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/ocpsoft/prettytime/PrettyTime;->mCachedUnits:Ljava/util/List;

    .line 554
    iget-object v1, p0, Lorg/ocpsoft/prettytime/PrettyTime;->units:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 555
    return-object v0
.end method

.method public format(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2
    .param p1, "then"    # Ljava/util/Calendar;

    .prologue
    .line 268
    if-nez p1, :cond_0

    .line 269
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Provided Calendar must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 270
    :cond_0
    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/util/Date;)Ljava/lang/String;
    .locals 3
    .param p1, "then"    # Ljava/util/Date;

    .prologue
    .line 251
    if-nez p1, :cond_0

    .line 252
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Date to format must not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 254
    :cond_0
    invoke-virtual {p0, p1}, Lorg/ocpsoft/prettytime/PrettyTime;->approximateDuration(Ljava/util/Date;)Lorg/ocpsoft/prettytime/Duration;

    move-result-object v0

    .line 255
    .local v0, "d":Lorg/ocpsoft/prettytime/Duration;
    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->format(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public format(Ljava/util/List;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/ocpsoft/prettytime/Duration;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 332
    .local p1, "durations":Ljava/util/List;, "Ljava/util/List<Lorg/ocpsoft/prettytime/Duration;>;"
    if-nez p1, :cond_0

    .line 333
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Duration list must not be null."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 335
    :cond_0
    const/4 v4, 0x0

    .line 336
    .local v4, "result":Ljava/lang/String;
    if-eqz p1, :cond_2

    .line 337
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 338
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 339
    .local v1, "duration":Lorg/ocpsoft/prettytime/Duration;
    const/4 v2, 0x0

    .line 340
    .local v2, "format":Lorg/ocpsoft/prettytime/TimeFormat;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_1

    .line 341
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "duration":Lorg/ocpsoft/prettytime/Duration;
    check-cast v1, Lorg/ocpsoft/prettytime/Duration;

    .line 342
    .restart local v1    # "duration":Lorg/ocpsoft/prettytime/Duration;
    invoke-interface {v1}, Lorg/ocpsoft/prettytime/Duration;->getUnit()Lorg/ocpsoft/prettytime/TimeUnit;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/ocpsoft/prettytime/PrettyTime;->getFormat(Lorg/ocpsoft/prettytime/TimeUnit;)Lorg/ocpsoft/prettytime/TimeFormat;

    move-result-object v2

    .line 344
    invoke-interface {v2, v1}, Lorg/ocpsoft/prettytime/TimeFormat;->formatUnrounded(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    const-string v5, " "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 347
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v1, v5}, Lorg/ocpsoft/prettytime/TimeFormat;->decorateUnrounded(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 350
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    .end local v1    # "duration":Lorg/ocpsoft/prettytime/Duration;
    .end local v2    # "format":Lorg/ocpsoft/prettytime/TimeFormat;
    .end local v3    # "i":I
    :cond_2
    return-object v4
.end method

.method public format(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 4
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 299
    if-nez p1, :cond_0

    .line 300
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Duration to format must not be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 301
    :cond_0
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->getUnit()Lorg/ocpsoft/prettytime/TimeUnit;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/ocpsoft/prettytime/PrettyTime;->getFormat(Lorg/ocpsoft/prettytime/TimeUnit;)Lorg/ocpsoft/prettytime/TimeFormat;

    move-result-object v0

    .line 302
    .local v0, "format":Lorg/ocpsoft/prettytime/TimeFormat;
    invoke-interface {v0, p1}, Lorg/ocpsoft/prettytime/TimeFormat;->format(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v1

    .line 303
    .local v1, "time":Ljava/lang/String;
    invoke-interface {v0, p1, v1}, Lorg/ocpsoft/prettytime/TimeFormat;->decorate(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public formatApproximateDuration(Ljava/util/Date;)Ljava/lang/String;
    .locals 2
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 362
    invoke-virtual {p0, p1}, Lorg/ocpsoft/prettytime/PrettyTime;->approximateDuration(Ljava/util/Date;)Lorg/ocpsoft/prettytime/Duration;

    move-result-object v0

    .line 363
    .local v0, "duration":Lorg/ocpsoft/prettytime/Duration;
    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->formatDuration(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public formatDuration(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 2
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 374
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->getUnit()Lorg/ocpsoft/prettytime/TimeUnit;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/ocpsoft/prettytime/PrettyTime;->getFormat(Lorg/ocpsoft/prettytime/TimeUnit;)Lorg/ocpsoft/prettytime/TimeFormat;

    move-result-object v0

    .line 375
    .local v0, "timeFormat":Lorg/ocpsoft/prettytime/TimeFormat;
    invoke-interface {v0, p1}, Lorg/ocpsoft/prettytime/TimeFormat;->format(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public formatUnrounded(Ljava/util/Date;)Ljava/lang/String;
    .locals 3
    .param p1, "then"    # Ljava/util/Date;

    .prologue
    .line 283
    if-nez p1, :cond_0

    .line 284
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Date to format must not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 286
    :cond_0
    invoke-virtual {p0, p1}, Lorg/ocpsoft/prettytime/PrettyTime;->approximateDuration(Ljava/util/Date;)Lorg/ocpsoft/prettytime/Duration;

    move-result-object v0

    .line 287
    .local v0, "d":Lorg/ocpsoft/prettytime/Duration;
    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/PrettyTime;->formatUnrounded(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public formatUnrounded(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 4
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 315
    if-nez p1, :cond_0

    .line 316
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Duration to format must not be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 318
    :cond_0
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->getUnit()Lorg/ocpsoft/prettytime/TimeUnit;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/ocpsoft/prettytime/PrettyTime;->getFormat(Lorg/ocpsoft/prettytime/TimeUnit;)Lorg/ocpsoft/prettytime/TimeFormat;

    move-result-object v0

    .line 319
    .local v0, "format":Lorg/ocpsoft/prettytime/TimeFormat;
    invoke-interface {v0, p1}, Lorg/ocpsoft/prettytime/TimeFormat;->formatUnrounded(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v1

    .line 320
    .local v1, "time":Ljava/lang/String;
    invoke-interface {v0, p1, v1}, Lorg/ocpsoft/prettytime/TimeFormat;->decorateUnrounded(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getFormat(Lorg/ocpsoft/prettytime/TimeUnit;)Lorg/ocpsoft/prettytime/TimeFormat;
    .locals 2
    .param p1, "unit"    # Lorg/ocpsoft/prettytime/TimeUnit;

    .prologue
    .line 383
    if-nez p1, :cond_0

    .line 384
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Time unit must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 386
    :cond_0
    iget-object v0, p0, Lorg/ocpsoft/prettytime/PrettyTime;->units:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 388
    iget-object v0, p0, Lorg/ocpsoft/prettytime/PrettyTime;->units:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ocpsoft/prettytime/TimeFormat;

    .line 390
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getLocale()Ljava/util/Locale;
    .locals 1

    .prologue
    .line 517
    iget-object v0, p0, Lorg/ocpsoft/prettytime/PrettyTime;->locale:Ljava/util/Locale;

    return-object v0
.end method

.method public getReference()Ljava/util/Date;
    .locals 1

    .prologue
    .line 402
    iget-object v0, p0, Lorg/ocpsoft/prettytime/PrettyTime;->reference:Ljava/util/Date;

    return-object v0
.end method

.method public getUnit(Ljava/lang/Class;)Lorg/ocpsoft/prettytime/TimeUnit;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UNIT::",
            "Lorg/ocpsoft/prettytime/TimeUnit;",
            ">(",
            "Ljava/lang/Class",
            "<TUNIT;>;)TUNIT;"
        }
    .end annotation

    .prologue
    .line 442
    .local p1, "unitType":Ljava/lang/Class;, "Ljava/lang/Class<TUNIT;>;"
    if-nez p1, :cond_0

    .line 443
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Unit type to get must not be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 445
    :cond_0
    iget-object v2, p0, Lorg/ocpsoft/prettytime/PrettyTime;->units:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/ocpsoft/prettytime/TimeUnit;

    .line 446
    .local v1, "unit":Lorg/ocpsoft/prettytime/TimeUnit;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 451
    .end local v1    # "unit":Lorg/ocpsoft/prettytime/TimeUnit;
    :goto_0
    return-object v1

    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getUnits()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/ocpsoft/prettytime/TimeUnit;",
            ">;"
        }
    .end annotation

    .prologue
    .line 425
    iget-object v1, p0, Lorg/ocpsoft/prettytime/PrettyTime;->mCachedUnits:Ljava/util/List;

    if-nez v1, :cond_0

    .line 426
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/ocpsoft/prettytime/PrettyTime;->units:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 427
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lorg/ocpsoft/prettytime/TimeUnit;>;"
    new-instance v1, Lorg/ocpsoft/prettytime/units/TimeUnitComparator;

    invoke-direct {v1}, Lorg/ocpsoft/prettytime/units/TimeUnitComparator;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 428
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lorg/ocpsoft/prettytime/PrettyTime;->mCachedUnits:Ljava/util/List;

    .line 431
    .end local v0    # "result":Ljava/util/List;, "Ljava/util/List<Lorg/ocpsoft/prettytime/TimeUnit;>;"
    :cond_0
    iget-object v1, p0, Lorg/ocpsoft/prettytime/PrettyTime;->mCachedUnits:Ljava/util/List;

    return-object v1
.end method

.method public registerUnit(Lorg/ocpsoft/prettytime/TimeUnit;Lorg/ocpsoft/prettytime/TimeFormat;)Lorg/ocpsoft/prettytime/PrettyTime;
    .locals 2
    .param p1, "unit"    # Lorg/ocpsoft/prettytime/TimeUnit;
    .param p2, "format"    # Lorg/ocpsoft/prettytime/TimeFormat;

    .prologue
    .line 461
    if-nez p1, :cond_0

    .line 462
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unit to register must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 463
    :cond_0
    if-nez p2, :cond_1

    .line 464
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Format to register must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 466
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/ocpsoft/prettytime/PrettyTime;->mCachedUnits:Ljava/util/List;

    .line 468
    iget-object v0, p0, Lorg/ocpsoft/prettytime/PrettyTime;->units:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    instance-of v0, p1, Lorg/ocpsoft/prettytime/LocaleAware;

    if-eqz v0, :cond_2

    .line 470
    check-cast p1, Lorg/ocpsoft/prettytime/LocaleAware;

    .end local p1    # "unit":Lorg/ocpsoft/prettytime/TimeUnit;
    iget-object v0, p0, Lorg/ocpsoft/prettytime/PrettyTime;->locale:Ljava/util/Locale;

    invoke-interface {p1, v0}, Lorg/ocpsoft/prettytime/LocaleAware;->setLocale(Ljava/util/Locale;)Ljava/lang/Object;

    .line 471
    :cond_2
    instance-of v0, p2, Lorg/ocpsoft/prettytime/LocaleAware;

    if-eqz v0, :cond_3

    .line 472
    check-cast p2, Lorg/ocpsoft/prettytime/LocaleAware;

    .end local p2    # "format":Lorg/ocpsoft/prettytime/TimeFormat;
    iget-object v0, p0, Lorg/ocpsoft/prettytime/PrettyTime;->locale:Ljava/util/Locale;

    invoke-interface {p2, v0}, Lorg/ocpsoft/prettytime/LocaleAware;->setLocale(Ljava/util/Locale;)Ljava/lang/Object;

    .line 473
    :cond_3
    return-object p0
.end method

.method public removeUnit(Ljava/lang/Class;)Lorg/ocpsoft/prettytime/TimeFormat;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UNIT::",
            "Lorg/ocpsoft/prettytime/TimeUnit;",
            ">(",
            "Ljava/lang/Class",
            "<TUNIT;>;)",
            "Lorg/ocpsoft/prettytime/TimeFormat;"
        }
    .end annotation

    .prologue
    .local p1, "unitType":Ljava/lang/Class;, "Ljava/lang/Class<TUNIT;>;"
    const/4 v2, 0x0

    .line 483
    if-nez p1, :cond_0

    .line 484
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Unit type to remove must not be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 486
    :cond_0
    iget-object v3, p0, Lorg/ocpsoft/prettytime/PrettyTime;->units:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/ocpsoft/prettytime/TimeUnit;

    .line 487
    .local v1, "unit":Lorg/ocpsoft/prettytime/TimeUnit;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 489
    iput-object v2, p0, Lorg/ocpsoft/prettytime/PrettyTime;->mCachedUnits:Ljava/util/List;

    .line 491
    iget-object v2, p0, Lorg/ocpsoft/prettytime/PrettyTime;->units:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/ocpsoft/prettytime/TimeFormat;

    .line 494
    .end local v1    # "unit":Lorg/ocpsoft/prettytime/TimeUnit;
    :cond_2
    return-object v2
.end method

.method public removeUnit(Lorg/ocpsoft/prettytime/TimeUnit;)Lorg/ocpsoft/prettytime/TimeFormat;
    .locals 2
    .param p1, "unit"    # Lorg/ocpsoft/prettytime/TimeUnit;

    .prologue
    .line 504
    if-nez p1, :cond_0

    .line 505
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unit to remove must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 507
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/ocpsoft/prettytime/PrettyTime;->mCachedUnits:Ljava/util/List;

    .line 509
    iget-object v0, p0, Lorg/ocpsoft/prettytime/PrettyTime;->units:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ocpsoft/prettytime/TimeFormat;

    return-object v0
.end method

.method public setLocale(Ljava/util/Locale;)Lorg/ocpsoft/prettytime/PrettyTime;
    .locals 4
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 526
    iput-object p1, p0, Lorg/ocpsoft/prettytime/PrettyTime;->locale:Ljava/util/Locale;

    .line 527
    iget-object v3, p0, Lorg/ocpsoft/prettytime/PrettyTime;->units:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/ocpsoft/prettytime/TimeUnit;

    .line 528
    .local v2, "unit":Lorg/ocpsoft/prettytime/TimeUnit;
    instance-of v3, v2, Lorg/ocpsoft/prettytime/LocaleAware;

    if-eqz v3, :cond_0

    .line 529
    check-cast v2, Lorg/ocpsoft/prettytime/LocaleAware;

    .end local v2    # "unit":Lorg/ocpsoft/prettytime/TimeUnit;
    invoke-interface {v2, p1}, Lorg/ocpsoft/prettytime/LocaleAware;->setLocale(Ljava/util/Locale;)Ljava/lang/Object;

    goto :goto_0

    .line 531
    :cond_1
    iget-object v3, p0, Lorg/ocpsoft/prettytime/PrettyTime;->units:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ocpsoft/prettytime/TimeFormat;

    .line 532
    .local v0, "format":Lorg/ocpsoft/prettytime/TimeFormat;
    instance-of v3, v0, Lorg/ocpsoft/prettytime/LocaleAware;

    if-eqz v3, :cond_2

    .line 533
    check-cast v0, Lorg/ocpsoft/prettytime/LocaleAware;

    .end local v0    # "format":Lorg/ocpsoft/prettytime/TimeFormat;
    invoke-interface {v0, p1}, Lorg/ocpsoft/prettytime/LocaleAware;->setLocale(Ljava/util/Locale;)Ljava/lang/Object;

    goto :goto_1

    .line 535
    :cond_3
    return-object p0
.end method

.method public setReference(Ljava/util/Date;)Lorg/ocpsoft/prettytime/PrettyTime;
    .locals 0
    .param p1, "timestamp"    # Ljava/util/Date;

    .prologue
    .line 414
    iput-object p1, p0, Lorg/ocpsoft/prettytime/PrettyTime;->reference:Ljava/util/Date;

    .line 415
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 541
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PrettyTime [reference="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/PrettyTime;->reference:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", locale="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/PrettyTime;->locale:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
