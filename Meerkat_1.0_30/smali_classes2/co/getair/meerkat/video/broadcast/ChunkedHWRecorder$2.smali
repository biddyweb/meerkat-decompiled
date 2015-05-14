.class Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$2;
.super Ljava/lang/Object;
.source "ChunkedHWRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->onPreviewFrame([BLandroid/hardware/Camera;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

.field final synthetic val$data:[B


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;[B)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .prologue
    .line 523
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$2;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$2;->val$data:[B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 527
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$2;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->cameraOnPreviewFrameCallback:Lco/getair/meerkat/utilities/RunnableWithResultObject;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$400(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Lco/getair/meerkat/utilities/RunnableWithResultObject;

    move-result-object v2

    if-nez v2, :cond_0

    .line 563
    :goto_0
    return-void

    .line 528
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$2;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->cameraOnPreviewFrameCallback:Lco/getair/meerkat/utilities/RunnableWithResultObject;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$400(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Lco/getair/meerkat/utilities/RunnableWithResultObject;

    move-result-object v14

    .line 529
    .local v14, "callbackHolder":Lco/getair/meerkat/utilities/RunnableWithResultObject;
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$2;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    const/4 v7, 0x0

    # setter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->cameraOnPreviewFrameCallback:Lco/getair/meerkat/utilities/RunnableWithResultObject;
    invoke-static {v2, v7}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$402(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;Lco/getair/meerkat/utilities/RunnableWithResultObject;)Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .line 530
    const-string v2, "CameraToMpegTest"

    const-string v7, "TAKING PHOTO"

    invoke-static {v2, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 532
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$2;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$500(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/hardware/Camera;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v16

    .line 533
    .local v16, "params":Landroid/hardware/Camera$Parameters;
    invoke-virtual/range {v16 .. v16}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v2

    iget v4, v2, Landroid/hardware/Camera$Size;->width:I

    .line 534
    .local v4, "w":I
    invoke-virtual/range {v16 .. v16}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v2

    iget v5, v2, Landroid/hardware/Camera$Size;->height:I

    .line 535
    .local v5, "h":I
    invoke-virtual/range {v16 .. v16}, Landroid/hardware/Camera$Parameters;->getPreviewFormat()I

    move-result v3

    .line 536
    .local v3, "format":I
    new-instance v1, Landroid/graphics/YuvImage;

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$2;->val$data:[B

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    .line 538
    .local v1, "image":Landroid/graphics/YuvImage;
    new-instance v15, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v15}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 539
    .local v15, "out":Ljava/io/ByteArrayOutputStream;
    new-instance v13, Landroid/graphics/Rect;

    const/4 v2, 0x0

    const/4 v7, 0x0

    invoke-direct {v13, v2, v7, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 540
    .local v13, "area":Landroid/graphics/Rect;
    const/16 v2, 0x32

    invoke-virtual {v1, v13, v2, v15}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z

    .line 541
    invoke-virtual {v15}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    const/4 v7, 0x0

    invoke-virtual {v15}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v8

    invoke-static {v2, v7, v8}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 543
    .local v6, "frameBitmap":Landroid/graphics/Bitmap;
    new-instance v11, Landroid/graphics/Matrix;

    invoke-direct {v11}, Landroid/graphics/Matrix;-><init>()V

    .line 544
    .local v11, "matrix":Landroid/graphics/Matrix;
    const/high16 v2, 0x42b40000    # 90.0f

    invoke-virtual {v11, v2}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 545
    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 546
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    const/4 v12, 0x1

    .line 545
    invoke-static/range {v6 .. v12}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v17

    .line 549
    .local v17, "targetBitmap":Landroid/graphics/Bitmap;
    if-eqz v17, :cond_1

    .line 551
    move-object/from16 v0, v17

    iput-object v0, v14, Lco/getair/meerkat/utilities/RunnableWithResultObject;->resultObject:Ljava/lang/Object;

    .line 552
    invoke-virtual {v14}, Lco/getair/meerkat/utilities/RunnableWithResultObject;->run()V

    .line 559
    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$2;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    const/4 v7, 0x0

    # setter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->cameraOnPreviewFrameCallback:Lco/getair/meerkat/utilities/RunnableWithResultObject;
    invoke-static {v2, v7}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$402(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;Lco/getair/meerkat/utilities/RunnableWithResultObject;)Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .line 561
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$2;->this$0:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    # getter for: Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->mCamera:Landroid/hardware/Camera;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->access$500(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)Landroid/hardware/Camera;

    move-result-object v2

    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    goto/16 :goto_0

    .line 556
    :cond_1
    const-string v2, "CameraToMpegTest"

    const-string v7, "ERROR ON COVER IMAGE"

    invoke-static {v2, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method
