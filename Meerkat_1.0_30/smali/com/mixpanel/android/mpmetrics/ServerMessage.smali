.class Lcom/mixpanel/android/mpmetrics/ServerMessage;
.super Ljava/lang/Object;
.source "ServerMessage.java"


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "MixpanelAPI.ServerMessage"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private slurp(Ljava/io/InputStream;)[B
    .locals 5
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 136
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 139
    .local v0, "buffer":Ljava/io/ByteArrayOutputStream;
    const/16 v3, 0x2000

    new-array v1, v3, [B

    .line 141
    .local v1, "data":[B
    :goto_0
    array-length v3, v1

    invoke-virtual {p1, v1, v4, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .local v2, "nRead":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 142
    invoke-virtual {v0, v1, v4, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 145
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 146
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public getUrls(Landroid/content/Context;[Ljava/lang/String;)[B
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "urls"    # [Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 44
    invoke-virtual {p0, p1}, Lcom/mixpanel/android/mpmetrics/ServerMessage;->isOnline(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 65
    :cond_0
    :goto_0
    return-object v1

    .line 48
    :cond_1
    const/4 v1, 0x0

    .line 49
    .local v1, "response":[B
    array-length v4, p2

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v4, :cond_0

    aget-object v2, p2, v3

    .line 51
    .local v2, "url":Ljava/lang/String;
    const/4 v5, 0x0

    :try_start_0
    invoke-virtual {p0, v2, v5}, Lcom/mixpanel/android/mpmetrics/ServerMessage;->performRequest(Ljava/lang/String;Ljava/util/List;)[B
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v1

    goto :goto_0

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Ljava/net/MalformedURLException;
    const-string v5, "MixpanelAPI.ServerMessage"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Cannot interpret "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " as a URL."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 49
    .end local v0    # "e":Ljava/net/MalformedURLException;
    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 55
    :catch_1
    move-exception v0

    .line 56
    .local v0, "e":Ljava/io/IOException;
    sget-boolean v5, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v5, :cond_2

    .line 57
    const-string v5, "MixpanelAPI.ServerMessage"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Cannot get "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 59
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 60
    .local v0, "e":Ljava/lang/OutOfMemoryError;
    const-string v3, "MixpanelAPI.ServerMessage"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Out of memory when getting to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public isOnline(Landroid/content/Context;)Z
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 27
    :try_start_0
    const-string v4, "connectivity"

    .line 28
    invoke-virtual {p1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 29
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v3

    .line 30
    .local v3, "netInfo":Landroid/net/NetworkInfo;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v2, 0x1

    .line 31
    .local v2, "isOnline":Z
    :goto_0
    sget-boolean v4, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v4, :cond_0

    .line 32
    const-string v5, "MixpanelAPI.ServerMessage"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ConnectivityManager says we "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-eqz v2, :cond_2

    const-string v4, "are"

    :goto_1
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " online"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .end local v0    # "cm":Landroid/net/ConnectivityManager;
    .end local v3    # "netInfo":Landroid/net/NetworkInfo;
    :cond_0
    :goto_2
    return v2

    .line 30
    .end local v2    # "isOnline":Z
    .restart local v0    # "cm":Landroid/net/ConnectivityManager;
    .restart local v3    # "netInfo":Landroid/net/NetworkInfo;
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 32
    .restart local v2    # "isOnline":Z
    :cond_2
    const-string v4, "are not"
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 34
    .end local v0    # "cm":Landroid/net/ConnectivityManager;
    .end local v2    # "isOnline":Z
    .end local v3    # "netInfo":Landroid/net/NetworkInfo;
    :catch_0
    move-exception v1

    .line 35
    .local v1, "e":Ljava/lang/SecurityException;
    const/4 v2, 0x1

    .line 36
    .restart local v2    # "isOnline":Z
    sget-boolean v4, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v4, :cond_0

    .line 37
    const-string v4, "MixpanelAPI.ServerMessage"

    const-string v5, "Don\'t have permission to check connectivity, will assume we are online"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method public performRequest(Ljava/lang/String;Ljava/util/List;)[B
    .locals 16
    .param p1, "endpointUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    .local p2, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    sget-boolean v13, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v13, :cond_0

    .line 70
    const-string v13, "MixpanelAPI.ServerMessage"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Attempting request to "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    :cond_0
    const/4 v9, 0x0

    .line 78
    .local v9, "response":[B
    const/4 v10, 0x0

    .line 79
    .local v10, "retries":I
    const/4 v11, 0x0

    .line 80
    .local v11, "succeeded":Z
    :cond_1
    :goto_0
    const/4 v13, 0x3

    if-ge v10, v13, :cond_e

    if-nez v11, :cond_e

    .line 81
    const/4 v7, 0x0

    .line 82
    .local v7, "in":Ljava/io/InputStream;
    const/4 v8, 0x0

    .line 83
    .local v8, "out":Ljava/io/OutputStream;
    const/4 v2, 0x0

    .line 84
    .local v2, "bout":Ljava/io/BufferedOutputStream;
    const/4 v4, 0x0

    .line 87
    .local v4, "connection":Ljava/net/HttpURLConnection;
    :try_start_0
    new-instance v12, Ljava/net/URL;

    move-object/from16 v0, p1

    invoke-direct {v12, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 88
    .local v12, "url":Ljava/net/URL;
    invoke-virtual {v12}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v13

    move-object v0, v13

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v4, v0

    .line 89
    const/16 v13, 0x7d0

    invoke-virtual {v4, v13}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 90
    const/16 v13, 0x2710

    invoke-virtual {v4, v13}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 91
    if-eqz p2, :cond_2

    .line 92
    const/4 v13, 0x1

    invoke-virtual {v4, v13}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 93
    new-instance v6, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v13, "UTF-8"

    move-object/from16 v0, p2

    invoke-direct {v6, v0, v13}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 94
    .local v6, "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    const-string v13, "POST"

    invoke-virtual {v4, v13}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 95
    invoke-virtual {v6}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;->getContentLength()J

    move-result-wide v14

    long-to-int v13, v14

    invoke-virtual {v4, v13}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 96
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    .line 97
    new-instance v3, Ljava/io/BufferedOutputStream;

    invoke-direct {v3, v8}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    .end local v2    # "bout":Ljava/io/BufferedOutputStream;
    .local v3, "bout":Ljava/io/BufferedOutputStream;
    :try_start_1
    invoke-virtual {v6, v3}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;->writeTo(Ljava/io/OutputStream;)V

    .line 99
    invoke-virtual {v3}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_a
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 100
    const/4 v2, 0x0

    .line 101
    .end local v3    # "bout":Ljava/io/BufferedOutputStream;
    .restart local v2    # "bout":Ljava/io/BufferedOutputStream;
    :try_start_2
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V

    .line 102
    const/4 v8, 0x0

    .line 104
    .end local v6    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    :cond_2
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    .line 105
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/mixpanel/android/mpmetrics/ServerMessage;->slurp(Ljava/io/InputStream;)[B

    move-result-object v9

    .line 106
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/EOFException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 107
    const/4 v7, 0x0

    .line 108
    const/4 v11, 0x1

    .line 115
    if-eqz v2, :cond_3

    .line 116
    :try_start_3
    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 117
    :cond_3
    :goto_1
    if-eqz v8, :cond_4

    .line 118
    :try_start_4
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 119
    :cond_4
    :goto_2
    if-eqz v7, :cond_5

    .line 120
    :try_start_5
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 121
    :cond_5
    :goto_3
    if-eqz v4, :cond_1

    .line 122
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_0

    .line 109
    .end local v12    # "url":Ljava/net/URL;
    :catch_0
    move-exception v5

    .line 110
    .local v5, "e":Ljava/io/EOFException;
    :goto_4
    :try_start_6
    sget-boolean v13, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v13, :cond_6

    .line 111
    const-string v13, "MixpanelAPI.ServerMessage"

    const-string v14, "Failure to connect, likely caused by a known issue with Android lib. Retrying."

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 113
    :cond_6
    add-int/lit8 v10, v10, 0x1

    .line 115
    if-eqz v2, :cond_7

    .line 116
    :try_start_7
    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    .line 117
    :cond_7
    :goto_5
    if-eqz v8, :cond_8

    .line 118
    :try_start_8
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    .line 119
    :cond_8
    :goto_6
    if-eqz v7, :cond_9

    .line 120
    :try_start_9
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    .line 121
    :cond_9
    :goto_7
    if-eqz v4, :cond_1

    .line 122
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_0

    .line 115
    .end local v5    # "e":Ljava/io/EOFException;
    :catchall_0
    move-exception v13

    :goto_8
    if-eqz v2, :cond_a

    .line 116
    :try_start_a
    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_7

    .line 117
    :cond_a
    :goto_9
    if-eqz v8, :cond_b

    .line 118
    :try_start_b
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_8

    .line 119
    :cond_b
    :goto_a
    if-eqz v7, :cond_c

    .line 120
    :try_start_c
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_9

    .line 121
    :cond_c
    :goto_b
    if-eqz v4, :cond_d

    .line 122
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_d
    throw v13

    .line 125
    .end local v2    # "bout":Ljava/io/BufferedOutputStream;
    .end local v4    # "connection":Ljava/net/HttpURLConnection;
    .end local v7    # "in":Ljava/io/InputStream;
    .end local v8    # "out":Ljava/io/OutputStream;
    :cond_e
    sget-boolean v13, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v13, :cond_f

    .line 126
    const/4 v13, 0x3

    if-lt v10, v13, :cond_f

    .line 127
    const-string v13, "MixpanelAPI.ServerMessage"

    const-string v14, "Could not connect to Mixpanel service after three retries."

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    :cond_f
    return-object v9

    .line 116
    .restart local v2    # "bout":Ljava/io/BufferedOutputStream;
    .restart local v4    # "connection":Ljava/net/HttpURLConnection;
    .restart local v7    # "in":Ljava/io/InputStream;
    .restart local v8    # "out":Ljava/io/OutputStream;
    .restart local v12    # "url":Ljava/net/URL;
    :catch_1
    move-exception v13

    goto :goto_1

    .line 118
    :catch_2
    move-exception v13

    goto :goto_2

    .line 120
    :catch_3
    move-exception v13

    goto :goto_3

    .line 116
    .end local v12    # "url":Ljava/net/URL;
    .restart local v5    # "e":Ljava/io/EOFException;
    :catch_4
    move-exception v13

    goto :goto_5

    .line 118
    :catch_5
    move-exception v13

    goto :goto_6

    .line 120
    :catch_6
    move-exception v13

    goto :goto_7

    .line 116
    .end local v5    # "e":Ljava/io/EOFException;
    :catch_7
    move-exception v14

    goto :goto_9

    .line 118
    :catch_8
    move-exception v14

    goto :goto_a

    .line 120
    :catch_9
    move-exception v14

    goto :goto_b

    .line 115
    .end local v2    # "bout":Ljava/io/BufferedOutputStream;
    .restart local v3    # "bout":Ljava/io/BufferedOutputStream;
    .restart local v6    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .restart local v12    # "url":Ljava/net/URL;
    :catchall_1
    move-exception v13

    move-object v2, v3

    .end local v3    # "bout":Ljava/io/BufferedOutputStream;
    .restart local v2    # "bout":Ljava/io/BufferedOutputStream;
    goto :goto_8

    .line 109
    .end local v2    # "bout":Ljava/io/BufferedOutputStream;
    .restart local v3    # "bout":Ljava/io/BufferedOutputStream;
    :catch_a
    move-exception v5

    move-object v2, v3

    .end local v3    # "bout":Ljava/io/BufferedOutputStream;
    .restart local v2    # "bout":Ljava/io/BufferedOutputStream;
    goto :goto_4
.end method
