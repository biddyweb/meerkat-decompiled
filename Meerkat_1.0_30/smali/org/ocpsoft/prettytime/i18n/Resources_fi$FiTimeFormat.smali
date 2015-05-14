.class Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;
.super Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
.source "Resources_fi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ocpsoft/prettytime/i18n/Resources_fi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FiTimeFormat"
.end annotation


# instance fields
.field private final bundle:Ljava/util/ResourceBundle;

.field private futureName:Ljava/lang/String;

.field private futurePluralName:Ljava/lang/String;

.field private pastName:Ljava/lang/String;

.field private pastPluralName:Ljava/lang/String;

.field private pluralPattern:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/util/ResourceBundle;Lorg/ocpsoft/prettytime/TimeUnit;)V
    .locals 4
    .param p1, "rb"    # Ljava/util/ResourceBundle;
    .param p2, "unit"    # Lorg/ocpsoft/prettytime/TimeUnit;

    .prologue
    .line 135
    invoke-direct {p0}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;-><init>()V

    .line 127
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->pastName:Ljava/lang/String;

    .line 128
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->futureName:Ljava/lang/String;

    .line 129
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->pastPluralName:Ljava/lang/String;

    .line 130
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->futurePluralName:Ljava/lang/String;

    .line 131
    const-string v0, ""

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->pluralPattern:Ljava/lang/String;

    .line 136
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    .line 138
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "PastSingularName"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ResourceBundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 139
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "PastSingularName"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->setPastName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "FutureSingularName"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->setFutureName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "PastSingularName"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->setPastPluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "FutureSingularName"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->setFuturePluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "Pattern"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->setPluralPattern(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;

    .line 145
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "PastPluralName"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ResourceBundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "PastPluralName"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->setPastPluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;

    .line 149
    :cond_0
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "FuturePluralName"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ResourceBundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 150
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "FuturePluralName"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->setFuturePluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;

    .line 153
    :cond_1
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "PluralPattern"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ResourceBundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 154
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "PluralPattern"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->setPluralPattern(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;

    .line 157
    :cond_2
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Pattern"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->setPattern(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "PastSuffix"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->setPastSuffix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "FutureSuffix"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->setFutureSuffix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->setFuturePrefix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->setPastPrefix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->setSingularName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->setPluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;

    .line 165
    :cond_3
    return-void
.end method

.method private getUnitName(Lorg/ocpsoft/prettytime/TimeUnit;)Ljava/lang/String;
    .locals 1
    .param p1, "unit"    # Lorg/ocpsoft/prettytime/TimeUnit;

    .prologue
    .line 243
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public decorate(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "time"    # Ljava/lang/String;

    .prologue
    .line 233
    const-string v0, ""

    .line 234
    .local v0, "result":Ljava/lang/String;
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->getUnit()Lorg/ocpsoft/prettytime/TimeUnit;

    move-result-object v1

    instance-of v1, v1, Lorg/ocpsoft/prettytime/units/Day;

    if-eqz v1, :cond_0

    const/16 v1, 0x32

    invoke-interface {p1, v1}, Lorg/ocpsoft/prettytime/Duration;->getQuantityRounded(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/16 v4, 0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    .line 235
    move-object v0, p2

    .line 239
    :goto_0
    return-object v0

    .line 237
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->decorate(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getFutureName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->futureName:Ljava/lang/String;

    return-object v0
.end method

.method public getFuturePluralName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->futurePluralName:Ljava/lang/String;

    return-object v0
.end method

.method protected getGramaticallyCorrectName(Lorg/ocpsoft/prettytime/Duration;Z)Ljava/lang/String;
    .locals 6
    .param p1, "d"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "round"    # Z

    .prologue
    .line 214
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInPast()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getPastName()Ljava/lang/String;

    move-result-object v0

    .line 215
    .local v0, "result":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, p1, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getQuantity(Lorg/ocpsoft/prettytime/Duration;Z)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    invoke-virtual {p0, p1, p2}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getQuantity(Lorg/ocpsoft/prettytime/Duration;Z)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/16 v4, 0x1

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    .line 217
    :cond_0
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInPast()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getPastPluralName()Ljava/lang/String;

    move-result-object v0

    .line 219
    :cond_1
    :goto_1
    return-object v0

    .line 214
    .end local v0    # "result":Ljava/lang/String;
    :cond_2
    invoke-virtual {p0}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getFutureName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 217
    .restart local v0    # "result":Ljava/lang/String;
    :cond_3
    invoke-virtual {p0}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getFuturePluralName()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method public getPastName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->pastName:Ljava/lang/String;

    return-object v0
.end method

.method public getPastPluralName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->pastPluralName:Ljava/lang/String;

    return-object v0
.end method

.method protected getPattern(J)Ljava/lang/String;
    .locals 5
    .param p1, "quantity"    # J

    .prologue
    .line 224
    invoke-static {p1, p2}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    const-wide/16 v2, 0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 225
    invoke-virtual {p0}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getPattern()Ljava/lang/String;

    move-result-object v0

    .line 227
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->getPluralPattern()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getPluralPattern()Ljava/lang/String;
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->pluralPattern:Ljava/lang/String;

    return-object v0
.end method

.method public setFutureName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;
    .locals 0
    .param p1, "futureName"    # Ljava/lang/String;

    .prologue
    .line 193
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->futureName:Ljava/lang/String;

    .line 194
    return-object p0
.end method

.method public bridge synthetic setFuturePluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 125
    invoke-virtual {p0, p1}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->setFuturePluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;

    move-result-object v0

    return-object v0
.end method

.method public setFuturePluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;
    .locals 0
    .param p1, "futureName"    # Ljava/lang/String;

    .prologue
    .line 203
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->futurePluralName:Ljava/lang/String;

    .line 204
    return-object p0
.end method

.method public setPastName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;
    .locals 0
    .param p1, "pastName"    # Ljava/lang/String;

    .prologue
    .line 188
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->pastName:Ljava/lang/String;

    .line 189
    return-object p0
.end method

.method public bridge synthetic setPastPluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 125
    invoke-virtual {p0, p1}, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->setPastPluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;

    move-result-object v0

    return-object v0
.end method

.method public setPastPluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;
    .locals 0
    .param p1, "pastName"    # Ljava/lang/String;

    .prologue
    .line 198
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->pastPluralName:Ljava/lang/String;

    .line 199
    return-object p0
.end method

.method public setPluralPattern(Ljava/lang/String;)Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;
    .locals 0
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 208
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_fi$FiTimeFormat;->pluralPattern:Ljava/lang/String;

    .line 209
    return-object p0
.end method
