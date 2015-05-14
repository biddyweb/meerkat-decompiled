.class public Lcom/instabug/library/internal/storage/d;
.super Ljava/lang/Object;
.source "CacheStore.java"


# instance fields
.field private a:Lcom/instabug/library/internal/storage/db/d;


# direct methods
.method public constructor <init>(Lcom/instabug/library/internal/storage/db/d;)V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/instabug/library/internal/storage/d;->a:Lcom/instabug/library/internal/storage/db/d;

    .line 18
    return-void
.end method


# virtual methods
.method public a()Ljava/util/ArrayList;
    .locals 2

    .prologue
    .line 22
    iget-object v0, p0, Lcom/instabug/library/internal/storage/d;->a:Lcom/instabug/library/internal/storage/db/d;

    invoke-virtual {v0}, Lcom/instabug/library/internal/storage/db/d;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 24
    new-instance v1, Lcom/instabug/library/internal/storage/db/b;

    invoke-direct {v1, v0}, Lcom/instabug/library/internal/storage/db/b;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 25
    invoke-virtual {v1}, Lcom/instabug/library/internal/storage/db/b;->b()Ljava/util/ArrayList;

    move-result-object v1

    .line 26
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 27
    return-object v1
.end method

.method public a(Lcom/instabug/library/model/a;)V
    .locals 5

    .prologue
    .line 32
    iget-object v0, p0, Lcom/instabug/library/internal/storage/d;->a:Lcom/instabug/library/internal/storage/db/d;

    invoke-virtual {v0}, Lcom/instabug/library/internal/storage/db/d;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 33
    new-instance v1, Lcom/instabug/library/internal/storage/db/b;

    invoke-direct {v1, v0}, Lcom/instabug/library/internal/storage/db/b;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 34
    const-string v2, "insertBugIntoCache: Inserting bug"

    invoke-static {v2}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 35
    invoke-static {p1}, Lcom/instabug/library/internal/storage/db/b;->a(Lcom/instabug/library/model/a;)Landroid/content/ContentValues;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/instabug/library/internal/storage/db/b;->a(Landroid/content/ContentValues;)J

    move-result-wide v2

    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "insertBugIntoCache: Bug inserted "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 37
    invoke-virtual {p1, v2, v3}, Lcom/instabug/library/model/a;->a(J)V

    .line 38
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 39
    return-void
.end method

.method public b(Lcom/instabug/library/model/a;)Z
    .locals 6

    .prologue
    .line 43
    iget-object v0, p0, Lcom/instabug/library/internal/storage/d;->a:Lcom/instabug/library/internal/storage/db/d;

    invoke-virtual {v0}, Lcom/instabug/library/internal/storage/db/d;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 44
    new-instance v0, Lcom/instabug/library/internal/storage/db/b;

    invoke-direct {v0, v1}, Lcom/instabug/library/internal/storage/db/b;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 46
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "removeBugFromCache: Deleting bug "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/instabug/library/model/a;->e()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 47
    invoke-virtual {p1}, Lcom/instabug/library/model/a;->e()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/instabug/library/internal/storage/db/b;->a(J)V

    .line 48
    const-string v0, "removeBugFromCache: Bug deleted"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/instabug/library/internal/storage/db/c; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 56
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 49
    :catch_0
    move-exception v0

    .line 50
    :try_start_1
    invoke-virtual {v0}, Lcom/instabug/library/internal/storage/db/c;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    throw v0
.end method

.method public c(Lcom/instabug/library/model/a;)Z
    .locals 6

    .prologue
    .line 61
    iget-object v0, p0, Lcom/instabug/library/internal/storage/d;->a:Lcom/instabug/library/internal/storage/db/d;

    invoke-virtual {v0}, Lcom/instabug/library/internal/storage/db/d;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 62
    new-instance v0, Lcom/instabug/library/internal/storage/db/b;

    invoke-direct {v0, v1}, Lcom/instabug/library/internal/storage/db/b;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 64
    :try_start_0
    invoke-static {p1}, Lcom/instabug/library/internal/storage/db/b;->a(Lcom/instabug/library/model/a;)Landroid/content/ContentValues;

    move-result-object v2

    invoke-virtual {p1}, Lcom/instabug/library/model/a;->e()J

    move-result-wide v4

    invoke-virtual {v0, v2, v4, v5}, Lcom/instabug/library/internal/storage/db/b;->a(Landroid/content/ContentValues;J)V
    :try_end_0
    .catch Lcom/instabug/library/internal/storage/db/c; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 72
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 65
    :catch_0
    move-exception v0

    .line 66
    :try_start_1
    invoke-virtual {v0}, Lcom/instabug/library/internal/storage/db/c;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    throw v0
.end method
