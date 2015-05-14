.class Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;
.super Landroid/os/Handler;
.source "ViewCrawler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/viewcrawler/ViewCrawler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewCrawlerHandler"
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mEditorConnection:Lcom/mixpanel/android/viewcrawler/EditorConnection;

.field private mSnapshot:Lcom/mixpanel/android/viewcrawler/ViewSnapshot;

.field private final mToken:Ljava/lang/String;

.field final synthetic this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;


# direct methods
.method public constructor <init>(Lcom/mixpanel/android/viewcrawler/ViewCrawler;Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "token"    # Ljava/lang/String;
    .param p4, "looper"    # Landroid/os/Looper;

    .prologue
    .line 243
    iput-object p1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    .line 244
    invoke-direct {p0, p4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 245
    iput-object p2, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mContext:Landroid/content/Context;

    .line 246
    iput-object p3, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mToken:Ljava/lang/String;

    .line 247
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mSnapshot:Lcom/mixpanel/android/viewcrawler/ViewSnapshot;

    .line 248
    return-void
.end method

.method private connectToEditor()V
    .locals 8

    .prologue
    .line 332
    sget-boolean v3, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v3, :cond_0

    .line 333
    const-string v3, "MixpanelAPI.ViewCrawler"

    const-string v4, "connecting to editor"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    :cond_0
    iget-object v3, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mEditorConnection:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mEditorConnection:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    invoke-virtual {v3}, Lcom/mixpanel/android/viewcrawler/EditorConnection;->isValid()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 337
    sget-boolean v3, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v3, :cond_1

    .line 338
    const-string v3, "MixpanelAPI.ViewCrawler"

    const-string v4, "There is already a valid connection to an events editor."

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    :cond_1
    :goto_0
    return-void

    .line 343
    :cond_2
    iget-object v3, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;
    invoke-static {v3}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$500(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    if-nez v3, :cond_3

    .line 344
    sget-boolean v3, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v3, :cond_1

    .line 345
    const-string v3, "MixpanelAPI.ViewCrawler"

    const-string v4, "SSL is not available on this device, no connection will be attempted to the events editor."

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 350
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getInstance(Landroid/content/Context;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getEditorUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mToken:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 352
    .local v2, "url":Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;
    invoke-static {v3}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$500(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v1

    .line 353
    .local v1, "sslSocket":Ljava/net/Socket;
    new-instance v3, Lcom/mixpanel/android/viewcrawler/EditorConnection;

    new-instance v4, Ljava/net/URI;

    invoke-direct {v4, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    new-instance v5, Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;

    iget-object v6, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    const/4 v7, 0x0

    invoke-direct {v5, v6, v7}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;-><init>(Lcom/mixpanel/android/viewcrawler/ViewCrawler;Lcom/mixpanel/android/viewcrawler/ViewCrawler$1;)V

    invoke-direct {v3, v4, v5, v1}, Lcom/mixpanel/android/viewcrawler/EditorConnection;-><init>(Ljava/net/URI;Lcom/mixpanel/android/viewcrawler/EditorConnection$Editor;Ljava/net/Socket;)V

    iput-object v3, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mEditorConnection:Lcom/mixpanel/android/viewcrawler/EditorConnection;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 354
    .end local v1    # "sslSocket":Ljava/net/Socket;
    :catch_0
    move-exception v0

    .line 355
    .local v0, "e":Ljava/net/URISyntaxException;
    const-string v3, "MixpanelAPI.ViewCrawler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error parsing URI "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " for editor websocket"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 356
    .end local v0    # "e":Ljava/net/URISyntaxException;
    :catch_1
    move-exception v0

    .line 357
    .local v0, "e":Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException;
    const-string v3, "MixpanelAPI.ViewCrawler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error connecting to URI "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 358
    .end local v0    # "e":Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException;
    :catch_2
    move-exception v0

    .line 359
    .local v0, "e":Ljava/io/IOException;
    const-string v3, "MixpanelAPI.ViewCrawler"

    const-string v4, "Can\'t create SSL Socket to connect to editor service"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0
.end method

.method private getSharedPreferences()Landroid/content/SharedPreferences;
    .locals 3

    .prologue
    .line 682
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mixpanel.viewcrawler.changes"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mToken:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 683
    .local v0, "sharedPrefsName":Ljava/lang/String;
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    return-object v1
.end method

.method private handleEditorBindingsReceived(Lorg/json/JSONObject;)V
    .locals 11
    .param p1, "message"    # Lorg/json/JSONObject;

    .prologue
    .line 550
    :try_start_0
    const-string v7, "payload"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 551
    .local v5, "payload":Lorg/json/JSONObject;
    const-string v7, "events"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 557
    .local v2, "eventBindings":Lorg/json/JSONArray;
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    .line 558
    .local v3, "eventCount":I
    iget-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorEventBindings:Ljava/util/List;
    invoke-static {v7}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1100(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v8

    monitor-enter v8

    .line 559
    :try_start_1
    iget-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorEventBindings:Ljava/util/List;
    invoke-static {v7}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1100(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 560
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v3, :cond_0

    .line 562
    :try_start_2
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 563
    .local v1, "event":Lorg/json/JSONObject;
    const-string v7, "target_activity"

    invoke-static {v1, v7}, Lcom/mixpanel/android/util/JSONUtils;->optionalStringKey(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 564
    .local v6, "targetActivity":Ljava/lang/String;
    iget-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorEventBindings:Ljava/util/List;
    invoke-static {v7}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1100(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v7

    new-instance v9, Landroid/util/Pair;

    invoke-direct {v9, v6, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 560
    .end local v1    # "event":Lorg/json/JSONObject;
    .end local v6    # "targetActivity":Ljava/lang/String;
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 552
    .end local v2    # "eventBindings":Lorg/json/JSONArray;
    .end local v3    # "eventCount":I
    .end local v4    # "i":I
    .end local v5    # "payload":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 553
    .local v0, "e":Lorg/json/JSONException;
    const-string v7, "MixpanelAPI.ViewCrawler"

    const-string v8, "Bad event bindings received"

    invoke-static {v7, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 572
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_2
    return-void

    .line 565
    .restart local v2    # "eventBindings":Lorg/json/JSONArray;
    .restart local v3    # "eventCount":I
    .restart local v4    # "i":I
    .restart local v5    # "payload":Lorg/json/JSONObject;
    :catch_1
    move-exception v0

    .line 566
    .restart local v0    # "e":Lorg/json/JSONException;
    :try_start_3
    const-string v7, "MixpanelAPI.ViewCrawler"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Bad event binding received from editor in "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 569
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v4    # "i":I
    :catchall_0
    move-exception v7

    monitor-exit v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v7

    .restart local v4    # "i":I
    :cond_0
    :try_start_4
    monitor-exit v8
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 571
    invoke-direct {p0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->updateEditState()V

    goto :goto_2
.end method

.method private handleEditorChangeReceived(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "changeMessage"    # Lorg/json/JSONObject;

    .prologue
    .line 522
    :try_start_0
    const-string v3, "target"

    invoke-static {p1, v3}, Lcom/mixpanel/android/util/JSONUtils;->optionalStringKey(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 523
    .local v2, "targetActivity":Ljava/lang/String;
    const-string v3, "change"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 524
    .local v0, "change":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorChanges:Ljava/util/List;
    invoke-static {v3}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v4

    monitor-enter v4
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 525
    :try_start_1
    iget-object v3, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorChanges:Ljava/util/List;
    invoke-static {v3}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v3

    new-instance v5, Landroid/util/Pair;

    invoke-direct {v5, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 526
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 527
    :try_start_2
    invoke-direct {p0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->updateEditState()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 531
    .end local v0    # "change":Lorg/json/JSONObject;
    .end local v2    # "targetActivity":Ljava/lang/String;
    :goto_0
    return-void

    .line 526
    .restart local v0    # "change":Lorg/json/JSONObject;
    .restart local v2    # "targetActivity":Ljava/lang/String;
    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v3
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    .line 528
    .end local v0    # "change":Lorg/json/JSONObject;
    .end local v2    # "targetActivity":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 529
    .local v1, "e":Lorg/json/JSONException;
    const-string v3, "MixpanelAPI.ViewCrawler"

    const-string v4, "Bad change request received"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private handleEditorClosed()V
    .locals 2

    .prologue
    .line 578
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorChanges:Ljava/util/List;
    invoke-static {v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v1

    monitor-enter v1

    .line 579
    :try_start_0
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorChanges:Ljava/util/List;
    invoke-static {v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 580
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 582
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorEventBindings:Ljava/util/List;
    invoke-static {v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1100(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v1

    monitor-enter v1

    .line 583
    :try_start_1
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorEventBindings:Ljava/util/List;
    invoke-static {v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1100(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 584
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 587
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mSnapshot:Lcom/mixpanel/android/viewcrawler/ViewSnapshot;

    .line 589
    invoke-direct {p0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->updateEditState()V

    .line 590
    return-void

    .line 580
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 584
    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method private handleEventBindingsReceived(Lorg/json/JSONArray;)V
    .locals 4
    .param p1, "eventBindings"    # Lorg/json/JSONArray;

    .prologue
    .line 537
    invoke-direct {p0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    .line 538
    .local v1, "preferences":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 539
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "mixpanel.viewcrawler.bindings"

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 540
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 541
    invoke-direct {p0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->initializeChanges()V

    .line 542
    return-void
.end method

.method private initializeChanges()V
    .locals 15

    .prologue
    const/4 v13, 0x0

    .line 287
    invoke-direct {p0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v8

    .line 288
    .local v8, "preferences":Landroid/content/SharedPreferences;
    const-string v12, "mixpanel.viewcrawler.changes"

    invoke-interface {v8, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 289
    .local v10, "storedChanges":Ljava/lang/String;
    const-string v12, "mixpanel.viewcrawler.bindings"

    invoke-interface {v8, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 291
    .local v9, "storedBindings":Ljava/lang/String;
    if-eqz v10, :cond_1

    .line 292
    :try_start_0
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3, v10}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 294
    .local v3, "changes":Lorg/json/JSONArray;
    iget-object v12, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentChanges:Ljava/util/List;
    invoke-static {v12}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$300(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v13

    monitor-enter v13
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 295
    :try_start_1
    iget-object v12, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentChanges:Ljava/util/List;
    invoke-static {v12}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$300(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->clear()V

    .line 296
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v7, v12, :cond_0

    .line 297
    invoke-virtual {v3, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 298
    .local v2, "changeMessage":Lorg/json/JSONObject;
    const-string v12, "target"

    invoke-static {v2, v12}, Lcom/mixpanel/android/util/JSONUtils;->optionalStringKey(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 299
    .local v11, "targetActivity":Ljava/lang/String;
    const-string v12, "change"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 300
    .local v1, "change":Lorg/json/JSONObject;
    iget-object v12, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentChanges:Ljava/util/List;
    invoke-static {v12}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$300(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v12

    new-instance v14, Landroid/util/Pair;

    invoke-direct {v14, v11, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v12, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 296
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 302
    .end local v1    # "change":Lorg/json/JSONObject;
    .end local v2    # "changeMessage":Lorg/json/JSONObject;
    .end local v11    # "targetActivity":Ljava/lang/String;
    :cond_0
    monitor-exit v13
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 305
    .end local v3    # "changes":Lorg/json/JSONArray;
    .end local v7    # "i":I
    :cond_1
    if-eqz v9, :cond_2

    .line 306
    :try_start_2
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, v9}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 308
    .local v0, "bindings":Lorg/json/JSONArray;
    iget-object v12, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentEventBindings:Ljava/util/List;
    invoke-static {v12}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$400(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v13

    monitor-enter v13
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 309
    :try_start_3
    iget-object v12, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentEventBindings:Ljava/util/List;
    invoke-static {v12}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$400(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->clear()V

    .line 310
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v7, v12, :cond_3

    .line 311
    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 312
    .local v6, "event":Lorg/json/JSONObject;
    const-string v12, "target_activity"

    invoke-static {v6, v12}, Lcom/mixpanel/android/util/JSONUtils;->optionalStringKey(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 313
    .restart local v11    # "targetActivity":Ljava/lang/String;
    iget-object v12, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentEventBindings:Ljava/util/List;
    invoke-static {v12}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$400(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v12

    new-instance v14, Landroid/util/Pair;

    invoke-direct {v14, v11, v6}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v12, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 310
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 302
    .end local v0    # "bindings":Lorg/json/JSONArray;
    .end local v6    # "event":Lorg/json/JSONObject;
    .end local v7    # "i":I
    .end local v11    # "targetActivity":Ljava/lang/String;
    .restart local v3    # "changes":Lorg/json/JSONArray;
    :catchall_0
    move-exception v12

    :try_start_4
    monitor-exit v13
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v12
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    .line 317
    .end local v3    # "changes":Lorg/json/JSONArray;
    :catch_0
    move-exception v4

    .line 318
    .local v4, "e":Lorg/json/JSONException;
    const-string v12, "MixpanelAPI.ViewCrawler"

    const-string v13, "JSON error when initializing saved changes, clearing persistent memory"

    invoke-static {v12, v13, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 319
    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    .line 320
    .local v5, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v12, "mixpanel.viewcrawler.changes"

    invoke-interface {v5, v12}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 321
    const-string v12, "mixpanel.viewcrawler.bindings"

    invoke-interface {v5, v12}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 322
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 325
    .end local v4    # "e":Lorg/json/JSONException;
    .end local v5    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_2
    :goto_2
    invoke-direct {p0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->updateEditState()V

    .line 326
    return-void

    .line 315
    .restart local v0    # "bindings":Lorg/json/JSONArray;
    .restart local v7    # "i":I
    :cond_3
    :try_start_6
    monitor-exit v13

    goto :goto_2

    .end local v7    # "i":I
    :catchall_1
    move-exception v12

    monitor-exit v13
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    throw v12
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_0
.end method

.method private sendDeviceInfo()V
    .locals 7

    .prologue
    .line 395
    iget-object v4, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mEditorConnection:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    invoke-virtual {v4}, Lcom/mixpanel/android/viewcrawler/EditorConnection;->getBufferedOutputStream()Ljava/io/BufferedOutputStream;

    move-result-object v2

    .line 396
    .local v2, "out":Ljava/io/OutputStream;
    new-instance v3, Ljava/io/OutputStreamWriter;

    invoke-direct {v3, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 399
    .local v3, "writer":Ljava/io/OutputStreamWriter;
    :try_start_0
    const-string v4, "{\"type\": \"device_info_response\","

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 400
    const-string v4, "\"payload\": {"

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 401
    const-string v4, "\"device_type\": \"Android\","

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 402
    const-string v4, "\"device_name\":"

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 403
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 404
    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 405
    const-string v4, "\"tweaks\":"

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 406
    new-instance v4, Lorg/json/JSONObject;

    iget-object v5, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mTweaks:Lcom/mixpanel/android/mpmetrics/Tweaks;
    invoke-static {v5}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$700(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/mpmetrics/Tweaks;

    move-result-object v5

    invoke-virtual {v5}, Lcom/mixpanel/android/mpmetrics/Tweaks;->getAll()Ljava/util/Map;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 407
    iget-object v4, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mDeviceInfo:Ljava/util/Map;
    invoke-static {v4}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$800(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 408
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 409
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 410
    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 411
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 415
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 416
    .local v0, "e":Ljava/io/IOException;
    :try_start_1
    const-string v4, "MixpanelAPI.ViewCrawler"

    const-string v5, "Can\'t write device_info to server"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 419
    :try_start_2
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 424
    .end local v0    # "e":Ljava/io/IOException;
    :goto_1
    return-void

    .line 413
    :cond_0
    :try_start_3
    const-string v4, "}"

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 414
    const-string v4, "}"

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 419
    :try_start_4
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 420
    :catch_1
    move-exception v0

    .line 421
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v4, "MixpanelAPI.ViewCrawler"

    const-string v5, "Can\'t close websocket writer"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 420
    :catch_2
    move-exception v0

    .line 421
    const-string v4, "MixpanelAPI.ViewCrawler"

    const-string v5, "Can\'t close websocket writer"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 418
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 419
    :try_start_5
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 422
    :goto_2
    throw v4

    .line 420
    :catch_3
    move-exception v0

    .line 421
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v5, "MixpanelAPI.ViewCrawler"

    const-string v6, "Can\'t close websocket writer"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method

.method private sendError(Ljava/lang/String;)V
    .locals 6
    .param p1, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 367
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 369
    .local v1, "errorObject":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "error_message"

    invoke-virtual {v1, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 374
    :goto_0
    new-instance v2, Ljava/io/OutputStreamWriter;

    iget-object v3, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mEditorConnection:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    invoke-virtual {v3}, Lcom/mixpanel/android/viewcrawler/EditorConnection;->getBufferedOutputStream()Ljava/io/BufferedOutputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 376
    .local v2, "writer":Ljava/io/OutputStreamWriter;
    :try_start_1
    const-string v3, "{\"type\": \"error\", "

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 377
    const-string v3, "\"payload\": "

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 378
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 379
    const-string v3, "}"

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 384
    :try_start_2
    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 389
    :goto_1
    return-void

    .line 370
    .end local v2    # "writer":Ljava/io/OutputStreamWriter;
    :catch_0
    move-exception v0

    .line 371
    .local v0, "e":Lorg/json/JSONException;
    const-string v3, "MixpanelAPI.ViewCrawler"

    const-string v4, "Apparently impossible JSONException"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 385
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v2    # "writer":Ljava/io/OutputStreamWriter;
    :catch_1
    move-exception v0

    .line 386
    .local v0, "e":Ljava/io/IOException;
    const-string v3, "MixpanelAPI.ViewCrawler"

    const-string v4, "Could not close output writer to editor"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 380
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 381
    .restart local v0    # "e":Ljava/io/IOException;
    :try_start_3
    const-string v3, "MixpanelAPI.ViewCrawler"

    const-string v4, "Can\'t write error message to editor"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 384
    :try_start_4
    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_1

    .line 385
    :catch_3
    move-exception v0

    .line 386
    const-string v3, "MixpanelAPI.ViewCrawler"

    const-string v4, "Could not close output writer to editor"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 383
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    .line 384
    :try_start_5
    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 387
    :goto_2
    throw v3

    .line 385
    :catch_4
    move-exception v0

    .line 386
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v4, "MixpanelAPI.ViewCrawler"

    const-string v5, "Could not close output writer to editor"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method

.method private sendReportTrackToEditor(Ljava/lang/String;)V
    .locals 7
    .param p1, "eventName"    # Ljava/lang/String;

    .prologue
    .line 487
    iget-object v4, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mEditorConnection:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mEditorConnection:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    invoke-virtual {v4}, Lcom/mixpanel/android/viewcrawler/EditorConnection;->isValid()Z

    move-result v4

    if-nez v4, :cond_1

    .line 515
    :cond_0
    :goto_0
    return-void

    .line 491
    :cond_1
    iget-object v4, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mEditorConnection:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    invoke-virtual {v4}, Lcom/mixpanel/android/viewcrawler/EditorConnection;->getBufferedOutputStream()Ljava/io/BufferedOutputStream;

    move-result-object v2

    .line 492
    .local v2, "out":Ljava/io/OutputStream;
    new-instance v3, Ljava/io/OutputStreamWriter;

    invoke-direct {v3, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 493
    .local v3, "writer":Ljava/io/OutputStreamWriter;
    new-instance v1, Landroid/util/JsonWriter;

    invoke-direct {v1, v3}, Landroid/util/JsonWriter;-><init>(Ljava/io/Writer;)V

    .line 496
    .local v1, "j":Landroid/util/JsonWriter;
    :try_start_0
    invoke-virtual {v1}, Landroid/util/JsonWriter;->beginObject()Landroid/util/JsonWriter;

    .line 497
    const-string v4, "type"

    invoke-virtual {v1, v4}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v4

    const-string v5, "track_message"

    invoke-virtual {v4, v5}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 498
    const-string v4, "payload"

    invoke-virtual {v1, v4}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 500
    invoke-virtual {v1}, Landroid/util/JsonWriter;->beginObject()Landroid/util/JsonWriter;

    .line 501
    const-string v4, "event_name"

    invoke-virtual {v1, v4}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 502
    invoke-virtual {v1}, Landroid/util/JsonWriter;->endObject()Landroid/util/JsonWriter;

    .line 504
    invoke-virtual {v1}, Landroid/util/JsonWriter;->endObject()Landroid/util/JsonWriter;

    .line 505
    invoke-virtual {v1}, Landroid/util/JsonWriter;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 510
    :try_start_1
    invoke-virtual {v1}, Landroid/util/JsonWriter;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 511
    :catch_0
    move-exception v0

    .line 512
    .local v0, "e":Ljava/io/IOException;
    const-string v4, "MixpanelAPI.ViewCrawler"

    const-string v5, "Can\'t close writer."

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 506
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 507
    .restart local v0    # "e":Ljava/io/IOException;
    :try_start_2
    const-string v4, "MixpanelAPI.ViewCrawler"

    const-string v5, "Can\'t write track_message to server"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 510
    :try_start_3
    invoke-virtual {v1}, Landroid/util/JsonWriter;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 511
    :catch_2
    move-exception v0

    .line 512
    const-string v4, "MixpanelAPI.ViewCrawler"

    const-string v5, "Can\'t close writer."

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 509
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 510
    :try_start_4
    invoke-virtual {v1}, Landroid/util/JsonWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 513
    :goto_1
    throw v4

    .line 511
    :catch_3
    move-exception v0

    .line 512
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v5, "MixpanelAPI.ViewCrawler"

    const-string v6, "Can\'t close writer."

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method private sendSnapshot(Lorg/json/JSONObject;)V
    .locals 11
    .param p1, "message"    # Lorg/json/JSONObject;

    .prologue
    .line 430
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 432
    .local v6, "startSnapshot":J
    :try_start_0
    const-string v8, "payload"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 433
    .local v2, "payload":Lorg/json/JSONObject;
    const-string v8, "config"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 434
    iget-object v8, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mProtocol:Lcom/mixpanel/android/viewcrawler/EditProtocol;
    invoke-static {v8}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$900(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/EditProtocol;

    move-result-object v8

    invoke-virtual {v8, v2}, Lcom/mixpanel/android/viewcrawler/EditProtocol;->readSnapshotConfig(Lorg/json/JSONObject;)Lcom/mixpanel/android/viewcrawler/ViewSnapshot;

    move-result-object v8

    iput-object v8, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mSnapshot:Lcom/mixpanel/android/viewcrawler/ViewSnapshot;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException; {:try_start_0 .. :try_end_0} :catch_1

    .line 446
    :cond_0
    iget-object v8, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mSnapshot:Lcom/mixpanel/android/viewcrawler/ViewSnapshot;

    if-nez v8, :cond_1

    .line 447
    const-string v8, "No snapshot configuration (or a malformed snapshot configuration) was sent."

    invoke-direct {p0, v8}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->sendError(Ljava/lang/String;)V

    .line 448
    const-string v8, "MixpanelAPI.ViewCrawler"

    const-string v9, "Mixpanel editor is misconfigured, sent a snapshot request without a valid configuration."

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 481
    .end local v2    # "payload":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 436
    :catch_0
    move-exception v0

    .line 437
    .local v0, "e":Lorg/json/JSONException;
    const-string v8, "MixpanelAPI.ViewCrawler"

    const-string v9, "Payload with snapshot config required with snapshot request"

    invoke-static {v8, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 438
    const-string v8, "Payload with snapshot config required with snapshot request"

    invoke-direct {p0, v8}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->sendError(Ljava/lang/String;)V

    goto :goto_0

    .line 440
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v0

    .line 441
    .local v0, "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
    const-string v8, "MixpanelAPI.ViewCrawler"

    const-string v9, "Editor sent malformed message with snapshot request"

    invoke-static {v8, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 442
    invoke-virtual {v0}, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->sendError(Ljava/lang/String;)V

    goto :goto_0

    .line 453
    .end local v0    # "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
    .restart local v2    # "payload":Lorg/json/JSONObject;
    :cond_1
    iget-object v8, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mEditorConnection:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    invoke-virtual {v8}, Lcom/mixpanel/android/viewcrawler/EditorConnection;->getBufferedOutputStream()Ljava/io/BufferedOutputStream;

    move-result-object v1

    .line 454
    .local v1, "out":Ljava/io/OutputStream;
    new-instance v3, Ljava/io/OutputStreamWriter;

    invoke-direct {v3, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 457
    .local v3, "writer":Ljava/io/OutputStreamWriter;
    :try_start_1
    const-string v8, "{"

    invoke-virtual {v3, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 458
    const-string v8, "\"type\": \"snapshot_response\","

    invoke-virtual {v3, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 459
    const-string v8, "\"payload\": {"

    invoke-virtual {v3, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 461
    const-string v8, "\"activities\":"

    invoke-virtual {v3, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 462
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->flush()V

    .line 463
    iget-object v8, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->mSnapshot:Lcom/mixpanel/android/viewcrawler/ViewSnapshot;

    iget-object v9, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditState:Lcom/mixpanel/android/viewcrawler/EditState;
    invoke-static {v9}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$100(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/EditState;

    move-result-object v9

    invoke-virtual {v8, v9, v1}, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->snapshots(Lcom/mixpanel/android/viewcrawler/UIThreadSet;Ljava/io/OutputStream;)V

    .line 466
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long v4, v8, v6

    .line 467
    .local v4, "snapshotTime":J
    const-string v8, ",\"snapshot_time_millis\": "

    invoke-virtual {v3, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 468
    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 470
    const-string v8, "}"

    invoke-virtual {v3, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 471
    const-string v8, "}"

    invoke-virtual {v3, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 476
    :try_start_2
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 477
    :catch_2
    move-exception v0

    .line 478
    .local v0, "e":Ljava/io/IOException;
    const-string v8, "MixpanelAPI.ViewCrawler"

    const-string v9, "Can\'t close writer."

    invoke-static {v8, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 472
    .end local v0    # "e":Ljava/io/IOException;
    .end local v4    # "snapshotTime":J
    :catch_3
    move-exception v0

    .line 473
    .restart local v0    # "e":Ljava/io/IOException;
    :try_start_3
    const-string v8, "MixpanelAPI.ViewCrawler"

    const-string v9, "Can\'t write snapshot request to server"

    invoke-static {v8, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 476
    :try_start_4
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_0

    .line 477
    :catch_4
    move-exception v0

    .line 478
    const-string v8, "MixpanelAPI.ViewCrawler"

    const-string v9, "Can\'t close writer."

    invoke-static {v8, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 475
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v8

    .line 476
    :try_start_5
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    .line 479
    :goto_1
    throw v8

    .line 477
    :catch_5
    move-exception v0

    .line 478
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v9, "MixpanelAPI.ViewCrawler"

    const-string v10, "Can\'t close writer."

    invoke-static {v9, v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method private updateEditState()V
    .locals 14

    .prologue
    .line 602
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 604
    .local v5, "newEdits":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/String;Lcom/mixpanel/android/viewcrawler/ViewVisitor;>;>;"
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentChanges:Ljava/util/List;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$300(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v11

    monitor-enter v11

    .line 605
    :try_start_0
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentChanges:Ljava/util/List;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$300(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v7

    .line 606
    .local v7, "size":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v7, :cond_0

    .line 607
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentChanges:Ljava/util/List;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$300(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 609
    .local v0, "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    :try_start_1
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mProtocol:Lcom/mixpanel/android/viewcrawler/EditProtocol;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$900(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/EditProtocol;

    move-result-object v12

    iget-object v10, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v10, Lorg/json/JSONObject;

    invoke-virtual {v12, v10}, Lcom/mixpanel/android/viewcrawler/EditProtocol;->readEdit(Lorg/json/JSONObject;)Lcom/mixpanel/android/viewcrawler/ViewVisitor;

    move-result-object v9

    .line 610
    .local v9, "visitor":Lcom/mixpanel/android/viewcrawler/ViewVisitor;
    new-instance v10, Landroid/util/Pair;

    iget-object v12, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-direct {v10, v12, v9}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v5, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 606
    .end local v9    # "visitor":Lcom/mixpanel/android/viewcrawler/ViewVisitor;
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 611
    :catch_0
    move-exception v1

    .line 612
    .local v1, "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;
    :try_start_2
    const-string v10, "MixpanelAPI.ViewCrawler"

    invoke-virtual {v1}, Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 617
    .end local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    .end local v1    # "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;
    .end local v3    # "i":I
    .end local v7    # "size":I
    :catchall_0
    move-exception v10

    monitor-exit v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v10

    .line 613
    .restart local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    .restart local v3    # "i":I
    .restart local v7    # "size":I
    :catch_1
    move-exception v1

    .line 614
    .local v1, "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
    :try_start_3
    const-string v10, "MixpanelAPI.ViewCrawler"

    const-string v12, "Bad persistent change request cannot be applied."

    invoke-static {v10, v12, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 617
    .end local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    .end local v1    # "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
    :cond_0
    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 619
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorChanges:Ljava/util/List;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v11

    monitor-enter v11

    .line 620
    :try_start_4
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorChanges:Ljava/util/List;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v7

    .line 621
    const/4 v3, 0x0

    :goto_2
    if-ge v3, v7, :cond_1

    .line 622
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorChanges:Ljava/util/List;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 624
    .restart local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    :try_start_5
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mProtocol:Lcom/mixpanel/android/viewcrawler/EditProtocol;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$900(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/EditProtocol;

    move-result-object v12

    iget-object v10, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v10, Lorg/json/JSONObject;

    invoke-virtual {v12, v10}, Lcom/mixpanel/android/viewcrawler/EditProtocol;->readEdit(Lorg/json/JSONObject;)Lcom/mixpanel/android/viewcrawler/ViewVisitor;

    move-result-object v9

    .line 625
    .restart local v9    # "visitor":Lcom/mixpanel/android/viewcrawler/ViewVisitor;
    new-instance v10, Landroid/util/Pair;

    iget-object v12, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-direct {v10, v12, v9}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v5, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catch Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 621
    .end local v9    # "visitor":Lcom/mixpanel/android/viewcrawler/ViewVisitor;
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 626
    :catch_2
    move-exception v1

    .line 627
    .local v1, "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;
    :try_start_6
    const-string v10, "MixpanelAPI.ViewCrawler"

    invoke-virtual {v1}, Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 632
    .end local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    .end local v1    # "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;
    :catchall_1
    move-exception v10

    monitor-exit v11
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v10

    .line 628
    .restart local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    :catch_3
    move-exception v1

    .line 629
    .local v1, "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
    :try_start_7
    const-string v10, "MixpanelAPI.ViewCrawler"

    const-string v12, "Bad editor change request cannot be applied."

    invoke-static {v10, v12, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    .line 632
    .end local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    .end local v1    # "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
    :cond_1
    monitor-exit v11
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 634
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentEventBindings:Ljava/util/List;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$400(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v11

    monitor-enter v11

    .line 635
    :try_start_8
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentEventBindings:Ljava/util/List;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$400(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v7

    .line 636
    const/4 v3, 0x0

    :goto_4
    if-ge v3, v7, :cond_2

    .line 637
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentEventBindings:Ljava/util/List;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$400(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 639
    .restart local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    :try_start_9
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mProtocol:Lcom/mixpanel/android/viewcrawler/EditProtocol;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$900(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/EditProtocol;

    move-result-object v12

    iget-object v10, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v10, Lorg/json/JSONObject;

    iget-object v13, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mTracker:Lcom/mixpanel/android/viewcrawler/DynamicEventTracker;
    invoke-static {v13}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1200(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/DynamicEventTracker;

    move-result-object v13

    invoke-virtual {v12, v10, v13}, Lcom/mixpanel/android/viewcrawler/EditProtocol;->readEventBinding(Lorg/json/JSONObject;Lcom/mixpanel/android/viewcrawler/ViewVisitor$OnEventListener;)Lcom/mixpanel/android/viewcrawler/ViewVisitor;

    move-result-object v9

    .line 640
    .restart local v9    # "visitor":Lcom/mixpanel/android/viewcrawler/ViewVisitor;
    new-instance v10, Landroid/util/Pair;

    iget-object v12, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-direct {v10, v12, v9}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v5, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_9
    .catch Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException; {:try_start_9 .. :try_end_9} :catch_4
    .catch Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException; {:try_start_9 .. :try_end_9} :catch_5
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 636
    .end local v9    # "visitor":Lcom/mixpanel/android/viewcrawler/ViewVisitor;
    :goto_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 641
    :catch_4
    move-exception v1

    .line 642
    .local v1, "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;
    :try_start_a
    const-string v10, "MixpanelAPI.ViewCrawler"

    invoke-virtual {v1}, Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 647
    .end local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    .end local v1    # "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;
    :catchall_2
    move-exception v10

    monitor-exit v11
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    throw v10

    .line 643
    .restart local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    :catch_5
    move-exception v1

    .line 644
    .local v1, "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
    :try_start_b
    const-string v10, "MixpanelAPI.ViewCrawler"

    const-string v12, "Bad persistent event binding cannot be applied."

    invoke-static {v10, v12, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5

    .line 647
    .end local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    .end local v1    # "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
    :cond_2
    monitor-exit v11
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 649
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorEventBindings:Ljava/util/List;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1100(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v11

    monitor-enter v11

    .line 650
    :try_start_c
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorEventBindings:Ljava/util/List;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1100(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v7

    .line 651
    const/4 v3, 0x0

    :goto_6
    if-ge v3, v7, :cond_3

    .line 652
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorEventBindings:Ljava/util/List;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1100(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 654
    .restart local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    :try_start_d
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mProtocol:Lcom/mixpanel/android/viewcrawler/EditProtocol;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$900(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/EditProtocol;

    move-result-object v12

    iget-object v10, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v10, Lorg/json/JSONObject;

    iget-object v13, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mTracker:Lcom/mixpanel/android/viewcrawler/DynamicEventTracker;
    invoke-static {v13}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$1200(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/DynamicEventTracker;

    move-result-object v13

    invoke-virtual {v12, v10, v13}, Lcom/mixpanel/android/viewcrawler/EditProtocol;->readEventBinding(Lorg/json/JSONObject;Lcom/mixpanel/android/viewcrawler/ViewVisitor$OnEventListener;)Lcom/mixpanel/android/viewcrawler/ViewVisitor;

    move-result-object v9

    .line 655
    .restart local v9    # "visitor":Lcom/mixpanel/android/viewcrawler/ViewVisitor;
    new-instance v10, Landroid/util/Pair;

    iget-object v12, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-direct {v10, v12, v9}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v5, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_d
    .catch Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException; {:try_start_d .. :try_end_d} :catch_6
    .catch Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException; {:try_start_d .. :try_end_d} :catch_7
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 651
    .end local v9    # "visitor":Lcom/mixpanel/android/viewcrawler/ViewVisitor;
    :goto_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 656
    :catch_6
    move-exception v1

    .line 657
    .local v1, "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;
    :try_start_e
    const-string v10, "MixpanelAPI.ViewCrawler"

    invoke-virtual {v1}, Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7

    .line 662
    .end local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    .end local v1    # "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;
    :catchall_3
    move-exception v10

    monitor-exit v11
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    throw v10

    .line 658
    .restart local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    :catch_7
    move-exception v1

    .line 659
    .local v1, "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
    :try_start_f
    const-string v10, "MixpanelAPI.ViewCrawler"

    const-string v12, "Bad editor event binding cannot be applied."

    invoke-static {v10, v12, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7

    .line 662
    .end local v0    # "changeInfo":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lorg/json/JSONObject;>;"
    .end local v1    # "e":Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
    :cond_3
    monitor-exit v11
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    .line 664
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 665
    .local v2, "editMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/mixpanel/android/viewcrawler/ViewVisitor;>;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    .line 666
    .local v8, "totalEdits":I
    const/4 v3, 0x0

    :goto_8
    if-ge v3, v8, :cond_5

    .line 667
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/util/Pair;

    .line 669
    .local v6, "next":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lcom/mixpanel/android/viewcrawler/ViewVisitor;>;"
    iget-object v10, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-interface {v2, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 670
    iget-object v10, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-interface {v2, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 675
    .local v4, "mapElement":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/ViewVisitor;>;"
    :goto_9
    iget-object v10, v6, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-interface {v4, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 666
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 672
    .end local v4    # "mapElement":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/ViewVisitor;>;"
    :cond_4
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 673
    .restart local v4    # "mapElement":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/ViewVisitor;>;"
    iget-object v10, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-interface {v2, v10, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9

    .line 678
    .end local v4    # "mapElement":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/ViewVisitor;>;"
    .end local v6    # "next":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Lcom/mixpanel/android/viewcrawler/ViewVisitor;>;"
    :cond_5
    iget-object v10, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditState:Lcom/mixpanel/android/viewcrawler/EditState;
    invoke-static {v10}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$100(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/EditState;

    move-result-object v10

    invoke-virtual {v10, v2}, Lcom/mixpanel/android/viewcrawler/EditState;->setEdits(Ljava/util/Map;)V

    .line 679
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 252
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 281
    :goto_0
    :pswitch_0
    return-void

    .line 254
    :pswitch_1
    invoke-direct {p0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->initializeChanges()V

    goto :goto_0

    .line 257
    :pswitch_2
    invoke-direct {p0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->connectToEditor()V

    goto :goto_0

    .line 260
    :pswitch_3
    invoke-direct {p0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->sendDeviceInfo()V

    goto :goto_0

    .line 263
    :pswitch_4
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lorg/json/JSONObject;

    invoke-direct {p0, v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->sendSnapshot(Lorg/json/JSONObject;)V

    goto :goto_0

    .line 266
    :pswitch_5
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->sendReportTrackToEditor(Ljava/lang/String;)V

    goto :goto_0

    .line 269
    :pswitch_6
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lorg/json/JSONObject;

    invoke-direct {p0, v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->handleEditorChangeReceived(Lorg/json/JSONObject;)V

    goto :goto_0

    .line 272
    :pswitch_7
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lorg/json/JSONArray;

    invoke-direct {p0, v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->handleEventBindingsReceived(Lorg/json/JSONArray;)V

    goto :goto_0

    .line 275
    :pswitch_8
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lorg/json/JSONObject;

    invoke-direct {p0, v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->handleEditorBindingsReceived(Lorg/json/JSONObject;)V

    goto :goto_0

    .line 278
    :pswitch_9
    invoke-direct {p0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->handleEditorClosed()V

    goto :goto_0

    .line 252
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_4
        :pswitch_6
        :pswitch_3
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_8
        :pswitch_5
        :pswitch_9
    .end packed-switch
.end method
