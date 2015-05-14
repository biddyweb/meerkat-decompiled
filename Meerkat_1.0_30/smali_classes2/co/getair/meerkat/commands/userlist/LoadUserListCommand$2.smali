.class Lco/getair/meerkat/commands/userlist/LoadUserListCommand$2;
.super Ljava/lang/Object;
.source "LoadUserListCommand.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->loadLeaderboardListSource()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/userlist/LoadUserListCommand;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/userlist/LoadUserListCommand;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    .prologue
    .line 86
    iput-object p1, p0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$2;->this$0:Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 89
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$2;->this$0:Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    iget-object v1, v1, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->resultHandler:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 90
    return-void
.end method
