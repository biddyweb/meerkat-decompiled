.class final Lcom/instabug/library/b$a;
.super Landroid/os/AsyncTask;
.source "InstabugAnnotationScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/instabug/library/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field private a:Ljava/lang/ref/WeakReference;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 777
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(B)V
    .locals 0

    .prologue
    .line 777
    invoke-direct {p0}, Lcom/instabug/library/b$a;-><init>()V

    return-void
.end method

.method private varargs a([Ljava/lang/Object;)Lorg/json/JSONObject;
    .locals 3

    .prologue
    .line 784
    :try_start_0
    new-instance v1, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x1

    aget-object v0, p1, v0

    check-cast v0, Lcom/instabug/library/b;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/instabug/library/b$a;->a:Ljava/lang/ref/WeakReference;

    .line 785
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/FileReader;

    const/4 v0, 0x0

    aget-object v0, p1, v0

    check-cast v0, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 786
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 787
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 790
    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected final synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 777
    invoke-direct {p0, p1}, Lcom/instabug/library/b$a;->a([Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method protected final synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 777
    check-cast p1, Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/instabug/library/b$a;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/b$a;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/b;

    invoke-static {v0, p1}, Lcom/instabug/library/b;->a(Lcom/instabug/library/b;Lorg/json/JSONObject;)V

    :cond_0
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    return-void
.end method
