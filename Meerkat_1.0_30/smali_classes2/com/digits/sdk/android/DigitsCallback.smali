.class public abstract Lcom/digits/sdk/android/DigitsCallback;
.super Lcom/twitter/sdk/android/core/Callback;
.source "DigitsCallback.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/twitter/sdk/android/core/Callback",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final context:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field final controller:Lcom/digits/sdk/android/DigitsController;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "controller"    # Lcom/digits/sdk/android/DigitsController;

    .prologue
    .line 16
    .local p0, "this":Lcom/digits/sdk/android/DigitsCallback;, "Lcom/digits/sdk/android/DigitsCallback<TT;>;"
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    .line 18
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/digits/sdk/android/DigitsCallback;->context:Ljava/lang/ref/WeakReference;

    .line 19
    iput-object p2, p0, Lcom/digits/sdk/android/DigitsCallback;->controller:Lcom/digits/sdk/android/DigitsController;

    .line 20
    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 5
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 24
    .local p0, "this":Lcom/digits/sdk/android/DigitsCallback;, "Lcom/digits/sdk/android/DigitsCallback<TT;>;"
    iget-object v2, p0, Lcom/digits/sdk/android/DigitsCallback;->controller:Lcom/digits/sdk/android/DigitsController;

    invoke-interface {v2}, Lcom/digits/sdk/android/DigitsController;->getErrors()Lcom/digits/sdk/android/ErrorCodes;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/digits/sdk/android/DigitsException;->create(Lcom/digits/sdk/android/ErrorCodes;Lcom/twitter/sdk/android/core/TwitterException;)Lcom/digits/sdk/android/DigitsException;

    move-result-object v1

    .line 26
    .local v1, "digitsException":Lcom/digits/sdk/android/DigitsException;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v2, "HTTP Error: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/twitter/sdk/android/core/TwitterException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", API Error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/digits/sdk/android/DigitsException;->getErrorCode()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", User Message: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/digits/sdk/android/DigitsException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v2

    const-string v3, "Digits"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    iget-object v3, p0, Lcom/digits/sdk/android/DigitsCallback;->controller:Lcom/digits/sdk/android/DigitsController;

    iget-object v2, p0, Lcom/digits/sdk/android/DigitsCallback;->context:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    invoke-interface {v3, v2, v1}, Lcom/digits/sdk/android/DigitsController;->handleError(Landroid/content/Context;Lcom/digits/sdk/android/DigitsException;)V

    .line 35
    return-void
.end method
