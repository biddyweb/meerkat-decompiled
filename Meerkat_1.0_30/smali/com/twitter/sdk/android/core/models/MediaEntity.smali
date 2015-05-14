.class public Lcom/twitter/sdk/android/core/models/MediaEntity;
.super Lcom/twitter/sdk/android/core/models/UrlEntity;
.source "MediaEntity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/core/models/MediaEntity$Size;,
        Lcom/twitter/sdk/android/core/models/MediaEntity$Sizes;
    }
.end annotation


# instance fields
.field public final id:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id"
    .end annotation
.end field

.field public final idStr:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id_str"
    .end annotation
.end field

.field public final mediaUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "media_url"
    .end annotation
.end field

.field public final mediaUrlHttps:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "media_url_https"
    .end annotation
.end field

.field public final sizes:Lcom/twitter/sdk/android/core/models/MediaEntity$Sizes;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "sizes"
    .end annotation
.end field

.field public final sourceStatusId:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "source_status_id"
    .end annotation
.end field

.field public final sourceStatusIdStr:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "source_status_id_str"
    .end annotation
.end field

.field public final type:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "type"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/twitter/sdk/android/core/models/MediaEntity$Sizes;JLjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "expandedUrl"    # Ljava/lang/String;
    .param p3, "displayUrl"    # Ljava/lang/String;
    .param p4, "start"    # I
    .param p5, "end"    # I
    .param p6, "id"    # J
    .param p8, "idStr"    # Ljava/lang/String;
    .param p9, "mediaUrl"    # Ljava/lang/String;
    .param p10, "mediaUrlHttps"    # Ljava/lang/String;
    .param p11, "sizes"    # Lcom/twitter/sdk/android/core/models/MediaEntity$Sizes;
    .param p12, "sourceStatusId"    # J
    .param p14, "sourceStatusIdStr"    # Ljava/lang/String;
    .param p15, "type"    # Ljava/lang/String;

    .prologue
    .line 72
    invoke-direct/range {p0 .. p5}, Lcom/twitter/sdk/android/core/models/UrlEntity;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V

    .line 73
    iput-wide p6, p0, Lcom/twitter/sdk/android/core/models/MediaEntity;->id:J

    .line 74
    iput-object p8, p0, Lcom/twitter/sdk/android/core/models/MediaEntity;->idStr:Ljava/lang/String;

    .line 75
    iput-object p9, p0, Lcom/twitter/sdk/android/core/models/MediaEntity;->mediaUrl:Ljava/lang/String;

    .line 76
    iput-object p10, p0, Lcom/twitter/sdk/android/core/models/MediaEntity;->mediaUrlHttps:Ljava/lang/String;

    .line 77
    iput-object p11, p0, Lcom/twitter/sdk/android/core/models/MediaEntity;->sizes:Lcom/twitter/sdk/android/core/models/MediaEntity$Sizes;

    .line 78
    iput-wide p12, p0, Lcom/twitter/sdk/android/core/models/MediaEntity;->sourceStatusId:J

    .line 79
    iput-object p14, p0, Lcom/twitter/sdk/android/core/models/MediaEntity;->sourceStatusIdStr:Ljava/lang/String;

    .line 80
    iput-object p15, p0, Lcom/twitter/sdk/android/core/models/MediaEntity;->type:Ljava/lang/String;

    .line 81
    return-void
.end method
