.class public Lcom/twitter/sdk/android/core/models/MediaEntity$Size;
.super Ljava/lang/Object;
.source "MediaEntity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/sdk/android/core/models/MediaEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Size"
.end annotation


# instance fields
.field public final h:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "h"
    .end annotation
.end field

.field public final resize:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "resize"
    .end annotation
.end field

.field public final w:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "w"
    .end annotation
.end field


# direct methods
.method public constructor <init>(IILjava/lang/String;)V
    .locals 0
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "resize"    # Ljava/lang/String;

    .prologue
    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    iput p1, p0, Lcom/twitter/sdk/android/core/models/MediaEntity$Size;->w:I

    .line 139
    iput p2, p0, Lcom/twitter/sdk/android/core/models/MediaEntity$Size;->h:I

    .line 140
    iput-object p3, p0, Lcom/twitter/sdk/android/core/models/MediaEntity$Size;->resize:Ljava/lang/String;

    .line 141
    return-void
.end method
