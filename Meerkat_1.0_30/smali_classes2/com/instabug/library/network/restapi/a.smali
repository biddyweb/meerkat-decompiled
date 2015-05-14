.class public final Lcom/instabug/library/network/restapi/a;
.super Ljava/lang/Object;
.source "IbgRestApi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/network/restapi/a$a;
    }
.end annotation


# instance fields
.field private a:Lcom/android/volley/RequestQueue;

.field private b:Lcom/instabug/library/network/restapi/c;

.field private c:Ljava/util/List;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/instabug/library/network/restapi/c;)V
    .locals 1

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/network/restapi/a;->c:Ljava/util/List;

    .line 52
    new-instance v0, Lcom/instabug/library/network/restapi/b;

    invoke-direct {v0, p0, p1}, Lcom/instabug/library/network/restapi/b;-><init>(Lcom/instabug/library/network/restapi/a;Landroid/content/Context;)V

    invoke-static {p1, v0}, Lcom/instabug/library/network/toolbox/b;->a(Landroid/content/Context;Lcom/instabug/library/network/toolbox/b$a;)V

    .line 62
    iput-object p2, p0, Lcom/instabug/library/network/restapi/a;->b:Lcom/instabug/library/network/restapi/c;

    .line 63
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/network/restapi/a;Lcom/android/volley/RequestQueue;)Lcom/android/volley/RequestQueue;
    .locals 0

    .prologue
    .line 30
    iput-object p1, p0, Lcom/instabug/library/network/restapi/a;->a:Lcom/android/volley/RequestQueue;

    return-object p1
.end method

.method static synthetic a(Lcom/instabug/library/network/restapi/a;)Ljava/util/List;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/instabug/library/network/restapi/a;->c:Ljava/util/List;

    return-object v0
.end method

.method static synthetic b(Lcom/instabug/library/network/restapi/a;)Lcom/android/volley/RequestQueue;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/instabug/library/network/restapi/a;->a:Lcom/android/volley/RequestQueue;

    return-object v0
.end method


# virtual methods
.method public final a(Lcom/instabug/library/model/a;Lcom/instabug/library/network/restapi/a$a;)V
    .locals 7

    .prologue
    const/4 v1, 0x1

    .line 113
    const-string v0, "Api: saveIssue"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 114
    new-instance v3, Lcom/instabug/library/network/c;

    invoke-direct {v3}, Lcom/instabug/library/network/c;-><init>()V

    .line 115
    invoke-virtual {p1}, Lcom/instabug/library/model/a;->f()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/instabug/library/network/c;->a(Lorg/json/JSONObject;)V

    .line 116
    new-instance v0, Lcom/android/volley/toolbox/JsonObjectRequest;

    .line 117
    invoke-virtual {v3, v1}, Lcom/instabug/library/network/c;->a(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3}, Lcom/instabug/library/network/c;->b()Lorg/json/JSONObject;

    move-result-object v3

    iget-object v5, p0, Lcom/instabug/library/network/restapi/a;->b:Lcom/instabug/library/network/restapi/c;

    .line 118
    new-instance v4, Lcom/instabug/library/network/restapi/f;

    invoke-direct {v4, v5, p2}, Lcom/instabug/library/network/restapi/f;-><init>(Lcom/instabug/library/network/restapi/c;Lcom/instabug/library/network/restapi/a$a;)V

    iget-object v6, p0, Lcom/instabug/library/network/restapi/a;->b:Lcom/instabug/library/network/restapi/c;

    .line 119
    new-instance v5, Lcom/instabug/library/network/restapi/g;

    invoke-direct {v5, v6, p2}, Lcom/instabug/library/network/restapi/g;-><init>(Lcom/instabug/library/network/restapi/c;Lcom/instabug/library/network/restapi/a$a;)V

    invoke-direct/range {v0 .. v5}, Lcom/android/volley/toolbox/JsonObjectRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 120
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/volley/toolbox/JsonObjectRequest;->setShouldCache(Z)Lcom/android/volley/Request;

    .line 121
    iget-object v1, p0, Lcom/instabug/library/network/restapi/a;->a:Lcom/android/volley/RequestQueue;

    if-eqz v1, :cond_0

    .line 122
    iget-object v1, p0, Lcom/instabug/library/network/restapi/a;->a:Lcom/android/volley/RequestQueue;

    invoke-virtual {v1, v0}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 126
    :goto_0
    return-void

    .line 124
    :cond_0
    iget-object v1, p0, Lcom/instabug/library/network/restapi/a;->c:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public final a(Lcom/instabug/library/model/a;Ljava/io/File;ILcom/instabug/library/interactor/a$a;)V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 129
    const-string v0, "Api: saveIssueArtifact"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 130
    packed-switch p3, :pswitch_data_0

    .line 136
    new-instance v0, Lcom/instabug/library/network/e;

    invoke-direct {v0}, Lcom/instabug/library/network/e;-><init>()V

    .line 139
    :goto_0
    new-instance v1, Lcom/instabug/library/network/toolbox/a;

    invoke-virtual {v0, v5}, Lcom/instabug/library/network/h;->a(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/instabug/library/network/restapi/a;->b:Lcom/instabug/library/network/restapi/c;

    .line 140
    new-instance v3, Lcom/instabug/library/network/restapi/h;

    invoke-direct {v3, v2, p4}, Lcom/instabug/library/network/restapi/h;-><init>(Lcom/instabug/library/network/restapi/c;Lcom/instabug/library/interactor/a$a;)V

    iget-object v2, p0, Lcom/instabug/library/network/restapi/a;->b:Lcom/instabug/library/network/restapi/c;

    .line 141
    new-instance v4, Lcom/instabug/library/network/restapi/i;

    invoke-direct {v4, v2, p4}, Lcom/instabug/library/network/restapi/i;-><init>(Lcom/instabug/library/network/restapi/c;Lcom/instabug/library/interactor/a$a;)V

    invoke-direct {v1, v5, v0, v3, v4}, Lcom/instabug/library/network/toolbox/a;-><init>(ILjava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 142
    new-instance v0, Lcom/android/volley/DefaultRetryPolicy;

    const v2, 0xea60

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v2, v5, v3}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {v1, v0}, Lcom/instabug/library/network/toolbox/a;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 143
    const-string v0, "file"

    invoke-virtual {v1, v0, p2}, Lcom/instabug/library/network/toolbox/a;->a(Ljava/lang/String;Ljava/io/File;)V

    .line 144
    const-string v0, "bugID"

    invoke-virtual {p1}, Lcom/instabug/library/model/a;->g()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/instabug/library/network/toolbox/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/instabug/library/network/toolbox/a;->setShouldCache(Z)Lcom/android/volley/Request;

    .line 146
    invoke-virtual {v1}, Lcom/instabug/library/network/toolbox/a;->a()V

    .line 148
    iget-object v0, p0, Lcom/instabug/library/network/restapi/a;->a:Lcom/android/volley/RequestQueue;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/instabug/library/network/restapi/a;->a:Lcom/android/volley/RequestQueue;

    invoke-virtual {v0, v1}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 153
    :goto_1
    return-void

    .line 133
    :pswitch_0
    new-instance v0, Lcom/instabug/library/network/d;

    invoke-direct {v0}, Lcom/instabug/library/network/d;-><init>()V

    goto :goto_0

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/network/restapi/a;->c:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 130
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/instabug/library/interactor/a$a;)V
    .locals 7

    .prologue
    .line 86
    new-instance v3, Lcom/instabug/library/network/b;

    invoke-direct {v3}, Lcom/instabug/library/network/b;-><init>()V

    .line 88
    :try_start_0
    const-string v0, "uuid"

    invoke-virtual {v3, v0, p1}, Lcom/instabug/library/network/b;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v0

    const-string v1, "token"

    .line 89
    invoke-virtual {v0, v1, p2}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v0

    const-string v1, "device"

    .line 90
    invoke-virtual {v0, v1, p3}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v0

    const-string v1, "os"

    .line 91
    invoke-virtual {v0, v1, p4}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v0

    const-string v1, "bundleID"

    .line 92
    invoke-virtual {v0, v1, p5}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v0

    const-string v1, "SDKVersion"

    .line 93
    invoke-virtual {v0, v1, p6}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    move-result-object v0

    const-string v1, "deviceRooted"

    .line 94
    invoke-virtual {v0, v1, p7}, Lcom/instabug/library/network/h;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/instabug/library/network/h;

    .line 95
    new-instance v0, Lcom/android/volley/toolbox/JsonObjectRequest;

    const/4 v1, 0x1

    const/4 v2, 0x1

    .line 96
    invoke-virtual {v3, v2}, Lcom/instabug/library/network/b;->a(I)Ljava/lang/String;

    move-result-object v2

    .line 97
    invoke-virtual {v3}, Lcom/instabug/library/network/b;->b()Lorg/json/JSONObject;

    move-result-object v3

    iget-object v5, p0, Lcom/instabug/library/network/restapi/a;->b:Lcom/instabug/library/network/restapi/c;

    .line 98
    new-instance v4, Lcom/instabug/library/network/restapi/d;

    invoke-direct {v4, v5, p8}, Lcom/instabug/library/network/restapi/d;-><init>(Lcom/instabug/library/network/restapi/c;Lcom/instabug/library/interactor/a$a;)V

    iget-object v6, p0, Lcom/instabug/library/network/restapi/a;->b:Lcom/instabug/library/network/restapi/c;

    .line 99
    new-instance v5, Lcom/instabug/library/network/restapi/e;

    invoke-direct {v5, v6, p8}, Lcom/instabug/library/network/restapi/e;-><init>(Lcom/instabug/library/network/restapi/c;Lcom/instabug/library/interactor/a$a;)V

    invoke-direct/range {v0 .. v5}, Lcom/android/volley/toolbox/JsonObjectRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 100
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/volley/toolbox/JsonObjectRequest;->setShouldCache(Z)Lcom/android/volley/Request;

    .line 101
    iget-object v1, p0, Lcom/instabug/library/network/restapi/a;->a:Lcom/android/volley/RequestQueue;

    if-eqz v1, :cond_0

    .line 102
    iget-object v1, p0, Lcom/instabug/library/network/restapi/a;->a:Lcom/android/volley/RequestQueue;

    invoke-virtual {v1, v0}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 109
    :goto_0
    return-void

    .line 104
    :cond_0
    iget-object v1, p0, Lcom/instabug/library/network/restapi/a;->c:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 106
    :catch_0
    move-exception v0

    .line 107
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
