.class public Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$PendingIntentRemoveGeofenceResult;
.super Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult;
.source "RemoveGeofencesResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PendingIntentRemoveGeofenceResult"
.end annotation


# instance fields
.field private final pendingIntent:Landroid/app/PendingIntent;


# direct methods
.method constructor <init>(ILandroid/app/PendingIntent;)V
    .locals 1
    .param p1, "statusCode"    # I
    .param p2, "pendingIntent"    # Landroid/app/PendingIntent;

    .prologue
    .line 41
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult;-><init>(ILpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$1;)V

    .line 42
    iput-object p2, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$PendingIntentRemoveGeofenceResult;->pendingIntent:Landroid/app/PendingIntent;

    .line 43
    return-void
.end method


# virtual methods
.method public getPendingIntent()Landroid/app/PendingIntent;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$PendingIntentRemoveGeofenceResult;->pendingIntent:Landroid/app/PendingIntent;

    return-object v0
.end method
