.class public Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$RequestIdsRemoveGeofenceResult;
.super Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult;
.source "RemoveGeofencesResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RequestIdsRemoveGeofenceResult"
.end annotation


# instance fields
.field private final requestIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(ILjava/util/List;)V
    .locals 1
    .param p1, "statusCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p2, "requestIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult;-><init>(ILpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$1;)V

    .line 58
    iput-object p2, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$RequestIdsRemoveGeofenceResult;->requestIds:Ljava/util/List;

    .line 59
    return-void
.end method


# virtual methods
.method public getRequestIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesResult$RequestIdsRemoveGeofenceResult;->requestIds:Ljava/util/List;

    return-object v0
.end method
