.class public interface abstract Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;
.super Ljava/lang/Object;
.source "MediaCodecTrackRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/MediaCodecTrackRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "EventListener"
.end annotation


# virtual methods
.method public abstract onCryptoError(Landroid/media/MediaCodec$CryptoException;)V
.end method

.method public abstract onDecoderInitializationError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V
.end method
