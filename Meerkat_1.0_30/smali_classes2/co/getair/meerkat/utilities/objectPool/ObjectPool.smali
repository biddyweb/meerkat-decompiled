.class public Lco/getair/meerkat/utilities/objectPool/ObjectPool;
.super Ljava/lang/Object;
.source "ObjectPool.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private locked:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private objects:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    .local p0, "this":Lco/getair/meerkat/utilities/objectPool/ObjectPool;, "Lco/getair/meerkat/utilities/objectPool/ObjectPool<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v0}, Lco/getair/meerkat/utilities/objectPool/ObjectPool;-><init>(Ljava/util/ArrayList;)V

    .line 23
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 18
    .local p0, "this":Lco/getair/meerkat/utilities/objectPool/ObjectPool;, "Lco/getair/meerkat/utilities/objectPool/ObjectPool<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-direct {p0, v0}, Lco/getair/meerkat/utilities/objectPool/ObjectPool;-><init>(Ljava/util/ArrayList;)V

    .line 19
    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 12
    .local p0, "this":Lco/getair/meerkat/utilities/objectPool/ObjectPool;, "Lco/getair/meerkat/utilities/objectPool/ObjectPool<TT;>;"
    .local p1, "objects":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lco/getair/meerkat/utilities/objectPool/ObjectPool;->objects:Ljava/util/ArrayList;

    .line 14
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lco/getair/meerkat/utilities/objectPool/ObjectPool;->locked:Ljava/util/ArrayList;

    .line 15
    return-void
.end method


# virtual methods
.method public declared-synchronized add(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 26
    .local p0, "this":Lco/getair/meerkat/utilities/objectPool/ObjectPool;, "Lco/getair/meerkat/utilities/objectPool/ObjectPool<TT;>;"
    .local p1, "object":Ljava/lang/Object;, "TT;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lco/getair/meerkat/utilities/objectPool/ObjectPool;->objects:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    iget-object v0, p0, Lco/getair/meerkat/utilities/objectPool/ObjectPool;->locked:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    monitor-exit p0

    return-void

    .line 26
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException;
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "this":Lco/getair/meerkat/utilities/objectPool/ObjectPool;, "Lco/getair/meerkat/utilities/objectPool/ObjectPool<TT;>;"
    monitor-enter p0

    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/utilities/objectPool/ObjectPool;->locked:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 32
    iget-object v1, p0, Lco/getair/meerkat/utilities/objectPool/ObjectPool;->locked:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    .line 33
    iget-object v1, p0, Lco/getair/meerkat/utilities/objectPool/ObjectPool;->locked:Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 34
    iget-object v1, p0, Lco/getair/meerkat/utilities/objectPool/ObjectPool;->objects:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit p0

    return-object v1

    .line 31
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 37
    :cond_1
    :try_start_1
    new-instance v1, Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException;

    invoke-direct {v1}, Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException;-><init>()V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized release(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/getair/meerkat/utilities/objectPool/UnknownObjectException;
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lco/getair/meerkat/utilities/objectPool/ObjectPool;, "Lco/getair/meerkat/utilities/objectPool/ObjectPool<TT;>;"
    .local p1, "object":Ljava/lang/Object;, "TT;"
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/utilities/objectPool/ObjectPool;->objects:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 43
    .local v0, "i":I
    if-gez v0, :cond_0

    .line 44
    new-instance v1, Lco/getair/meerkat/utilities/objectPool/UnknownObjectException;

    invoke-direct {v1}, Lco/getair/meerkat/utilities/objectPool/UnknownObjectException;-><init>()V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .end local v0    # "i":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 46
    .restart local v0    # "i":I
    :cond_0
    :try_start_1
    iget-object v1, p0, Lco/getair/meerkat/utilities/objectPool/ObjectPool;->locked:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    monitor-exit p0

    return-void
.end method
