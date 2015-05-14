.class public abstract Lpl/charmas/android/reactivelocation/observables/activity/BaseActivityObservable;
.super Lpl/charmas/android/reactivelocation/observables/BaseObservable;
.source "BaseActivityObservable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lpl/charmas/android/reactivelocation/observables/BaseObservable",
        "<TT;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 12
    .local p0, "this":Lpl/charmas/android/reactivelocation/observables/activity/BaseActivityObservable;, "Lpl/charmas/android/reactivelocation/observables/activity/BaseActivityObservable<TT;>;"
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/google/android/gms/common/api/Api;

    const/4 v1, 0x0

    sget-object v2, Lcom/google/android/gms/location/ActivityRecognition;->API:Lcom/google/android/gms/common/api/Api;

    aput-object v2, v0, v1

    invoke-direct {p0, p1, v0}, Lpl/charmas/android/reactivelocation/observables/BaseObservable;-><init>(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;)V

    .line 13
    return-void
.end method
