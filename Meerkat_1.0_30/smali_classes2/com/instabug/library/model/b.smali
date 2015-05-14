.class public final Lcom/instabug/library/model/b;
.super Ljava/lang/Object;
.source "IssueFactory.java"


# static fields
.field private static a:Lcom/instabug/library/model/b;


# instance fields
.field private b:Lcom/instabug/library/x;

.field private c:Lcom/instabug/library/a;

.field private d:Lcom/instabug/library/internal/device/a;


# direct methods
.method private constructor <init>(Lcom/instabug/library/x;Lcom/instabug/library/a;Lcom/instabug/library/internal/device/a;)V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/instabug/library/model/b;->b:Lcom/instabug/library/x;

    .line 32
    iput-object p2, p0, Lcom/instabug/library/model/b;->c:Lcom/instabug/library/a;

    .line 33
    iput-object p3, p0, Lcom/instabug/library/model/b;->d:Lcom/instabug/library/internal/device/a;

    .line 34
    return-void
.end method

.method public static a(Lcom/instabug/library/x;Lcom/instabug/library/a;Lcom/instabug/library/internal/device/a;)Lcom/instabug/library/model/b;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lcom/instabug/library/model/b;->a:Lcom/instabug/library/model/b;

    if-nez v0, :cond_0

    .line 21
    new-instance v0, Lcom/instabug/library/model/b;

    invoke-direct {v0, p0, p1, p2}, Lcom/instabug/library/model/b;-><init>(Lcom/instabug/library/x;Lcom/instabug/library/a;Lcom/instabug/library/internal/device/a;)V

    sput-object v0, Lcom/instabug/library/model/b;->a:Lcom/instabug/library/model/b;

    .line 23
    :cond_0
    sget-object v0, Lcom/instabug/library/model/b;->a:Lcom/instabug/library/model/b;

    return-object v0
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;I)Lcom/instabug/library/model/a;
    .locals 14

    .prologue
    .line 37
    new-instance v3, Lcom/instabug/library/model/a;

    invoke-direct {v3}, Lcom/instabug/library/model/a;-><init>()V

    .line 38
    move/from16 v0, p4

    invoke-virtual {v3, v0}, Lcom/instabug/library/model/a;->a(I)V

    .line 39
    new-instance v4, Lcom/instabug/library/network/c;

    invoke-direct {v4}, Lcom/instabug/library/network/c;-><init>()V

    .line 41
    :try_start_0
    const-string v2, "uuid"

    iget-object v5, p0, Lcom/instabug/library/model/b;->d:Lcom/instabug/library/internal/device/a;

    invoke-virtual {v5}, Lcom/instabug/library/internal/device/a;->j()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Lcom/instabug/library/network/c;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "type"

    .line 42
    invoke-virtual {v3}, Lcom/instabug/library/model/a;->a()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "token"

    iget-object v6, p0, Lcom/instabug/library/model/b;->b:Lcom/instabug/library/x;

    .line 43
    invoke-virtual {v6}, Lcom/instabug/library/x;->b()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "device"

    .line 44
    invoke-static {}, Lcom/instabug/library/internal/device/a;->a()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "os"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "SDK Level "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "email"

    .line 46
    invoke-virtual {v2, v5, p1}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "comment"

    .line 47
    move-object/from16 v0, p2

    invoke-virtual {v2, v5, v0}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "carrier"

    iget-object v6, p0, Lcom/instabug/library/model/b;->d:Lcom/instabug/library/internal/device/a;

    .line 48
    invoke-virtual {v6}, Lcom/instabug/library/internal/device/a;->f()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "appVersion"

    iget-object v6, p0, Lcom/instabug/library/model/b;->d:Lcom/instabug/library/internal/device/a;

    .line 49
    invoke-virtual {v6}, Lcom/instabug/library/internal/device/a;->g()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "batteryLevel"

    iget-object v6, p0, Lcom/instabug/library/model/b;->d:Lcom/instabug/library/internal/device/a;

    .line 50
    invoke-virtual {v6}, Lcom/instabug/library/internal/device/a;->d()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "batteryState"

    iget-object v6, p0, Lcom/instabug/library/model/b;->d:Lcom/instabug/library/internal/device/a;

    .line 51
    invoke-virtual {v6}, Lcom/instabug/library/internal/device/a;->e()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "createdAt"

    .line 52
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v5

    const-string v6, "hasFile"

    iget-object v2, p0, Lcom/instabug/library/model/b;->b:Lcom/instabug/library/x;

    .line 53
    invoke-virtual {v2}, Lcom/instabug/library/x;->j()Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "1"

    :goto_0
    invoke-virtual {v5, v6, v2}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v5

    const-string v6, "hasScreenshot"

    if-eqz p3, :cond_5

    const-string v2, "1"

    .line 54
    :goto_1
    invoke-virtual {v5, v6, v2}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "SDKVersion"

    const-string v6, "1.3.2"

    .line 55
    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "wifi"

    iget-object v6, p0, Lcom/instabug/library/model/b;->d:Lcom/instabug/library/internal/device/a;

    .line 56
    invoke-virtual {v6}, Lcom/instabug/library/internal/device/a;->k()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "memoryFree"

    iget-object v6, p0, Lcom/instabug/library/model/b;->d:Lcom/instabug/library/internal/device/a;

    .line 57
    invoke-virtual {v6}, Lcom/instabug/library/internal/device/a;->o()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "memoryUsed"

    iget-object v6, p0, Lcom/instabug/library/model/b;->d:Lcom/instabug/library/internal/device/a;

    .line 58
    invoke-virtual {v6}, Lcom/instabug/library/internal/device/a;->m()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "memoryTotal"

    iget-object v6, p0, Lcom/instabug/library/model/b;->d:Lcom/instabug/library/internal/device/a;

    .line 59
    invoke-virtual {v6}, Lcom/instabug/library/internal/device/a;->n()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "storageFree"

    .line 60
    invoke-static {}, Lcom/instabug/library/internal/device/a;->q()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "storageUsed"

    .line 61
    invoke-static {}, Lcom/instabug/library/internal/device/a;->p()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "storageTotal"

    .line 62
    invoke-static {}, Lcom/instabug/library/internal/device/a;->r()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "userData"

    .line 63
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v6

    invoke-virtual {v6}, Lcom/instabug/library/Instabug;->getUserData()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "consoleLog"

    .line 64
    invoke-static {}, Lcom/instabug/library/internal/device/a;->l()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "userSteps"

    iget-object v6, p0, Lcom/instabug/library/model/b;->c:Lcom/instabug/library/a;

    .line 65
    invoke-virtual {v6}, Lcom/instabug/library/a;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "methodsLog"

    iget-object v6, p0, Lcom/instabug/library/model/b;->b:Lcom/instabug/library/x;

    .line 66
    invoke-virtual {v6}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "deviceRooted"

    .line 67
    invoke-static {}, Lcom/instabug/library/internal/device/a;->c()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "duration"

    iget-object v6, p0, Lcom/instabug/library/model/b;->b:Lcom/instabug/library/x;

    .line 68
    invoke-virtual {v6}, Lcom/instabug/library/x;->a()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    long-to-int v9, v6

    rem-int/lit8 v9, v9, 0x3c

    const-wide/16 v10, 0x3c

    div-long/2addr v6, v10

    long-to-int v10, v6

    rem-int/lit8 v10, v10, 0x3c

    const-wide/16 v12, 0x3c

    div-long/2addr v6, v12

    long-to-int v6, v6

    rem-int/lit8 v6, v6, 0x3c

    const/16 v7, 0x9

    if-gt v6, v7, :cond_0

    const-string v7, "0"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ":"

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v6, 0x9

    if-gt v10, v6, :cond_1

    const-string v6, "0"

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ":"

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v6, 0x9

    if-gt v9, v6, :cond_2

    const-string v6, "0"

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v2

    const-string v5, "instabugLog"

    .line 69
    invoke-static {}, Lcom/instabug/library/util/InstabugLogger;->getInstabugLog()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    .line 70
    invoke-virtual {v4}, Lcom/instabug/library/network/c;->b()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/instabug/library/model/a;->a(Lorg/json/JSONObject;)V

    .line 71
    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Lcom/instabug/library/model/a;->a(Landroid/graphics/Bitmap;)V

    .line 72
    iget-object v2, p0, Lcom/instabug/library/model/b;->b:Lcom/instabug/library/x;

    invoke-virtual {v2}, Lcom/instabug/library/x;->j()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 73
    iget-object v2, p0, Lcom/instabug/library/model/b;->b:Lcom/instabug/library/x;

    invoke-virtual {v2}, Lcom/instabug/library/x;->k()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/instabug/library/model/a;->c(Ljava/lang/String;)V

    .line 77
    :cond_3
    :goto_2
    return-object v3

    .line 53
    :cond_4
    const-string v2, "0"

    goto/16 :goto_0

    :cond_5
    const-string v2, "0"
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 74
    :catch_0
    move-exception v2

    .line 75
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2
.end method
