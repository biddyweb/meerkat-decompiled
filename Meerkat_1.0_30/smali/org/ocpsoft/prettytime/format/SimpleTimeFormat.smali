.class public Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
.super Ljava/lang/Object;
.source "SimpleTimeFormat.java"

# interfaces
.implements Lorg/ocpsoft/prettytime/TimeFormat;


# static fields
.field private static final NEGATIVE:Ljava/lang/String; = "-"

.field public static final QUANTITY:Ljava/lang/String; = "%n"

.field public static final SIGN:Ljava/lang/String; = "%s"

.field public static final UNIT:Ljava/lang/String; = "%u"


# instance fields
.field private futurePluralName:Ljava/lang/String;

.field private futurePrefix:Ljava/lang/String;

.field private futureSingularName:Ljava/lang/String;

.field private futureSuffix:Ljava/lang/String;

.field private pastPluralName:Ljava/lang/String;

.field private pastPrefix:Ljava/lang/String;

.field private pastSingularName:Ljava/lang/String;

.field private pastSuffix:Ljava/lang/String;

.field private pattern:Ljava/lang/String;

.field private pluralName:Ljava/lang/String;

.field private roundingTolerance:I

.field private singularName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->singularName:Ljava/lang/String;

    .line 35
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pluralName:Ljava/lang/String;

    .line 36
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futureSingularName:Ljava/lang/String;

    .line 37
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futurePluralName:Ljava/lang/String;

    .line 38
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastSingularName:Ljava/lang/String;

    .line 39
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastPluralName:Ljava/lang/String;

    .line 41
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pattern:Ljava/lang/String;

    .line 42
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futurePrefix:Ljava/lang/String;

    .line 43
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futureSuffix:Ljava/lang/String;

    .line 44
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastPrefix:Ljava/lang/String;

    .line 45
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastSuffix:Ljava/lang/String;

    .line 46
    const/16 v0, 0x32

    iput v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->roundingTolerance:I

    return-void
.end method

.method private applyPattern(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;
    .locals 3
    .param p1, "sign"    # Ljava/lang/String;
    .param p2, "unit"    # Ljava/lang/String;
    .param p3, "quantity"    # J

    .prologue
    .line 93
    invoke-virtual {p0, p3, p4}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->getPattern(J)Ljava/lang/String;

    move-result-object v1

    const-string v2, "%s"

    invoke-virtual {v1, v2, p1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 94
    .local v0, "result":Ljava/lang/String;
    const-string v1, "%n"

    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 95
    const-string v1, "%u"

    invoke-virtual {v0, v1, p2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 96
    return-object v0
.end method

.method private format(Lorg/ocpsoft/prettytime/Duration;Z)Ljava/lang/String;
    .locals 5
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "round"    # Z

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->getSign(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v2

    .line 85
    .local v2, "sign":Ljava/lang/String;
    invoke-virtual {p0, p1, p2}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->getGramaticallyCorrectName(Lorg/ocpsoft/prettytime/Duration;Z)Ljava/lang/String;

    move-result-object v3

    .line 86
    .local v3, "unit":Ljava/lang/String;
    invoke-virtual {p0, p1, p2}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->getQuantity(Lorg/ocpsoft/prettytime/Duration;Z)J

    move-result-wide v0

    .line 88
    .local v0, "quantity":J
    invoke-direct {p0, v2, v3, v0, v1}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->applyPattern(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private getPluralName(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 145
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInFuture()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futurePluralName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futureSingularName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 146
    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futurePluralName:Ljava/lang/String;

    .line 150
    :goto_0
    return-object v0

    .line 147
    :cond_0
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInPast()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastPluralName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastSingularName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 148
    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastPluralName:Ljava/lang/String;

    goto :goto_0

    .line 150
    :cond_1
    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pluralName:Ljava/lang/String;

    goto :goto_0
.end method

.method private getSign(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 4
    .param p1, "d"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 126
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->getQuantity()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 128
    const-string v0, "-"

    .line 130
    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method private getSingularName(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 135
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInFuture()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futureSingularName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futureSingularName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 136
    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futureSingularName:Ljava/lang/String;

    .line 140
    :goto_0
    return-object v0

    .line 137
    :cond_0
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInPast()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastSingularName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastSingularName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 138
    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastSingularName:Ljava/lang/String;

    goto :goto_0

    .line 140
    :cond_1
    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->singularName:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public decorate(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "time"    # Ljava/lang/String;

    .prologue
    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .local v0, "result":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInPast()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 66
    iget-object v1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastSuffix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\s+"

    const-string v3, " "

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 70
    :cond_0
    iget-object v1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futurePrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futureSuffix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public decorateUnrounded(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "time"    # Ljava/lang/String;

    .prologue
    .line 79
    invoke-virtual {p0, p1, p2}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->decorate(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 51
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->format(Lorg/ocpsoft/prettytime/Duration;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public formatUnrounded(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->format(Lorg/ocpsoft/prettytime/Duration;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getGramaticallyCorrectName(Lorg/ocpsoft/prettytime/Duration;Z)Ljava/lang/String;
    .locals 6
    .param p1, "d"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "round"    # Z

    .prologue
    .line 116
    invoke-direct {p0, p1}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->getSingularName(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, "result":Ljava/lang/String;
    invoke-virtual {p0, p1, p2}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->getQuantity(Lorg/ocpsoft/prettytime/Duration;Z)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    invoke-virtual {p0, p1, p2}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->getQuantity(Lorg/ocpsoft/prettytime/Duration;Z)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/16 v4, 0x1

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    .line 119
    :cond_0
    invoke-direct {p0, p1}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->getPluralName(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v0

    .line 121
    :cond_1
    return-object v0
.end method

.method public getPattern()Ljava/lang/String;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pattern:Ljava/lang/String;

    return-object v0
.end method

.method protected getPattern(J)Ljava/lang/String;
    .locals 1
    .param p1, "quantity"    # J

    .prologue
    .line 101
    iget-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pattern:Ljava/lang/String;

    return-object v0
.end method

.method protected getQuantity(Lorg/ocpsoft/prettytime/Duration;Z)J
    .locals 2
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "round"    # Z

    .prologue
    .line 111
    if-eqz p2, :cond_0

    iget v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->roundingTolerance:I

    invoke-interface {p1, v0}, Lorg/ocpsoft/prettytime/Duration;->getQuantityRounded(I)J

    move-result-wide v0

    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    return-wide v0

    :cond_0
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->getQuantity()J

    move-result-wide v0

    goto :goto_0
.end method

.method public setFuturePluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    .locals 0
    .param p1, "futurePluralName"    # Ljava/lang/String;

    .prologue
    .line 218
    iput-object p1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futurePluralName:Ljava/lang/String;

    .line 219
    return-object p0
.end method

.method public setFuturePrefix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    .locals 1
    .param p1, "futurePrefix"    # Ljava/lang/String;

    .prologue
    .line 164
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futurePrefix:Ljava/lang/String;

    .line 165
    return-object p0
.end method

.method public setFutureSingularName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    .locals 0
    .param p1, "futureSingularName"    # Ljava/lang/String;

    .prologue
    .line 212
    iput-object p1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futureSingularName:Ljava/lang/String;

    .line 213
    return-object p0
.end method

.method public setFutureSuffix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    .locals 1
    .param p1, "futureSuffix"    # Ljava/lang/String;

    .prologue
    .line 170
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futureSuffix:Ljava/lang/String;

    .line 171
    return-object p0
.end method

.method public setPastPluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    .locals 0
    .param p1, "pastPluralName"    # Ljava/lang/String;

    .prologue
    .line 230
    iput-object p1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastPluralName:Ljava/lang/String;

    .line 231
    return-object p0
.end method

.method public setPastPrefix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    .locals 1
    .param p1, "pastPrefix"    # Ljava/lang/String;

    .prologue
    .line 176
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastPrefix:Ljava/lang/String;

    .line 177
    return-object p0
.end method

.method public setPastSingularName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    .locals 0
    .param p1, "pastSingularName"    # Ljava/lang/String;

    .prologue
    .line 224
    iput-object p1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastSingularName:Ljava/lang/String;

    .line 225
    return-object p0
.end method

.method public setPastSuffix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    .locals 1
    .param p1, "pastSuffix"    # Ljava/lang/String;

    .prologue
    .line 182
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastSuffix:Ljava/lang/String;

    .line 183
    return-object p0
.end method

.method public setPattern(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    .locals 0
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 158
    iput-object p1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pattern:Ljava/lang/String;

    .line 159
    return-object p0
.end method

.method public setPluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    .locals 0
    .param p1, "pluralName"    # Ljava/lang/String;

    .prologue
    .line 206
    iput-object p1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pluralName:Ljava/lang/String;

    .line 207
    return-object p0
.end method

.method public setRoundingTolerance(I)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    .locals 0
    .param p1, "roundingTolerance"    # I

    .prologue
    .line 194
    iput p1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->roundingTolerance:I

    .line 195
    return-object p0
.end method

.method public setSingularName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 200
    iput-object p1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->singularName:Ljava/lang/String;

    .line 201
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 237
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SimpleTimeFormat [pattern="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pattern:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", futurePrefix="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futurePrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", futureSuffix="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->futureSuffix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", pastPrefix="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", pastSuffix="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->pastSuffix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", roundingTolerance="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->roundingTolerance:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
