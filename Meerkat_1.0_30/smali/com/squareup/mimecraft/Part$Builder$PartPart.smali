.class final Lcom/squareup/mimecraft/Part$Builder$PartPart;
.super Lcom/squareup/mimecraft/Part$Builder$PartImpl;
.source "Part.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/mimecraft/Part$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PartPart"
.end annotation


# instance fields
.field private final body:Lcom/squareup/mimecraft/Part;


# direct methods
.method protected constructor <init>(Ljava/util/Map;Lcom/squareup/mimecraft/Part;)V
    .locals 0
    .param p2, "body"    # Lcom/squareup/mimecraft/Part;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/squareup/mimecraft/Part;",
            ")V"
        }
    .end annotation

    .prologue
    .line 199
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lcom/squareup/mimecraft/Part$Builder$PartImpl;-><init>(Ljava/util/Map;)V

    .line 200
    iput-object p2, p0, Lcom/squareup/mimecraft/Part$Builder$PartPart;->body:Lcom/squareup/mimecraft/Part;

    .line 201
    return-void
.end method


# virtual methods
.method public writeBodyTo(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "stream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 204
    iget-object v0, p0, Lcom/squareup/mimecraft/Part$Builder$PartPart;->body:Lcom/squareup/mimecraft/Part;

    invoke-interface {v0, p1}, Lcom/squareup/mimecraft/Part;->writeBodyTo(Ljava/io/OutputStream;)V

    .line 205
    return-void
.end method
