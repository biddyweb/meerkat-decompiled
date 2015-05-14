.class public Lpl/charmas/android/reactivelocation/observables/GoogleAPIConnectionSuspendedException;
.super Ljava/lang/RuntimeException;
.source "GoogleAPIConnectionSuspendedException.java"


# instance fields
.field private final cause:I


# direct methods
.method constructor <init>(I)V
    .locals 0
    .param p1, "cause"    # I

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 7
    iput p1, p0, Lpl/charmas/android/reactivelocation/observables/GoogleAPIConnectionSuspendedException;->cause:I

    .line 8
    return-void
.end method


# virtual methods
.method public getErrorCause()I
    .locals 1

    .prologue
    .line 11
    iget v0, p0, Lpl/charmas/android/reactivelocation/observables/GoogleAPIConnectionSuspendedException;->cause:I

    return v0
.end method
