.class Lcom/digits/sdk/android/UploadError;
.super Ljava/lang/Object;
.source "UploadError.java"


# instance fields
.field final code:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "code"
    .end annotation
.end field

.field final item:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "item"
    .end annotation
.end field

.field final message:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "message"
    .end annotation
.end field


# direct methods
.method constructor <init>(ILjava/lang/String;I)V
    .locals 0
    .param p1, "code"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "item"    # I

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput p1, p0, Lcom/digits/sdk/android/UploadError;->code:I

    .line 17
    iput-object p2, p0, Lcom/digits/sdk/android/UploadError;->message:Ljava/lang/String;

    .line 18
    iput p3, p0, Lcom/digits/sdk/android/UploadError;->item:I

    .line 19
    return-void
.end method
