.class Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;
.super Ljava/lang/Object;
.source "Resources_ua.java"

# interfaces
.implements Lorg/ocpsoft/prettytime/TimeFormat;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ocpsoft/prettytime/i18n/Resources_ua;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TimeFormatAided"
.end annotation


# instance fields
.field private final pluarls:[Ljava/lang/String;


# direct methods
.method public varargs constructor <init>([Ljava/lang/String;)V
    .locals 2
    .param p1, "plurals"    # [Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    array-length v0, p1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 52
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Wrong plural forms number for slavic language!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_0
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;->pluarls:[Ljava/lang/String;

    .line 55
    return-void
.end method

.method private performDecoration(ZZJLjava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p1, "past"    # Z
    .param p2, "future"    # Z
    .param p3, "n"    # J
    .param p5, "time"    # Ljava/lang/String;

    .prologue
    const-wide/16 v10, 0x64

    const-wide/16 v8, 0xa

    .line 96
    rem-long v4, p3, v8

    const-wide/16 v6, 0x1

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    rem-long v4, p3, v10

    const-wide/16 v6, 0xb

    cmp-long v4, v4, v6

    if-eqz v4, :cond_0

    const/4 v2, 0x0

    .line 97
    .local v2, "pluralIdx":I
    :goto_0
    const/4 v4, 0x3

    if-le v2, v4, :cond_3

    .line 99
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Wrong plural index was calculated somehow for slavic language"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 96
    .end local v2    # "pluralIdx":I
    :cond_0
    rem-long v4, p3, v8

    const-wide/16 v6, 0x2

    cmp-long v4, v4, v6

    if-ltz v4, :cond_2

    rem-long v4, p3, v8

    const-wide/16 v6, 0x4

    cmp-long v4, v4, v6

    if-gtz v4, :cond_2

    rem-long v4, p3, v10

    cmp-long v4, v4, v8

    if-ltz v4, :cond_1

    rem-long v4, p3, v10

    const-wide/16 v6, 0x14

    cmp-long v4, v4, v6

    if-ltz v4, :cond_2

    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v2, 0x2

    goto :goto_0

    .line 102
    .restart local v2    # "pluralIdx":I
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 104
    .local v3, "result":Ljava/lang/StringBuilder;
    if-eqz p2, :cond_4

    .line 105
    const-string v4, "\u0447\u0435\u0440\u0435\u0437 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    :cond_4
    move-object/from16 v0, p5

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    const/16 v4, 0x20

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 110
    iget-object v4, p0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;->pluarls:[Ljava/lang/String;

    aget-object v4, v4, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    if-eqz p1, :cond_5

    .line 113
    const-string v4, " \u0442\u043e\u043c\u0443"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    :cond_5
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public decorate(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "time"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInPast()Z

    move-result v2

    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInFuture()Z

    move-result v3

    const/16 v0, 0x32

    invoke-interface {p1, v0}, Lorg/ocpsoft/prettytime/Duration;->getQuantityRounded(I)J

    move-result-wide v4

    move-object v1, p0

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;->performDecoration(ZZJLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public decorateUnrounded(Lorg/ocpsoft/prettytime/Duration;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;
    .param p2, "time"    # Ljava/lang/String;

    .prologue
    .line 85
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInPast()Z

    move-result v2

    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->isInFuture()Z

    move-result v3

    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->getQuantity()J

    move-result-wide v4

    move-object v1, p0

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;->performDecoration(ZZJLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 4
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 59
    const/16 v3, 0x32

    invoke-interface {p1, v3}, Lorg/ocpsoft/prettytime/Duration;->getQuantityRounded(I)J

    move-result-wide v0

    .line 60
    .local v0, "quantity":J
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .local v2, "result":Ljava/lang/StringBuilder;
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 62
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public formatUnrounded(Lorg/ocpsoft/prettytime/Duration;)Ljava/lang/String;
    .locals 4
    .param p1, "duration"    # Lorg/ocpsoft/prettytime/Duration;

    .prologue
    .line 67
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/Duration;->getQuantity()J

    move-result-wide v0

    .line 68
    .local v0, "quantity":J
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .local v2, "result":Ljava/lang/StringBuilder;
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 70
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
