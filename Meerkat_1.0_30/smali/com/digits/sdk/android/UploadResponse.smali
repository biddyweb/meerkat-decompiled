.class public Lcom/digits/sdk/android/UploadResponse;
.super Ljava/lang/Object;
.source "UploadResponse.java"


# instance fields
.field final errors:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "errors"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/digits/sdk/android/UploadError;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/digits/sdk/android/UploadError;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 11
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Lcom/digits/sdk/android/UploadError;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/digits/sdk/android/UploadResponse;->errors:Ljava/util/List;

    .line 13
    return-void
.end method
