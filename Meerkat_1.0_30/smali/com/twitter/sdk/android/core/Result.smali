.class public Lcom/twitter/sdk/android/core/Result;
.super Ljava/lang/Object;
.source "Result.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public final response:Lretrofit/client/Response;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lretrofit/client/Response;)V
    .locals 0
    .param p2, "response"    # Lretrofit/client/Response;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lretrofit/client/Response;",
            ")V"
        }
    .end annotation

    .prologue
    .line 14
    .local p0, "this":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<TT;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    .line 16
    iput-object p2, p0, Lcom/twitter/sdk/android/core/Result;->response:Lretrofit/client/Response;

    .line 17
    return-void
.end method
