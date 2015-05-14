.class Lco/getair/meerkat/proxies/BroadcastProxy$2;
.super Landroid/os/AsyncTask;
.source "BroadcastProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/BroadcastProxy;->uploadCoverImage(Landroid/graphics/Bitmap;)V
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
.field final synthetic this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

.field final synthetic val$coverImage:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/BroadcastProxy;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/BroadcastProxy;

    .prologue
    .line 101
    iput-object p1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$2;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/BroadcastProxy$2;->val$coverImage:Landroid/graphics/Bitmap;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 101
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/BroadcastProxy$2;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 9
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 105
    :try_start_0
    iget-object v6, p0, Lco/getair/meerkat/proxies/BroadcastProxy$2;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    # getter for: Lco/getair/meerkat/proxies/BroadcastProxy;->followupActions:Ljava/util/HashMap;
    invoke-static {v6}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$200(Lco/getair/meerkat/proxies/BroadcastProxy;)Ljava/util/HashMap;

    move-result-object v6

    const-string v7, "cover"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 107
    .local v5, "updateImageUrl":Ljava/lang/String;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 108
    .local v1, "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    iget-object v6, p0, Lco/getair/meerkat/proxies/BroadcastProxy$2;->val$coverImage:Landroid/graphics/Bitmap;

    sget-object v7, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v8, 0x46

    invoke-virtual {v6, v7, v8, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 110
    new-instance v3, Lco/getair/meerkat/utilities/MultipartUtility;

    const-string v6, "UTF-8"

    invoke-direct {v3, v5, v6}, Lco/getair/meerkat/utilities/MultipartUtility;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .local v3, "multipart":Lco/getair/meerkat/utilities/MultipartUtility;
    const-string v6, "User-Agent"

    const-string v7, "Meerkat Android"

    invoke-virtual {v3, v6, v7}, Lco/getair/meerkat/utilities/MultipartUtility;->addHeaderField(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-direct {v0, v6}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 115
    .local v0, "byteArrayInputStream":Ljava/io/ByteArrayInputStream;
    const-string v6, "imageFile"

    const-string v7, "coverImage.png"

    invoke-virtual {v3, v6, v7, v0}, Lco/getair/meerkat/utilities/MultipartUtility;->addFilePart(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    .line 116
    const-string v6, "counter"

    const-string v7, "1"

    invoke-virtual {v3, v6, v7}, Lco/getair/meerkat/utilities/MultipartUtility;->addFormField(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    invoke-virtual {v3}, Lco/getair/meerkat/utilities/MultipartUtility;->finish()Ljava/util/List;

    move-result-object v4

    .line 120
    .local v4, "response":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v6, "BroadcastProxy"

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .end local v0    # "byteArrayInputStream":Ljava/io/ByteArrayInputStream;
    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "multipart":Lco/getair/meerkat/utilities/MultipartUtility;
    .end local v4    # "response":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "updateImageUrl":Ljava/lang/String;
    :goto_0
    const/4 v6, 0x0

    return-object v6

    .line 121
    :catch_0
    move-exception v2

    .line 122
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
