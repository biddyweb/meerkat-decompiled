.class public Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;
.super Ljava/lang/Object;
.source "ScribeEvent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform;
    }
.end annotation


# static fields
.field private static final CURRENT_FORMAT_VERSION:Ljava/lang/String; = "2"


# instance fields
.field private final category:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "_category_"
    .end annotation
.end field

.field private final eventNamespace:Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "event_namespace"
    .end annotation
.end field

.field private final formatVersion:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "format_version"
    .end annotation
.end field

.field private final timestamp:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "ts"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;J)V
    .locals 1
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "eventNamespace"    # Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    .param p3, "timestamp"    # J

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->category:Ljava/lang/String;

    .line 42
    iput-object p2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->eventNamespace:Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    .line 43
    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->timestamp:Ljava/lang/String;

    .line 44
    const-string v0, "2"

    iput-object v0, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->formatVersion:Ljava/lang/String;

    .line 45
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 59
    if-ne p0, p1, :cond_1

    .line 80
    :cond_0
    :goto_0
    return v1

    .line 60
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 62
    check-cast v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;

    .line 64
    .local v0, "that":Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->category:Ljava/lang/String;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->category:Ljava/lang/String;

    iget-object v4, v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->category:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    :cond_4
    move v1, v2

    .line 66
    goto :goto_0

    .line 64
    :cond_5
    iget-object v3, v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->category:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 68
    :cond_6
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->eventNamespace:Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->eventNamespace:Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    iget-object v4, v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->eventNamespace:Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    invoke-virtual {v3, v4}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    :cond_7
    move v1, v2

    .line 70
    goto :goto_0

    .line 68
    :cond_8
    iget-object v3, v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->eventNamespace:Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    if-nez v3, :cond_7

    .line 72
    :cond_9
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->formatVersion:Ljava/lang/String;

    if-eqz v3, :cond_b

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->formatVersion:Ljava/lang/String;

    iget-object v4, v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->formatVersion:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_c

    :cond_a
    move v1, v2

    .line 74
    goto :goto_0

    .line 72
    :cond_b
    iget-object v3, v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->formatVersion:Ljava/lang/String;

    if-nez v3, :cond_a

    .line 76
    :cond_c
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->timestamp:Ljava/lang/String;

    if-eqz v3, :cond_d

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->timestamp:Ljava/lang/String;

    iget-object v4, v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->timestamp:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 77
    goto :goto_0

    .line 76
    :cond_d
    iget-object v3, v0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->timestamp:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 85
    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->eventNamespace:Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->eventNamespace:Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    invoke-virtual {v2}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->hashCode()I

    move-result v0

    .line 86
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->timestamp:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->timestamp:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_1
    add-int v0, v3, v2

    .line 87
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->formatVersion:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->formatVersion:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_2
    add-int v0, v3, v2

    .line 88
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->category:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->category:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 89
    return v0

    .end local v0    # "result":I
    :cond_1
    move v0, v1

    .line 85
    goto :goto_0

    .restart local v0    # "result":I
    :cond_2
    move v2, v1

    .line 86
    goto :goto_1

    :cond_3
    move v2, v1

    .line 87
    goto :goto_2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "event_namespace="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->eventNamespace:Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", ts="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->timestamp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", format_version="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->formatVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", _category_="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;->category:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
