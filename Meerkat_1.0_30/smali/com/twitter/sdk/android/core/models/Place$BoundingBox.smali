.class public Lcom/twitter/sdk/android/core/models/Place$BoundingBox;
.super Ljava/lang/Object;
.source "Place.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/sdk/android/core/models/Place;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BoundingBox"
.end annotation


# instance fields
.field public final coordinates:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "coordinates"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;>;>;"
        }
    .end annotation
.end field

.field public final type:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "type"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .param p2, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;>;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, "coordinates":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/util/List<Ljava/lang/Double;>;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/Place$BoundingBox;->coordinates:Ljava/util/List;

    .line 101
    iput-object p2, p0, Lcom/twitter/sdk/android/core/models/Place$BoundingBox;->type:Ljava/lang/String;

    .line 102
    return-void
.end method
