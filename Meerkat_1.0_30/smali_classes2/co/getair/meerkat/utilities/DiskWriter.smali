.class public Lco/getair/meerkat/utilities/DiskWriter;
.super Ljava/lang/Object;
.source "DiskWriter.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "DiskWritter"

.field private static _instance:Lco/getair/meerkat/utilities/DiskWriter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const/4 v0, 0x0

    sput-object v0, Lco/getair/meerkat/utilities/DiskWriter;->_instance:Lco/getair/meerkat/utilities/DiskWriter;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getInstance()Lco/getair/meerkat/utilities/DiskWriter;
    .locals 2

    .prologue
    .line 24
    const-class v1, Lco/getair/meerkat/utilities/DiskWriter;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lco/getair/meerkat/utilities/DiskWriter;->_instance:Lco/getair/meerkat/utilities/DiskWriter;

    if-nez v0, :cond_0

    .line 26
    new-instance v0, Lco/getair/meerkat/utilities/DiskWriter;

    invoke-direct {v0}, Lco/getair/meerkat/utilities/DiskWriter;-><init>()V

    sput-object v0, Lco/getair/meerkat/utilities/DiskWriter;->_instance:Lco/getair/meerkat/utilities/DiskWriter;

    .line 28
    :cond_0
    sget-object v0, Lco/getair/meerkat/utilities/DiskWriter;->_instance:Lco/getair/meerkat/utilities/DiskWriter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 24
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public deleteObject(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-virtual {p1, p2}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    .line 82
    return-void
.end method

.method public loadObject(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 54
    const/4 v4, 0x0

    .line 58
    .local v4, "result":Ljava/lang/Object;
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v1

    .line 59
    .local v1, "fis":Ljava/io/FileInputStream;
    new-instance v2, Ljava/io/ObjectInputStream;

    invoke-direct {v2, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 60
    .local v2, "is":Ljava/io/ObjectInputStream;
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v3

    .line 61
    .local v3, "object":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    .line 63
    move-object v4, v3

    .line 77
    .end local v1    # "fis":Ljava/io/FileInputStream;
    .end local v2    # "is":Ljava/io/ObjectInputStream;
    .end local v3    # "object":Ljava/lang/Object;
    .end local v4    # "result":Ljava/lang/Object;
    :goto_0
    return-object v4

    .line 64
    .restart local v4    # "result":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 65
    .local v0, "ex":Ljava/io/FileNotFoundException;
    const-string v5, "DiskWritter"

    const-string v6, "FileNotFoundException"

    invoke-static {v5, v6}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 68
    .end local v0    # "ex":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v0

    .line 69
    .local v0, "ex":Ljava/io/IOException;
    const-string v5, "DiskWritter"

    const-string v6, "IOException"

    invoke-static {v5, v6}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 71
    .end local v0    # "ex":Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 72
    .local v0, "ex":Ljava/lang/ClassNotFoundException;
    const-string v5, "DiskWritter"

    const-string v6, "ClassNotFoundException"

    invoke-static {v5, v6}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method public saveObject(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "objectToSave"    # Ljava/lang/Object;
    .param p3, "key"    # Ljava/lang/String;

    .prologue
    .line 32
    const-string v3, "DiskWritter"

    const-string v4, "saveChanges"

    invoke-static {v3, v4}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p1, p3, v3}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v1

    .line 37
    .local v1, "fos":Ljava/io/FileOutputStream;
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 38
    .local v2, "os":Ljava/io/ObjectOutputStream;
    invoke-virtual {v2, p2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 39
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 50
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .end local v2    # "os":Ljava/io/ObjectOutputStream;
    :goto_0
    return-void

    .line 41
    :catch_0
    move-exception v0

    .line 42
    .local v0, "ex":Ljava/io/FileNotFoundException;
    const-string v3, "DiskWritter"

    const-string v4, "FileNotFoundException"

    invoke-static {v3, v4}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 45
    .end local v0    # "ex":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v0

    .line 46
    .local v0, "ex":Ljava/io/IOException;
    const-string v3, "DiskWritter"

    const-string v4, "IOException"

    invoke-static {v3, v4}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
