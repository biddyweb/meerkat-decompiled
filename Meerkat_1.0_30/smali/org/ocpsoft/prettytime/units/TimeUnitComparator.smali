.class public Lorg/ocpsoft/prettytime/units/TimeUnitComparator;
.super Ljava/lang/Object;
.source "TimeUnitComparator.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/ocpsoft/prettytime/TimeUnit;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 29
    check-cast p1, Lorg/ocpsoft/prettytime/TimeUnit;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/ocpsoft/prettytime/TimeUnit;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/ocpsoft/prettytime/units/TimeUnitComparator;->compare(Lorg/ocpsoft/prettytime/TimeUnit;Lorg/ocpsoft/prettytime/TimeUnit;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/ocpsoft/prettytime/TimeUnit;Lorg/ocpsoft/prettytime/TimeUnit;)I
    .locals 4
    .param p1, "left"    # Lorg/ocpsoft/prettytime/TimeUnit;
    .param p2, "right"    # Lorg/ocpsoft/prettytime/TimeUnit;

    .prologue
    .line 34
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/TimeUnit;->getMillisPerUnit()J

    move-result-wide v0

    invoke-interface {p2}, Lorg/ocpsoft/prettytime/TimeUnit;->getMillisPerUnit()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 35
    const/4 v0, -0x1

    .line 39
    :goto_0
    return v0

    .line 36
    :cond_0
    invoke-interface {p1}, Lorg/ocpsoft/prettytime/TimeUnit;->getMillisPerUnit()J

    move-result-wide v0

    invoke-interface {p2}, Lorg/ocpsoft/prettytime/TimeUnit;->getMillisPerUnit()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 37
    const/4 v0, 0x1

    goto :goto_0

    .line 39
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
