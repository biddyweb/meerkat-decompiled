.class public Lcom/twitter/sdk/android/core/models/UserEntities;
.super Ljava/lang/Object;
.source "UserEntities.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/core/models/UserEntities$UrlEntities;
    }
.end annotation


# instance fields
.field public final description:Lcom/twitter/sdk/android/core/models/UserEntities$UrlEntities;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "description"
    .end annotation
.end field

.field public final url:Lcom/twitter/sdk/android/core/models/UserEntities$UrlEntities;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "url"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/core/models/UserEntities$UrlEntities;Lcom/twitter/sdk/android/core/models/UserEntities$UrlEntities;)V
    .locals 0
    .param p1, "url"    # Lcom/twitter/sdk/android/core/models/UserEntities$UrlEntities;
    .param p2, "description"    # Lcom/twitter/sdk/android/core/models/UserEntities$UrlEntities;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/UserEntities;->url:Lcom/twitter/sdk/android/core/models/UserEntities$UrlEntities;

    .line 22
    iput-object p2, p0, Lcom/twitter/sdk/android/core/models/UserEntities;->description:Lcom/twitter/sdk/android/core/models/UserEntities$UrlEntities;

    .line 23
    return-void
.end method
