.class Lco/getair/meerkat/commands/userlist/LoadUserListCommand$1;
.super Ljava/lang/Object;
.source "LoadUserListCommand.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->loadLeaderboardListSource()V
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
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/userlist/LoadUserListCommand;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/userlist/LoadUserListCommand;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    .prologue
    .line 80
    iput-object p1, p0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$1;->this$0:Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 80
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 83
    iget-object v0, p0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$1;->this$0:Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    iget-object v0, v0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->resultHandler:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    iput-object p1, v0, Lco/getair/meerkat/utilities/RunnableWithResultObject;->resultObject:Ljava/lang/Object;

    .line 84
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$1;->this$0:Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    iget-object v1, v1, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->resultHandler:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 85
    return-void
.end method
