.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "AC3TrackImpl.java"


# static fields
.field static bitRateAndFrameSizeTable:[[[[I


# instance fields
.field private final dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

.field private duration:[J

.field private sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

.field private samples:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation
.end field

.field private trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 276
    const/16 v0, 0x13

    filled-new-array {v0, v4, v5, v4}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[[[I

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    .line 280
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x20

    aput v1, v0, v2

    .line 281
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x20

    aput v1, v0, v2

    .line 282
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x40

    aput v1, v0, v3

    .line 283
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x40

    aput v1, v0, v3

    .line 284
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x28

    aput v1, v0, v2

    .line 285
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x28

    aput v1, v0, v2

    .line 286
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x50

    aput v1, v0, v3

    .line 287
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x50

    aput v1, v0, v3

    .line 288
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v4

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x30

    aput v1, v0, v2

    .line 289
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v4

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x30

    aput v1, v0, v2

    .line 290
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v4

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x60

    aput v1, v0, v3

    .line 291
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v4

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x60

    aput v1, v0, v3

    .line 292
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v5

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x38

    aput v1, v0, v2

    .line 293
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v5

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x38

    aput v1, v0, v2

    .line 294
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v5

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x70

    aput v1, v0, v3

    .line 295
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v5

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x70

    aput v1, v0, v3

    .line 296
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v6

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x40

    aput v1, v0, v2

    .line 297
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v6

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x40

    aput v1, v0, v2

    .line 298
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v6

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x80

    aput v1, v0, v3

    .line 299
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v6

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x80

    aput v1, v0, v3

    .line 300
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x5

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x50

    aput v1, v0, v2

    .line 301
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x5

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x50

    aput v1, v0, v2

    .line 302
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x5

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0xa0

    aput v1, v0, v3

    .line 303
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x5

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0xa0

    aput v1, v0, v3

    .line 304
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x6

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x60

    aput v1, v0, v2

    .line 305
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x6

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x60

    aput v1, v0, v2

    .line 306
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x6

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0xc0

    aput v1, v0, v3

    .line 307
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x6

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0xc0

    aput v1, v0, v3

    .line 308
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x7

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x70

    aput v1, v0, v2

    .line 309
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x7

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x70

    aput v1, v0, v2

    .line 310
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x7

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0xe0

    aput v1, v0, v3

    .line 311
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x7

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0xe0

    aput v1, v0, v3

    .line 312
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x8

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x80

    aput v1, v0, v2

    .line 313
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x8

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x80

    aput v1, v0, v2

    .line 314
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x8

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x100

    aput v1, v0, v3

    .line 315
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x8

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x100

    aput v1, v0, v3

    .line 316
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x9

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0xa0

    aput v1, v0, v2

    .line 317
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x9

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0xa0

    aput v1, v0, v2

    .line 318
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x9

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x140

    aput v1, v0, v3

    .line 319
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x9

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x140

    aput v1, v0, v3

    .line 320
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xa

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0xc0

    aput v1, v0, v2

    .line 321
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xa

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0xc0

    aput v1, v0, v2

    .line 322
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xa

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x180

    aput v1, v0, v3

    .line 323
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xa

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x180

    aput v1, v0, v3

    .line 324
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xb

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0xe0

    aput v1, v0, v2

    .line 325
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xb

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0xe0

    aput v1, v0, v2

    .line 326
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xb

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x1c0

    aput v1, v0, v3

    .line 327
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xb

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x1c0

    aput v1, v0, v3

    .line 328
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xc

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x100

    aput v1, v0, v2

    .line 329
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xc

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x100

    aput v1, v0, v2

    .line 330
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xc

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x200

    aput v1, v0, v3

    .line 331
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xc

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x200

    aput v1, v0, v3

    .line 332
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xd

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x140

    aput v1, v0, v2

    .line 333
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xd

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x140

    aput v1, v0, v2

    .line 334
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xd

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x280

    aput v1, v0, v3

    .line 335
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xd

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x280

    aput v1, v0, v3

    .line 336
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xe

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x180

    aput v1, v0, v2

    .line 337
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xe

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x180

    aput v1, v0, v2

    .line 338
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xe

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x300

    aput v1, v0, v3

    .line 339
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xe

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x300

    aput v1, v0, v3

    .line 340
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xf

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x1c0

    aput v1, v0, v2

    .line 341
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xf

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x1c0

    aput v1, v0, v2

    .line 342
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xf

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x380

    aput v1, v0, v3

    .line 343
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xf

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x380

    aput v1, v0, v3

    .line 344
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x10

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x200

    aput v1, v0, v2

    .line 345
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x10

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x200

    aput v1, v0, v2

    .line 346
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x10

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x400

    aput v1, v0, v3

    .line 347
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x10

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x400

    aput v1, v0, v3

    .line 348
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x11

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x240

    aput v1, v0, v2

    .line 349
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x11

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x240

    aput v1, v0, v2

    .line 350
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x11

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x480

    aput v1, v0, v3

    .line 351
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x11

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x480

    aput v1, v0, v3

    .line 352
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x12

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x280

    aput v1, v0, v2

    .line 353
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x12

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x280

    aput v1, v0, v2

    .line 354
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x12

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    const/16 v1, 0x500

    aput v1, v0, v3

    .line 355
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x12

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    const/16 v1, 0x500

    aput v1, v0, v3

    .line 358
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x20

    aput v1, v0, v2

    .line 359
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x20

    aput v1, v0, v2

    .line 360
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x45

    aput v1, v0, v3

    .line 361
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x46

    aput v1, v0, v3

    .line 362
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x28

    aput v1, v0, v2

    .line 363
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x28

    aput v1, v0, v2

    .line 364
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x57

    aput v1, v0, v3

    .line 365
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x58

    aput v1, v0, v3

    .line 366
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v4

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x30

    aput v1, v0, v2

    .line 367
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v4

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x30

    aput v1, v0, v2

    .line 368
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v4

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x68

    aput v1, v0, v3

    .line 369
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v4

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x69

    aput v1, v0, v3

    .line 370
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v5

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x38

    aput v1, v0, v2

    .line 371
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v5

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x38

    aput v1, v0, v2

    .line 372
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v5

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x79

    aput v1, v0, v3

    .line 373
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v5

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x7a

    aput v1, v0, v3

    .line 374
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v6

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x40

    aput v1, v0, v2

    .line 375
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v6

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x40

    aput v1, v0, v2

    .line 376
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v6

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x8b

    aput v1, v0, v3

    .line 377
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v6

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x8c

    aput v1, v0, v3

    .line 378
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x5

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x50

    aput v1, v0, v2

    .line 379
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x5

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x50

    aput v1, v0, v2

    .line 380
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x5

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0xae

    aput v1, v0, v3

    .line 381
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x5

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0xaf

    aput v1, v0, v3

    .line 382
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x6

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x60

    aput v1, v0, v2

    .line 383
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x6

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x60

    aput v1, v0, v2

    .line 384
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x6

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0xd0

    aput v1, v0, v3

    .line 385
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x6

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0xd1

    aput v1, v0, v3

    .line 386
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x7

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x70

    aput v1, v0, v2

    .line 387
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x7

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x70

    aput v1, v0, v2

    .line 388
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x7

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0xf3

    aput v1, v0, v3

    .line 389
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x7

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0xf4

    aput v1, v0, v3

    .line 390
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x8

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x80

    aput v1, v0, v2

    .line 391
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x8

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x80

    aput v1, v0, v2

    .line 392
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x8

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x116

    aput v1, v0, v3

    .line 393
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x8

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x117

    aput v1, v0, v3

    .line 394
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x9

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0xa0

    aput v1, v0, v2

    .line 395
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x9

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0xa0

    aput v1, v0, v2

    .line 396
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x9

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x15c

    aput v1, v0, v3

    .line 397
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x9

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x15d

    aput v1, v0, v3

    .line 398
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xa

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0xc0

    aput v1, v0, v2

    .line 399
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xa

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0xc0

    aput v1, v0, v2

    .line 400
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xa

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x1a1

    aput v1, v0, v3

    .line 401
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xa

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x1a2

    aput v1, v0, v3

    .line 402
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xb

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0xe0

    aput v1, v0, v2

    .line 403
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xb

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0xe0

    aput v1, v0, v2

    .line 404
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xb

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x1e7

    aput v1, v0, v3

    .line 405
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xb

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x1e8

    aput v1, v0, v3

    .line 406
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xc

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x100

    aput v1, v0, v2

    .line 407
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xc

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x100

    aput v1, v0, v2

    .line 408
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xc

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x22d

    aput v1, v0, v3

    .line 409
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xc

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x22e

    aput v1, v0, v3

    .line 410
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xd

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x140

    aput v1, v0, v2

    .line 411
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xd

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x140

    aput v1, v0, v2

    .line 412
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xd

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x2b8

    aput v1, v0, v3

    .line 413
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xd

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x2b9

    aput v1, v0, v3

    .line 414
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xe

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x180

    aput v1, v0, v2

    .line 415
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xe

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x180

    aput v1, v0, v2

    .line 416
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xe

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x343

    aput v1, v0, v3

    .line 417
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xe

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x344

    aput v1, v0, v3

    .line 418
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xf

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x1c0

    aput v1, v0, v2

    .line 419
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xf

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x1c0

    aput v1, v0, v2

    .line 420
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xf

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x3cf

    aput v1, v0, v3

    .line 421
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xf

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x3cf

    aput v1, v0, v3

    .line 422
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x10

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x200

    aput v1, v0, v2

    .line 423
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x10

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x200

    aput v1, v0, v2

    .line 424
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x10

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x45a

    aput v1, v0, v3

    .line 425
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x10

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x45b

    aput v1, v0, v3

    .line 426
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x11

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x240

    aput v1, v0, v2

    .line 427
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x11

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x240

    aput v1, v0, v2

    .line 428
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x11

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x4e5

    aput v1, v0, v3

    .line 429
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x11

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x4e6

    aput v1, v0, v3

    .line 430
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x12

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x280

    aput v1, v0, v2

    .line 431
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x12

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x280

    aput v1, v0, v2

    .line 432
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x12

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    const/16 v1, 0x571

    aput v1, v0, v3

    .line 433
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x12

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    const/16 v1, 0x572

    aput v1, v0, v3

    .line 436
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x20

    aput v1, v0, v2

    .line 437
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x20

    aput v1, v0, v2

    .line 438
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v2

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x60

    aput v1, v0, v3

    .line 439
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v2

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x60

    aput v1, v0, v3

    .line 440
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x28

    aput v1, v0, v2

    .line 441
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x28

    aput v1, v0, v2

    .line 442
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v3

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x78

    aput v1, v0, v3

    .line 443
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v3

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x78

    aput v1, v0, v3

    .line 444
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v4

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x30

    aput v1, v0, v2

    .line 445
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v4

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x30

    aput v1, v0, v2

    .line 446
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v4

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x90

    aput v1, v0, v3

    .line 447
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v4

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x90

    aput v1, v0, v3

    .line 448
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v5

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x38

    aput v1, v0, v2

    .line 449
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v5

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x38

    aput v1, v0, v2

    .line 450
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v5

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0xa8

    aput v1, v0, v3

    .line 451
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v5

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0xa8

    aput v1, v0, v3

    .line 452
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v6

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x40

    aput v1, v0, v2

    .line 453
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v6

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x40

    aput v1, v0, v2

    .line 454
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v6

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0xc0

    aput v1, v0, v3

    .line 455
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v0, v0, v6

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0xc0

    aput v1, v0, v3

    .line 456
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x5

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x50

    aput v1, v0, v2

    .line 457
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x5

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x50

    aput v1, v0, v2

    .line 458
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x5

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0xf0

    aput v1, v0, v3

    .line 459
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x5

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0xf0

    aput v1, v0, v3

    .line 460
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x6

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x60

    aput v1, v0, v2

    .line 461
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x6

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x60

    aput v1, v0, v2

    .line 462
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x6

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x120

    aput v1, v0, v3

    .line 463
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x6

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x120

    aput v1, v0, v3

    .line 464
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x7

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x70

    aput v1, v0, v2

    .line 465
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x7

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x70

    aput v1, v0, v2

    .line 466
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x7

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x150

    aput v1, v0, v3

    .line 467
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/4 v1, 0x7

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x150

    aput v1, v0, v3

    .line 468
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x8

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x80

    aput v1, v0, v2

    .line 469
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x8

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x80

    aput v1, v0, v2

    .line 470
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x8

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x180

    aput v1, v0, v3

    .line 471
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x8

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x180

    aput v1, v0, v3

    .line 472
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x9

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0xa0

    aput v1, v0, v2

    .line 473
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x9

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0xa0

    aput v1, v0, v2

    .line 474
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x9

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x1e0

    aput v1, v0, v3

    .line 475
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x9

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x1e0

    aput v1, v0, v3

    .line 476
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xa

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0xc0

    aput v1, v0, v2

    .line 477
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xa

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0xc0

    aput v1, v0, v2

    .line 478
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xa

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x240

    aput v1, v0, v3

    .line 479
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xa

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x240

    aput v1, v0, v3

    .line 480
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xb

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0xe0

    aput v1, v0, v2

    .line 481
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xb

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0xe0

    aput v1, v0, v2

    .line 482
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xb

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x2a0

    aput v1, v0, v3

    .line 483
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xb

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x2a0

    aput v1, v0, v3

    .line 484
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xc

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x100

    aput v1, v0, v2

    .line 485
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xc

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x100

    aput v1, v0, v2

    .line 486
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xc

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x300

    aput v1, v0, v3

    .line 487
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xc

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x300

    aput v1, v0, v3

    .line 488
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xd

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x140

    aput v1, v0, v2

    .line 489
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xd

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x140

    aput v1, v0, v2

    .line 490
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xd

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x3c0

    aput v1, v0, v3

    .line 491
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xd

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x3c0

    aput v1, v0, v3

    .line 492
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xe

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x180

    aput v1, v0, v2

    .line 493
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xe

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x180

    aput v1, v0, v2

    .line 494
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xe

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x480

    aput v1, v0, v3

    .line 495
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xe

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x480

    aput v1, v0, v3

    .line 496
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xf

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x1c0

    aput v1, v0, v2

    .line 497
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xf

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x1c0

    aput v1, v0, v2

    .line 498
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xf

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x540

    aput v1, v0, v3

    .line 499
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0xf

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x540

    aput v1, v0, v3

    .line 500
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x10

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x200

    aput v1, v0, v2

    .line 501
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x10

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x200

    aput v1, v0, v2

    .line 502
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x10

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x600

    aput v1, v0, v3

    .line 503
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x10

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x600

    aput v1, v0, v3

    .line 504
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x11

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x240

    aput v1, v0, v2

    .line 505
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x11

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x240

    aput v1, v0, v2

    .line 506
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x11

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x6c0

    aput v1, v0, v3

    .line 507
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x11

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x6c0

    aput v1, v0, v3

    .line 508
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x12

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x280

    aput v1, v0, v2

    .line 509
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x12

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x280

    aput v1, v0, v2

    .line 510
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x12

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    aget-object v0, v0, v4

    const/16 v1, 0x780

    aput v1, v0, v3

    .line 511
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    const/16 v1, 0x12

    aget-object v0, v0, v1

    aget-object v0, v0, v3

    aget-object v0, v0, v4

    const/16 v1, 0x780

    aput v1, v0, v3

    .line 512
    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    .locals 1
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    const-string v0, "eng"

    invoke-direct {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/lang/String;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/lang/String;)V
    .locals 4
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "lang"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 28
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;-><init>()V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    .line 38
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    .line 39
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-virtual {v1, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setLanguage(Ljava/lang/String;)V

    .line 41
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->readSamples()Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->samples:Ljava/util/List;

    .line 44
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;-><init>()V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 45
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->createAudioSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    move-result-object v0

    .line 46
    .local v0, "ase":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 48
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setCreationTime(Ljava/util/Date;)V

    .line 49
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setModificationTime(Ljava/util/Date;)V

    .line 50
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-virtual {v1, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setLanguage(Ljava/lang/String;)V

    .line 51
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSampleRate()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setTimescale(J)V

    .line 52
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setVolume(F)V

    .line 54
    return-void
.end method

.method private createAudioSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->samples:Ljava/util/List;

    const/16 v16, 0x0

    invoke-interface/range {v15 .. v16}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    invoke-interface {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 101
    .local v5, "bb":Ljava/nio/ByteBuffer;
    new-instance v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;

    invoke-direct {v6, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 102
    .local v6, "brb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    const/16 v15, 0x10

    invoke-virtual {v6, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v14

    .line 103
    .local v14, "syncword":I
    const/16 v15, 0xb77

    if-eq v14, v15, :cond_0

    .line 104
    new-instance v15, Ljava/lang/RuntimeException;

    const-string v16, "Stream doesn\'t seem to be AC3"

    invoke-direct/range {v15 .. v16}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 106
    :cond_0
    const/16 v15, 0x10

    invoke-virtual {v6, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 107
    const/4 v15, 0x2

    invoke-virtual {v6, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v11

    .line 109
    .local v11, "fscod":I
    packed-switch v11, :pswitch_data_0

    .line 123
    new-instance v15, Ljava/lang/RuntimeException;

    const-string v16, "Unsupported Sample Rate"

    invoke-direct/range {v15 .. v16}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 111
    :pswitch_0
    const v13, 0xbb80

    .line 127
    .local v13, "samplerate":I
    :goto_0
    const/4 v15, 0x6

    invoke-virtual {v6, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v10

    .line 130
    .local v10, "frmsizecod":I
    const/4 v15, 0x5

    invoke-virtual {v6, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v7

    .line 131
    .local v7, "bsid":I
    const/4 v15, 0x3

    invoke-virtual {v6, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v8

    .line 132
    .local v8, "bsmod":I
    const/4 v15, 0x3

    invoke-virtual {v6, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    .line 134
    .local v3, "acmod":I
    const/16 v15, 0x10

    if-ne v7, v15, :cond_1

    .line 135
    new-instance v15, Ljava/lang/RuntimeException;

    const-string v16, "You cannot read E-AC-3 track with AC3TrackImpl.class - user EC3TrackImpl.class"

    invoke-direct/range {v15 .. v16}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 115
    .end local v3    # "acmod":I
    .end local v7    # "bsid":I
    .end local v8    # "bsmod":I
    .end local v10    # "frmsizecod":I
    .end local v13    # "samplerate":I
    :pswitch_1
    const v13, 0xac44

    .line 116
    .restart local v13    # "samplerate":I
    goto :goto_0

    .line 119
    .end local v13    # "samplerate":I
    :pswitch_2
    const/16 v13, 0x7d00

    .line 120
    .restart local v13    # "samplerate":I
    goto :goto_0

    .line 138
    .restart local v3    # "acmod":I
    .restart local v7    # "bsid":I
    .restart local v8    # "bsmod":I
    .restart local v10    # "frmsizecod":I
    :cond_1
    const/16 v15, 0x9

    if-ne v7, v15, :cond_6

    .line 139
    div-int/lit8 v13, v13, 0x2

    .line 144
    :cond_2
    const/4 v15, 0x1

    if-eq v3, v15, :cond_3

    and-int/lit8 v15, v3, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_3

    .line 145
    const/4 v15, 0x2

    invoke-virtual {v6, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 148
    :cond_3
    and-int/lit8 v15, v3, 0x4

    if-eqz v15, :cond_4

    .line 149
    const/4 v15, 0x2

    invoke-virtual {v6, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 152
    :cond_4
    const/4 v15, 0x2

    if-ne v3, v15, :cond_5

    .line 153
    const/4 v15, 0x2

    invoke-virtual {v6, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 156
    :cond_5
    packed-switch v3, :pswitch_data_1

    .line 189
    new-instance v15, Ljava/lang/RuntimeException;

    const-string v16, "Unsupported acmod"

    invoke-direct/range {v15 .. v16}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 140
    :cond_6
    const/16 v15, 0x8

    if-eq v7, v15, :cond_2

    const/4 v15, 0x6

    if-eq v7, v15, :cond_2

    .line 141
    new-instance v15, Ljava/lang/RuntimeException;

    const-string v16, "Unsupported bsid"

    invoke-direct/range {v15 .. v16}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 158
    :pswitch_3
    const/4 v9, 0x2

    .line 193
    .local v9, "channelCount":I
    :goto_1
    const/4 v15, 0x1

    invoke-virtual {v6, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v12

    .line 195
    .local v12, "lfeon":I
    const/4 v15, 0x1

    if-ne v12, v15, :cond_7

    .line 196
    add-int/lit8 v9, v9, 0x1

    .line 198
    :cond_7
    new-instance v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    const-string v15, "ac-3"

    invoke-direct {v4, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;-><init>(Ljava/lang/String;)V

    .line 199
    .local v4, "audioSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    const/4 v15, 0x2

    invoke-virtual {v4, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setChannelCount(I)V

    .line 200
    int-to-long v0, v13

    move-wide/from16 v16, v0

    move-wide/from16 v0, v16

    invoke-virtual {v4, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSampleRate(J)V

    .line 201
    const/4 v15, 0x1

    invoke-virtual {v4, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setDataReferenceIndex(I)V

    .line 202
    const/16 v15, 0x10

    invoke-virtual {v4, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSampleSize(I)V

    .line 204
    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AC3SpecificBox;

    invoke-direct {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AC3SpecificBox;-><init>()V

    .line 205
    .local v2, "ac3":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AC3SpecificBox;
    invoke-virtual {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AC3SpecificBox;->setAcmod(I)V

    .line 206
    shr-int/lit8 v15, v10, 0x1

    invoke-virtual {v2, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AC3SpecificBox;->setBitRateCode(I)V

    .line 207
    invoke-virtual {v2, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AC3SpecificBox;->setBsid(I)V

    .line 208
    invoke-virtual {v2, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AC3SpecificBox;->setBsmod(I)V

    .line 209
    invoke-virtual {v2, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AC3SpecificBox;->setFscod(I)V

    .line 210
    invoke-virtual {v2, v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AC3SpecificBox;->setLfeon(I)V

    .line 211
    const/4 v15, 0x0

    invoke-virtual {v2, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AC3SpecificBox;->setReserved(I)V

    .line 213
    invoke-virtual {v4, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 214
    return-object v4

    .line 162
    .end local v2    # "ac3":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/AC3SpecificBox;
    .end local v4    # "audioSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    .end local v9    # "channelCount":I
    .end local v12    # "lfeon":I
    :pswitch_4
    const/4 v9, 0x1

    .line 163
    .restart local v9    # "channelCount":I
    goto :goto_1

    .line 166
    .end local v9    # "channelCount":I
    :pswitch_5
    const/4 v9, 0x2

    .line 167
    .restart local v9    # "channelCount":I
    goto :goto_1

    .line 170
    .end local v9    # "channelCount":I
    :pswitch_6
    const/4 v9, 0x3

    .line 171
    .restart local v9    # "channelCount":I
    goto :goto_1

    .line 174
    .end local v9    # "channelCount":I
    :pswitch_7
    const/4 v9, 0x3

    .line 175
    .restart local v9    # "channelCount":I
    goto :goto_1

    .line 178
    .end local v9    # "channelCount":I
    :pswitch_8
    const/4 v9, 0x4

    .line 179
    .restart local v9    # "channelCount":I
    goto :goto_1

    .line 182
    .end local v9    # "channelCount":I
    :pswitch_9
    const/4 v9, 0x4

    .line 183
    .restart local v9    # "channelCount":I
    goto :goto_1

    .line 186
    .end local v9    # "channelCount":I
    :pswitch_a
    const/4 v9, 0x5

    .line 187
    .restart local v9    # "channelCount":I
    goto :goto_1

    .line 109
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 156
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method private getFrameSize(II)I
    .locals 4
    .param p1, "code"    # I
    .param p2, "fscod"    # I

    .prologue
    const/4 v3, 0x1

    .line 218
    ushr-int/lit8 v1, p1, 0x1

    .line 219
    .local v1, "frmsizecode":I
    and-int/lit8 v0, p1, 0x1

    .line 220
    .local v0, "flag":I
    const/16 v2, 0x12

    if-gt v1, v2, :cond_0

    if-gt v0, v3, :cond_0

    const/4 v2, 0x2

    if-le p2, v2, :cond_1

    .line 221
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Cannot determine framesize of current sample"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 223
    :cond_1
    sget-object v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->bitRateAndFrameSizeTable:[[[[I

    aget-object v2, v2, v1

    aget-object v2, v2, v0

    aget-object v2, v2, p2

    aget v2, v2, v3

    mul-int/lit8 v2, v2, 0x2

    return v2
.end method

.method private readSamples()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 258
    const/4 v0, 0x5

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 259
    .local v10, "header":Ljava/nio/ByteBuffer;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 261
    .local v11, "mysamples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    :goto_0
    const/4 v0, -0x1

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v1, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 262
    const/4 v0, 0x4

    invoke-virtual {v10, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    and-int/lit8 v8, v0, 0x3f

    .line 263
    .local v8, "frmsizecode":I
    const/4 v0, 0x4

    invoke-virtual {v10, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    shr-int/lit8 v9, v0, 0x6

    .line 264
    .local v9, "fscod":I
    invoke-direct {p0, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->getFrameSize(II)I

    move-result v7

    .line 265
    .local v7, "frameSize":I
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl$1SampleImpl;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position()J

    move-result-wide v2

    const-wide/16 v4, 0x5

    sub-long/2addr v2, v4

    int-to-long v4, v7

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl$1SampleImpl;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V

    invoke-interface {v11, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 266
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position()J

    move-result-wide v2

    const-wide/16 v4, 0x5

    sub-long/2addr v2, v4

    int-to-long v4, v7

    add-long/2addr v2, v4

    invoke-interface {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position(J)V

    .line 267
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    goto :goto_0

    .line 270
    .end local v7    # "frameSize":I
    .end local v8    # "frmsizecode":I
    .end local v9    # "fscod":I
    :cond_0
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [J

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->duration:[J

    .line 271
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->duration:[J

    const-wide/16 v2, 0x600

    invoke-static {v0, v2, v3}, Ljava/util/Arrays;->fill([JJ)V

    .line 272
    return-object v11
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->close()V

    .line 58
    return-void
.end method

.method public getCompositionTimeEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    const-string v0, "soun"

    return-object v0
.end method

.method public getSampleDependencies()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 82
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    return-object v0
.end method

.method public declared-synchronized getSampleDurations()[J
    .locals 1

    .prologue
    .line 70
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->duration:[J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getSamples()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->samples:Ljava/util/List;

    return-object v0
.end method

.method public getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
    .locals 1

    .prologue
    .line 94
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSyncSamples()[J
    .locals 1

    .prologue
    .line 78
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AC3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    return-object v0
.end method
