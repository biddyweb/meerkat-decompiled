.class Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;
.super Ljava/lang/Object;
.source "Resources_cs.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ocpsoft/prettytime/i18n/Resources_cs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CsName"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;",
        ">;"
    }
.end annotation


# instance fields
.field private final isFuture:Z

.field private final threshold:Ljava/lang/Long;

.field private final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZLjava/lang/String;Ljava/lang/Long;)V
    .locals 0
    .param p1, "isFuture"    # Z
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "threshold"    # Ljava/lang/Long;

    .prologue
    .line 325
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 326
    iput-boolean p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;->isFuture:Z

    .line 327
    iput-object p2, p0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;->value:Ljava/lang/String;

    .line 328
    iput-object p3, p0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;->threshold:Ljava/lang/Long;

    .line 329
    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 317
    check-cast p1, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;->compareTo(Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;)I
    .locals 4
    .param p1, "o"    # Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;

    .prologue
    .line 345
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;->threshold:Ljava/lang/Long;

    invoke-virtual {p1}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;->getThreshold()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    move-result v0

    return v0
.end method

.method public get()Ljava/lang/String;
    .locals 1

    .prologue
    .line 336
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;->value:Ljava/lang/String;

    return-object v0
.end method

.method public getThreshold()J
    .locals 2

    .prologue
    .line 340
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;->threshold:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public isFuture()Z
    .locals 1

    .prologue
    .line 332
    iget-boolean v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;->isFuture:Z

    return v0
.end method
