.class Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
.super Ljava/lang/Object;
.source "Resources_ja.java"

# interfaces
.implements Lorg/ocpsoft/prettytime/TimeFormat;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ocpsoft/prettytime/i18n/Resources_ja;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JaTimeFormat"
.end annotation


# static fields
.field private static final NEGATIVE:Ljava/lang/String; = "-"

.field public static final QUANTITY:Ljava/lang/String; = "%n"

.field public static final SIGN:Ljava/lang/String; = "%s"

.field public static final UNIT:Ljava/lang/String; = "%u"


# instance fields
.field private final bundle:Ljava/util/ResourceBundle;

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
.method public constructor <init>(Ljava/util/ResourceBundle;Lorg/ocpsoft/prettytime/TimeUnit;)V
    .locals 2
    .param p1, "bundle"    # Ljava/util/ResourceBundle;
    .param p2, "unit"    # Lorg/ocpsoft/prettytime/TimeUnit;

    .prologue
    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->singularName:Ljava/lang/String;

    .line 131
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pluralName:Ljava/lang/String;

    .line 132
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futureSingularName:Ljava/lang/String;

    .line 133
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futurePluralName:Ljava/lang/String;

    .line 134
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastSingularName:Ljava/lang/String;

    .line 135
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastPluralName:Ljava/lang/String;

    .line 137
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pattern:Ljava/lang/String;

    .line 138
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futurePrefix:Ljava/lang/String;

    .line 139
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futureSuffix:Ljava/lang/String;

    .line 140
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastPrefix:Ljava/lang/String;

    .line 141
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastSuffix:Ljava/lang/String;

    .line 142
    const/16 v0, 0x32

    iput v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->roundingTolerance:I

    .line 146
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->bundle:Ljava/util/ResourceBundle;

    .line 148
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Pattern"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->setPattern(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "FuturePrefix"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->setFuturePrefix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;

    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "FutureSuffix"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->setFutureSuffix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;

    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "PastPrefix"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->setPastPrefix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;

    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "PastSuffix"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->setPastSuffix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;

    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "SingularName"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->setSingularName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;

    .line 155
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "PluralName"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->setPluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;

    .line 158
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "FuturePluralName"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->setFuturePluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 163
    :goto_0
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "FutureSingularName"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->setFutureSingularName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 168
    :goto_1
    :try_start_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "PastPluralName"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->setPastPluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 173
    :goto_2
    :try_start_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "PastSingularName"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->setPastSingularName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 177
    :goto_3
    return-void

    .line 175
    :catch_0
    move-exception v0

    goto :goto_3

    .line 170
    :catch_1
    move-exception v0

    goto :goto_2

    .line 165
    :catch_2
    move-exception v0

    goto :goto_1

    .line 160
    :catch_3
    move-exception v0

    goto :goto_0
.end method

.method private applyPattern(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;
    .locals 3
    .param p1, "sign"    # Ljava/lang/String;
    .param p2, "unit"    # Ljava/lang/String;
    .param p3, "quantity"    # J

    .prologue
    .line 202
    invoke-virtual {p0, p3, p4}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getPattern(J)Ljava/lang/String;

    move-result-object v1

    const-string v2, "%s"

    invoke-virtual {v1, v2, p1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 203
    .local v0, "result":Ljava/lang/String;
    const-string v1, "%n"

    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 204
    const-string v1, "%u"

    invoke-virtual {v0, v1, p2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 205
    return-object v0
.end method

.method private format(Lorg/ocpsoft/prettytime/Duration;Z)Ljava/lang/String;
    .locals 5
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "round"    # Z

    .prologue
    .line 194
    invoke-direct {p0, p1}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getSign(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v2

    .line 195
    .local v2, "sign":Ljava/lang/String;
    invoke-virtual {p0, p1, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getGramaticallyCorrectName(Lorg/ocpsoft/prettytime/Duration;Z)Ljava/lang/String;

    move-result-object v3

    .line 196
    .local v3, "unit":Ljava/lang/String;
    invoke-virtual {p0, p1, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getQuantity(Lorg/ocpsoft/prettytime/Duration;Z)J

    move-result-wide v0

    .line 198
    .local v0, "quantity":J
    invoke-direct {p0, v2, v3, v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->applyPattern(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private getPluralName(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 248
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInFuture()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futurePluralName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futureSingularName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 249
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futurePluralName:Ljava/lang/String;

    .line 255
    :goto_0
    return-object v0

    .line 251
    :cond_0
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInPast()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastPluralName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastSingularName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 252
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastPluralName:Ljava/lang/String;

    goto :goto_0

    .line 255
    :cond_1
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pluralName:Ljava/lang/String;

    goto :goto_0
.end method

.method private getSign(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 4
    .param p1, "d"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 229
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->getQuantity()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 230
    const-string v0, "-"

    .line 232
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
    .line 236
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInFuture()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futureSingularName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futureSingularName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 237
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futureSingularName:Ljava/lang/String;

    .line 243
    :goto_0
    return-object v0

    .line 239
    :cond_0
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInPast()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastSingularName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastSingularName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 240
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastSingularName:Ljava/lang/String;

    goto :goto_0

    .line 243
    :cond_1
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->singularName:Ljava/lang/String;

    goto :goto_0
.end method

.method private getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;
    .locals 1
    .param p1, "unit"    # Lorg/ocpsoft/prettytime/TimeUnit;

    .prologue
    .line 180
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public decorate(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "time"    # Ljava/lang/String;

    .prologue
    .line 261
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 262
    .local v0, "result":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInPast()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 263
    iget-object v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastSuffix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
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

    .line 266
    :cond_0
    iget-object v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futurePrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futureSuffix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public decorateUnrounded(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "time"    # Ljava/lang/String;

    .prologue
    .line 273
    invoke-virtual {p0, p1, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->decorate(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 185
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->format(Lorg/ocpsoft/prettytime/Duration;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public formatUnrounded(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 190
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->format(Lorg/ocpsoft/prettytime/Duration;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getGramaticallyCorrectName(Lorg/ocpsoft/prettytime/Duration;Z)Ljava/lang/String;
    .locals 6
    .param p1, "d"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "round"    # Z

    .prologue
    .line 221
    invoke-direct {p0, p1}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getSingularName(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v0

    .line 222
    .local v0, "result":Ljava/lang/String;
    invoke-virtual {p0, p1, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getQuantity(Lorg/ocpsoft/prettytime/Duration;Z)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    invoke-virtual {p0, p1, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getQuantity(Lorg/ocpsoft/prettytime/Duration;Z)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/16 v4, 0x1

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    .line 223
    :cond_0
    invoke-direct {p0, p1}, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->getPluralName(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v0

    .line 225
    :cond_1
    return-object v0
.end method

.method public getPattern()Ljava/lang/String;
    .locals 1

    .prologue
    .line 213
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pattern:Ljava/lang/String;

    return-object v0
.end method

.method protected getPattern(J)Ljava/lang/String;
    .locals 1
    .param p1, "quantity"    # J

    .prologue
    .line 209
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pattern:Ljava/lang/String;

    return-object v0
.end method

.method protected getQuantity(Lorg/ocpsoft/prettytime/Duration;Z)J
    .locals 2
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "round"    # Z

    .prologue
    .line 217
    if-eqz p2, :cond_0

    iget v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->roundingTolerance:I

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

.method public setFuturePluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    .locals 0
    .param p1, "futurePluralName"    # Ljava/lang/String;

    .prologue
    .line 331
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futurePluralName:Ljava/lang/String;

    .line 332
    return-object p0
.end method

.method public setFuturePrefix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    .locals 1
    .param p1, "futurePrefix"    # Ljava/lang/String;

    .prologue
    .line 285
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futurePrefix:Ljava/lang/String;

    .line 286
    return-object p0
.end method

.method public setFutureSingularName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    .locals 0
    .param p1, "futureSingularName"    # Ljava/lang/String;

    .prologue
    .line 326
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futureSingularName:Ljava/lang/String;

    .line 327
    return-object p0
.end method

.method public setFutureSuffix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    .locals 1
    .param p1, "futureSuffix"    # Ljava/lang/String;

    .prologue
    .line 290
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futureSuffix:Ljava/lang/String;

    .line 291
    return-object p0
.end method

.method public setPastPluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    .locals 0
    .param p1, "pastPluralName"    # Ljava/lang/String;

    .prologue
    .line 341
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastPluralName:Ljava/lang/String;

    .line 342
    return-object p0
.end method

.method public setPastPrefix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    .locals 1
    .param p1, "pastPrefix"    # Ljava/lang/String;

    .prologue
    .line 295
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastPrefix:Ljava/lang/String;

    .line 296
    return-object p0
.end method

.method public setPastSingularName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    .locals 0
    .param p1, "pastSingularName"    # Ljava/lang/String;

    .prologue
    .line 336
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastSingularName:Ljava/lang/String;

    .line 337
    return-object p0
.end method

.method public setPastSuffix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    .locals 1
    .param p1, "pastSuffix"    # Ljava/lang/String;

    .prologue
    .line 300
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastSuffix:Ljava/lang/String;

    .line 301
    return-object p0
.end method

.method public setPattern(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    .locals 0
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 280
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pattern:Ljava/lang/String;

    .line 281
    return-object p0
.end method

.method public setPluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    .locals 0
    .param p1, "pluralName"    # Ljava/lang/String;

    .prologue
    .line 321
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pluralName:Ljava/lang/String;

    .line 322
    return-object p0
.end method

.method public setRoundingTolerance(I)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    .locals 0
    .param p1, "roundingTolerance"    # I

    .prologue
    .line 311
    iput p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->roundingTolerance:I

    .line 312
    return-object p0
.end method

.method public setSingularName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 316
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->singularName:Ljava/lang/String;

    .line 317
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 347
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "JaTimeFormat [pattern="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pattern:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", futurePrefix="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futurePrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", futureSuffix="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->futureSuffix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", pastPrefix="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", pastSuffix="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->pastSuffix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", roundingTolerance="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ja$JaTimeFormat;->roundingTolerance:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
