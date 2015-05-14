.class Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "UploadProfileImageCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/UploadProfileImageCommand$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/commands/UploadProfileImageCommand$1;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/UploadProfileImageCommand$1;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/commands/UploadProfileImageCommand$1;

    .prologue
    .line 31
    iput-object p1, p0, Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1;->this$1:Lco/getair/meerkat/commands/UploadProfileImageCommand$1;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 34
    iget-boolean v2, p0, Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1;->success:Z

    if-eqz v2, :cond_0

    .line 35
    iget-object v0, p0, Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1;->resultObject:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Bitmap;

    .line 36
    .local v0, "imageBitmap":Landroid/graphics/Bitmap;
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1$1;

    invoke-direct {v2, p0, v0}, Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1$1;-><init>(Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1;Landroid/graphics/Bitmap;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 47
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 49
    .end local v0    # "imageBitmap":Landroid/graphics/Bitmap;
    .end local v1    # "thread":Ljava/lang/Thread;
    :cond_0
    return-void
.end method
