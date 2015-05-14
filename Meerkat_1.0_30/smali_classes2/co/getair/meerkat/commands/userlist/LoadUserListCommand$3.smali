.class Lco/getair/meerkat/commands/userlist/LoadUserListCommand$3;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "LoadUserListCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/commands/userlist/LoadUserListCommand;
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
    .line 98
    iput-object p1, p0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$3;->this$0:Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    .line 102
    iget-object v8, p0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$3;->resultObject:Ljava/lang/Object;

    if-eqz v8, :cond_1

    .line 106
    :try_start_0
    iget-object v8, p0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$3;->resultObject:Ljava/lang/Object;

    check-cast v8, Lorg/json/JSONObject;

    const-string v9, "result"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/json/JSONArray;

    .line 107
    .local v6, "resultJson":Lorg/json/JSONArray;
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 108
    .local v7, "resultList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/dtos/FollowUser;>;"
    move-object v4, v6

    .line 109
    .local v4, "jArray":Lorg/json/JSONArray;
    new-instance v2, Lcom/google/gson/Gson;

    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    .line 110
    .local v2, "gson":Lcom/google/gson/Gson;
    if-eqz v4, :cond_0

    .line 111
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v3, v8, :cond_0

    .line 112
    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 113
    .local v5, "jsonString":Ljava/lang/String;
    const-class v8, Lco/getair/meerkat/dtos/FollowUser;

    invoke-virtual {v2, v5, v8}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/dtos/FollowUser;

    .line 114
    .local v1, "followUser":Lco/getair/meerkat/dtos/FollowUser;
    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 118
    .end local v1    # "followUser":Lco/getair/meerkat/dtos/FollowUser;
    .end local v3    # "i":I
    .end local v5    # "jsonString":Ljava/lang/String;
    :cond_0
    iget-object v8, p0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$3;->this$0:Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    # invokes: Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v8}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->access$000(Lco/getair/meerkat/commands/userlist/LoadUserListCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v8

    const-string v9, "userlistLoaded"

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v7, v10}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .end local v2    # "gson":Lcom/google/gson/Gson;
    .end local v4    # "jArray":Lorg/json/JSONArray;
    .end local v6    # "resultJson":Lorg/json/JSONArray;
    .end local v7    # "resultList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/dtos/FollowUser;>;"
    :goto_1
    return-void

    .line 120
    :catch_0
    move-exception v0

    .line 121
    .local v0, "ex":Ljava/lang/Exception;
    iget-object v8, p0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$3;->this$0:Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    # invokes: Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v8}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->access$100(Lco/getair/meerkat/commands/userlist/LoadUserListCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v8

    const-string v9, "userlistLoadingError"

    invoke-virtual {v8, v9, v11, v11}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_1

    .line 124
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_1
    iget-object v8, p0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand$3;->this$0:Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    # invokes: Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v8}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;->access$200(Lco/getair/meerkat/commands/userlist/LoadUserListCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v8

    const-string v9, "userlistLoadingError"

    invoke-virtual {v8, v9, v11, v11}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_1
.end method
