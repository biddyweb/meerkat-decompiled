.class public Lcom/google/android/exoplayer/metadata/TxxxMetadata;
.super Ljava/lang/Object;
.source "TxxxMetadata.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "TXXX"


# instance fields
.field public final description:Ljava/lang/String;

.field public final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/google/android/exoplayer/metadata/TxxxMetadata;->description:Ljava/lang/String;

    .line 31
    iput-object p2, p0, Lcom/google/android/exoplayer/metadata/TxxxMetadata;->value:Ljava/lang/String;

    .line 32
    return-void
.end method
