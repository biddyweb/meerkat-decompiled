.class Lco/getair/meerkat/commands/UploadProfileImageCommand$1;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "UploadProfileImageCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/UploadProfileImageCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/UploadProfileImageCommand;

.field final synthetic val$twitterProxy:Lco/getair/meerkat/proxies/TwitterProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/UploadProfileImageCommand;Lco/getair/meerkat/proxies/TwitterProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/UploadProfileImageCommand;

    .prologue
    .line 26
    iput-object p1, p0, Lco/getair/meerkat/commands/UploadProfileImageCommand$1;->this$0:Lco/getair/meerkat/commands/UploadProfileImageCommand;

    iput-object p2, p0, Lco/getair/meerkat/commands/UploadProfileImageCommand$1;->val$twitterProxy:Lco/getair/meerkat/proxies/TwitterProxy;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 29
    iget-boolean v1, p0, Lco/getair/meerkat/commands/UploadProfileImageCommand$1;->success:Z

    if-eqz v1, :cond_0

    .line 30
    iget-object v0, p0, Lco/getair/meerkat/commands/UploadProfileImageCommand$1;->resultObject:Ljava/lang/Object;

    check-cast v0, Lcom/twitter/sdk/android/core/models/User;

    .line 31
    .local v0, "twitterUser":Lcom/twitter/sdk/android/core/models/User;
    iget-object v1, p0, Lco/getair/meerkat/commands/UploadProfileImageCommand$1;->val$twitterProxy:Lco/getair/meerkat/proxies/TwitterProxy;

    new-instance v2, Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1;

    invoke-direct {v2, p0}, Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1;-><init>(Lco/getair/meerkat/commands/UploadProfileImageCommand$1;)V

    invoke-virtual {v1, v0, v2}, Lco/getair/meerkat/proxies/TwitterProxy;->getUserProfileImage(Lcom/twitter/sdk/android/core/models/User;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 52
    .end local v0    # "twitterUser":Lcom/twitter/sdk/android/core/models/User;
    :cond_0
    return-void
.end method
