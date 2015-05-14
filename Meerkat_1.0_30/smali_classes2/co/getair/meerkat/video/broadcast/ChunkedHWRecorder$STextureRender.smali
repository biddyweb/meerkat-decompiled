.class Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;
.super Ljava/lang/Object;
.source "ChunkedHWRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "STextureRender"
.end annotation


# static fields
.field private static final COORDS_PER_VERTEX:I = 0x2

.field static squareCoords:[F

.field static textureVertices:[F


# instance fields
.field private drawListBuffer:Ljava/nio/ShortBuffer;

.field private drawOrder:[S

.field private final fragmentShaderCode:Ljava/lang/String;

.field private final fragmentShaderCodeFlipped:Ljava/lang/String;

.field private mPositionHandle:I

.field private mProgram:I

.field private mTextureCoordHandle:I

.field private textureId:I

.field private textureVerticesBuffer:Ljava/nio/FloatBuffer;

.field private vertexBuffer:Ljava/nio/FloatBuffer;

.field private final vertexShaderCode:Ljava/lang/String;

.field private final vertexStride:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 1233
    new-array v0, v1, [F

    fill-array-data v0, :array_0

    sput-object v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->squareCoords:[F

    .line 1240
    new-array v0, v1, [F

    fill-array-data v0, :array_1

    sput-object v0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->textureVertices:[F

    return-void

    .line 1233
    nop

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 1240
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 1250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1184
    const-string v0, "attribute vec4 vPosition;attribute vec2 inputTextureCoordinate;varying vec2 textureCoordinate;void main(){gl_Position = vPosition;textureCoordinate = inputTextureCoordinate;}"

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->vertexShaderCode:Ljava/lang/String;

    .line 1197
    const-string v0, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;varying vec2 textureCoordinate;\nuniform samplerExternalOES s_texture;\nvoid main() {\nvec4 fragColor = texture2D( s_texture, textureCoordinate );\nif ( textureCoordinate.x > 0.995 && textureCoordinate.y > 0.995 ) { \nfragColor = vec4( 1.0, 1.0, 1.0, 0.1 ) ; \n } \ngl_FragColor = fragColor;\n}"

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->fragmentShaderCode:Ljava/lang/String;

    .line 1208
    const-string v0, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;varying vec2 textureCoordinate;\nuniform samplerExternalOES s_texture;\nvoid main() {vec2 vTexCoord = vec2( 1.0 - textureCoordinate.x, textureCoordinate.y);vec4 fragColor = texture2D( s_texture, vTexCoord );\nif ( textureCoordinate.x > 0.995 && textureCoordinate.y > 0.995 ) { \nfragColor = vec4( 1.0, 1.0, 1.0, 0.1 ) ; \n } \ngl_FragColor = fragColor;\n}"

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->fragmentShaderCodeFlipped:Ljava/lang/String;

    .line 1226
    const/4 v0, 0x6

    new-array v0, v0, [S

    fill-array-data v0, :array_0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->drawOrder:[S

    .line 1231
    const/16 v0, 0x8

    iput v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->vertexStride:I

    .line 1251
    return-void

    .line 1226
    :array_0
    .array-data 2
        0x0s
        0x1s
        0x2s
        0x0s
        0x2s
        0x3s
    .end array-data
.end method

.method private createTexture()I
    .locals 6

    .prologue
    const v5, 0x812f

    const/4 v1, 0x1

    const v4, 0x46180400    # 9729.0f

    const/4 v3, 0x0

    const v2, 0x8d65

    .line 1331
    new-array v0, v1, [I

    .line 1334
    .local v0, "textures":[I
    invoke-static {v1, v0, v3}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 1335
    aget v1, v0, v3

    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 1338
    const/16 v1, 0x2801

    invoke-static {v2, v1, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 1339
    const/16 v1, 0x2800

    invoke-static {v2, v1, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 1342
    const/16 v1, 0x2802

    invoke-static {v2, v1, v5}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 1343
    const/16 v1, 0x2803

    invoke-static {v2, v1, v5}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 1345
    aget v1, v0, v3

    return v1
.end method

.method private loadShader(ILjava/lang/String;)I
    .locals 5
    .param p1, "shaderType"    # I
    .param p2, "source"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 1350
    invoke-static {p1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result v1

    .line 1351
    .local v1, "shader":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "glCreateShader type="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->checkGlError(Ljava/lang/String;)V

    .line 1352
    invoke-static {v1, p2}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 1353
    invoke-static {v1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 1354
    const/4 v2, 0x1

    new-array v0, v2, [I

    .line 1355
    .local v0, "compiled":[I
    const v2, 0x8b81

    invoke-static {v1, v2, v0, v4}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 1356
    aget v2, v0, v4

    if-nez v2, :cond_0

    .line 1357
    const-string v2, "CameraToMpegTest"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not compile shader "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1358
    const-string v2, "CameraToMpegTest"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v1}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1359
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 1360
    const/4 v1, 0x0

    .line 1362
    :cond_0
    return v1
.end method


# virtual methods
.method public checkGlError(Ljava/lang/String;)V
    .locals 4
    .param p1, "op"    # Ljava/lang/String;

    .prologue
    .line 1368
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    .local v0, "error":I
    if-eqz v0, :cond_0

    .line 1369
    const-string v1, "CameraToMpegTest"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": glError "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1370
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": glError "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1372
    :cond_0
    return-void
.end method

.method public drawFrame(Landroid/graphics/SurfaceTexture;II)V
    .locals 6
    .param p1, "st"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    const/16 v2, 0x1406

    const/16 v4, 0x8

    const/4 v1, 0x2

    const/4 v3, 0x0

    .line 1259
    iget v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mProgram:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 1261
    invoke-static {v3, v3, p2, p3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 1263
    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 1264
    const v0, 0x8d65

    iget v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->textureId:I

    invoke-static {v0, v5}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 1267
    iget v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mProgram:I

    const-string v5, "vPosition"

    invoke-static {v0, v5}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mPositionHandle:I

    .line 1270
    iget v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mPositionHandle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 1273
    iget v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mPositionHandle:I

    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->vertexBuffer:Ljava/nio/FloatBuffer;

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 1275
    iget v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mProgram:I

    const-string v5, "inputTextureCoordinate"

    invoke-static {v0, v5}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mTextureCoordHandle:I

    .line 1276
    iget v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mTextureCoordHandle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 1277
    iget v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mTextureCoordHandle:I

    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->textureVerticesBuffer:Ljava/nio/FloatBuffer;

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 1279
    const/4 v0, 0x4

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->drawOrder:[S

    array-length v1, v1

    const/16 v2, 0x1403

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->drawListBuffer:Ljava/nio/ShortBuffer;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 1282
    iget v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mPositionHandle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 1283
    iget v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mTextureCoordHandle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 1285
    return-void
.end method

.method public getTextureId()I
    .locals 1

    .prologue
    .line 1254
    iget v0, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->textureId:I

    return v0
.end method

.method public surfaceCreated(Z)V
    .locals 9
    .param p1, "flipTexture"    # Z

    .prologue
    const v8, 0x8b30

    const/4 v7, 0x0

    .line 1292
    sget-object v5, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->squareCoords:[F

    array-length v5, v5

    mul-int/lit8 v5, v5, 0x4

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 1293
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1294
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v5

    iput-object v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 1295
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->vertexBuffer:Ljava/nio/FloatBuffer;

    sget-object v6, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->squareCoords:[F

    invoke-virtual {v5, v6}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 1296
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->vertexBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v5, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1299
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->drawOrder:[S

    array-length v5, v5

    mul-int/lit8 v5, v5, 0x2

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 1300
    .local v2, "dlb":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1301
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v5

    iput-object v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 1302
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->drawListBuffer:Ljava/nio/ShortBuffer;

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->drawOrder:[S

    invoke-virtual {v5, v6}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 1303
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->drawListBuffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v5, v7}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 1305
    sget-object v5, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->textureVertices:[F

    array-length v5, v5

    mul-int/lit8 v5, v5, 0x4

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 1306
    .local v1, "bb2":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1307
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v5

    iput-object v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->textureVerticesBuffer:Ljava/nio/FloatBuffer;

    .line 1308
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->textureVerticesBuffer:Ljava/nio/FloatBuffer;

    sget-object v6, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->textureVertices:[F

    invoke-virtual {v5, v6}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 1309
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->textureVerticesBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v5, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1311
    const v5, 0x8b31

    const-string v6, "attribute vec4 vPosition;attribute vec2 inputTextureCoordinate;varying vec2 textureCoordinate;void main(){gl_Position = vPosition;textureCoordinate = inputTextureCoordinate;}"

    invoke-direct {p0, v5, v6}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->loadShader(ILjava/lang/String;)I

    move-result v4

    .line 1313
    .local v4, "vertexShader":I
    if-eqz p1, :cond_0

    .line 1315
    const-string v5, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;varying vec2 textureCoordinate;\nuniform samplerExternalOES s_texture;\nvoid main() {vec2 vTexCoord = vec2( 1.0 - textureCoordinate.x, textureCoordinate.y);vec4 fragColor = texture2D( s_texture, vTexCoord );\nif ( textureCoordinate.x > 0.995 && textureCoordinate.y > 0.995 ) { \nfragColor = vec4( 1.0, 1.0, 1.0, 0.1 ) ; \n } \ngl_FragColor = fragColor;\n}"

    invoke-direct {p0, v8, v5}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->loadShader(ILjava/lang/String;)I

    move-result v3

    .line 1321
    .local v3, "fragmentShader":I
    :goto_0
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mProgram:I

    .line 1322
    iget v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mProgram:I

    invoke-static {v5, v4}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 1323
    iget v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mProgram:I

    invoke-static {v5, v3}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 1324
    iget v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->mProgram:I

    invoke-static {v5}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 1326
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->createTexture()I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->textureId:I

    .line 1327
    return-void

    .line 1317
    .end local v3    # "fragmentShader":I
    :cond_0
    const-string v5, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;varying vec2 textureCoordinate;\nuniform samplerExternalOES s_texture;\nvoid main() {\nvec4 fragColor = texture2D( s_texture, textureCoordinate );\nif ( textureCoordinate.x > 0.995 && textureCoordinate.y > 0.995 ) { \nfragColor = vec4( 1.0, 1.0, 1.0, 0.1 ) ; \n } \ngl_FragColor = fragColor;\n}"

    invoke-direct {p0, v8, v5}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$STextureRender;->loadShader(ILjava/lang/String;)I

    move-result v3

    .restart local v3    # "fragmentShader":I
    goto :goto_0
.end method
