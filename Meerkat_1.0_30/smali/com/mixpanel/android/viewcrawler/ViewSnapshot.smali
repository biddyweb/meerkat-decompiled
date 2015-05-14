.class Lcom/mixpanel/android/viewcrawler/ViewSnapshot;
.super Ljava/lang/Object;
.source "ViewSnapshot.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo;,
        Lcom/mixpanel/android/viewcrawler/ViewSnapshot$CachedBitmap;,
        Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewFinder;,
        Lcom/mixpanel/android/viewcrawler/ViewSnapshot$ClassNameCache;
    }
.end annotation


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "MixpanelAPI.ViewSnapshot"

.field private static final MAX_CLASS_NAME_CACHE_SIZE:I = 0xff


# instance fields
.field private final mClassnameCache:Lcom/mixpanel/android/viewcrawler/ViewSnapshot$ClassNameCache;

.field private final mMainThreadHandler:Landroid/os/Handler;

.field private final mProperties:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mixpanel/android/viewcrawler/PropertyDescription;",
            ">;"
        }
    .end annotation
.end field

.field private final mResourceIds:Lcom/mixpanel/android/mpmetrics/ResourceIds;

.field private final mRootViewFinder:Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewFinder;


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/mixpanel/android/mpmetrics/ResourceIds;)V
    .locals 2
    .param p2, "resourceIds"    # Lcom/mixpanel/android/mpmetrics/ResourceIds;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mixpanel/android/viewcrawler/PropertyDescription;",
            ">;",
            "Lcom/mixpanel/android/mpmetrics/ResourceIds;",
            ")V"
        }
    .end annotation

    .prologue
    .line 45
    .local p1, "properties":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/PropertyDescription;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->mProperties:Ljava/util/List;

    .line 47
    iput-object p2, p0, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->mResourceIds:Lcom/mixpanel/android/mpmetrics/ResourceIds;

    .line 48
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->mMainThreadHandler:Landroid/os/Handler;

    .line 49
    new-instance v0, Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewFinder;

    invoke-direct {v0}, Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewFinder;-><init>()V

    iput-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->mRootViewFinder:Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewFinder;

    .line 50
    new-instance v0, Lcom/mixpanel/android/viewcrawler/ViewSnapshot$ClassNameCache;

    const/16 v1, 0xff

    invoke-direct {v0, v1}, Lcom/mixpanel/android/viewcrawler/ViewSnapshot$ClassNameCache;-><init>(I)V

    iput-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->mClassnameCache:Lcom/mixpanel/android/viewcrawler/ViewSnapshot$ClassNameCache;

    .line 51
    return-void
.end method

.method private addProperties(Landroid/util/JsonWriter;Landroid/view/View;)V
    .locals 6
    .param p1, "j"    # Landroid/util/JsonWriter;
    .param p2, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 215
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 216
    .local v2, "viewClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v3, p0, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->mProperties:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mixpanel/android/viewcrawler/PropertyDescription;

    .line 217
    .local v0, "desc":Lcom/mixpanel/android/viewcrawler/PropertyDescription;
    iget-object v4, v0, Lcom/mixpanel/android/viewcrawler/PropertyDescription;->targetClass:Ljava/lang/Class;

    invoke-virtual {v4, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, v0, Lcom/mixpanel/android/viewcrawler/PropertyDescription;->accessor:Lcom/mixpanel/android/viewcrawler/Caller;

    if-eqz v4, :cond_0

    .line 218
    iget-object v4, v0, Lcom/mixpanel/android/viewcrawler/PropertyDescription;->accessor:Lcom/mixpanel/android/viewcrawler/Caller;

    invoke-virtual {v4, p2}, Lcom/mixpanel/android/viewcrawler/Caller;->applyMethod(Landroid/view/View;)Ljava/lang/Object;

    move-result-object v1

    .line 219
    .local v1, "value":Ljava/lang/Object;
    if-eqz v1, :cond_0

    .line 221
    instance-of v4, v1, Ljava/lang/Number;

    if-eqz v4, :cond_1

    .line 222
    iget-object v4, v0, Lcom/mixpanel/android/viewcrawler/PropertyDescription;->name:Ljava/lang/String;

    invoke-virtual {p1, v4}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v4

    check-cast v1, Ljava/lang/Number;

    .end local v1    # "value":Ljava/lang/Object;
    invoke-virtual {v4, v1}, Landroid/util/JsonWriter;->value(Ljava/lang/Number;)Landroid/util/JsonWriter;

    goto :goto_0

    .line 223
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_1
    instance-of v4, v1, Ljava/lang/Boolean;

    if-eqz v4, :cond_2

    .line 224
    iget-object v4, v0, Lcom/mixpanel/android/viewcrawler/PropertyDescription;->name:Ljava/lang/String;

    invoke-virtual {p1, v4}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v4

    check-cast v1, Ljava/lang/Boolean;

    .end local v1    # "value":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/util/JsonWriter;->value(Z)Landroid/util/JsonWriter;

    goto :goto_0

    .line 226
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_2
    iget-object v4, v0, Lcom/mixpanel/android/viewcrawler/PropertyDescription;->name:Ljava/lang/String;

    invoke-virtual {p1, v4}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    goto :goto_0

    .line 230
    .end local v0    # "desc":Lcom/mixpanel/android/viewcrawler/PropertyDescription;
    .end local v1    # "value":Ljava/lang/Object;
    :cond_3
    return-void
.end method

.method private snapshotView(Landroid/util/JsonWriter;Landroid/view/View;)V
    .locals 16
    .param p1, "j"    # Landroid/util/JsonWriter;
    .param p2, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getId()I

    move-result v11

    .line 130
    .local v11, "viewId":I
    const/4 v13, -0x1

    if-ne v13, v11, :cond_5

    .line 131
    const/4 v12, 0x0

    .line 136
    .local v12, "viewIdName":Ljava/lang/String;
    :goto_0
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonWriter;->beginObject()Landroid/util/JsonWriter;

    .line 137
    const-string v13, "hashCode"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->hashCode()I

    move-result v14

    int-to-long v14, v14

    invoke-virtual {v13, v14, v15}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 138
    const-string v13, "id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    int-to-long v14, v11

    invoke-virtual {v13, v14, v15}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 139
    const-string v13, "mp_id_name"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    invoke-virtual {v13, v12}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 141
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v4

    .line 142
    .local v4, "description":Ljava/lang/CharSequence;
    if-nez v4, :cond_6

    .line 143
    const-string v13, "contentDescription"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    invoke-virtual {v13}, Landroid/util/JsonWriter;->nullValue()Landroid/util/JsonWriter;

    .line 148
    :goto_1
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v8

    .line 149
    .local v8, "tag":Ljava/lang/Object;
    if-nez v8, :cond_7

    .line 150
    const-string v13, "tag"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    invoke-virtual {v13}, Landroid/util/JsonWriter;->nullValue()Landroid/util/JsonWriter;

    .line 155
    :cond_0
    :goto_2
    const-string v13, "top"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTop()I

    move-result v14

    int-to-long v14, v14

    invoke-virtual {v13, v14, v15}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 156
    const-string v13, "left"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLeft()I

    move-result v14

    int-to-long v14, v14

    invoke-virtual {v13, v14, v15}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 157
    const-string v13, "width"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getWidth()I

    move-result v14

    int-to-long v14, v14

    invoke-virtual {v13, v14, v15}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 158
    const-string v13, "height"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getHeight()I

    move-result v14

    int-to-long v14, v14

    invoke-virtual {v13, v14, v15}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 159
    const-string v13, "scrollX"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getScrollX()I

    move-result v14

    int-to-long v14, v14

    invoke-virtual {v13, v14, v15}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 160
    const-string v13, "scrollY"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getScrollY()I

    move-result v14

    int-to-long v14, v14

    invoke-virtual {v13, v14, v15}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 161
    const-string v13, "visibility"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getVisibility()I

    move-result v14

    int-to-long v14, v14

    invoke-virtual {v13, v14, v15}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 163
    const/4 v9, 0x0

    .line 164
    .local v9, "translationX":F
    const/4 v10, 0x0

    .line 165
    .local v10, "translationY":F
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v14, 0xb

    if-lt v13, v14, :cond_1

    .line 166
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTranslationX()F

    move-result v9

    .line 167
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTranslationY()F

    move-result v10

    .line 170
    :cond_1
    const-string v13, "translationX"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    float-to-double v14, v9

    invoke-virtual {v13, v14, v15}, Landroid/util/JsonWriter;->value(D)Landroid/util/JsonWriter;

    .line 171
    const-string v13, "translationY"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    float-to-double v14, v10

    invoke-virtual {v13, v14, v15}, Landroid/util/JsonWriter;->value(D)Landroid/util/JsonWriter;

    .line 173
    const-string v13, "classes"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 174
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonWriter;->beginArray()Landroid/util/JsonWriter;

    .line 175
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    .line 177
    .local v7, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->mClassnameCache:Lcom/mixpanel/android/viewcrawler/ViewSnapshot$ClassNameCache;

    invoke-virtual {v13, v7}, Lcom/mixpanel/android/viewcrawler/ViewSnapshot$ClassNameCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 178
    invoke-virtual {v7}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v7

    .line 179
    const-class v13, Ljava/lang/Object;

    if-eq v7, v13, :cond_3

    if-nez v7, :cond_2

    .line 180
    :cond_3
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonWriter;->endArray()Landroid/util/JsonWriter;

    .line 182
    invoke-direct/range {p0 .. p2}, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->addProperties(Landroid/util/JsonWriter;Landroid/view/View;)V

    .line 184
    const-string v13, "subviews"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 185
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonWriter;->beginArray()Landroid/util/JsonWriter;

    .line 186
    move-object/from16 v0, p2

    instance-of v13, v0, Landroid/view/ViewGroup;

    if-eqz v13, :cond_8

    move-object/from16 v5, p2

    .line 187
    check-cast v5, Landroid/view/ViewGroup;

    .line 188
    .local v5, "group":Landroid/view/ViewGroup;
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    .line 189
    .local v3, "childCount":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3
    if-ge v6, v3, :cond_8

    .line 190
    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 192
    .local v2, "child":Landroid/view/View;
    if-eqz v2, :cond_4

    .line 193
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v13

    int-to-long v14, v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 189
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 133
    .end local v2    # "child":Landroid/view/View;
    .end local v3    # "childCount":I
    .end local v4    # "description":Ljava/lang/CharSequence;
    .end local v5    # "group":Landroid/view/ViewGroup;
    .end local v6    # "i":I
    .end local v7    # "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "tag":Ljava/lang/Object;
    .end local v9    # "translationX":F
    .end local v10    # "translationY":F
    .end local v12    # "viewIdName":Ljava/lang/String;
    :cond_5
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->mResourceIds:Lcom/mixpanel/android/mpmetrics/ResourceIds;

    invoke-interface {v13, v11}, Lcom/mixpanel/android/mpmetrics/ResourceIds;->nameForId(I)Ljava/lang/String;

    move-result-object v12

    .restart local v12    # "viewIdName":Ljava/lang/String;
    goto/16 :goto_0

    .line 145
    .restart local v4    # "description":Ljava/lang/CharSequence;
    :cond_6
    const-string v13, "contentDescription"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    goto/16 :goto_1

    .line 151
    .restart local v8    # "tag":Ljava/lang/Object;
    :cond_7
    instance-of v13, v8, Ljava/lang/CharSequence;

    if-eqz v13, :cond_0

    .line 152
    const-string v13, "tag"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v13

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    goto/16 :goto_2

    .line 197
    .restart local v7    # "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v9    # "translationX":F
    .restart local v10    # "translationY":F
    :cond_8
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonWriter;->endArray()Landroid/util/JsonWriter;

    .line 198
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonWriter;->endObject()Landroid/util/JsonWriter;

    .line 200
    move-object/from16 v0, p2

    instance-of v13, v0, Landroid/view/ViewGroup;

    if-eqz v13, :cond_a

    move-object/from16 v5, p2

    .line 201
    check-cast v5, Landroid/view/ViewGroup;

    .line 202
    .restart local v5    # "group":Landroid/view/ViewGroup;
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    .line 203
    .restart local v3    # "childCount":I
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_4
    if-ge v6, v3, :cond_a

    .line 204
    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 206
    .restart local v2    # "child":Landroid/view/View;
    if-eqz v2, :cond_9

    .line 207
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v2}, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->snapshotView(Landroid/util/JsonWriter;Landroid/view/View;)V

    .line 203
    :cond_9
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 211
    .end local v2    # "child":Landroid/view/View;
    .end local v3    # "childCount":I
    .end local v5    # "group":Landroid/view/ViewGroup;
    .end local v6    # "i":I
    :cond_a
    return-void
.end method


# virtual methods
.method getProperties()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mixpanel/android/viewcrawler/PropertyDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 116
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->mProperties:Ljava/util/List;

    return-object v0
.end method

.method snapshotViewHierarchy(Landroid/util/JsonWriter;Landroid/view/View;)V
    .locals 0
    .param p1, "j"    # Landroid/util/JsonWriter;
    .param p2, "rootView"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    invoke-virtual {p1}, Landroid/util/JsonWriter;->beginArray()Landroid/util/JsonWriter;

    .line 122
    invoke-direct {p0, p1, p2}, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->snapshotView(Landroid/util/JsonWriter;Landroid/view/View;)V

    .line 123
    invoke-virtual {p1}, Landroid/util/JsonWriter;->endArray()Landroid/util/JsonWriter;

    .line 124
    return-void
.end method

.method public snapshots(Lcom/mixpanel/android/viewcrawler/UIThreadSet;Ljava/io/OutputStream;)V
    .locals 12
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mixpanel/android/viewcrawler/UIThreadSet",
            "<",
            "Landroid/app/Activity;",
            ">;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    .local p1, "liveActivities":Lcom/mixpanel/android/viewcrawler/UIThreadSet;, "Lcom/mixpanel/android/viewcrawler/UIThreadSet<Landroid/app/Activity;>;"
    iget-object v8, p0, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->mRootViewFinder:Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewFinder;

    invoke-virtual {v8, p1}, Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewFinder;->findInActivities(Lcom/mixpanel/android/viewcrawler/UIThreadSet;)V

    .line 60
    new-instance v4, Ljava/util/concurrent/FutureTask;

    iget-object v8, p0, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->mRootViewFinder:Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewFinder;

    invoke-direct {v4, v8}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 61
    .local v4, "infoFuture":Ljava/util/concurrent/FutureTask;, "Ljava/util/concurrent/FutureTask<Ljava/util/List<Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo;>;>;"
    iget-object v8, p0, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->mMainThreadHandler:Landroid/os/Handler;

    invoke-virtual {v8, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 63
    new-instance v7, Ljava/io/OutputStreamWriter;

    invoke-direct {v7, p2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 66
    .local v7, "writer":Ljava/io/OutputStreamWriter;
    const-wide/16 v8, 0x1

    :try_start_0
    sget-object v10, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v8, v9, v10}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 67
    .local v5, "infoList":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v3

    .line 68
    .local v3, "infoCount":I
    const-string v8, "["

    invoke-virtual {v7, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 69
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_1

    .line 70
    if-lez v1, :cond_0

    .line 71
    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 73
    :cond_0
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo;

    .line 74
    .local v2, "info":Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo;
    const-string v8, "{"

    invoke-virtual {v7, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 75
    const-string v8, "\"activity\":"

    invoke-virtual {v7, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 76
    iget-object v8, v2, Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo;->activityName:Ljava/lang/String;

    invoke-static {v8}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 77
    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 78
    const-string v8, "\"scale\":"

    invoke-virtual {v7, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 79
    const-string v8, "%s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget v11, v2, Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo;->scale:F

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 80
    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 81
    const-string v8, "\"serialized_objects\":"

    invoke-virtual {v7, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 83
    new-instance v6, Landroid/util/JsonWriter;

    invoke-direct {v6, v7}, Landroid/util/JsonWriter;-><init>(Ljava/io/Writer;)V

    .line 84
    .local v6, "j":Landroid/util/JsonWriter;
    invoke-virtual {v6}, Landroid/util/JsonWriter;->beginObject()Landroid/util/JsonWriter;

    .line 85
    const-string v8, "rootObject"

    invoke-virtual {v6, v8}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    move-result-object v8

    iget-object v9, v2, Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo;->rootView:Landroid/view/View;

    invoke-virtual {v9}, Ljava/lang/Object;->hashCode()I

    move-result v9

    int-to-long v10, v9

    invoke-virtual {v8, v10, v11}, Landroid/util/JsonWriter;->value(J)Landroid/util/JsonWriter;

    .line 86
    const-string v8, "objects"

    invoke-virtual {v6, v8}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 87
    iget-object v8, v2, Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo;->rootView:Landroid/view/View;

    invoke-virtual {p0, v6, v8}, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;->snapshotViewHierarchy(Landroid/util/JsonWriter;Landroid/view/View;)V

    .line 88
    invoke-virtual {v6}, Landroid/util/JsonWriter;->endObject()Landroid/util/JsonWriter;

    .line 89
    invoke-virtual {v6}, Landroid/util/JsonWriter;->flush()V

    .line 91
    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 92
    const-string v8, "\"screenshot\":"

    invoke-virtual {v7, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 93
    invoke-virtual {v7}, Ljava/io/OutputStreamWriter;->flush()V

    .line 94
    iget-object v8, v2, Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo;->screenshot:Lcom/mixpanel/android/viewcrawler/ViewSnapshot$CachedBitmap;

    sget-object v9, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v10, 0x64

    invoke-virtual {v8, v9, v10, p2}, Lcom/mixpanel/android/viewcrawler/ViewSnapshot$CachedBitmap;->writeBitmapJSON(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)V

    .line 95
    const-string v8, "}"

    invoke-virtual {v7, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 69
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 97
    .end local v2    # "info":Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo;
    .end local v6    # "j":Landroid/util/JsonWriter;
    :cond_1
    const-string v8, "]"

    invoke-virtual {v7, v8}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 98
    invoke-virtual {v7}, Ljava/io/OutputStreamWriter;->flush()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_2

    .line 112
    .end local v1    # "i":I
    .end local v3    # "infoCount":I
    .end local v5    # "infoList":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo;>;"
    :cond_2
    :goto_1
    return-void

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-boolean v8, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v8, :cond_2

    .line 101
    const-string v8, "MixpanelAPI.ViewSnapshot"

    const-string v9, "Screenshot interrupted, no screenshot will be sent."

    invoke-static {v8, v9, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 103
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v0

    .line 104
    .local v0, "e":Ljava/util/concurrent/TimeoutException;
    sget-boolean v8, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v8, :cond_2

    .line 105
    const-string v8, "MixpanelAPI.ViewSnapshot"

    const-string v9, "Screenshot took more than 1 second to be scheduled and executed. No screenshot will be sent."

    invoke-static {v8, v9, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 107
    .end local v0    # "e":Ljava/util/concurrent/TimeoutException;
    :catch_2
    move-exception v0

    .line 108
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    sget-boolean v8, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v8, :cond_2

    .line 109
    const-string v8, "MixpanelAPI.ViewSnapshot"

    const-string v9, "Exception thrown during screenshot attempt"

    invoke-static {v8, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method
