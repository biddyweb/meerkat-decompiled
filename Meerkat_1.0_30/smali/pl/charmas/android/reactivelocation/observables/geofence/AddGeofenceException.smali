.class public Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceException;
.super Ljava/lang/Throwable;
.source "AddGeofenceException.java"


# instance fields
.field private final addGeofenceResult:Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;


# direct methods
.method constructor <init>(Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;)V
    .locals 2
    .param p1, "addGeofenceResult"    # Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;

    .prologue
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error adding geofences. Status code: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 12
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceException;->addGeofenceResult:Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;

    .line 13
    return-void
.end method


# virtual methods
.method public getAddGeofenceResult()Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceException;->addGeofenceResult:Lpl/charmas/android/reactivelocation/observables/geofence/AddGeofenceResult;

    return-object v0
.end method
