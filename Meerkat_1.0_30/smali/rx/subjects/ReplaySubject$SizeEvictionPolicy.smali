.class final Lrx/subjects/ReplaySubject$SizeEvictionPolicy;
.super Ljava/lang/Object;
.source "ReplaySubject.java"

# interfaces
.implements Lrx/subjects/ReplaySubject$EvictionPolicy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/subjects/ReplaySubject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SizeEvictionPolicy"
.end annotation


# instance fields
.field final maxSize:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "maxSize"    # I

    .prologue
    .line 819
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 820
    iput p1, p0, Lrx/subjects/ReplaySubject$SizeEvictionPolicy;->maxSize:I

    .line 821
    return-void
.end method


# virtual methods
.method public evict(Lrx/subjects/ReplaySubject$NodeList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/ReplaySubject$NodeList",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 825
    .local p1, "t1":Lrx/subjects/ReplaySubject$NodeList;, "Lrx/subjects/ReplaySubject$NodeList<Ljava/lang/Object;>;"
    :goto_0
    invoke-virtual {p1}, Lrx/subjects/ReplaySubject$NodeList;->size()I

    move-result v0

    iget v1, p0, Lrx/subjects/ReplaySubject$SizeEvictionPolicy;->maxSize:I

    if-le v0, v1, :cond_0

    .line 826
    invoke-virtual {p1}, Lrx/subjects/ReplaySubject$NodeList;->removeFirst()Ljava/lang/Object;

    goto :goto_0

    .line 828
    :cond_0
    return-void
.end method

.method public evictFinal(Lrx/subjects/ReplaySubject$NodeList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/ReplaySubject$NodeList",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 837
    .local p1, "t1":Lrx/subjects/ReplaySubject$NodeList;, "Lrx/subjects/ReplaySubject$NodeList<Ljava/lang/Object;>;"
    :goto_0
    invoke-virtual {p1}, Lrx/subjects/ReplaySubject$NodeList;->size()I

    move-result v0

    iget v1, p0, Lrx/subjects/ReplaySubject$SizeEvictionPolicy;->maxSize:I

    add-int/lit8 v1, v1, 0x1

    if-le v0, v1, :cond_0

    .line 838
    invoke-virtual {p1}, Lrx/subjects/ReplaySubject$NodeList;->removeFirst()Ljava/lang/Object;

    goto :goto_0

    .line 840
    :cond_0
    return-void
.end method

.method public test(Ljava/lang/Object;J)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "now"    # J

    .prologue
    .line 832
    const/4 v0, 0x0

    return v0
.end method
