.class public abstract Lco/getair/meerkat/utilities/RunnableWithResultObject;
.super Ljava/lang/Object;
.source "RunnableWithResultObject.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public resultObject:Ljava/lang/Object;

.field public success:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/utilities/RunnableWithResultObject;->resultObject:Ljava/lang/Object;

    .line 9
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/utilities/RunnableWithResultObject;->success:Z

    return-void
.end method


# virtual methods
.method public abstract run()V
.end method
