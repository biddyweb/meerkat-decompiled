.class public Lcom/digits/sdk/android/DigitsUser;
.super Ljava/lang/Object;
.source "DigitsUser.java"


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


# direct methods
.method public constructor <init>(JLjava/lang/String;)V
    .locals 1
    .param p1, "id"    # J
    .param p3, "idStr"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-wide p1, p0, Lcom/digits/sdk/android/DigitsUser;->id:J

    .line 28
    iput-object p3, p0, Lcom/digits/sdk/android/DigitsUser;->idStr:Ljava/lang/String;

    .line 29
    return-void
.end method
