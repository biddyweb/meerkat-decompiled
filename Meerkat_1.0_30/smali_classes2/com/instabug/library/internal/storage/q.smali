.class public final Lcom/instabug/library/internal/storage/q;
.super Ljava/lang/Object;
.source "IssuesDataRepository.java"

# interfaces
.implements Lcom/instabug/library/internal/storage/s;


# static fields
.field private static a:Lcom/instabug/library/internal/storage/q;


# instance fields
.field private b:Lcom/instabug/library/internal/storage/p;


# direct methods
.method private constructor <init>(Lcom/instabug/library/internal/storage/p;)V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/instabug/library/internal/storage/q;->b:Lcom/instabug/library/internal/storage/p;

    .line 21
    return-void
.end method

.method public static declared-synchronized a(Lcom/instabug/library/internal/storage/p;)Lcom/instabug/library/internal/storage/q;
    .locals 2

    .prologue
    .line 11
    const-class v1, Lcom/instabug/library/internal/storage/q;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/instabug/library/internal/storage/q;->a:Lcom/instabug/library/internal/storage/q;

    if-nez v0, :cond_0

    .line 12
    new-instance v0, Lcom/instabug/library/internal/storage/q;

    invoke-direct {v0, p0}, Lcom/instabug/library/internal/storage/q;-><init>(Lcom/instabug/library/internal/storage/p;)V

    sput-object v0, Lcom/instabug/library/internal/storage/q;->a:Lcom/instabug/library/internal/storage/q;

    .line 14
    :cond_0
    sget-object v0, Lcom/instabug/library/internal/storage/q;->a:Lcom/instabug/library/internal/storage/q;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 11
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public final declared-synchronized a()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 55
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/internal/storage/q;->b:Lcom/instabug/library/internal/storage/p;

    invoke-interface {v0}, Lcom/instabug/library/internal/storage/p;->a()Ljava/util/ArrayList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized a(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 2

    .prologue
    .line 25
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/internal/storage/q;->b:Lcom/instabug/library/internal/storage/p;

    new-instance v1, Lcom/instabug/library/internal/storage/r;

    invoke-direct {v1, p0, p2}, Lcom/instabug/library/internal/storage/r;-><init>(Lcom/instabug/library/internal/storage/q;Lcom/instabug/library/internal/storage/e$a;)V

    invoke-interface {v0, p1, v1}, Lcom/instabug/library/internal/storage/p;->b(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    monitor-exit p0

    return-void

    .line 25
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
