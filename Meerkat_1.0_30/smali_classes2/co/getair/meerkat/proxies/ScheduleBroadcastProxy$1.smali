.class Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$1;
.super Landroid/os/AsyncTask;
.source "ScheduleBroadcastProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->uploadCoverImage(Landroid/graphics/Bitmap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

.field final synthetic val$coverImage:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    .prologue
    .line 56
    iput-object p1, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$1;->this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$1;->val$coverImage:Landroid/graphics/Bitmap;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 56
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 8
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 60
    :try_start_0
    iget-object v5, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$1;->this$0:Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    # getter for: Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->followupActions:Ljava/util/HashMap;
    invoke-static {v5}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->access$000(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;)Ljava/util/HashMap;

    move-result-object v5

    const-string v6, "cover"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 62
    .local v4, "updateImageUrl":Ljava/lang/String;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 63
    .local v1, "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    iget-object v5, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$1;->val$coverImage:Landroid/graphics/Bitmap;

    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v7, 0x46

    invoke-virtual {v5, v6, v7, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 65
    new-instance v3, Lco/getair/meerkat/utilities/MultipartUtility;

    const-string v5, "UTF-8"

    invoke-direct {v3, v4, v5}, Lco/getair/meerkat/utilities/MultipartUtility;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .local v3, "multipart":Lco/getair/meerkat/utilities/MultipartUtility;
    const-string v5, "User-Agent"

    const-string v6, "Meerkat Android"

    invoke-virtual {v3, v5, v6}, Lco/getair/meerkat/utilities/MultipartUtility;->addHeaderField(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 70
    .local v0, "byteArrayInputStream":Ljava/io/ByteArrayInputStream;
    const-string v5, "imageFile"

    const-string v6, "coverImage.png"

    invoke-virtual {v3, v5, v6, v0}, Lco/getair/meerkat/utilities/MultipartUtility;->addFilePart(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    .line 71
    const-string v5, "counter"

    const-string v6, "1"

    invoke-virtual {v3, v5, v6}, Lco/getair/meerkat/utilities/MultipartUtility;->addFormField(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    invoke-virtual {v3}, Lco/getair/meerkat/utilities/MultipartUtility;->finish()Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .end local v0    # "byteArrayInputStream":Ljava/io/ByteArrayInputStream;
    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "multipart":Lco/getair/meerkat/utilities/MultipartUtility;
    .end local v4    # "updateImageUrl":Ljava/lang/String;
    :goto_0
    const/4 v5, 0x0

    return-object v5

    .line 74
    :catch_0
    move-exception v2

    .line 75
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
