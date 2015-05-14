.class public final Lcom/instabug/library/internal/storage/db/b;
.super Lcom/instabug/library/internal/storage/db/a;
.source "BugReportDao.java"


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/instabug/library/internal/storage/db/a;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 29
    return-void
.end method

.method public static a(Lcom/instabug/library/model/a;)Landroid/content/ContentValues;
    .locals 4

    .prologue
    .line 32
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 33
    const-string v1, "BUG_JSON"

    invoke-virtual {p0}, Lcom/instabug/library/model/a;->f()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    const-string v1, "FILE_PATH"

    invoke-virtual {p0}, Lcom/instabug/library/model/a;->l()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    const-string v1, "IMAGE_PATH"

    invoke-virtual {p0}, Lcom/instabug/library/model/a;->k()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    const-string v1, "SENT"

    invoke-virtual {p0}, Lcom/instabug/library/model/a;->h()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 37
    const-string v1, "BUG_ID"

    invoke-virtual {p0}, Lcom/instabug/library/model/a;->g()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 38
    const-string v1, "FILE_UPLOADED"

    invoke-virtual {p0}, Lcom/instabug/library/model/a;->i()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 39
    const-string v1, "PHOTO_UPLOADED"

    invoke-virtual {p0}, Lcom/instabug/library/model/a;->j()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 40
    return-object v0
.end method

.method private static a(Landroid/database/Cursor;)Lcom/instabug/library/model/a;
    .locals 4

    .prologue
    .line 98
    new-instance v1, Lcom/instabug/library/model/a;

    invoke-direct {v1}, Lcom/instabug/library/model/a;-><init>()V

    .line 99
    const-string v0, "_id"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/instabug/library/model/a;->a(J)V

    .line 101
    :try_start_0
    const-string v0, "BUG_JSON"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/instabug/library/model/a;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    :goto_0
    const-string v0, "BUG_ID"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/instabug/library/model/a;->b(J)V

    .line 106
    const-string v0, "IMAGE_PATH"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/instabug/library/model/a;->b(Ljava/lang/String;)V

    .line 107
    const-string v0, "FILE_PATH"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/instabug/library/model/a;->c(Ljava/lang/String;)V

    .line 108
    const-string v0, "SENT"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/instabug/library/model/a;->b(I)V

    .line 109
    const-string v0, "FILE_UPLOADED"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/instabug/library/model/a;->c(I)V

    .line 110
    const-string v0, "PHOTO_UPLOADED"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/instabug/library/model/a;->d(I)V

    .line 111
    return-object v1

    .line 102
    :catch_0
    move-exception v0

    .line 103
    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method protected final a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    const-string v0, "BUG_REPORTS"

    return-object v0
.end method

.method public final b()Ljava/util/ArrayList;
    .locals 9

    .prologue
    const/4 v2, 0x0

    .line 61
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 62
    iget-object v0, p0, Lcom/instabug/library/internal/storage/db/b;->a:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "BUG_REPORTS"

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 64
    if-eqz v1, :cond_1

    .line 65
    const/4 v0, 0x0

    :goto_0
    :try_start_0
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-ge v0, v2, :cond_1

    .line 67
    :try_start_1
    invoke-interface {v1, v0}, Landroid/database/Cursor;->move(I)Z

    .line 68
    invoke-static {v1}, Lcom/instabug/library/internal/storage/db/b;->a(Landroid/database/Cursor;)Lcom/instabug/library/model/a;

    move-result-object v2

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 70
    :catch_0
    move-exception v2

    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Couldn\'t read issue at row "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ". Skipping."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/instabug/library/Instabug$a;->c(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 75
    :catchall_0
    move-exception v0

    if-eqz v1, :cond_0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_0
    throw v0

    :cond_1
    if-eqz v1, :cond_2

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 77
    :cond_2
    return-object v8
.end method
