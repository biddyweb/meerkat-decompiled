.class Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;
.super Landroid/os/AsyncTask;
.source "RegisterForNotificationsCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;

.field final synthetic val$callingActivity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;Landroid/app/Activity;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;

    .prologue
    .line 56
    iput-object p1, p0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;->this$0:Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;

    iput-object p2, p0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;->val$callingActivity:Landroid/app/Activity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 56
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/String;
    .locals 10
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 59
    const-string v5, ""

    .line 61
    .local v5, "msg":Ljava/lang/String;
    :try_start_0
    iget-object v7, p0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;->val$callingActivity:Landroid/app/Activity;

    invoke-static {v7}, Lcom/google/android/gms/gcm/GoogleCloudMessaging;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/gcm/GoogleCloudMessaging;

    move-result-object v4

    .line 62
    .local v4, "gcm":Lcom/google/android/gms/gcm/GoogleCloudMessaging;
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    # getter for: Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->SENDER_ID:Ljava/lang/String;
    invoke-static {}, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->access$000()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v4, v7}, Lcom/google/android/gms/gcm/GoogleCloudMessaging;->register([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 63
    .local v6, "regid":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "and - "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 65
    new-instance v0, Lco/getair/meerkat/utilities/ApplicationPreferences;

    iget-object v7, p0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;->val$callingActivity:Landroid/app/Activity;

    invoke-direct {v0, v7}, Lco/getair/meerkat/utilities/ApplicationPreferences;-><init>(Landroid/content/Context;)V

    .line 66
    .local v0, "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    invoke-virtual {v0}, Lco/getair/meerkat/utilities/ApplicationPreferences;->getNotificationsToken()Ljava/lang/String;

    move-result-object v2

    .line 68
    .local v2, "currentNotificationsToken":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 69
    :cond_0
    invoke-virtual {v0, v6}, Lco/getair/meerkat/utilities/ApplicationPreferences;->saveNotificationsToken(Ljava/lang/String;)V

    .line 70
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v7

    const-string v8, "authorizeProxy"

    invoke-virtual {v7, v8}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/AuthorizeProxy;

    .line 71
    .local v1, "authorizeProxy":Lco/getair/meerkat/proxies/AuthorizeProxy;
    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    sget-object v8, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;->PERIODIC:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    new-instance v9, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;

    invoke-direct {v9, p0}, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;-><init>(Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;)V

    invoke-virtual {v1, v7, v8, v9}, Lco/getair/meerkat/proxies/AuthorizeProxy;->authorizeWithNewToken(Ljava/lang/Boolean;Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    .end local v0    # "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    .end local v1    # "authorizeProxy":Lco/getair/meerkat/proxies/AuthorizeProxy;
    .end local v2    # "currentNotificationsToken":Ljava/lang/String;
    .end local v4    # "gcm":Lcom/google/android/gms/gcm/GoogleCloudMessaging;
    .end local v6    # "regid":Ljava/lang/String;
    :cond_1
    :goto_0
    return-object v5

    .line 86
    :catch_0
    move-exception v3

    .line 87
    .local v3, "ex":Ljava/io/IOException;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error :"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method
