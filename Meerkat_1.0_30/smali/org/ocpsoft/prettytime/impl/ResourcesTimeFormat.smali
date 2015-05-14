.class public Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;
.super Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
.source "ResourcesTimeFormat.java"

# interfaces
.implements Lorg/ocpsoft/prettytime/LocaleAware;
.implements Lorg/ocpsoft/prettytime/TimeFormat;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;",
        "Lorg/ocpsoft/prettytime/TimeFormat;",
        "Lorg/ocpsoft/prettytime/LocaleAware",
        "<",
        "Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;",
        ">;"
    }
.end annotation


# instance fields
.field private bundle:Ljava/util/ResourceBundle;

.field private override:Lorg/ocpsoft/prettytime/TimeFormat;

.field private final unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;


# direct methods
.method public constructor <init>(Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;)V
    .locals 0
    .param p1, "unit"    # Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    .prologue
    .line 23
    invoke-direct {p0}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;-><init>()V

    .line 24
    iput-object p1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    .line 25
    return-void
.end method


# virtual methods
.method public decorate(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "time"    # Ljava/lang/String;

    .prologue
    .line 81
    iget-object v0, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->override:Lorg/ocpsoft/prettytime/TimeFormat;

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->decorate(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->override:Lorg/ocpsoft/prettytime/TimeFormat;

    invoke-interface {v0, p1, p2}, Lorg/ocpsoft/prettytime/TimeFormat;->decorate(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public decorateUnrounded(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "time"    # Ljava/lang/String;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->override:Lorg/ocpsoft/prettytime/TimeFormat;

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->decorateUnrounded(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->override:Lorg/ocpsoft/prettytime/TimeFormat;

    invoke-interface {v0, p1, p2}, Lorg/ocpsoft/prettytime/TimeFormat;->decorateUnrounded(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public format(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 93
    iget-object v0, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->override:Lorg/ocpsoft/prettytime/TimeFormat;

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->format(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->override:Lorg/ocpsoft/prettytime/TimeFormat;

    invoke-interface {v0, p1}, Lorg/ocpsoft/prettytime/TimeFormat;->format(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public formatUnrounded(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 99
    iget-object v0, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->override:Lorg/ocpsoft/prettytime/TimeFormat;

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;->formatUnrounded(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->override:Lorg/ocpsoft/prettytime/TimeFormat;

    invoke-interface {v0, p1}, Lorg/ocpsoft/prettytime/TimeFormat;->formatUnrounded(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public bridge synthetic setLocale(Ljava/util/Locale;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/util/Locale;

    .prologue
    .line 16
    invoke-virtual {p0, p1}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->setLocale(Ljava/util/Locale;)Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;

    move-result-object v0

    return-object v0
.end method

.method public setLocale(Ljava/util/Locale;)Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;
    .locals 4
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 30
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    invoke-virtual {v1}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->getResourceBundleName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p1}, Ljava/util/ResourceBundle;->getBundle(Ljava/lang/String;Ljava/util/Locale;)Ljava/util/ResourceBundle;

    move-result-object v1

    iput-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->bundle:Ljava/util/ResourceBundle;

    .line 32
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->bundle:Ljava/util/ResourceBundle;

    instance-of v1, v1, Lorg/ocpsoft/prettytime/impl/TimeFormatProvider;

    if-eqz v1, :cond_2

    .line 34
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->bundle:Ljava/util/ResourceBundle;

    check-cast v1, Lorg/ocpsoft/prettytime/impl/TimeFormatProvider;

    iget-object v2, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    invoke-interface {v1, v2}, Lorg/ocpsoft/prettytime/impl/TimeFormatProvider;->getFormatFor(Lorg/ocpsoft/prettytime/TimeUnit;)Lorg/ocpsoft/prettytime/TimeFormat;

    move-result-object v0

    .line 35
    .local v0, "format":Lorg/ocpsoft/prettytime/TimeFormat;
    if-eqz v0, :cond_0

    .line 37
    iput-object v0, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->override:Lorg/ocpsoft/prettytime/TimeFormat;

    .line 45
    .end local v0    # "format":Lorg/ocpsoft/prettytime/TimeFormat;
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->override:Lorg/ocpsoft/prettytime/TimeFormat;

    if-nez v1, :cond_1

    .line 47
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    invoke-virtual {v3}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->getResourceKeyPrefix()Ljava/lang/String;

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

    invoke-virtual {p0, v1}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->setPattern(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;

    .line 48
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    invoke-virtual {v3}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->getResourceKeyPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "FuturePrefix"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->setFuturePrefix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;

    .line 49
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    invoke-virtual {v3}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->getResourceKeyPrefix()Ljava/lang/String;

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

    invoke-virtual {p0, v1}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->setFutureSuffix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;

    .line 50
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    invoke-virtual {v3}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->getResourceKeyPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "PastPrefix"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->setPastPrefix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;

    .line 51
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    invoke-virtual {v3}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->getResourceKeyPrefix()Ljava/lang/String;

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

    invoke-virtual {p0, v1}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->setPastSuffix(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;

    .line 53
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    invoke-virtual {v3}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->getResourceKeyPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "SingularName"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->setSingularName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;

    .line 54
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    invoke-virtual {v3}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->getResourceKeyPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "PluralName"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->setPluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;

    .line 57
    :try_start_0
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    invoke-virtual {v3}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->getResourceKeyPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "FuturePluralName"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->setFuturePluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 61
    :goto_1
    :try_start_1
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    invoke-virtual {v3}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->getResourceKeyPrefix()Ljava/lang/String;

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

    invoke-virtual {p0, v1}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->setFutureSingularName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 65
    :goto_2
    :try_start_2
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    invoke-virtual {v3}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->getResourceKeyPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "PastPluralName"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->setPastPluralName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 69
    :goto_3
    :try_start_3
    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->bundle:Ljava/util/ResourceBundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->unit:Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;

    invoke-virtual {v3}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->getResourceKeyPrefix()Ljava/lang/String;

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

    invoke-virtual {p0, v1}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->setPastSingularName(Ljava/lang/String;)Lorg/ocpsoft/prettytime/format/SimpleTimeFormat;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 75
    :cond_1
    :goto_4
    return-object p0

    .line 42
    :cond_2
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeFormat;->override:Lorg/ocpsoft/prettytime/TimeFormat;

    goto/16 :goto_0

    .line 71
    :catch_0
    move-exception v1

    goto :goto_4

    .line 67
    :catch_1
    move-exception v1

    goto :goto_3

    .line 63
    :catch_2
    move-exception v1

    goto :goto_2

    .line 59
    :catch_3
    move-exception v1

    goto :goto_1
.end method
