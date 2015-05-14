.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;
.super Ljava/lang/Object;
.source "RangeStartMap.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K::",
        "Ljava/lang/Comparable;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field base:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 20
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Ljava/util/TreeMap;

    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap$1;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;)V

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    .line 21
    return-void
.end method

.method public constructor <init>(Ljava/lang/Comparable;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    .local p1, "k":Ljava/lang/Comparable;, "TK;"
    .local p2, "v":Ljava/lang/Object;, "TV;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Ljava/util/TreeMap;

    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap$1;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;)V

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    .line 24
    invoke-virtual {p0, p1, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->put(Ljava/lang/Comparable;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 100
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->clear()V

    .line 101
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 36
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 40
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "k"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    const/4 v3, 0x0

    .line 44
    instance-of v4, p1, Ljava/lang/Comparable;

    if-nez v4, :cond_1

    .line 61
    :cond_0
    :goto_0
    return-object v3

    :cond_1
    move-object v1, p1

    .line 47
    check-cast v1, Ljava/lang/Comparable;

    .line 48
    .local v1, "key":Ljava/lang/Comparable;, "Ljava/lang/Comparable<TK;>;"
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 51
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v3}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 52
    .local v2, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<TK;>;"
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Comparable;

    .line 54
    .local v0, "a":Ljava/lang/Comparable;, "TK;"
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 55
    invoke-interface {v1, v0}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v3

    if-gez v3, :cond_2

    .line 56
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "a":Ljava/lang/Comparable;, "TK;"
    check-cast v0, Ljava/lang/Comparable;

    .restart local v0    # "a":Ljava/lang/Comparable;, "TK;"
    goto :goto_1

    .line 58
    :cond_2
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v3, v0}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0

    .line 61
    :cond_3
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v3, v0}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 32
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 105
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Comparable;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Comparable;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 13
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    check-cast p1, Ljava/lang/Comparable;

    invoke-virtual {p0, p1, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->put(Ljava/lang/Comparable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    .local p1, "m":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->putAll(Ljava/util/Map;)V

    .line 96
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "k"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    const/4 v3, 0x0

    .line 71
    instance-of v4, p1, Ljava/lang/Comparable;

    if-nez v4, :cond_1

    .line 88
    :cond_0
    :goto_0
    return-object v3

    :cond_1
    move-object v1, p1

    .line 74
    check-cast v1, Ljava/lang/Comparable;

    .line 75
    .local v1, "key":Ljava/lang/Comparable;, "Ljava/lang/Comparable<TK;>;"
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 78
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v3}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 79
    .local v2, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<TK;>;"
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Comparable;

    .line 81
    .local v0, "a":Ljava/lang/Comparable;, "TK;"
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 82
    invoke-interface {v1, v0}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v3

    if-gez v3, :cond_2

    .line 83
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "a":Ljava/lang/Comparable;, "TK;"
    check-cast v0, Ljava/lang/Comparable;

    .restart local v0    # "a":Ljava/lang/Comparable;, "TK;"
    goto :goto_1

    .line 85
    :cond_2
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v3, v0}, Ljava/util/TreeMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0

    .line 88
    :cond_3
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v3, v0}, Ljava/util/TreeMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 28
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 110
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<TK;TV;>;"
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->base:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
