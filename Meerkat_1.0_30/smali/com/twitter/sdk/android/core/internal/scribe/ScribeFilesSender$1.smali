.class Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$1;
.super Ljava/lang/Object;
.source "ScribeFilesSender.java"

# interfaces
.implements Lio/fabric/sdk/android/services/common/QueueFile$ElementReader;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->getScribeEventsAsJsonArrayString(Ljava/util/List;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;

.field final synthetic val$appendComma:[Z

.field final synthetic val$out:Ljava/io/ByteArrayOutputStream;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;[ZLjava/io/ByteArrayOutputStream;)V
    .locals 0

    .prologue
    .line 116
    iput-object p1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$1;->this$0:Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;

    iput-object p2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$1;->val$appendComma:[Z

    iput-object p3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$1;->val$out:Ljava/io/ByteArrayOutputStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public read(Ljava/io/InputStream;I)V
    .locals 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 119
    new-array v0, p2, [B

    .line 120
    .local v0, "buf":[B
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    .line 122
    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$1;->val$appendComma:[Z

    aget-boolean v1, v1, v3

    if-eqz v1, :cond_0

    .line 123
    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$1;->val$out:Ljava/io/ByteArrayOutputStream;

    # getter for: Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->COMMA:[B
    invoke-static {}, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;->access$000()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 128
    :goto_0
    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$1;->val$out:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v1, v0}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 129
    return-void

    .line 126
    :cond_0
    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$1;->val$appendComma:[Z

    const/4 v2, 0x1

    aput-boolean v2, v1, v3

    goto :goto_0
.end method
