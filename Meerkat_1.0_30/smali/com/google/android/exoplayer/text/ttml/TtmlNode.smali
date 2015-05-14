.class final Lcom/google/android/exoplayer/text/ttml/TtmlNode;
.super Ljava/lang/Object;
.source "TtmlNode.java"


# static fields
.field public static final TAG_BODY:Ljava/lang/String; = "body"

.field public static final TAG_BR:Ljava/lang/String; = "br"

.field public static final TAG_DIV:Ljava/lang/String; = "div"

.field public static final TAG_HEAD:Ljava/lang/String; = "head"

.field public static final TAG_LAYOUT:Ljava/lang/String; = "layout"

.field public static final TAG_METADATA:Ljava/lang/String; = "metadata"

.field public static final TAG_P:Ljava/lang/String; = "p"

.field public static final TAG_REGION:Ljava/lang/String; = "region"

.field public static final TAG_SMPTE_DATA:Ljava/lang/String; = "smpte:data"

.field public static final TAG_SMPTE_IMAGE:Ljava/lang/String; = "smpte:image"

.field public static final TAG_SMPTE_INFORMATION:Ljava/lang/String; = "smpte:information"

.field public static final TAG_SPAN:Ljava/lang/String; = "span"

.field public static final TAG_STYLE:Ljava/lang/String; = "style"

.field public static final TAG_STYLING:Ljava/lang/String; = "styling"

.field public static final TAG_TT:Ljava/lang/String; = "tt"

.field public static final UNDEFINED_TIME:J = -0x1L


# instance fields
.field private children:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/text/ttml/TtmlNode;",
            ">;"
        }
    .end annotation
.end field

.field public final endTimeUs:J

.field public final isTextNode:Z

.field public final startTimeUs:J

.field public final tag:Ljava/lang/String;

.field public final text:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 1
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "startTimeUs"    # J
    .param p5, "endTimeUs"    # J

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->tag:Ljava/lang/String;

    .line 64
    iput-object p2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->text:Ljava/lang/String;

    .line 65
    if-eqz p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->isTextNode:Z

    .line 66
    iput-wide p3, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    .line 67
    iput-wide p5, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    .line 68
    return-void

    .line 65
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static applySpacePolicy(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 3
    .param p0, "in"    # Ljava/lang/String;
    .param p1, "treatLineFeedAsSpace"    # Z

    .prologue
    .line 161
    const-string v1, "\r\n"

    const-string v2, "\n"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 164
    .local v0, "out":Ljava/lang/String;
    const-string v1, " *\n *"

    const-string v2, "\n"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 166
    if-eqz p1, :cond_0

    const-string v1, "\n"

    const-string v2, " "

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 168
    :cond_0
    const-string v1, "[ \t\\x0B\u000c\r]+"

    const-string v2, " "

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 169
    return-object v0
.end method

.method public static buildNode(Ljava/lang/String;JJ)Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .locals 9
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "startTimeUs"    # J
    .param p3, "endTimeUs"    # J

    .prologue
    .line 59
    new-instance v1, Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    const/4 v3, 0x0

    move-object v2, p0

    move-wide v4, p1

    move-wide v6, p3

    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;-><init>(Ljava/lang/String;Ljava/lang/String;JJ)V

    return-object v1
.end method

.method public static buildTextNode(Ljava/lang/String;)Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .locals 8
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    const-wide/16 v4, -0x1

    .line 55
    new-instance v1, Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    const/4 v2, 0x0

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->applySpacePolicy(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    move-wide v6, v4

    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;-><init>(Ljava/lang/String;Ljava/lang/String;JJ)V

    return-object v1
.end method

.method private getEventTimes(Ljava/util/TreeSet;Z)V
    .locals 6
    .param p2, "descendsPNode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TreeSet",
            "<",
            "Ljava/lang/Long;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p1, "out":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/Long;>;"
    const-wide/16 v4, -0x1

    .line 109
    const-string v2, "p"

    iget-object v3, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->tag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 110
    .local v1, "isPNode":Z
    if-nez p2, :cond_0

    if-eqz v1, :cond_2

    .line 111
    :cond_0
    iget-wide v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    .line 112
    iget-wide v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 114
    :cond_1
    iget-wide v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2

    .line 115
    iget-wide v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 118
    :cond_2
    iget-object v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    if-nez v2, :cond_4

    .line 124
    :cond_3
    return-void

    .line 121
    :cond_4
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 122
    iget-object v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    if-nez p2, :cond_5

    if-eqz v1, :cond_6

    :cond_5
    const/4 v3, 0x1

    :goto_1
    invoke-direct {v2, p1, v3}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->getEventTimes(Ljava/util/TreeSet;Z)V

    .line 121
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 122
    :cond_6
    const/4 v3, 0x0

    goto :goto_1
.end method

.method private getText(JLjava/lang/StringBuilder;Z)V
    .locals 5
    .param p1, "timeUs"    # J
    .param p3, "builder"    # Ljava/lang/StringBuilder;
    .param p4, "descendsPNode"    # Z

    .prologue
    .line 133
    iget-boolean v3, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->isTextNode:Z

    if-eqz v3, :cond_1

    if-eqz p4, :cond_1

    .line 134
    iget-object v3, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->text:Ljava/lang/String;

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    :cond_0
    :goto_0
    return-void

    .line 135
    :cond_1
    const-string v3, "br"

    iget-object v4, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->tag:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    if-eqz p4, :cond_2

    .line 136
    const-string v3, "\n"

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 137
    :cond_2
    const-string v3, "metadata"

    iget-object v4, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->tag:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 139
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->isActive(J)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 140
    const-string v3, "p"

    iget-object v4, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->tag:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 141
    .local v1, "isPNode":Z
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    .line 142
    .local v2, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->getChildCount()I

    move-result v3

    if-ge v0, v3, :cond_5

    .line 143
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->getChild(I)Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    move-result-object v4

    if-nez p4, :cond_3

    if-eqz v1, :cond_4

    :cond_3
    const/4 v3, 0x1

    :goto_2
    invoke-direct {v4, p1, p2, p3, v3}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->getText(JLjava/lang/StringBuilder;Z)V

    .line 142
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 143
    :cond_4
    const/4 v3, 0x0

    goto :goto_2

    .line 145
    :cond_5
    if-eqz v1, :cond_0

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eq v2, v3, :cond_0

    .line 146
    const-string v3, "\n"

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method


# virtual methods
.method public addChild(Lcom/google/android/exoplayer/text/ttml/TtmlNode;)V
    .locals 1
    .param p1, "child"    # Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    if-nez v0, :cond_0

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    return-void
.end method

.method public getChild(I)Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 85
    iget-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    if-nez v0, :cond_0

    .line 86
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    return-object v0
.end method

.method public getChildCount()I
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getEventTimesUs()[J
    .locals 8

    .prologue
    .line 96
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    .line 97
    .local v1, "eventTimeSet":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/Long;>;"
    const/4 v7, 0x0

    invoke-direct {p0, v1, v7}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->getEventTimes(Ljava/util/TreeSet;Z)V

    .line 98
    invoke-virtual {v1}, Ljava/util/TreeSet;->size()I

    move-result v7

    new-array v4, v7, [J

    .line 99
    .local v4, "eventTimes":[J
    invoke-virtual {v1}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 100
    .local v0, "eventTimeIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Long;>;"
    const/4 v5, 0x0

    .line 101
    .local v5, "i":I
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 102
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 103
    .local v2, "eventTimeUs":J
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "i":I
    .local v6, "i":I
    aput-wide v2, v4, v5

    move v5, v6

    .line 104
    .end local v6    # "i":I
    .restart local v5    # "i":I
    goto :goto_0

    .line 105
    .end local v2    # "eventTimeUs":J
    :cond_0
    return-object v4
.end method

.method public getText(J)Ljava/lang/String;
    .locals 5
    .param p1, "timeUs"    # J

    .prologue
    const/4 v4, 0x0

    .line 127
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-direct {p0, p1, p2, v0, v4}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->getText(JLjava/lang/StringBuilder;Z)V

    .line 129
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\n$"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v4}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->applySpacePolicy(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public isActive(J)Z
    .locals 5
    .param p1, "timeUs"    # J

    .prologue
    const-wide/16 v2, -0x1

    .line 71
    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_3

    :cond_0
    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    cmp-long v0, v0, p1

    if-gtz v0, :cond_1

    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_3

    :cond_1
    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    cmp-long v0, p1, v0

    if-ltz v0, :cond_3

    :cond_2
    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    cmp-long v0, v0, p1

    if-gtz v0, :cond_4

    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    cmp-long v0, p1, v0

    if-gez v0, :cond_4

    :cond_3
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method
