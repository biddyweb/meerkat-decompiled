.class public final Lcom/instabug/library/internal/storage/db/d;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "InstabugOpenHelper.java"


# static fields
.field private static a:Lcom/instabug/library/internal/storage/db/d;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 33
    const-string v0, "instabugdb"

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 34
    return-void
.end method

.method public static declared-synchronized a(Landroid/content/Context;)Lcom/instabug/library/internal/storage/db/d;
    .locals 2

    .prologue
    .line 26
    const-class v1, Lcom/instabug/library/internal/storage/db/d;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/instabug/library/internal/storage/db/d;->a:Lcom/instabug/library/internal/storage/db/d;

    if-nez v0, :cond_0

    .line 27
    new-instance v0, Lcom/instabug/library/internal/storage/db/d;

    invoke-direct {v0, p0}, Lcom/instabug/library/internal/storage/db/d;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/instabug/library/internal/storage/db/d;->a:Lcom/instabug/library/internal/storage/db/d;

    .line 29
    :cond_0
    sget-object v0, Lcom/instabug/library/internal/storage/db/d;->a:Lcom/instabug/library/internal/storage/db/d;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 26
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public final getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .prologue
    .line 44
    const-string v0, "DB: Readable Database reference requested"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 45
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public final getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .prologue
    .line 38
    const-string v0, "DB: Writable Database reference requested."

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 39
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public final onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    .prologue
    .line 50
    const-string v0, "SQLiteOpenHelper: OnCreate"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 52
    :try_start_0
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 53
    const-string v0, "CREATE TABLE BUG_REPORTS(\n\t_id INTEGER PRIMARY KEY AUTOINCREMENT,\n\tBUG_JSON TEXT NOT NULL,\n\tIMAGE_PATH TEXT DEFAULT \"\",\n\tFILE_PATH TEXT DEFAULT \"\",\n\tBUG_ID INTEGER DEFAULT 0,\n\tSENT INTEGER DEFAULT 0,\n\tFILE_UPLOADED INTEGER DEFAULT 0,\n\tPHOTO_UPLOADED INTEGER DEFAULT 0\n);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 54
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 60
    :goto_0
    return-void

    .line 56
    :catch_0
    move-exception v0

    .line 57
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0
.end method

.method public final onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 2

    .prologue
    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SQLiteOpenHelper: OnUpgrade from "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 66
    return-void
.end method
