.class Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers$1;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "ProfileUpdateFollowingFollowers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;

    .prologue
    .line 31
    iput-object p1, p0, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers$1;->this$0:Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 34
    iget-object v5, p0, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers$1;->resultObject:Ljava/lang/Object;

    if-eqz v5, :cond_1

    .line 38
    :try_start_0
    iget-object v5, p0, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers$1;->resultObject:Ljava/lang/Object;

    check-cast v5, Lorg/json/JSONObject;

    const-string v6, "result"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONArray;

    .line 39
    .local v2, "followerListJson":Lorg/json/JSONArray;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .local v1, "followerList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object v4, v2

    .line 41
    .local v4, "jArray":Lorg/json/JSONArray;
    if-eqz v4, :cond_0

    .line 42
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v3, v5, :cond_0

    .line 43
    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 46
    .end local v3    # "i":I
    :cond_0
    iget-object v5, p0, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers$1;->this$0:Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;

    # invokes: Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v5}, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;->access$000(Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v5

    const-string v6, "profileFollowerLoaded"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v1, v7}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .end local v1    # "followerList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "followerListJson":Lorg/json/JSONArray;
    .end local v4    # "jArray":Lorg/json/JSONArray;
    :goto_1
    return-void

    .line 47
    :catch_0
    move-exception v0

    .line 48
    .local v0, "ex":Ljava/lang/Exception;
    iget-object v5, p0, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers$1;->this$0:Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;

    # invokes: Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v5}, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;->access$100(Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v5

    const-string v6, "profileFollowerLoadingError"

    invoke-virtual {v5, v6, v8, v8}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_1

    .line 51
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_1
    iget-object v5, p0, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers$1;->this$0:Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;

    # invokes: Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v5}, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;->access$200(Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v5

    const-string v6, "profileFollowerLoadingError"

    invoke-virtual {v5, v6, v8, v8}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_1
.end method
