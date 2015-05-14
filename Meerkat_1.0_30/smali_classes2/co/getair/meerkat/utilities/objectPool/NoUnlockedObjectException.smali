.class public Lco/getair/meerkat/utilities/objectPool/NoUnlockedObjectException;
.super Ljava/lang/Exception;
.source "NoUnlockedObjectException.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    const-string v0, "No free object available"

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 9
    return-void
.end method
