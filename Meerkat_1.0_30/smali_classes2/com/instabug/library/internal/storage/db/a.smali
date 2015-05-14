.class public abstract Lcom/instabug/library/internal/storage/db/a;
.super Ljava/lang/Object;
.source "BaseDao.java"


# instance fields
.field protected a:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/instabug/library/internal/storage/db/a;->a:Landroid/database/sqlite/SQLiteDatabase;

    .line 11
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/ContentValues;)J
    .locals 3

    .prologue
    .line 14
    iget-object v0, p0, Lcom/instabug/library/internal/storage/db/a;->a:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0}, Lcom/instabug/library/internal/storage/db/a;->a()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    return-wide v0
.end method

.method protected abstract a()Ljava/lang/String;
.end method

.method public final a(J)V
    .locals 5

    .prologue
    .line 26
    iget-object v0, p0, Lcom/instabug/library/internal/storage/db/a;->a:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0}, Lcom/instabug/library/internal/storage/db/a;->a()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "_ID = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 27
    return-void
.end method

.method public final a(Landroid/content/ContentValues;J)V
    .locals 4

    .prologue
    .line 18
    iget-object v0, p0, Lcom/instabug/library/internal/storage/db/a;->a:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0}, Lcom/instabug/library/internal/storage/db/a;->a()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "_ID = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, p1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 19
    return-void
.end method
