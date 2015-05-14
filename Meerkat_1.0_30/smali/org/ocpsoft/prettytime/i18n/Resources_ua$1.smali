.class Lorg/ocpsoft/prettytime/i18n/Resources_ua$1;
.super Ljava/lang/Object;
.source "Resources_ua.java"

# interfaces
.implements Lorg/ocpsoft/prettytime/TimeFormat;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/ocpsoft/prettytime/i18n/Resources_ua;->getFormatFor(Lorg/ocpsoft/prettytime/TimeUnit;)Lorg/ocpsoft/prettytime/TimeFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/ocpsoft/prettytime/i18n/Resources_ua;


# direct methods
.method constructor <init>(Lorg/ocpsoft/prettytime/i18n/Resources_ua;)V
    .locals 0

    .prologue
    .line 129
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$1;->this$0:Lorg/ocpsoft/prettytime/i18n/Resources_ua;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private performFormat(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 141
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInFuture()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 142
    const-string v0, "\u0437\u0430\u0440\u0430\u0437"

    .line 147
    :goto_0
    return-object v0

    .line 144
    :cond_0
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInPast()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 145
    const-string v0, "\u0449\u043e\u0439\u043d\u043e"

    goto :goto_0

    .line 147
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public decorate(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "time"    # Ljava/lang/String;

    .prologue
    .line 152
    return-object p2
.end method

.method public decorateUnrounded(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "time"    # Ljava/lang/String;

    .prologue
    .line 157
    return-object p2
.end method

.method public format(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 132
    invoke-direct {p0, p1}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$1;->performFormat(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public formatUnrounded(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 1
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 137
    invoke-direct {p0, p1}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$1;->performFormat(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
