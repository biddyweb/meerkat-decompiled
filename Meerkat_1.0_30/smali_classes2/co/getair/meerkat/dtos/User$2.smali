.class final Lco/getair/meerkat/dtos/User$2;
.super Ljava/lang/Object;
.source "User.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/dtos/User;->fetchUser(Landroid/content/Context;Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$completionRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;


# direct methods
.method constructor <init>(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 0

    .prologue
    .line 162
    iput-object p1, p0, Lco/getair/meerkat/dtos/User$2;->val$completionRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 166
    const-string v1, "Error get  user object"

    invoke-static {v1}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    .line 168
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lco/getair/meerkat/dtos/User$2;->val$completionRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 169
    .local v0, "thread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 170
    return-void
.end method
