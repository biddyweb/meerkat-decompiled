.class Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;
.super Ljava/lang/Object;
.source "MixpanelAPI.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->showGivenOrAvailableNotification(Lcom/mixpanel/android/mpmetrics/InAppNotification;Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;

.field final synthetic val$notifOrNull:Lcom/mixpanel/android/mpmetrics/InAppNotification;

.field final synthetic val$parent:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;Lcom/mixpanel/android/mpmetrics/InAppNotification;Landroid/app/Activity;)V
    .locals 0
    .param p1, "this$1"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;

    .prologue
    .line 1544
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->this$1:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;

    iput-object p2, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->val$notifOrNull:Lcom/mixpanel/android/mpmetrics/InAppNotification;

    iput-object p3, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->val$parent:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 1548
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/UpdateDisplayState;->getLockObject()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v6

    .line 1549
    .local v6, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1551
    :try_start_0
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/UpdateDisplayState;->hasCurrentProposal()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 1552
    sget-boolean v10, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v10, :cond_0

    .line 1553
    const-string v10, "MixpanelAPI.MixpanelAPI"

    const-string v11, "DisplayState is locked, will not show notifications."

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1631
    :cond_0
    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1633
    :goto_0
    return-void

    .line 1558
    :cond_1
    :try_start_1
    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->val$notifOrNull:Lcom/mixpanel/android/mpmetrics/InAppNotification;

    .line 1559
    .local v8, "toShow":Lcom/mixpanel/android/mpmetrics/InAppNotification;
    if-nez v8, :cond_2

    .line 1560
    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->this$1:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;

    invoke-virtual {v10}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->getNotificationIfAvailable()Lcom/mixpanel/android/mpmetrics/InAppNotification;

    move-result-object v8

    .line 1562
    :cond_2
    if-nez v8, :cond_4

    .line 1563
    sget-boolean v10, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v10, :cond_3

    .line 1564
    const-string v10, "MixpanelAPI.MixpanelAPI"

    const-string v11, "No notification available, will not show."

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1631
    :cond_3
    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    .line 1569
    :cond_4
    :try_start_2
    invoke-virtual {v8}, Lcom/mixpanel/android/mpmetrics/InAppNotification;->getType()Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;

    move-result-object v2

    .line 1570
    .local v2, "inAppType":Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;
    sget-object v10, Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;->TAKEOVER:Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;

    if-ne v2, v10, :cond_6

    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->val$parent:Landroid/app/Activity;

    invoke-virtual {v10}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    invoke-static {v10}, Lcom/mixpanel/android/mpmetrics/ConfigurationChecker;->checkSurveyActivityAvailable(Landroid/content/Context;)Z

    move-result v10

    if-nez v10, :cond_6

    .line 1571
    sget-boolean v10, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v10, :cond_5

    .line 1572
    const-string v10, "MixpanelAPI.MixpanelAPI"

    const-string v11, "Application is not configured to show takeover notifications, none will be shown."

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1631
    :cond_5
    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    .line 1577
    :cond_6
    :try_start_3
    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->val$parent:Landroid/app/Activity;

    invoke-static {v10}, Lcom/mixpanel/android/util/ActivityImageUtils;->getHighlightColorFromBackground(Landroid/app/Activity;)I

    move-result v1

    .line 1578
    .local v1, "highlightColor":I
    new-instance v7, Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState$InAppNotificationState;

    invoke-direct {v7, v8, v1}, Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState$InAppNotificationState;-><init>(Lcom/mixpanel/android/mpmetrics/InAppNotification;I)V

    .line 1580
    .local v7, "proposal":Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState$InAppNotificationState;
    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->this$1:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;

    invoke-virtual {v10}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->getDistinctId()Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->this$1:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;

    iget-object v11, v11, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mToken:Ljava/lang/String;
    invoke-static {v11}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$1200(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v7, v10, v11}, Lcom/mixpanel/android/mpmetrics/UpdateDisplayState;->proposeDisplay(Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 1581
    .local v5, "intentId":I
    if-gtz v5, :cond_7

    .line 1582
    const-string v10, "MixpanelAPI.MixpanelAPI"

    const-string v11, "DisplayState Lock in inconsistent state! Please report this issue to Mixpanel"

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1631
    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    .line 1586
    :cond_7
    :try_start_4
    sget-object v10, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$3;->$SwitchMap$com$mixpanel$android$mpmetrics$InAppNotification$Type:[I

    invoke-virtual {v2}, Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_0

    .line 1625
    const-string v10, "MixpanelAPI.MixpanelAPI"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Unrecognized notification type "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " can\'t be shown"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1627
    :goto_1
    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->this$1:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;

    iget-object v10, v10, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    # getter for: Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v10}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->access$900(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v10

    invoke-virtual {v10}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getTestMode()Z

    move-result v10

    if-nez v10, :cond_8

    .line 1628
    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->this$1:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;

    invoke-virtual {v10, v8}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->trackNotificationSeen(Lcom/mixpanel/android/mpmetrics/InAppNotification;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1631
    :cond_8
    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto/16 :goto_0

    .line 1588
    :pswitch_0
    :try_start_5
    invoke-static {v5}, Lcom/mixpanel/android/mpmetrics/UpdateDisplayState;->claimDisplayState(I)Lcom/mixpanel/android/mpmetrics/UpdateDisplayState;

    move-result-object v0

    .line 1589
    .local v0, "claimed":Lcom/mixpanel/android/mpmetrics/UpdateDisplayState;
    if-nez v0, :cond_a

    .line 1590
    sget-boolean v10, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v10, :cond_9

    .line 1591
    const-string v10, "MixpanelAPI.MixpanelAPI"

    const-string v11, "Notification\'s display proposal was already consumed, no notification will be shown."

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1631
    :cond_9
    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto/16 :goto_0

    .line 1595
    :cond_a
    :try_start_6
    new-instance v3, Lcom/mixpanel/android/mpmetrics/InAppFragment;

    invoke-direct {v3}, Lcom/mixpanel/android/mpmetrics/InAppFragment;-><init>()V

    .line 1596
    .local v3, "inapp":Lcom/mixpanel/android/mpmetrics/InAppFragment;
    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->this$1:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;

    iget-object v11, v10, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .line 1599
    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/UpdateDisplayState;->getDisplayState()Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState;

    move-result-object v10

    check-cast v10, Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState$InAppNotificationState;

    .line 1596
    invoke-virtual {v3, v11, v5, v10}, Lcom/mixpanel/android/mpmetrics/InAppFragment;->setDisplayState(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;ILcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState$InAppNotificationState;)V

    .line 1601
    const/4 v10, 0x1

    invoke-virtual {v3, v10}, Lcom/mixpanel/android/mpmetrics/InAppFragment;->setRetainInstance(Z)V

    .line 1603
    sget-boolean v10, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v10, :cond_b

    .line 1604
    const-string v10, "MixpanelAPI.MixpanelAPI"

    const-string v11, "Attempting to show mini notification."

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1606
    :cond_b
    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->val$parent:Landroid/app/Activity;

    invoke-virtual {v10}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v10

    invoke-virtual {v10}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v9

    .line 1607
    .local v9, "transaction":Landroid/app/FragmentTransaction;
    const/4 v10, 0x0

    sget v11, Lcom/mixpanel/android/R$anim;->com_mixpanel_android_slide_down:I

    invoke-virtual {v9, v10, v11}, Landroid/app/FragmentTransaction;->setCustomAnimations(II)Landroid/app/FragmentTransaction;

    .line 1608
    const v10, 0x1020002

    invoke-virtual {v9, v10, v3}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 1609
    invoke-virtual {v9}, Landroid/app/FragmentTransaction;->commit()I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_1

    .line 1631
    .end local v0    # "claimed":Lcom/mixpanel/android/mpmetrics/UpdateDisplayState;
    .end local v1    # "highlightColor":I
    .end local v2    # "inAppType":Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;
    .end local v3    # "inapp":Lcom/mixpanel/android/mpmetrics/InAppFragment;
    .end local v5    # "intentId":I
    .end local v7    # "proposal":Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState$InAppNotificationState;
    .end local v8    # "toShow":Lcom/mixpanel/android/mpmetrics/InAppNotification;
    .end local v9    # "transaction":Landroid/app/FragmentTransaction;
    :catchall_0
    move-exception v10

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v10

    .line 1613
    .restart local v1    # "highlightColor":I
    .restart local v2    # "inAppType":Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;
    .restart local v5    # "intentId":I
    .restart local v7    # "proposal":Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState$InAppNotificationState;
    .restart local v8    # "toShow":Lcom/mixpanel/android/mpmetrics/InAppNotification;
    :pswitch_1
    :try_start_7
    sget-boolean v10, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v10, :cond_c

    .line 1614
    const-string v10, "MixpanelAPI.MixpanelAPI"

    const-string v11, "Sending intent for takeover notification."

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1617
    :cond_c
    new-instance v4, Landroid/content/Intent;

    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->val$parent:Landroid/app/Activity;

    invoke-virtual {v10}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    const-class v11, Lcom/mixpanel/android/surveys/SurveyActivity;

    invoke-direct {v4, v10, v11}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1618
    .local v4, "intent":Landroid/content/Intent;
    const/high16 v10, 0x10000000

    invoke-virtual {v4, v10}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1619
    const/high16 v10, 0x20000

    invoke-virtual {v4, v10}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1620
    const-string v10, "com.mixpanel.android.surveys.SurveyActivity.INTENT_ID_KEY"

    invoke-virtual {v4, v10, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1621
    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$4;->val$parent:Landroid/app/Activity;

    invoke-virtual {v10, v4}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_1

    .line 1586
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
