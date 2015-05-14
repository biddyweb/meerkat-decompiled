.class Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;
.super Landroid/os/Handler;
.source "AnalyticsMessages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AnalyticsMessageHandler"
.end annotation


# instance fields
.field private mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

.field private final mDecideChecker:Lcom/mixpanel/android/mpmetrics/DecideChecker;

.field private final mDisableFallback:Z

.field private final mFlushInterval:J

.field final synthetic this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;


# direct methods
.method public constructor <init>(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;Landroid/os/Looper;)V
    .locals 3
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 210
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    .line 211
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 212
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    .line 213
    new-instance v0, Lcom/mixpanel/android/mpmetrics/DecideChecker;

    iget-object v1, p1, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$100(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p1, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v2}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$200(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mixpanel/android/mpmetrics/DecideChecker;-><init>(Landroid/content/Context;Lcom/mixpanel/android/mpmetrics/MPConfig;)V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDecideChecker:Lcom/mixpanel/android/mpmetrics/DecideChecker;

    .line 214
    iget-object v0, p1, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$200(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDisableFallback()Z

    move-result v0

    iput-boolean v0, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDisableFallback:Z

    .line 215
    iget-object v0, p1, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$200(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getFlushInterval()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mFlushInterval:J

    .line 216
    new-instance v0, Lcom/mixpanel/android/mpmetrics/SystemInformation;

    iget-object v1, p1, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$100(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mixpanel/android/mpmetrics/SystemInformation;-><init>(Landroid/content/Context;)V

    # setter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->mSystemInformation:Lcom/mixpanel/android/mpmetrics/SystemInformation;
    invoke-static {p1, v0}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$302(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;Lcom/mixpanel/android/mpmetrics/SystemInformation;)Lcom/mixpanel/android/mpmetrics/SystemInformation;

    .line 217
    return-void
.end method

.method private getDefaultEventProperties()Lorg/json/JSONObject;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 433
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 435
    .local v9, "ret":Lorg/json/JSONObject;
    const-string v11, "mp_lib"

    const-string v12, "android"

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 436
    const-string v11, "$lib_version"

    const-string v12, "4.5.3"

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 439
    const-string v11, "$os"

    const-string v12, "Android"

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 440
    const-string v12, "$os_version"

    sget-object v11, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    if-nez v11, :cond_7

    const-string v11, "UNKNOWN"

    :goto_0
    invoke-virtual {v9, v12, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 442
    const-string v12, "$manufacturer"

    sget-object v11, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    if-nez v11, :cond_8

    const-string v11, "UNKNOWN"

    :goto_1
    invoke-virtual {v9, v12, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 443
    const-string v12, "$brand"

    sget-object v11, Landroid/os/Build;->BRAND:Ljava/lang/String;

    if-nez v11, :cond_9

    const-string v11, "UNKNOWN"

    :goto_2
    invoke-virtual {v9, v12, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 444
    const-string v12, "$model"

    sget-object v11, Landroid/os/Build;->MODEL:Ljava/lang/String;

    if-nez v11, :cond_a

    const-string v11, "UNKNOWN"

    :goto_3
    invoke-virtual {v9, v12, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 448
    :try_start_0
    iget-object v11, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v11, v11, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mContext:Landroid/content/Context;
    invoke-static {v11}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$100(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Landroid/content/Context;

    move-result-object v11

    invoke-static {v11}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_1

    move-result v10

    .line 449
    .local v10, "servicesAvailable":I
    packed-switch v10, :pswitch_data_0

    .line 476
    .end local v10    # "servicesAvailable":I
    :goto_4
    :pswitch_0
    iget-object v11, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->mSystemInformation:Lcom/mixpanel/android/mpmetrics/SystemInformation;
    invoke-static {v11}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$300(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;)Lcom/mixpanel/android/mpmetrics/SystemInformation;

    move-result-object v11

    invoke-virtual {v11}, Lcom/mixpanel/android/mpmetrics/SystemInformation;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 477
    .local v3, "displayMetrics":Landroid/util/DisplayMetrics;
    const-string v11, "$screen_dpi"

    iget v12, v3, Landroid/util/DisplayMetrics;->densityDpi:I

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 478
    const-string v11, "$screen_height"

    iget v12, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 479
    const-string v11, "$screen_width"

    iget v12, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 481
    iget-object v11, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->mSystemInformation:Lcom/mixpanel/android/mpmetrics/SystemInformation;
    invoke-static {v11}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$300(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;)Lcom/mixpanel/android/mpmetrics/SystemInformation;

    move-result-object v11

    invoke-virtual {v11}, Lcom/mixpanel/android/mpmetrics/SystemInformation;->getAppVersionName()Ljava/lang/String;

    move-result-object v0

    .line 482
    .local v0, "applicationVersionName":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 483
    const-string v11, "$app_version"

    invoke-virtual {v9, v11, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 485
    :cond_0
    iget-object v11, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->mSystemInformation:Lcom/mixpanel/android/mpmetrics/SystemInformation;
    invoke-static {v11}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$300(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;)Lcom/mixpanel/android/mpmetrics/SystemInformation;

    move-result-object v11

    invoke-virtual {v11}, Lcom/mixpanel/android/mpmetrics/SystemInformation;->hasNFC()Z

    move-result v11

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 486
    .local v5, "hasNFC":Ljava/lang/Boolean;
    if-eqz v5, :cond_1

    .line 487
    const-string v11, "$has_nfc"

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 489
    :cond_1
    iget-object v11, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->mSystemInformation:Lcom/mixpanel/android/mpmetrics/SystemInformation;
    invoke-static {v11}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$300(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;)Lcom/mixpanel/android/mpmetrics/SystemInformation;

    move-result-object v11

    invoke-virtual {v11}, Lcom/mixpanel/android/mpmetrics/SystemInformation;->hasTelephony()Z

    move-result v11

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    .line 490
    .local v6, "hasTelephony":Ljava/lang/Boolean;
    if-eqz v6, :cond_2

    .line 491
    const-string v11, "$has_telephone"

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 493
    :cond_2
    iget-object v11, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->mSystemInformation:Lcom/mixpanel/android/mpmetrics/SystemInformation;
    invoke-static {v11}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$300(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;)Lcom/mixpanel/android/mpmetrics/SystemInformation;

    move-result-object v11

    invoke-virtual {v11}, Lcom/mixpanel/android/mpmetrics/SystemInformation;->getCurrentNetworkOperator()Ljava/lang/String;

    move-result-object v2

    .line 494
    .local v2, "carrier":Ljava/lang/String;
    if-eqz v2, :cond_3

    .line 495
    const-string v11, "$carrier"

    invoke-virtual {v9, v11, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 497
    :cond_3
    iget-object v11, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->mSystemInformation:Lcom/mixpanel/android/mpmetrics/SystemInformation;
    invoke-static {v11}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$300(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;)Lcom/mixpanel/android/mpmetrics/SystemInformation;

    move-result-object v11

    invoke-virtual {v11}, Lcom/mixpanel/android/mpmetrics/SystemInformation;->isWifiConnected()Ljava/lang/Boolean;

    move-result-object v8

    .line 498
    .local v8, "isWifi":Ljava/lang/Boolean;
    if-eqz v8, :cond_4

    .line 499
    const-string v11, "$wifi"

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 501
    :cond_4
    iget-object v11, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->mSystemInformation:Lcom/mixpanel/android/mpmetrics/SystemInformation;
    invoke-static {v11}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$300(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;)Lcom/mixpanel/android/mpmetrics/SystemInformation;

    move-result-object v11

    invoke-virtual {v11}, Lcom/mixpanel/android/mpmetrics/SystemInformation;->isBluetoothEnabled()Ljava/lang/Boolean;

    move-result-object v7

    .line 502
    .local v7, "isBluetoothEnabled":Ljava/lang/Boolean;
    if-eqz v7, :cond_5

    .line 503
    const-string v11, "$bluetooth_enabled"

    invoke-virtual {v9, v11, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 505
    :cond_5
    iget-object v11, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->mSystemInformation:Lcom/mixpanel/android/mpmetrics/SystemInformation;
    invoke-static {v11}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$300(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;)Lcom/mixpanel/android/mpmetrics/SystemInformation;

    move-result-object v11

    invoke-virtual {v11}, Lcom/mixpanel/android/mpmetrics/SystemInformation;->getBluetoothVersion()Ljava/lang/String;

    move-result-object v1

    .line 506
    .local v1, "bluetoothVersion":Ljava/lang/String;
    if-eqz v1, :cond_6

    .line 507
    const-string v11, "$bluetooth_version"

    invoke-virtual {v9, v11, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 509
    :cond_6
    return-object v9

    .line 440
    .end local v0    # "applicationVersionName":Ljava/lang/String;
    .end local v1    # "bluetoothVersion":Ljava/lang/String;
    .end local v2    # "carrier":Ljava/lang/String;
    .end local v3    # "displayMetrics":Landroid/util/DisplayMetrics;
    .end local v5    # "hasNFC":Ljava/lang/Boolean;
    .end local v6    # "hasTelephony":Ljava/lang/Boolean;
    .end local v7    # "isBluetoothEnabled":Ljava/lang/Boolean;
    .end local v8    # "isWifi":Ljava/lang/Boolean;
    :cond_7
    sget-object v11, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    goto/16 :goto_0

    .line 442
    :cond_8
    sget-object v11, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    goto/16 :goto_1

    .line 443
    :cond_9
    sget-object v11, Landroid/os/Build;->BRAND:Ljava/lang/String;

    goto/16 :goto_2

    .line 444
    :cond_a
    sget-object v11, Landroid/os/Build;->MODEL:Ljava/lang/String;

    goto/16 :goto_3

    .line 451
    .restart local v10    # "servicesAvailable":I
    :pswitch_1
    :try_start_1
    const-string v11, "$google_play_services"

    const-string v12, "available"

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_4

    .line 466
    .end local v10    # "servicesAvailable":I
    :catch_0
    move-exception v4

    .line 469
    .local v4, "e":Ljava/lang/RuntimeException;
    :try_start_2
    const-string v11, "$google_play_services"

    const-string v12, "not configured"

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_4

    .line 472
    .end local v4    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v4

    .line 473
    .local v4, "e":Ljava/lang/NoClassDefFoundError;
    const-string v11, "$google_play_services"

    const-string v12, "not included"

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_4

    .line 454
    .end local v4    # "e":Ljava/lang/NoClassDefFoundError;
    .restart local v10    # "servicesAvailable":I
    :pswitch_2
    :try_start_3
    const-string v11, "$google_play_services"

    const-string v12, "missing"

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_4

    .line 457
    :pswitch_3
    const-string v11, "$google_play_services"

    const-string v12, "out of date"

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_4

    .line 460
    :pswitch_4
    const-string v11, "$google_play_services"

    const-string v12, "disabled"

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_4

    .line 463
    :pswitch_5
    const-string v11, "$google_play_services"

    const-string v12, "invalid"

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_4

    .line 449
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method

.method private prepareEventObject(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$EventDescription;)Lorg/json/JSONObject;
    .locals 7
    .param p1, "eventDescription"    # Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$EventDescription;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 513
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 514
    .local v0, "eventObj":Lorg/json/JSONObject;
    invoke-virtual {p1}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$EventDescription;->getProperties()Lorg/json/JSONObject;

    move-result-object v1

    .line 515
    .local v1, "eventProperties":Lorg/json/JSONObject;
    invoke-direct {p0}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->getDefaultEventProperties()Lorg/json/JSONObject;

    move-result-object v4

    .line 516
    .local v4, "sendProperties":Lorg/json/JSONObject;
    const-string v5, "token"

    invoke-virtual {p1}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$EventDescription;->getToken()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 517
    if-eqz v1, :cond_0

    .line 518
    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 519
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 520
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 523
    .end local v2    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v3    # "key":Ljava/lang/String;
    :cond_0
    const-string v5, "event"

    invoke-virtual {p1}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$EventDescription;->getEventName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 524
    const-string v5, "properties"

    invoke-virtual {v0, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 525
    return-object v0
.end method

.method private runGCMRegistration(Ljava/lang/String;)V
    .locals 6
    .param p1, "senderID"    # Ljava/lang/String;

    .prologue
    .line 321
    :try_start_0
    iget-object v4, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v4, v4, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mContext:Landroid/content/Context;
    invoke-static {v4}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$100(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v3

    .line 322
    .local v3, "resultCode":I
    if-eqz v3, :cond_0

    .line 323
    const-string v4, "MixpanelAPI.AnalyticsMessages"

    const-string v5, "Can\'t register for push notifications, Google Play Services are not installed."

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_2

    .line 351
    .end local v3    # "resultCode":I
    :goto_0
    return-void

    .line 326
    :catch_0
    move-exception v0

    .line 327
    .local v0, "e":Ljava/lang/RuntimeException;
    :try_start_1
    const-string v4, "MixpanelAPI.AnalyticsMessages"

    const-string v5, "Can\'t register for push notifications, Google Play services are not configured."

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 334
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v0

    .line 335
    .local v0, "e":Ljava/io/IOException;
    const-string v4, "MixpanelAPI.AnalyticsMessages"

    const-string v5, "Exception when trying to register for GCM"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 332
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v3    # "resultCode":I
    :cond_0
    :try_start_2
    iget-object v4, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v4, v4, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mContext:Landroid/content/Context;
    invoke-static {v4}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$100(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gms/gcm/GoogleCloudMessaging;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/gcm/GoogleCloudMessaging;

    move-result-object v1

    .line 333
    .local v1, "gcm":Lcom/google/android/gms/gcm/GoogleCloudMessaging;
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v1, v4}, Lcom/google/android/gms/gcm/GoogleCloudMessaging;->register([Ljava/lang/String;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v2

    .line 342
    .local v2, "registrationId":Ljava/lang/String;
    new-instance v4, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler$1;

    invoke-direct {v4, p0, v2}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler$1;-><init>(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;Ljava/lang/String;)V

    invoke-static {v4}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->allInstances(Lcom/mixpanel/android/mpmetrics/MixpanelAPI$InstanceProcessor;)V

    goto :goto_0

    .line 337
    .end local v1    # "gcm":Lcom/google/android/gms/gcm/GoogleCloudMessaging;
    .end local v2    # "registrationId":Ljava/lang/String;
    .end local v3    # "resultCode":I
    :catch_2
    move-exception v0

    .line 338
    .local v0, "e":Ljava/lang/NoClassDefFoundError;
    const-string v4, "MixpanelAPI.AnalyticsMessages"

    const-string v5, "Google play services were not part of this build, push notifications cannot be registered or delivered"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private sendAllData(Lcom/mixpanel/android/mpmetrics/MPDbAdapter;)V
    .locals 7
    .param p1, "dbAdapter"    # Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 354
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v1, v1, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->getPoster()Lcom/mixpanel/android/mpmetrics/ServerMessage;

    move-result-object v0

    .line 355
    .local v0, "poster":Lcom/mixpanel/android/mpmetrics/ServerMessage;
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v1, v1, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$100(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mixpanel/android/mpmetrics/ServerMessage;->isOnline(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 356
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v1, v1, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    const-string v2, "Not flushing data to Mixpanel because the device is not connected to the internet."

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V

    .line 370
    :goto_0
    return-void

    .line 360
    :cond_0
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v1, v1, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    const-string v2, "Sending records to Mixpanel"

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V

    .line 361
    iget-boolean v1, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDisableFallback:Z

    if-eqz v1, :cond_1

    .line 362
    sget-object v1, Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;->EVENTS:Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;

    new-array v2, v5, [Ljava/lang/String;

    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v3, v3, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v3}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$200(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getEventsEndpoint()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-direct {p0, p1, v1, v2}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->sendData(Lcom/mixpanel/android/mpmetrics/MPDbAdapter;Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;[Ljava/lang/String;)V

    .line 363
    sget-object v1, Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;->PEOPLE:Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;

    new-array v2, v5, [Ljava/lang/String;

    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v3, v3, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v3}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$200(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getPeopleEndpoint()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-direct {p0, p1, v1, v2}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->sendData(Lcom/mixpanel/android/mpmetrics/MPDbAdapter;Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;[Ljava/lang/String;)V

    goto :goto_0

    .line 365
    :cond_1
    sget-object v1, Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;->EVENTS:Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;

    new-array v2, v6, [Ljava/lang/String;

    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v3, v3, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    .line 366
    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v3}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$200(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getEventsEndpoint()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v3, v3, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v3}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$200(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getEventsFallbackEndpoint()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    .line 365
    invoke-direct {p0, p1, v1, v2}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->sendData(Lcom/mixpanel/android/mpmetrics/MPDbAdapter;Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;[Ljava/lang/String;)V

    .line 367
    sget-object v1, Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;->PEOPLE:Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;

    new-array v2, v6, [Ljava/lang/String;

    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v3, v3, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    .line 368
    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v3}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$200(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getPeopleEndpoint()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v3, v3, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v3}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$200(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getPeopleFallbackEndpoint()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    .line 367
    invoke-direct {p0, p1, v1, v2}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->sendData(Lcom/mixpanel/android/mpmetrics/MPDbAdapter;Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;[Ljava/lang/String;)V

    goto :goto_0
.end method

.method private sendData(Lcom/mixpanel/android/mpmetrics/MPDbAdapter;Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;[Ljava/lang/String;)V
    .locals 18
    .param p1, "dbAdapter"    # Lcom/mixpanel/android/mpmetrics/MPDbAdapter;
    .param p2, "table"    # Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;
    .param p3, "urls"    # [Ljava/lang/String;

    .prologue
    .line 373
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v13, v13, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    invoke-virtual {v13}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->getPoster()Lcom/mixpanel/android/mpmetrics/ServerMessage;

    move-result-object v9

    .line 374
    .local v9, "poster":Lcom/mixpanel/android/mpmetrics/ServerMessage;
    invoke-virtual/range {p1 .. p2}, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;->generateDataString(Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;)[Ljava/lang/String;

    move-result-object v5

    .line 376
    .local v5, "eventsData":[Ljava/lang/String;
    if-eqz v5, :cond_2

    .line 377
    const/4 v13, 0x0

    aget-object v6, v5, v13

    .line 378
    .local v6, "lastId":Ljava/lang/String;
    const/4 v13, 0x1

    aget-object v10, v5, v13

    .line 380
    .local v10, "rawMessage":Ljava/lang/String;
    invoke-static {v10}, Lcom/mixpanel/android/util/Base64Coder;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 381
    .local v4, "encodedData":Ljava/lang/String;
    new-instance v7, Ljava/util/ArrayList;

    const/4 v13, 0x1

    invoke-direct {v7, v13}, Ljava/util/ArrayList;-><init>(I)V

    .line 382
    .local v7, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v13, Lorg/apache/http/message/BasicNameValuePair;

    const-string v14, "data"

    invoke-direct {v13, v14, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v7, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 383
    sget-boolean v13, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v13, :cond_0

    .line 384
    new-instance v13, Lorg/apache/http/message/BasicNameValuePair;

    const-string v14, "verbose"

    const-string v15, "1"

    invoke-direct {v13, v14, v15}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v7, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 387
    :cond_0
    const/4 v2, 0x1

    .line 389
    .local v2, "deleteEvents":Z
    move-object/from16 v0, p3

    array-length v14, v0

    const/4 v13, 0x0

    :goto_0
    if-ge v13, v14, :cond_1

    aget-object v12, p3, v13

    .line 391
    .local v12, "url":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v9, v12, v7}, Lcom/mixpanel/android/mpmetrics/ServerMessage;->performRequest(Ljava/lang/String;Ljava/util/List;)[B

    move-result-object v11

    .line 392
    .local v11, "response":[B
    const/4 v2, 0x1

    .line 393
    if-nez v11, :cond_3

    .line 394
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v15, v15, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Response was null, unexpected failure posting to "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "."

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 419
    .end local v11    # "response":[B
    .end local v12    # "url":Ljava/lang/String;
    :cond_1
    :goto_1
    if-eqz v2, :cond_4

    .line 420
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v13, v13, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    const-string v14, "Not retrying this batch of events, deleting them from DB."

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static {v13, v14}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V

    .line 421
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v6, v1}, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;->cleanupEvents(Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;)V

    .line 429
    .end local v2    # "deleteEvents":Z
    .end local v4    # "encodedData":Ljava/lang/String;
    .end local v6    # "lastId":Ljava/lang/String;
    .end local v7    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v10    # "rawMessage":Ljava/lang/String;
    :cond_2
    :goto_2
    return-void

    .line 398
    .restart local v2    # "deleteEvents":Z
    .restart local v4    # "encodedData":Ljava/lang/String;
    .restart local v6    # "lastId":Ljava/lang/String;
    .restart local v7    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local v10    # "rawMessage":Ljava/lang/String;
    .restart local v11    # "response":[B
    .restart local v12    # "url":Ljava/lang/String;
    :cond_3
    :try_start_1
    new-instance v8, Ljava/lang/String;

    const-string v15, "UTF-8"

    invoke-direct {v8, v11, v15}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 403
    .local v8, "parsedResponse":Ljava/lang/String;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v15, v15, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Successfully posted to "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ": \n"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V

    .line 404
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v15, v15, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Response was "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    goto :goto_1

    .line 407
    .end local v8    # "parsedResponse":Ljava/lang/String;
    .end local v11    # "response":[B
    :catch_0
    move-exception v3

    .line 408
    .local v3, "e":Ljava/lang/OutOfMemoryError;
    const-string v13, "MixpanelAPI.AnalyticsMessages"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Out of memory when posting to "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 399
    .end local v3    # "e":Ljava/lang/OutOfMemoryError;
    .restart local v11    # "response":[B
    :catch_1
    move-exception v3

    .line 400
    .local v3, "e":Ljava/io/UnsupportedEncodingException;
    :try_start_3
    new-instance v15, Ljava/lang/RuntimeException;

    const-string v16, "UTF not supported on this platform?"

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v15
    :try_end_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 410
    .end local v3    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v11    # "response":[B
    :catch_2
    move-exception v3

    .line 411
    .local v3, "e":Ljava/net/MalformedURLException;
    const-string v13, "MixpanelAPI.AnalyticsMessages"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Cannot interpret "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " as a URL."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 413
    .end local v3    # "e":Ljava/net/MalformedURLException;
    :catch_3
    move-exception v3

    .line 414
    .local v3, "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v15, v15, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Cannot post message to "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "."

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;Ljava/lang/Throwable;)V
    invoke-static {v15, v0, v3}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$1300(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 415
    const/4 v2, 0x0

    .line 389
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_0

    .line 423
    .end local v3    # "e":Ljava/io/IOException;
    .end local v12    # "url":Ljava/lang/String;
    :cond_4
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v13, v13, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    const-string v14, "Retrying this batch of events."

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static {v13, v14}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V

    .line 424
    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->FLUSH_QUEUE:I
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$600()I

    move-result v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->hasMessages(I)Z

    move-result v13

    if-nez v13, :cond_2

    .line 425
    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->FLUSH_QUEUE:I
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$600()I

    move-result v13

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mFlushInterval:J

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14, v15}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_2
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 12
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 221
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    if-nez v7, :cond_0

    .line 222
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v7, v7, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v8, v8, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mContext:Landroid/content/Context;
    invoke-static {v8}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$100(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->makeDbAdapter(Landroid/content/Context;)Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    move-result-object v7

    iput-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    .line 223
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v10, v10, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v10}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$200(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v10

    invoke-virtual {v10}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDataExpiration()I

    move-result v10

    int-to-long v10, v10

    sub-long/2addr v8, v10

    sget-object v10, Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;->EVENTS:Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;

    invoke-virtual {v7, v8, v9, v10}, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;->cleanupEvents(JLcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;)V

    .line 224
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v10, v10, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v10}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$200(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v10

    invoke-virtual {v10}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDataExpiration()I

    move-result v10

    int-to-long v10, v10

    sub-long/2addr v8, v10

    sget-object v10, Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;->PEOPLE:Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;

    invoke-virtual {v7, v8, v9, v10}, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;->cleanupEvents(JLcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;)V

    .line 228
    :cond_0
    const/4 v4, -0x1

    .line 230
    .local v4, "queueDepth":I
    :try_start_0
    iget v7, p1, Landroid/os/Message;->what:I

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->ENQUEUE_PEOPLE:I
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$400()I

    move-result v8

    if-ne v7, v8, :cond_2

    .line 231
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Lorg/json/JSONObject;

    .line 233
    .local v3, "message":Lorg/json/JSONObject;
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v7, v7, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    const-string v8, "Queuing people record for sending later"

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V

    .line 234
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v7, v7, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "    "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V

    .line 236
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    sget-object v8, Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;->PEOPLE:Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;

    invoke-virtual {v7, v3, v8}, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;->addJSON(Lorg/json/JSONObject;Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;)I

    move-result v4

    .line 278
    .end local v3    # "message":Lorg/json/JSONObject;
    :goto_0
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v7, v7, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;
    invoke-static {v7}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$200(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v7

    invoke-virtual {v7}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getBulkUploadLimit()I

    move-result v7

    if-lt v4, v7, :cond_8

    .line 279
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v7, v7, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    const-string v8, "Flushing queue due to bulk upload limit"

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V

    .line 280
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->updateFlushFrequency()V
    invoke-static {v7}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$700(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;)V

    .line 281
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    invoke-direct {p0, v7}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->sendAllData(Lcom/mixpanel/android/mpmetrics/MPDbAdapter;)V

    .line 282
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDecideChecker:Lcom/mixpanel/android/mpmetrics/DecideChecker;

    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v8, v8, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    invoke-virtual {v8}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->getPoster()Lcom/mixpanel/android/mpmetrics/ServerMessage;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/mixpanel/android/mpmetrics/DecideChecker;->runDecideChecks(Lcom/mixpanel/android/mpmetrics/ServerMessage;)V

    .line 307
    :cond_1
    :goto_1
    return-void

    .line 238
    :cond_2
    iget v7, p1, Landroid/os/Message;->what:I

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->ENQUEUE_EVENTS:I
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$500()I

    move-result v8

    if-ne v7, v8, :cond_3

    .line 239
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$EventDescription;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 241
    .local v2, "eventDescription":Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$EventDescription;
    :try_start_1
    invoke-direct {p0, v2}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->prepareEventObject(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$EventDescription;)Lorg/json/JSONObject;

    move-result-object v3

    .line 242
    .restart local v3    # "message":Lorg/json/JSONObject;
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v7, v7, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    const-string v8, "Queuing event for sending later"

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V

    .line 243
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v7, v7, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "    "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V

    .line 244
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    sget-object v8, Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;->EVENTS:Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;

    invoke-virtual {v7, v3, v8}, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;->addJSON(Lorg/json/JSONObject;Lcom/mixpanel/android/mpmetrics/MPDbAdapter$Table;)I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v4

    goto :goto_0

    .line 245
    .end local v3    # "message":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 246
    .local v1, "e":Lorg/json/JSONException;
    :try_start_2
    const-string v7, "MixpanelAPI.AnalyticsMessages"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Exception tracking event "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$EventDescription;->getEventName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 295
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "eventDescription":Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$EventDescription;
    :catch_1
    move-exception v1

    .line 296
    .local v1, "e":Ljava/lang/RuntimeException;
    const-string v7, "MixpanelAPI.AnalyticsMessages"

    const-string v8, "Worker threw an unhandled exception"

    invoke-static {v7, v8, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 297
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->mHandlerLock:Ljava/lang/Object;
    invoke-static {v7}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$1100(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;)Ljava/lang/Object;

    move-result-object v8

    monitor-enter v8

    .line 298
    :try_start_3
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    const/4 v9, 0x0

    # setter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->mHandler:Landroid/os/Handler;
    invoke-static {v7, v9}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$1202(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;Landroid/os/Handler;)Landroid/os/Handler;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 300
    :try_start_4
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v7

    invoke-virtual {v7}, Landroid/os/Looper;->quit()V

    .line 301
    const-string v7, "MixpanelAPI.AnalyticsMessages"

    const-string v9, "Mixpanel will not process any more analytics messages"

    invoke-static {v7, v9, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 305
    :goto_2
    :try_start_5
    monitor-exit v8

    goto/16 :goto_1

    :catchall_0
    move-exception v7

    monitor-exit v8
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v7

    .line 249
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :cond_3
    :try_start_6
    iget v7, p1, Landroid/os/Message;->what:I

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->FLUSH_QUEUE:I
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$600()I

    move-result v8

    if-ne v7, v8, :cond_4

    .line 250
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v7, v7, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    const-string v8, "Flushing queue due to scheduled or forced flush"

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V

    .line 251
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->updateFlushFrequency()V
    invoke-static {v7}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$700(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;)V

    .line 252
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    invoke-direct {p0, v7}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->sendAllData(Lcom/mixpanel/android/mpmetrics/MPDbAdapter;)V

    .line 253
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDecideChecker:Lcom/mixpanel/android/mpmetrics/DecideChecker;

    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v8, v8, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    invoke-virtual {v8}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->getPoster()Lcom/mixpanel/android/mpmetrics/ServerMessage;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/mixpanel/android/mpmetrics/DecideChecker;->runDecideChecks(Lcom/mixpanel/android/mpmetrics/ServerMessage;)V

    goto/16 :goto_0

    .line 255
    :cond_4
    iget v7, p1, Landroid/os/Message;->what:I

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->INSTALL_DECIDE_CHECK:I
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$800()I

    move-result v8

    if-ne v7, v8, :cond_5

    .line 256
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v7, v7, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    const-string v8, "Installing a check for surveys and in app notifications"

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V

    .line 257
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/mixpanel/android/mpmetrics/DecideMessages;

    .line 258
    .local v0, "check":Lcom/mixpanel/android/mpmetrics/DecideMessages;
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDecideChecker:Lcom/mixpanel/android/mpmetrics/DecideChecker;

    invoke-virtual {v7, v0}, Lcom/mixpanel/android/mpmetrics/DecideChecker;->addDecideCheck(Lcom/mixpanel/android/mpmetrics/DecideMessages;)V

    .line 259
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDecideChecker:Lcom/mixpanel/android/mpmetrics/DecideChecker;

    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v8, v8, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    invoke-virtual {v8}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->getPoster()Lcom/mixpanel/android/mpmetrics/ServerMessage;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/mixpanel/android/mpmetrics/DecideChecker;->runDecideChecks(Lcom/mixpanel/android/mpmetrics/ServerMessage;)V

    goto/16 :goto_0

    .line 261
    .end local v0    # "check":Lcom/mixpanel/android/mpmetrics/DecideMessages;
    :cond_5
    iget v7, p1, Landroid/os/Message;->what:I

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->REGISTER_FOR_GCM:I
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$900()I

    move-result v8

    if-ne v7, v8, :cond_6

    .line 262
    iget-object v5, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    .line 263
    .local v5, "senderId":Ljava/lang/String;
    invoke-direct {p0, v5}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->runGCMRegistration(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 265
    .end local v5    # "senderId":Ljava/lang/String;
    :cond_6
    iget v7, p1, Landroid/os/Message;->what:I

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->KILL_WORKER:I
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$1000()I

    move-result v8

    if-ne v7, v8, :cond_7

    .line 266
    const-string v7, "MixpanelAPI.AnalyticsMessages"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Worker received a hard kill. Dumping all events and force-killing. Thread id "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getId()J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->mHandlerLock:Ljava/lang/Object;
    invoke-static {v7}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$1100(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;)Ljava/lang/Object;

    move-result-object v8

    monitor-enter v8
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_1

    .line 268
    :try_start_7
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    invoke-virtual {v7}, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;->deleteDB()V

    .line 269
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    const/4 v9, 0x0

    # setter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->mHandler:Landroid/os/Handler;
    invoke-static {v7, v9}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->access$1202(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;Landroid/os/Handler;)Landroid/os/Handler;

    .line 270
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v7

    invoke-virtual {v7}, Landroid/os/Looper;->quit()V

    .line 271
    monitor-exit v8

    goto/16 :goto_0

    :catchall_1
    move-exception v7

    monitor-exit v8
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v7

    .line 273
    :cond_7
    const-string v7, "MixpanelAPI.AnalyticsMessages"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unexpected message received by Mixpanel worker: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 283
    :cond_8
    if-lez v4, :cond_1

    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->FLUSH_QUEUE:I
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$600()I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->hasMessages(I)Z

    move-result v7

    if-nez v7, :cond_1

    .line 290
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->this$1:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;

    iget-object v7, v7, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker;->this$0:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Queue depth "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " - Adding flush in "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-wide v10, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mFlushInterval:J

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    # invokes: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->logAboutMessageToMixpanel(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$000(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;Ljava/lang/String;)V

    .line 291
    iget-wide v8, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mFlushInterval:J

    const-wide/16 v10, 0x0

    cmp-long v7, v8, v10

    if-ltz v7, :cond_1

    .line 292
    # getter for: Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->FLUSH_QUEUE:I
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->access$600()I

    move-result v7

    iget-wide v8, p0, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->mFlushInterval:J

    invoke-virtual {p0, v7, v8, v9}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$Worker$AnalyticsMessageHandler;->sendEmptyMessageDelayed(IJ)Z
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_1

    goto/16 :goto_1

    .line 302
    .restart local v1    # "e":Ljava/lang/RuntimeException;
    :catch_2
    move-exception v6

    .line 303
    .local v6, "tooLate":Ljava/lang/Exception;
    :try_start_9
    const-string v7, "MixpanelAPI.AnalyticsMessages"

    const-string v9, "Could not halt looper"

    invoke-static {v7, v9, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_2
.end method
