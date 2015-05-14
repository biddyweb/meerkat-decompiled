.class Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;
.super Ljava/lang/Object;
.source "MixpanelAPI.java"

# interfaces
.implements Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PeopleImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;


# direct methods
.method private constructor <init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V
    .locals 0

    .prologue
    .line 1112
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lcom/mixpanel/android/mpmetrics/MixpanelAPI$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
    .param p2, "x1"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI$1;

    .prologue
    .line 1112
    invoke-direct {p0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V

    return-void
.end method

.method private registerForPushIdAPI19AndOlder(Ljava/lang/String;)V
    .locals 7
    .param p1, "senderID"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 1466
    :try_start_0
    sget-boolean v2, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "MixpanelAPI.MixpanelAPI"

    const-string v3, "Registering a new push id"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1467
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.google.android.c2dm.intent.REGISTER"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1468
    .local v1, "registrationIntent":Landroid/content/Intent;
    const-string v2, "app"

    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$1000(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1469
    const-string v2, "sender"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1470
    iget-object v2, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$1000(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1474
    .end local v1    # "registrationIntent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 1471
    :catch_0
    move-exception v0

    .line 1472
    .local v0, "e":Ljava/lang/SecurityException;
    const-string v2, "MixpanelAPI.MixpanelAPI"

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private registerForPushIdAPI21AndUp(Ljava/lang/String;)V
    .locals 1
    .param p1, "senderID"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 1460
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mMessages:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$1300(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->registerForGCM(Ljava/lang/String;)V

    .line 1461
    return-void
.end method

.method private showGivenOrAvailableNotification(Lcom/mixpanel/android/mpmetrics/InAppNotification;Landroid/app/Activity;)V
    .locals 2
    .param p1, "notifOrNull"    # Lcom/mixpanel/android/mpmetrics/InAppNotification;
    .param p2, "parent"    # Landroid/app/Activity;

    .prologue
    .line 1537
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_1

    .line 1538
    sget-boolean v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 1539
    const-string v0, "MixpanelAPI.MixpanelAPI"

    const-string v1, "Will not show notifications, os version is too low."

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1636
    :cond_0
    :goto_0
    return-void

    .line 1544
    :cond_1
    new-instance v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;

    invoke-direct {v0, p0, p1, p2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;Lcom/mixpanel/android/mpmetrics/InAppNotification;Landroid/app/Activity;)V

    invoke-virtual {p2, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private showGivenOrAvailableSurvey(Lcom/mixpanel/android/mpmetrics/Survey;Landroid/app/Activity;)V
    .locals 7
    .param p1, "surveyOrNull"    # Lcom/mixpanel/android/mpmetrics/Survey;
    .param p2, "parent"    # Landroid/app/Activity;

    .prologue
    .line 1478
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x10

    if-ge v5, v6, :cond_1

    .line 1479
    sget-boolean v5, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v5, :cond_0

    .line 1480
    const-string v5, "MixpanelAPI.MixpanelAPI"

    const-string v6, "Will not show survey, os version is too low."

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1534
    :cond_0
    :goto_0
    return-void

    .line 1485
    :cond_1
    invoke-virtual {p2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/mixpanel/android/mpmetrics/ConfigurationChecker;->checkSurveyActivityAvailable(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 1486
    sget-boolean v5, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v5, :cond_0

    .line 1487
    const-string v5, "MixpanelAPI.MixpanelAPI"

    const-string v6, "Will not show survey, application isn\'t configured appropriately."

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1492
    :cond_2
    const/4 v1, 0x0

    .line 1493
    .local v1, "listener":Lcom/mixpanel/android/mpmetrics/BackgroundCapture$OnBackgroundCapturedListener;
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/UpdateDisplayState;->getLockObject()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v2

    .line 1494
    .local v2, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1496
    :try_start_0
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/UpdateDisplayState;->hasCurrentProposal()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-eqz v5, :cond_3

    .line 1530
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    .line 1499
    :cond_3
    move-object v4, p1

    .line 1500
    .local v4, "toShow":Lcom/mixpanel/android/mpmetrics/Survey;
    if-nez v4, :cond_4

    .line 1501
    :try_start_1
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->getSurveyIfAvailable()Lcom/mixpanel/android/mpmetrics/Survey;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v4

    .line 1503
    :cond_4
    if-nez v4, :cond_5

    .line 1530
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    .line 1507
    :cond_5
    :try_start_2
    new-instance v3, Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState$SurveyState;

    invoke-direct {v3, v4}, Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState$SurveyState;-><init>(Lcom/mixpanel/android/mpmetrics/Survey;)V

    .line 1510
    .local v3, "surveyDisplay":Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState$SurveyState;
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->getDistinctId()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mToken:Ljava/lang/String;
    invoke-static {v6}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$1200(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v5, v6}, Lcom/mixpanel/android/mpmetrics/UpdateDisplayState;->proposeDisplay(Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 1511
    .local v0, "intentId":I
    if-gtz v0, :cond_6

    .line 1512
    const-string v5, "MixpanelAPI.MixpanelAPI"

    const-string v6, "DisplayState Lock is in an inconsistent state! Please report this issue to Mixpanel"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1530
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    .line 1516
    :cond_6
    :try_start_3
    new-instance v1, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$3;

    .end local v1    # "listener":Lcom/mixpanel/android/mpmetrics/BackgroundCapture$OnBackgroundCapturedListener;
    invoke-direct {v1, p0, v3, p2, v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$3;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState$SurveyState;Landroid/app/Activity;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1530
    .restart local v1    # "listener":Lcom/mixpanel/android/mpmetrics/BackgroundCapture$OnBackgroundCapturedListener;
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1533
    invoke-static {p2, v1}, Lcom/mixpanel/android/mpmetrics/BackgroundCapture;->captureBackground(Landroid/app/Activity;Lcom/mixpanel/android/mpmetrics/BackgroundCapture$OnBackgroundCapturedListener;)V

    goto :goto_0

    .line 1530
    .end local v0    # "intentId":I
    .end local v1    # "listener":Lcom/mixpanel/android/mpmetrics/BackgroundCapture$OnBackgroundCapturedListener;
    .end local v3    # "surveyDisplay":Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState$SurveyState;
    .end local v4    # "toShow":Lcom/mixpanel/android/mpmetrics/Survey;
    :catchall_0
    move-exception v5

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v5
.end method

.method private stdPeopleMessage(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "actionType"    # Ljava/lang/String;
    .param p2, "properties"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1444
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 1445
    .local v0, "dataObj":Lorg/json/JSONObject;
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->getDistinctId()Ljava/lang/String;

    move-result-object v1

    .line 1447
    .local v1, "distinctId":Ljava/lang/String;
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1448
    const-string v2, "$token"

    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mToken:Ljava/lang/String;
    invoke-static {v3}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$1200(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1449
    const-string v2, "$time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v0, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 1451
    if-eqz v1, :cond_0

    .line 1452
    const-string v2, "$distinct_id"

    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->getDistinctId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1455
    :cond_0
    return-object v0
.end method


# virtual methods
.method public addOnMixpanelUpdatesReceivedListener(Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;

    .prologue
    .line 1434
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mUpdatesListener:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$1100(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;->addOnMixpanelUpdatesReceivedListener(Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;)V

    .line 1435
    return-void
.end method

.method public append(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 1185
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 1186
    .local v2, "properties":Lorg/json/JSONObject;
    invoke-virtual {v2, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1187
    const-string v3, "$append"

    invoke-direct {p0, v3, v2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->stdPeopleMessage(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 1188
    .local v1, "message":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # invokes: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->recordPeopleMessage(Lorg/json/JSONObject;)V
    invoke-static {v3, v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$800(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1192
    .end local v1    # "message":Lorg/json/JSONObject;
    .end local v2    # "properties":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 1189
    :catch_0
    move-exception v0

    .line 1190
    .local v0, "e":Lorg/json/JSONException;
    const-string v3, "MixpanelAPI.MixpanelAPI"

    const-string v4, "Exception appending a property"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public checkForSurvey(Lcom/mixpanel/android/mpmetrics/SurveyCallbacks;)V
    .locals 2
    .param p1, "callbacks"    # Lcom/mixpanel/android/mpmetrics/SurveyCallbacks;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1221
    const-string v0, "MixpanelAPI.MixpanelAPI"

    const-string v1, "MixpanelAPI.checkForSurvey is deprecated. Calling is now a no-op.\n    to query surveys, call MixpanelAPI.getPeople().getSurveyIfAvailable()"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1226
    return-void
.end method

.method public checkForSurvey(Lcom/mixpanel/android/mpmetrics/SurveyCallbacks;Landroid/app/Activity;)V
    .locals 2
    .param p1, "callbacks"    # Lcom/mixpanel/android/mpmetrics/SurveyCallbacks;
    .param p2, "parentActivity"    # Landroid/app/Activity;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1232
    const-string v0, "MixpanelAPI.MixpanelAPI"

    const-string v1, "MixpanelAPI.checkForSurvey is deprecated. Calling is now a no-op.\n    to query surveys, call MixpanelAPI.getPeople().getSurveyIfAvailable()"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1237
    return-void
.end method

.method public clearCharges()V
    .locals 1

    .prologue
    .line 1345
    const-string v0, "$transactions"

    invoke-virtual {p0, v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->unset(Ljava/lang/String;)V

    .line 1346
    return-void
.end method

.method public clearPushRegistrationId()V
    .locals 2

    .prologue
    .line 1377
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$400(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->clearPushId()V

    .line 1378
    const-string v0, "$android_devices"

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1379
    return-void
.end method

.method public deleteUser()V
    .locals 4

    .prologue
    .line 1351
    :try_start_0
    const-string v2, "$delete"

    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-direct {p0, v2, v3}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->stdPeopleMessage(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 1352
    .local v1, "message":Lorg/json/JSONObject;
    iget-object v2, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # invokes: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->recordPeopleMessage(Lorg/json/JSONObject;)V
    invoke-static {v2, v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$800(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1356
    .end local v1    # "message":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 1353
    :catch_0
    move-exception v0

    .line 1354
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "MixpanelAPI.MixpanelAPI"

    const-string v3, "Exception deleting a user"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getDistinctId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1411
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$400(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->getPeopleDistinctId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNotificationIfAvailable()Lcom/mixpanel/android/mpmetrics/InAppNotification;
    .locals 2

    .prologue
    .line 1241
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mDecideMessages:Lcom/mixpanel/android/mpmetrics/DecideMessages;
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$500(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/DecideMessages;

    move-result-object v0

    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$900(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getTestMode()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mixpanel/android/mpmetrics/DecideMessages;->getNotification(Z)Lcom/mixpanel/android/mpmetrics/InAppNotification;

    move-result-object v0

    return-object v0
.end method

.method public getSurveyIfAvailable()Lcom/mixpanel/android/mpmetrics/Survey;
    .locals 2

    .prologue
    .line 1263
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mDecideMessages:Lcom/mixpanel/android/mpmetrics/DecideMessages;
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$500(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/DecideMessages;

    move-result-object v0

    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$900(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getTestMode()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mixpanel/android/mpmetrics/DecideMessages;->getSurvey(Z)Lcom/mixpanel/android/mpmetrics/Survey;

    move-result-object v0

    return-object v0
.end method

.method public identify(Ljava/lang/String;)V
    .locals 1
    .param p1, "distinctId"    # Ljava/lang/String;

    .prologue
    .line 1115
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$400(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->setPeopleDistinctId(Ljava/lang/String;)V

    .line 1116
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mDecideMessages:Lcom/mixpanel/android/mpmetrics/DecideMessages;
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$500(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/DecideMessages;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mixpanel/android/mpmetrics/DecideMessages;->setDistinctId(Ljava/lang/String;)V

    .line 1117
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # invokes: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->pushWaitingPeopleRecord()V
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$600(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V

    .line 1118
    return-void
.end method

.method public increment(Ljava/lang/String;D)V
    .locals 2
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # D

    .prologue
    .line 1177
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1178
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Double;>;"
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1179
    invoke-virtual {p0, v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->increment(Ljava/util/Map;)V

    .line 1180
    return-void
.end method

.method public increment(Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Number;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1166
    .local p1, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;+Ljava/lang/Number;>;"
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 1168
    .local v1, "json":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "$add"

    invoke-direct {p0, v3, v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->stdPeopleMessage(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    .line 1169
    .local v2, "message":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # invokes: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->recordPeopleMessage(Lorg/json/JSONObject;)V
    invoke-static {v3, v2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$800(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1173
    .end local v2    # "message":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 1170
    :catch_0
    move-exception v0

    .line 1171
    .local v0, "e":Lorg/json/JSONException;
    const-string v3, "MixpanelAPI.MixpanelAPI"

    const-string v4, "Exception incrementing properties"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public initPushHandling(Ljava/lang/String;)V
    .locals 4
    .param p1, "senderID"    # Ljava/lang/String;

    .prologue
    .line 1383
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$1000(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/ConfigurationChecker;->checkPushConfiguration(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1384
    const-string v1, "MixpanelAPI.MixpanelAPI"

    const-string v2, "Can\'t register for push notification services. Push notifications will not work."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1385
    const-string v1, "MixpanelAPI.MixpanelAPI"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "See log tagged "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/mixpanel/android/mpmetrics/ConfigurationChecker;->LOGTAG:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " above for details."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1407
    :goto_0
    return-void

    .line 1388
    :cond_0
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;
    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$400(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->getPushId()Ljava/lang/String;

    move-result-object v0

    .line 1389
    .local v0, "pushId":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 1390
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_1

    .line 1391
    invoke-direct {p0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->registerForPushIdAPI21AndUp(Ljava/lang/String;)V

    goto :goto_0

    .line 1393
    :cond_1
    invoke-direct {p0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->registerForPushIdAPI19AndOlder(Ljava/lang/String;)V

    goto :goto_0

    .line 1396
    :cond_2
    new-instance v1, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$1;

    invoke-direct {v1, p0, v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$1;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->allInstances(Lcom/mixpanel/android/mpmetrics/MixpanelAPI$InstanceProcessor;)V

    goto :goto_0
.end method

.method public removeOnMixpanelUpdatesReceivedListener(Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;

    .prologue
    .line 1439
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mUpdatesListener:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$1100(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;->removeOnMixpanelUpdatesReceivedListener(Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;)V

    .line 1440
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 1139
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->set(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1143
    :goto_0
    return-void

    .line 1140
    :catch_0
    move-exception v0

    .line 1141
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "MixpanelAPI.MixpanelAPI"

    const-string v2, "set"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public set(Lorg/json/JSONObject;)V
    .locals 7
    .param p1, "properties"    # Lorg/json/JSONObject;

    .prologue
    .line 1123
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mDeviceInfo:Ljava/util/Map;
    invoke-static {v5}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$700(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Ljava/util/Map;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 1124
    .local v4, "sendProperties":Lorg/json/JSONObject;
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1125
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1126
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1131
    .end local v1    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v2    # "key":Ljava/lang/String;
    .end local v4    # "sendProperties":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 1132
    .local v0, "e":Lorg/json/JSONException;
    const-string v5, "MixpanelAPI.MixpanelAPI"

    const-string v6, "Exception setting people properties"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1134
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_1
    return-void

    .line 1129
    .restart local v1    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .restart local v4    # "sendProperties":Lorg/json/JSONObject;
    :cond_0
    :try_start_1
    const-string v5, "$set"

    invoke-direct {p0, v5, v4}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->stdPeopleMessage(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    .line 1130
    .local v3, "message":Lorg/json/JSONObject;
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # invokes: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->recordPeopleMessage(Lorg/json/JSONObject;)V
    invoke-static {v5, v3}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$800(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public setOnce(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 1158
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->setOnce(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1162
    :goto_0
    return-void

    .line 1159
    :catch_0
    move-exception v0

    .line 1160
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "MixpanelAPI.MixpanelAPI"

    const-string v2, "set"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public setOnce(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "properties"    # Lorg/json/JSONObject;

    .prologue
    .line 1148
    :try_start_0
    const-string v2, "$set_once"

    invoke-direct {p0, v2, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->stdPeopleMessage(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 1149
    .local v1, "message":Lorg/json/JSONObject;
    iget-object v2, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # invokes: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->recordPeopleMessage(Lorg/json/JSONObject;)V
    invoke-static {v2, v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$800(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1153
    .end local v1    # "message":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 1150
    :catch_0
    move-exception v0

    .line 1151
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "MixpanelAPI.MixpanelAPI"

    const-string v3, "Exception setting people properties"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setPushRegistrationId(Ljava/lang/String;)V
    .locals 6
    .param p1, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 1361
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;
    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$400(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    move-result-object v2

    monitor-enter v2

    .line 1362
    :try_start_0
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;
    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$400(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->getPeopleDistinctId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 1363
    monitor-exit v2

    .line 1373
    :goto_0
    return-void

    .line 1366
    :cond_0
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;
    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$400(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->storePushId(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1368
    :try_start_1
    const-string v1, "$android_devices"

    new-instance v3, Lorg/json/JSONArray;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1, v3}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->union(Ljava/lang/String;Lorg/json/JSONArray;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1372
    :goto_1
    :try_start_2
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 1369
    :catch_0
    move-exception v0

    .line 1370
    .local v0, "e":Lorg/json/JSONException;
    :try_start_3
    const-string v1, "MixpanelAPI.MixpanelAPI"

    const-string v3, "set push registration id error"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method

.method public showGivenNotification(Lcom/mixpanel/android/mpmetrics/InAppNotification;Landroid/app/Activity;)V
    .locals 0
    .param p1, "notif"    # Lcom/mixpanel/android/mpmetrics/InAppNotification;
    .param p2, "parent"    # Landroid/app/Activity;

    .prologue
    .line 1306
    if-eqz p1, :cond_0

    .line 1307
    invoke-direct {p0, p1, p2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->showGivenOrAvailableNotification(Lcom/mixpanel/android/mpmetrics/InAppNotification;Landroid/app/Activity;)V

    .line 1309
    :cond_0
    return-void
.end method

.method public showNotificationById(ILandroid/app/Activity;)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "parent"    # Landroid/app/Activity;

    .prologue
    .line 1300
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mDecideMessages:Lcom/mixpanel/android/mpmetrics/DecideMessages;
    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$500(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/DecideMessages;

    move-result-object v1

    iget-object v2, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$900(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getTestMode()Z

    move-result v2

    invoke-virtual {v1, p1, v2}, Lcom/mixpanel/android/mpmetrics/DecideMessages;->getNotification(IZ)Lcom/mixpanel/android/mpmetrics/InAppNotification;

    move-result-object v0

    .line 1301
    .local v0, "notif":Lcom/mixpanel/android/mpmetrics/InAppNotification;
    invoke-virtual {p0, v0, p2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->showGivenNotification(Lcom/mixpanel/android/mpmetrics/InAppNotification;Landroid/app/Activity;)V

    .line 1302
    return-void
.end method

.method public showNotificationIfAvailable(Landroid/app/Activity;)V
    .locals 2
    .param p1, "parent"    # Landroid/app/Activity;

    .prologue
    .line 1291
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    .line 1296
    :goto_0
    return-void

    .line 1295
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->showGivenOrAvailableNotification(Lcom/mixpanel/android/mpmetrics/InAppNotification;Landroid/app/Activity;)V

    goto :goto_0
.end method

.method public showSurvey(Lcom/mixpanel/android/mpmetrics/Survey;Landroid/app/Activity;)V
    .locals 0
    .param p1, "survey"    # Lcom/mixpanel/android/mpmetrics/Survey;
    .param p2, "parent"    # Landroid/app/Activity;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1269
    invoke-direct {p0, p1, p2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->showGivenOrAvailableSurvey(Lcom/mixpanel/android/mpmetrics/Survey;Landroid/app/Activity;)V

    .line 1270
    return-void
.end method

.method public showSurveyById(ILandroid/app/Activity;)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "parent"    # Landroid/app/Activity;

    .prologue
    .line 1283
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mDecideMessages:Lcom/mixpanel/android/mpmetrics/DecideMessages;
    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$500(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/DecideMessages;

    move-result-object v1

    iget-object v2, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$900(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getTestMode()Z

    move-result v2

    invoke-virtual {v1, p1, v2}, Lcom/mixpanel/android/mpmetrics/DecideMessages;->getSurvey(IZ)Lcom/mixpanel/android/mpmetrics/Survey;

    move-result-object v0

    .line 1284
    .local v0, "s":Lcom/mixpanel/android/mpmetrics/Survey;
    if-eqz v0, :cond_0

    .line 1285
    invoke-direct {p0, v0, p2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->showGivenOrAvailableSurvey(Lcom/mixpanel/android/mpmetrics/Survey;Landroid/app/Activity;)V

    .line 1287
    :cond_0
    return-void
.end method

.method public showSurveyIfAvailable(Landroid/app/Activity;)V
    .locals 2
    .param p1, "parent"    # Landroid/app/Activity;

    .prologue
    .line 1274
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    .line 1279
    :goto_0
    return-void

    .line 1278
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->showGivenOrAvailableSurvey(Lcom/mixpanel/android/mpmetrics/Survey;Landroid/app/Activity;)V

    goto :goto_0
.end method

.method public trackCharge(DLorg/json/JSONObject;)V
    .locals 9
    .param p1, "amount"    # D
    .param p3, "properties"    # Lorg/json/JSONObject;

    .prologue
    .line 1318
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    .line 1319
    .local v4, "now":Ljava/util/Date;
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyy-MM-dd\'T\'HH:mm:ss"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 1320
    .local v0, "dateFormat":Ljava/text/DateFormat;
    const-string v6, "UTC"

    invoke-static {v6}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 1323
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 1324
    .local v5, "transactionValue":Lorg/json/JSONObject;
    const-string v6, "$amount"

    invoke-virtual {v5, v6, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 1325
    const-string v6, "$time"

    invoke-virtual {v0, v4}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1327
    if-eqz p3, :cond_0

    .line 1328
    invoke-virtual {p3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1329
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1330
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {p3, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1335
    .end local v2    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "transactionValue":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 1336
    .local v1, "e":Lorg/json/JSONException;
    const-string v6, "MixpanelAPI.MixpanelAPI"

    const-string v7, "Exception creating new charge"

    invoke-static {v6, v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1338
    .end local v1    # "e":Lorg/json/JSONException;
    :goto_1
    return-void

    .line 1334
    .restart local v5    # "transactionValue":Lorg/json/JSONObject;
    :cond_0
    :try_start_1
    const-string v6, "$transactions"

    invoke-virtual {p0, v6, v5}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->append(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public trackNotification(Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/InAppNotification;)V
    .locals 2
    .param p1, "eventName"    # Ljava/lang/String;
    .param p2, "notif"    # Lcom/mixpanel/android/mpmetrics/InAppNotification;

    .prologue
    .line 1313
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    invoke-virtual {p2}, Lcom/mixpanel/android/mpmetrics/InAppNotification;->getCampaignProperties()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->track(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 1314
    return-void
.end method

.method public trackNotificationSeen(Lcom/mixpanel/android/mpmetrics/InAppNotification;)V
    .locals 6
    .param p1, "notif"    # Lcom/mixpanel/android/mpmetrics/InAppNotification;

    .prologue
    .line 1246
    if-nez p1, :cond_0

    .line 1259
    :goto_0
    return-void

    .line 1248
    :cond_0
    const-string v4, "$campaign_delivery"

    invoke-virtual {p0, v4, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->trackNotification(Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/InAppNotification;)V

    .line 1249
    iget-object v4, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    invoke-virtual {v4}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->getPeople()Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->getDistinctId()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;->withIdentity(Ljava/lang/String;)Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;

    move-result-object v3

    .line 1250
    .local v3, "people":Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyy-MM-dd\'T\'HH:mm:ss"

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 1251
    .local v0, "dateFormat":Ljava/text/DateFormat;
    invoke-virtual {p1}, Lcom/mixpanel/android/mpmetrics/InAppNotification;->getCampaignProperties()Lorg/json/JSONObject;

    move-result-object v2

    .line 1253
    .local v2, "notifProperties":Lorg/json/JSONObject;
    :try_start_0
    const-string v4, "$time"

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1257
    :goto_1
    const-string v4, "$campaigns"

    invoke-virtual {p1}, Lcom/mixpanel/android/mpmetrics/InAppNotification;->getId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;->append(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1258
    const-string v4, "$notifications"

    invoke-interface {v3, v4, v2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;->append(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 1254
    :catch_0
    move-exception v1

    .line 1255
    .local v1, "e":Lorg/json/JSONException;
    const-string v4, "MixpanelAPI.MixpanelAPI"

    const-string v5, "Exception trying to track an in app notification seen"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method public union(Ljava/lang/String;Lorg/json/JSONArray;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Lorg/json/JSONArray;

    .prologue
    .line 1197
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 1198
    .local v2, "properties":Lorg/json/JSONObject;
    invoke-virtual {v2, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1199
    const-string v3, "$union"

    invoke-direct {p0, v3, v2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->stdPeopleMessage(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 1200
    .local v1, "message":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # invokes: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->recordPeopleMessage(Lorg/json/JSONObject;)V
    invoke-static {v3, v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$800(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1204
    .end local v1    # "message":Lorg/json/JSONObject;
    .end local v2    # "properties":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 1201
    :catch_0
    move-exception v0

    .line 1202
    .local v0, "e":Lorg/json/JSONException;
    const-string v3, "MixpanelAPI.MixpanelAPI"

    const-string v4, "Exception unioning a property"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public unset(Ljava/lang/String;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1209
    :try_start_0
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 1210
    .local v2, "names":Lorg/json/JSONArray;
    invoke-virtual {v2, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1211
    const-string v3, "$unset"

    invoke-direct {p0, v3, v2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->stdPeopleMessage(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 1212
    .local v1, "message":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # invokes: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->recordPeopleMessage(Lorg/json/JSONObject;)V
    invoke-static {v3, v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$800(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1216
    .end local v1    # "message":Lorg/json/JSONObject;
    .end local v2    # "names":Lorg/json/JSONArray;
    :goto_0
    return-void

    .line 1213
    :catch_0
    move-exception v0

    .line 1214
    .local v0, "e":Lorg/json/JSONException;
    const-string v3, "MixpanelAPI.MixpanelAPI"

    const-string v4, "Exception unsetting a property"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public withIdentity(Ljava/lang/String;)Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;
    .locals 1
    .param p1, "distinctId"    # Ljava/lang/String;

    .prologue
    .line 1416
    if-nez p1, :cond_0

    .line 1417
    const/4 v0, 0x0

    .line 1419
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$2;

    invoke-direct {v0, p0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$2;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;Ljava/lang/String;)V

    goto :goto_0
.end method
