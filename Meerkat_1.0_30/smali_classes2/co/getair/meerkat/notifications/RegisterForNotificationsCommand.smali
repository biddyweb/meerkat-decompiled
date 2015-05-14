.class public Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "RegisterForNotificationsCommand.java"


# static fields
.field private static final PLAY_SERVICES_RESOLUTION_REQUEST:I = 0x2328

.field private static final PROPERTY_APP_VERSION:Ljava/lang/String; = "appVersion"

.field public static final PROPERTY_REG_ID:Ljava/lang/String; = "registration_id"

.field private static SENDER_ID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-string v0, "416405205913"

    sput-object v0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->SENDER_ID:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->SENDER_ID:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;

    .prologue
    .line 28
    invoke-virtual {p0}, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;

    .prologue
    .line 28
    invoke-virtual {p0}, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;

    .prologue
    .line 28
    invoke-virtual {p0}, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 9
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    const/4 v8, 0x0

    .line 37
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 40
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/notifications/RegisterForNotificationsParams;

    .line 41
    .local v3, "registerForNotificationsParams":Lco/getair/meerkat/notifications/RegisterForNotificationsParams;
    invoke-virtual {v3}, Lco/getair/meerkat/notifications/RegisterForNotificationsParams;->getCallingActivity()Landroid/app/Activity;

    move-result-object v0

    .line 43
    .local v0, "callingActivity":Landroid/app/Activity;
    invoke-static {v0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v4

    .line 44
    .local v4, "resultCode":I
    if-eqz v4, :cond_1

    .line 45
    invoke-static {v4}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isUserRecoverableError(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 46
    const/16 v5, 0x2328

    invoke-static {v4, v0, v5}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->getErrorDialog(ILandroid/app/Activity;I)Landroid/app/Dialog;

    move-result-object v5

    .line 47
    invoke-virtual {v5}, Landroid/app/Dialog;->show()V

    .line 51
    :goto_0
    invoke-virtual {p0}, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v5

    const-string v6, "commandGoogleServicesApkNotFound"

    invoke-virtual {v5, v6, v8, v8}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 93
    :goto_1
    return-void

    .line 49
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 53
    :cond_1
    invoke-static {v0}, Lcom/google/android/gms/gcm/GoogleCloudMessaging;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/gcm/GoogleCloudMessaging;

    move-result-object v1

    .line 54
    .local v1, "gcm":Lcom/google/android/gms/gcm/GoogleCloudMessaging;
    const-string v2, ""

    .line 56
    .local v2, "regid":Ljava/lang/String;
    new-instance v5, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;

    invoke-direct {v5, p0, v0}, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;-><init>(Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;Landroid/app/Activity;)V

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Void;

    const/4 v7, 0x0

    aput-object v8, v6, v7

    const/4 v7, 0x1

    aput-object v8, v6, v7

    const/4 v7, 0x2

    aput-object v8, v6, v7

    .line 91
    invoke-virtual {v5, v6}, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1
.end method
