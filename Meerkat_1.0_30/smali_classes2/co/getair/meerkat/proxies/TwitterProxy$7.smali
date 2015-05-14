.class Lco/getair/meerkat/proxies/TwitterProxy$7;
.super Ljava/lang/Object;
.source "TwitterProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/TwitterProxy;->getUserProfileImage(Lcom/twitter/sdk/android/core/models/User;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/TwitterProxy;

.field final synthetic val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/TwitterProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/TwitterProxy;

    .prologue
    .line 218
    iput-object p1, p0, Lco/getair/meerkat/proxies/TwitterProxy$7;->this$0:Lco/getair/meerkat/proxies/TwitterProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/TwitterProxy$7;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "response"    # Landroid/graphics/Bitmap;

    .prologue
    .line 221
    const-string v0, "TwitterProxy"

    const-string v1, "profile image arrived"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    iget-object v0, p0, Lco/getair/meerkat/proxies/TwitterProxy$7;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lco/getair/meerkat/utilities/RunnableWithResultObject;->success:Z

    .line 223
    iget-object v0, p0, Lco/getair/meerkat/proxies/TwitterProxy$7;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    iput-object p1, v0, Lco/getair/meerkat/utilities/RunnableWithResultObject;->resultObject:Ljava/lang/Object;

    .line 224
    iget-object v0, p0, Lco/getair/meerkat/proxies/TwitterProxy$7;->val$runnableWithResultObject:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-virtual {v0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;->run()V

    .line 225
    return-void
.end method

.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 218
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/TwitterProxy$7;->onResponse(Landroid/graphics/Bitmap;)V

    return-void
.end method
