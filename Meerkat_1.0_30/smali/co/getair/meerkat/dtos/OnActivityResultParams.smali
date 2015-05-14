.class public Lco/getair/meerkat/dtos/OnActivityResultParams;
.super Ljava/lang/Object;
.source "OnActivityResultParams.java"


# instance fields
.field private data:Landroid/content/Intent;

.field private requestCode:I

.field private resultCode:I


# direct methods
.method public constructor <init>(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput p1, p0, Lco/getair/meerkat/dtos/OnActivityResultParams;->requestCode:I

    .line 16
    iput p2, p0, Lco/getair/meerkat/dtos/OnActivityResultParams;->resultCode:I

    .line 17
    iput-object p3, p0, Lco/getair/meerkat/dtos/OnActivityResultParams;->data:Landroid/content/Intent;

    .line 18
    return-void
.end method


# virtual methods
.method public getData()Landroid/content/Intent;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lco/getair/meerkat/dtos/OnActivityResultParams;->data:Landroid/content/Intent;

    return-object v0
.end method

.method public getRequestCode()I
    .locals 1

    .prologue
    .line 21
    iget v0, p0, Lco/getair/meerkat/dtos/OnActivityResultParams;->requestCode:I

    return v0
.end method

.method public getResultCode()I
    .locals 1

    .prologue
    .line 25
    iget v0, p0, Lco/getair/meerkat/dtos/OnActivityResultParams;->resultCode:I

    return v0
.end method
