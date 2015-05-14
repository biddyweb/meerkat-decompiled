.class public abstract Lrx/Subscriber;
.super Ljava/lang/Object;
.source "Subscriber.java"

# interfaces
.implements Lrx/Observer;
.implements Lrx/Subscription;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Observer",
        "<TT;>;",
        "Lrx/Subscription;"
    }
.end annotation


# instance fields
.field private final cs:Lrx/internal/util/SubscriptionList;

.field private final op:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<*>;"
        }
    .end annotation
.end field

.field private p:Lrx/Producer;

.field private requested:J


# direct methods
.method protected constructor <init>()V
    .locals 2

    .prologue
    .line 43
    .local p0, "this":Lrx/Subscriber;, "Lrx/Subscriber<TT;>;"
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lrx/Subscriber;-><init>(Lrx/Subscriber;Z)V

    .line 44
    return-void
.end method

.method protected constructor <init>(Lrx/Subscriber;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lrx/Subscriber;, "Lrx/Subscriber<TT;>;"
    .local p1, "op":Lrx/Subscriber;, "Lrx/Subscriber<*>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lrx/Subscriber;-><init>(Lrx/Subscriber;Z)V

    .line 48
    return-void
.end method

.method protected constructor <init>(Lrx/Subscriber;Z)V
    .locals 2
    .param p2, "shareSubscriptions"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lrx/Subscriber;, "Lrx/Subscriber<TT;>;"
    .local p1, "op":Lrx/Subscriber;, "Lrx/Subscriber<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lrx/Subscriber;->requested:J

    .line 63
    iput-object p1, p0, Lrx/Subscriber;->op:Lrx/Subscriber;

    .line 64
    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p1, Lrx/Subscriber;->cs:Lrx/internal/util/SubscriptionList;

    :goto_0
    iput-object v0, p0, Lrx/Subscriber;->cs:Lrx/internal/util/SubscriptionList;

    .line 65
    return-void

    .line 64
    :cond_0
    new-instance v0, Lrx/internal/util/SubscriptionList;

    invoke-direct {v0}, Lrx/internal/util/SubscriptionList;-><init>()V

    goto :goto_0
.end method


# virtual methods
.method public final add(Lrx/Subscription;)V
    .locals 1
    .param p1, "s"    # Lrx/Subscription;

    .prologue
    .line 76
    .local p0, "this":Lrx/Subscriber;, "Lrx/Subscriber<TT;>;"
    iget-object v0, p0, Lrx/Subscriber;->cs:Lrx/internal/util/SubscriptionList;

    invoke-virtual {v0, p1}, Lrx/internal/util/SubscriptionList;->add(Lrx/Subscription;)V

    .line 77
    return-void
.end method

.method public final isUnsubscribed()Z
    .locals 1

    .prologue
    .line 91
    .local p0, "this":Lrx/Subscriber;, "Lrx/Subscriber<TT;>;"
    iget-object v0, p0, Lrx/Subscriber;->cs:Lrx/internal/util/SubscriptionList;

    invoke-virtual {v0}, Lrx/internal/util/SubscriptionList;->isUnsubscribed()Z

    move-result v0

    return v0
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 101
    .local p0, "this":Lrx/Subscriber;, "Lrx/Subscriber<TT;>;"
    return-void
.end method

.method protected final request(J)V
    .locals 11
    .param p1, "n"    # J

    .prologue
    .local p0, "this":Lrx/Subscriber;, "Lrx/Subscriber<TT;>;"
    const-wide/16 v8, 0x0

    .line 124
    cmp-long v1, p1, v8

    if-gez v1, :cond_0

    .line 125
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "number requested cannot be negative: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 127
    :cond_0
    const/4 v0, 0x0

    .line 128
    .local v0, "shouldRequest":Lrx/Producer;
    monitor-enter p0

    .line 129
    :try_start_0
    iget-object v1, p0, Lrx/Subscriber;->p:Lrx/Producer;

    if-eqz v1, :cond_2

    .line 130
    iget-object v0, p0, Lrx/Subscriber;->p:Lrx/Producer;

    .line 142
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    if-eqz v0, :cond_1

    .line 145
    invoke-interface {v0, p1, p2}, Lrx/Producer;->request(J)V

    .line 147
    :cond_1
    return-void

    .line 131
    :cond_2
    :try_start_1
    iget-wide v4, p0, Lrx/Subscriber;->requested:J

    const-wide/high16 v6, -0x8000000000000000L

    cmp-long v1, v4, v6

    if-nez v1, :cond_3

    .line 132
    iput-wide p1, p0, Lrx/Subscriber;->requested:J

    goto :goto_0

    .line 142
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 134
    :cond_3
    :try_start_2
    iget-wide v4, p0, Lrx/Subscriber;->requested:J

    add-long v2, v4, p1

    .line 136
    .local v2, "total":J
    cmp-long v1, v2, v8

    if-gez v1, :cond_4

    .line 137
    const-wide v4, 0x7fffffffffffffffL

    iput-wide v4, p0, Lrx/Subscriber;->requested:J

    goto :goto_0

    .line 139
    :cond_4
    iput-wide v2, p0, Lrx/Subscriber;->requested:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public setProducer(Lrx/Producer;)V
    .locals 6
    .param p1, "producer"    # Lrx/Producer;

    .prologue
    .local p0, "this":Lrx/Subscriber;, "Lrx/Subscriber<TT;>;"
    const-wide/high16 v4, -0x8000000000000000L

    .line 156
    const/4 v0, 0x0

    .line 157
    .local v0, "setProducer":Z
    monitor-enter p0

    .line 158
    :try_start_0
    iget-wide v2, p0, Lrx/Subscriber;->requested:J

    .line 159
    .local v2, "toRequest":J
    iput-object p1, p0, Lrx/Subscriber;->p:Lrx/Producer;

    .line 160
    iget-object v1, p0, Lrx/Subscriber;->op:Lrx/Subscriber;

    if-eqz v1, :cond_0

    .line 162
    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    .line 164
    const/4 v0, 0x1

    .line 168
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    if-eqz v0, :cond_1

    .line 171
    iget-object v1, p0, Lrx/Subscriber;->op:Lrx/Subscriber;

    iget-object v4, p0, Lrx/Subscriber;->p:Lrx/Producer;

    invoke-virtual {v1, v4}, Lrx/Subscriber;->setProducer(Lrx/Producer;)V

    .line 180
    :goto_0
    return-void

    .line 168
    .end local v2    # "toRequest":J
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 174
    .restart local v2    # "toRequest":J
    :cond_1
    cmp-long v1, v2, v4

    if-nez v1, :cond_2

    .line 175
    iget-object v1, p0, Lrx/Subscriber;->p:Lrx/Producer;

    const-wide v4, 0x7fffffffffffffffL

    invoke-interface {v1, v4, v5}, Lrx/Producer;->request(J)V

    goto :goto_0

    .line 177
    :cond_2
    iget-object v1, p0, Lrx/Subscriber;->p:Lrx/Producer;

    invoke-interface {v1, v2, v3}, Lrx/Producer;->request(J)V

    goto :goto_0
.end method

.method public final unsubscribe()V
    .locals 1

    .prologue
    .line 81
    .local p0, "this":Lrx/Subscriber;, "Lrx/Subscriber<TT;>;"
    iget-object v0, p0, Lrx/Subscriber;->cs:Lrx/internal/util/SubscriptionList;

    invoke-virtual {v0}, Lrx/internal/util/SubscriptionList;->unsubscribe()V

    .line 82
    return-void
.end method
