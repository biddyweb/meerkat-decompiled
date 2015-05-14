.class public Lco/getair/meerkat/notifications/RegisterForNotificationsParams;
.super Ljava/lang/Object;
.source "RegisterForNotificationsParams.java"


# instance fields
.field private callingActivity:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .param p1, "callingActivity"    # Landroid/app/Activity;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lco/getair/meerkat/notifications/RegisterForNotificationsParams;->callingActivity:Landroid/app/Activity;

    .line 13
    return-void
.end method


# virtual methods
.method public getCallingActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lco/getair/meerkat/notifications/RegisterForNotificationsParams;->callingActivity:Landroid/app/Activity;

    return-object v0
.end method
