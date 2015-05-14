.class public Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesException;
.super Ljava/lang/Throwable;
.source "RemoveGeofencesException.java"


# instance fields
.field private final statusCode:I


# direct methods
.method constructor <init>(I)V
    .locals 1
    .param p1, "statusCode"    # I

    .prologue
    .line 11
    const-string v0, "Error removing geofences."

    invoke-direct {p0, v0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 12
    iput p1, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesException;->statusCode:I

    .line 13
    return-void
.end method


# virtual methods
.method public getStatusCode()I
    .locals 1

    .prologue
    .line 16
    iget v0, p0, Lpl/charmas/android/reactivelocation/observables/geofence/RemoveGeofencesException;->statusCode:I

    return v0
.end method
