.class public Lcom/twitter/cobalt/metrics/Metric$CustomLevel;
.super Ljava/lang/Object;
.source "Metric.java"

# interfaces
.implements Lcom/twitter/cobalt/metrics/Metric$Level;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/cobalt/metrics/Metric;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CustomLevel"
.end annotation


# instance fields
.field private final mSampleRate:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "sampleRate"    # I

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput p1, p0, Lcom/twitter/cobalt/metrics/Metric$CustomLevel;->mSampleRate:I

    .line 74
    return-void
.end method


# virtual methods
.method public getSampleRate()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lcom/twitter/cobalt/metrics/Metric$CustomLevel;->mSampleRate:I

    return v0
.end method
