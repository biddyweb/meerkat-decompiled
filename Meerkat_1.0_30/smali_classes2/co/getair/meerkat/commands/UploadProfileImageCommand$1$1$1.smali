.class Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1$1;
.super Ljava/lang/Object;
.source "UploadProfileImageCommand.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1;

.field final synthetic val$imageBitmap:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "this$2"    # Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1;

    .prologue
    .line 36
    iput-object p1, p0, Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1$1;->this$2:Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1;

    iput-object p2, p0, Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1$1;->val$imageBitmap:Landroid/graphics/Bitmap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 40
    :try_start_0
    iget-object v2, p0, Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1$1;->this$2:Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1;

    iget-object v2, v2, Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1;->this$1:Lco/getair/meerkat/commands/UploadProfileImageCommand$1;

    iget-object v2, v2, Lco/getair/meerkat/commands/UploadProfileImageCommand$1;->this$0:Lco/getair/meerkat/commands/UploadProfileImageCommand;

    # invokes: Lco/getair/meerkat/commands/UploadProfileImageCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v2}, Lco/getair/meerkat/commands/UploadProfileImageCommand;->access$000(Lco/getair/meerkat/commands/UploadProfileImageCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "sessionProxy"

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/SessionProxy;

    .line 41
    .local v1, "sessionProxy":Lco/getair/meerkat/proxies/SessionProxy;
    iget-object v2, p0, Lco/getair/meerkat/commands/UploadProfileImageCommand$1$1$1;->val$imageBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1, v2}, Lco/getair/meerkat/proxies/SessionProxy;->uploadProfileImage(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .end local v1    # "sessionProxy":Lco/getair/meerkat/proxies/SessionProxy;
    :goto_0
    return-void

    .line 42
    :catch_0
    move-exception v0

    .line 43
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
