; Route.s : 経路
;


; モジュール宣言
;
    .module Route

; 参照ファイル
;
    .include    "bios.inc"
    .include    "vdp.inc"
    .include    "System.inc"
    .include    "Sound.inc"
    .include    "App.inc"
    .include    "Game.inc"
    .include	"Route.inc"

; 外部変数宣言
;

; マクロの定義
;


; CODE 領域
;
    .area   _CODE

; 経路を初期化する
;
_RouteInitialize::

    ; レジスタの保存

    ; 経路の初期化
    call    RouteBuild
    ld      de, #0x0000
    call    _RouteSetPosition

    ; レジスタの復帰

    ; 終了
    ret


; 経路を更新する
;
_RouteUpdate::

    ; レジスタの保存

    ; レジスタの復帰
    
    ; 終了
    ret

; 経路を描画する
;
_RouteRender::
    
    ; レジスタの保存

    ; 転送の設定
    ld      a, (routePositionOffset + 0x0000)
    or      a
    jr      nz, 11$
    ld      a, #((APP_PATTERN_GENERATOR_TABLE + 0x0000) >> 11)
    ld      (_videoRegister + VDP_R4), a
    ld      de, #routePatternY
    ld      a, (routePositionOffset + 0x0001)
    ld      c, a
    ld      hl, (routePositionScroll)
    ld      a, h
    cp      #(ROUTE_PATTERN_SIZE_Y - ROUTE_PATTERN_VIEW_Y + 0x01)
    jr      nc, 10$
    ld      a, l
    cp      #(ROUTE_PATTERN_SIZE_X - ROUTE_PATTERN_VIEW_X + 0x01)
    ld      hl, #RouteTransfer1x1
    jr      c, 19$
    ld      hl, #RouteTransfer2x1
    jr      19$
10$:
    ld      a, l
    cp      #(ROUTE_PATTERN_SIZE_X - ROUTE_PATTERN_VIEW_X + 0x01)
    ld      hl, #RouteTransfer1x2
    jr      c, 19$
    ld      hl, #RouteTransfer2x2
    jr      19$
11$:
    ld      a, #((APP_PATTERN_GENERATOR_TABLE + 0x0800) >> 11)
    ld      (_videoRegister + VDP_R4), a
    ld      de, #routePatternX
    ld      a, (routePositionOffset + 0x0000)
    ld      c, a
    ld      hl, (routePositionScroll)
    ld      a, h
    cp      #(ROUTE_PATTERN_SIZE_Y - ROUTE_PATTERN_VIEW_Y + 0x01)
    jr      nc, 12$
    ld      a, l
    cp      #(ROUTE_PATTERN_SIZE_X - ROUTE_PATTERN_VIEW_X + 0x01)
    ld      hl, #RouteTransfer1x1
    jr      c, 19$
    ld      hl, #RouteTransfer2x1
    jr      19$
12$:
    ld      a, l
    cp      #(ROUTE_PATTERN_SIZE_X - ROUTE_PATTERN_VIEW_X + 0x01)
    ld      hl, #RouteTransfer1x2
    jr      c, 19$
    ld      hl, #RouteTransfer2x2
;   jr      19$
19$:
    ld      (routeTransferProc), hl
    ld      (routeTransferPattern), de
    ld      a, c
    ld      (routeTransferOffset), a

    ; レジスタの復帰

    ; 終了
    ret

RouteRender_0:
    
    ; レジスタの保存

    ; 経路の描画 (Y)
    ld      a, (routePositionOffset + 0x0000)
    or      a
    jp      nz, 200$
100$:
    ld      a, #((APP_PATTERN_GENERATOR_TABLE + 0x0000) >> 11)
    ld      (_videoRegister + VDP_R4), a
    ld      de, (routePositionScroll)
    ld      a, d
    cp      #(ROUTE_PATTERN_SIZE_Y - ROUTE_PATTERN_VIEW_Y + 0x01)
    jr      nc, 101$
    ld      a, e
    cp      #(ROUTE_PATTERN_SIZE_X - ROUTE_PATTERN_VIEW_X + 0x01)
    jr      c, 110$
    jr      120$
101$:
    ld      a, e
    cp      #(ROUTE_PATTERN_SIZE_X - ROUTE_PATTERN_VIEW_X + 0x01)
    jr      c, 130$
    jr      140$

    ; 分割なし
110$:
    ld      hl, #0x0000
    ld      bc, #((ROUTE_PATTERN_VIEW_Y << 8) | ROUTE_PATTERN_VIEW_X)
    call    180$
    jp      90$

    ; 左右に分割
120$:
    ld      hl, #0x0000
    ld      a, #ROUTE_PATTERN_SIZE_X
    sub     e
    ld      c, a
    ld      b, #ROUTE_PATTERN_VIEW_Y
    call    180$
    ld      l, c
    ld      e, #0x00
    ld      a, #ROUTE_PATTERN_VIEW_X
    sub     c
    ld      c, a
    call    180$
    jp      90$

    ; 上下に分割
130$:
    ld      hl, #0x0000
    ld      c, #ROUTE_PATTERN_VIEW_X
    ld      a, #ROUTE_PATTERN_SIZE_Y
    sub     d
    ld      b, a
    call    180$
    ld      h, b
    ld      d, #0x00
    ld      a, #ROUTE_PATTERN_VIEW_Y
    sub     b
    ld      b, a
    call    180$
    jp      90$

    ; 上下左右に分割
140$:
    ld      hl, #0x0000
    ld      a, #ROUTE_PATTERN_SIZE_X
    sub     e
    ld      c, a
    ld      a, #ROUTE_PATTERN_SIZE_Y
    sub     d
    ld      b, a
    call    180$
    push    hl
    push    bc
    push    de
    ld      l, c
    ld      e, #0x00
    ld      a, #ROUTE_PATTERN_VIEW_X
    sub     c
    ld      c, a
    call    180$
    pop     de
    pop     bc
    pop     hl
    ld      h, b
    ld      d, #0x00
    ld      a, #ROUTE_PATTERN_VIEW_Y
    sub     b
    ld      b, a
    call    180$
    ld      l, c
    ld      e, #0x00
    ld      a, #ROUTE_PATTERN_VIEW_X
    sub     c
    ld      c, a
    call    180$
    jp      90$

    ; 矩形の描画
180$:
    push    hl
    push    bc
    push    de
    push    de
    xor     a
    srl     h
    rra
    srl     h
    rra
    srl     h
    rra
    add     a, l
    ld      l, a
    ld      de, #_patternName
    add     hl, de
    pop     de
    push    hl
    xor     a
    srl     d
    rra
    srl     d
    rra
    add     a, e
    ld      e, a
    ld      hl, #routePatternY
    add     hl, de
    ex      de, hl
    pop     hl
181$:
    push    bc
    push    hl
    push    de
    ld      a, (routePositionOffset + 0x0001)
    ld      b, a
182$:
    ld      a, (de)
    add     a, b
    ld      (hl), a
    inc     de
    inc     hl
    dec     c
    jr      nz, 182$
    pop     de
    ld      hl, #ROUTE_PATTERN_SIZE_X
    add     hl, de
    ex      de, hl
    pop     hl
    ld      bc, #0x0020
    add     hl, bc
    pop     bc
    djnz    181$
    pop     de
    pop     bc
    pop     hl
    ret
    
    ; 経路の描画 (X)
200$:
    ld      a, #((APP_PATTERN_GENERATOR_TABLE + 0x0800) >> 11)
    ld      (_videoRegister + VDP_R4), a
    ld      de, (routePositionScroll)
    ld      a, d
    cp      #(ROUTE_PATTERN_SIZE_Y - ROUTE_PATTERN_VIEW_Y + 0x01)
    jr      nc, 201$
    ld      a, e
    cp      #(ROUTE_PATTERN_SIZE_X - ROUTE_PATTERN_VIEW_X + 0x01)
    jr      c, 210$
    jr      220$
201$:
    ld      a, e
    cp      #(ROUTE_PATTERN_SIZE_X - ROUTE_PATTERN_VIEW_X + 0x01)
    jr      c, 230$
    jr      240$

    ; 分割なし
210$:
    ld      hl, #0x0000
    ld      bc, #((ROUTE_PATTERN_VIEW_Y << 8) | ROUTE_PATTERN_VIEW_X)
    call    280$
    jp      90$

    ; 左右に分割
220$:
    ld      hl, #0x0000
    ld      a, #ROUTE_PATTERN_SIZE_X
    sub     e
    ld      c, a
    ld      b, #ROUTE_PATTERN_VIEW_Y
    call    280$
    ld      l, c
    ld      e, #0x00
    ld      a, #ROUTE_PATTERN_VIEW_X
    sub     c
    ld      c, a
    call    280$
    jp      90$

    ; 上下に分割
230$:
    ld      hl, #0x0000
    ld      c, #ROUTE_PATTERN_VIEW_X
    ld      a, #ROUTE_PATTERN_SIZE_Y
    sub     d
    ld      b, a
    call    280$
    ld      h, b
    ld      d, #0x00
    ld      a, #ROUTE_PATTERN_VIEW_Y
    sub     b
    ld      b, a
    call    280$
    jp      90$

    ; 上下左右に分割
240$:
    ld      hl, #0x0000
    ld      a, #ROUTE_PATTERN_SIZE_X
    sub     e
    ld      c, a
    ld      a, #ROUTE_PATTERN_SIZE_Y
    sub     d
    ld      b, a
    call    280$
    push    hl
    push    bc
    push    de
    ld      l, c
    ld      e, #0x00
    ld      a, #ROUTE_PATTERN_VIEW_X
    sub     c
    ld      c, a
    call    280$
    pop     de
    pop     bc
    pop     hl
    ld      h, b
    ld      d, #0x00
    ld      a, #ROUTE_PATTERN_VIEW_Y
    sub     b
    ld      b, a
    call    280$
    ld      l, c
    ld      e, #0x00
    ld      a, #ROUTE_PATTERN_VIEW_X
    sub     c
    ld      c, a
    call    280$
    jp      90$

    ; 矩形の描画
280$:
    push    hl
    push    bc
    push    de
    push    de
    xor     a
    srl     h
    rra
    srl     h
    rra
    srl     h
    rra
    add     a, l
    ld      l, a
    ld      de, #_patternName
    add     hl, de
    pop     de
    push    hl
    xor     a
    srl     d
    rra
    srl     d
    rra
    add     a, e
    ld      e, a
    ld      hl, #routePatternX
    add     hl, de
    ex      de, hl
    pop     hl
281$:
    push    bc
    push    hl
    push    de
    ld      a, (routePositionOffset + 0x0000)
    ld      b, a
282$:
    ld      a, (de)
    add     a, b
    ld      (hl), a
    inc     de
    inc     hl
    dec     c
    jr      nz, 282$
    pop     de
    ld      hl, #ROUTE_PATTERN_SIZE_X
    add     hl, de
    ex      de, hl
    pop     hl
    ld      bc, #0x0020
    add     hl, bc
    pop     bc
    djnz    281$
    pop     de
    pop     bc
    pop     hl
    ret
    
    ; マップの描画
30$:
    ld      hl, #_patternName
    ld      de, #routeMap
    ld      b, #0x18
31$:
    push    bc
    ld      b, #0x18
32$:
    ld      a, (de)
    ld      (hl), a
    inc     de
    inc     hl
    djnz    32$
    ld      bc, #0x0008
    add     hl, bc
    pop     bc
    djnz    31$
;   jr      90$

    ; 描画の完了
90$:

    ; レジスタの復帰
    
    ; 終了
    ret

; 経路を転送する
;
_RouteTransfer::

    ; レジスタの保存

    ; d  < ポート #0
    ; e  < ポート #1

    ; 経路の転送
    ld      hl, (routeTransferProc)
    jp      (hl)

    ; レジスタの復帰

    ; 終了
    ret

RouteTransfer1x1:

    ; レジスタの保存
    push    de

    ; d  < ポート #0
    ; e  < ポート #1

    ; VRAM アドレスの設定
    ld      c, e
    xor     a
    out     (c), a
    ld      a, (_videoRegister + VDP_R2)
    add     a, a
    add     a, a
    or      #0b01000000
    out     (c), a

    ; パターンネームテーブルの転送
    ld      c, d
    ld      de, (routePositionScroll)
    xor     a
    srl     d
    rra
    srl     d
    rra
    add     a, e
    ld      e, a
    ld      hl, (routeTransferPattern)
    add     hl, de
    ld      de, #(_patternName + ROUTE_PATTERN_VIEW_X)
    ld      b, #ROUTE_PATTERN_VIEW_Y
10$:
    push    bc
    push    hl
    push    de
    ld      a, (routeTransferOffset)
    ld      e, a
    ld      b, #ROUTE_PATTERN_VIEW_X
11$:
    ld      a, (hl)
    add     a, e
    out     (c), a
    inc     hl
    djnz    11$
    pop     hl
    ld      b, #(0x20 - ROUTE_PATTERN_VIEW_X)
12$:
    outi
    jp      nz, 12$
    ld      de, #ROUTE_PATTERN_VIEW_X
    add     hl, de
    ex      de, hl
    pop     hl
    ld      bc, #ROUTE_PATTERN_SIZE_X
    add     hl, bc
    pop     bc
    djnz    10$

    ; レジスタの復帰
    pop     de

    ; 終了
    ret

RouteTransfer2x1:

    ; レジスタの保存
    push    de

    ; d  < ポート #0
    ; e  < ポート #1

    ; VRAM アドレスの設定
    ld      c, e
    xor     a
    out     (c), a
    ld      a, (_videoRegister + VDP_R2)
    add     a, a
    add     a, a
    or      #0b01000000
    out     (c), a

    ; パターンネームテーブルの転送
    ld      c, d
    ld      de, (routePositionScroll)
    xor     a
    srl     d
    rra
    srl     d
    rra
    add     a, e
    ld      e, a
    ld      hl, (routeTransferPattern)
    add     hl, de
    ld      de, #(_patternName + ROUTE_PATTERN_VIEW_X)
    ld      b, #ROUTE_PATTERN_VIEW_Y
10$:
    push    bc
    push    hl
    push    de
    ld      a, (routeTransferOffset)
    ld      e, a
    ld      a, (routePositionScroll + 0x0000)
    sub     #ROUTE_PATTERN_SIZE_X
    neg
    ld      d, a
    push    de
    ld      b, a
11$:
    ld      a, (hl)
    add     a, e
    out     (c), a
    inc     hl
    djnz    11$
    ld      de, #-ROUTE_PATTERN_SIZE_X
    add     hl, de
    pop     de
    ld      a, #ROUTE_PATTERN_VIEW_X
    sub     d
    ld      b, a
12$:
    ld      a, (hl)
    add     a, e
    out     (c), a
    inc     hl
    djnz    12$
    pop     hl
    ld      b, #(0x20 - ROUTE_PATTERN_VIEW_X)
13$:
    outi
    jp      nz, 13$
    ld      de, #ROUTE_PATTERN_VIEW_X
    add     hl, de
    ex      de, hl
    pop     hl
    ld      bc, #ROUTE_PATTERN_SIZE_X
    add     hl, bc
    pop     bc
    djnz    10$

    ; レジスタの復帰
    pop     de

    ; 終了
    ret

RouteTransfer1x2:

    ; レジスタの保存
    push    de

    ; d  < ポート #0
    ; e  < ポート #1

    ; VRAM アドレスの設定
    ld      c, e
    xor     a
    out     (c), a
    ld      a, (_videoRegister + VDP_R2)
    add     a, a
    add     a, a
    or      #0b01000000
    out     (c), a

    ; パターンネームテーブルの転送
    ld      c, d
    ld      de, (routePositionScroll)
    xor     a
    srl     d
    rra
    srl     d
    rra
    add     a, e
    ld      e, a
    ld      hl, (routeTransferPattern)
    add     hl, de
    ld      de, #(_patternName + ROUTE_PATTERN_VIEW_X)
    ld      a, (routePositionScroll + 0x0001)
    sub     #ROUTE_PATTERN_SIZE_Y
    neg
    ld      b, a
    push    bc
100$:
    push    bc
    push    hl
    push    de
    ld      a, (routeTransferOffset)
    ld      e, a
    ld      b, #ROUTE_PATTERN_VIEW_X
101$:
    ld      a, (hl)
    add     a, e
    out     (c), a
    inc     hl
    djnz    101$
    pop     hl
    ld      b, #(0x20 - ROUTE_PATTERN_VIEW_X)
102$:
    outi
    jp      nz, 102$
    ld      de, #ROUTE_PATTERN_VIEW_X
    add     hl, de
    ex      de, hl
    pop     hl
    ld      bc, #ROUTE_PATTERN_SIZE_X
    add     hl, bc
    pop     bc
    djnz    100$
    ld      bc, #-(ROUTE_PATTERN_SIZE_X * ROUTE_PATTERN_SIZE_Y)
    add     hl, bc
    pop     bc
    ld      a, #ROUTE_PATTERN_VIEW_Y
    sub     b
    ld      b, a
110$:
    push    bc
    push    hl
    push    de
    ld      a, (routeTransferOffset)
    ld      e, a
    ld      b, #ROUTE_PATTERN_VIEW_X
111$:
    ld      a, (hl)
    add     a, e
    out     (c), a
    inc     hl
    djnz    111$
    pop     hl
    ld      b, #(0x20 - ROUTE_PATTERN_VIEW_X)
112$:
    outi
    jp      nz, 112$
    ld      de, #ROUTE_PATTERN_VIEW_X
    add     hl, de
    ex      de, hl
    pop     hl
    ld      bc, #ROUTE_PATTERN_SIZE_X
    add     hl, bc
    pop     bc
    djnz    110$

    ; レジスタの復帰
    pop     de

    ; 終了
    ret

RouteTransfer2x2:

    ; レジスタの保存
    push    de

    ; d  < ポート #0
    ; e  < ポート #1

    ; VRAM アドレスの設定
    ld      c, e
    xor     a
    out     (c), a
    ld      a, (_videoRegister + VDP_R2)
    add     a, a
    add     a, a
    or      #0b01000000
    out     (c), a

    ; パターンネームテーブルの転送
    ld      c, d
    ld      de, (routePositionScroll)
    xor     a
    srl     d
    rra
    srl     d
    rra
    add     a, e
    ld      e, a
    ld      hl, (routeTransferPattern)
    add     hl, de
    ld      de, #(_patternName + ROUTE_PATTERN_VIEW_X)
    ld      a, (routePositionScroll + 0x0001)
    sub     #ROUTE_PATTERN_SIZE_Y
    neg
    ld      b, a
    push    bc
100$:
    push    bc
    push    hl
    push    de
    ld      a, (routeTransferOffset)
    ld      e, a
    ld      a, (routePositionScroll + 0x0000)
    sub     #ROUTE_PATTERN_SIZE_X
    neg
    ld      d, a
    push    de
    ld      b, a
101$:
    ld      a, (hl)
    add     a, e
    out     (c), a
    inc     hl
    djnz    101$
    ld      de, #-ROUTE_PATTERN_SIZE_X
    add     hl, de
    pop     de
    ld      a, #ROUTE_PATTERN_VIEW_X
    sub     d
    ld      b, a
102$:
    ld      a, (hl)
    add     a, e
    out     (c), a
    inc     hl
    djnz    102$
    pop     hl
    ld      b, #(0x20 - ROUTE_PATTERN_VIEW_X)
103$:
    outi
    jp      nz, 103$
    ld      de, #ROUTE_PATTERN_VIEW_X
    add     hl, de
    ex      de, hl
    pop     hl
    ld      bc, #ROUTE_PATTERN_SIZE_X
    add     hl, bc
    pop     bc
    djnz    100$
    ld      bc, #-(ROUTE_PATTERN_SIZE_X * ROUTE_PATTERN_SIZE_Y)
    add     hl, bc
    pop     bc
    ld      a, #ROUTE_PATTERN_VIEW_Y
    sub     b
    ld      b, a
110$:
    push    bc
    push    hl
    push    de
    ld      a, (routeTransferOffset)
    ld      e, a
    ld      a, (routePositionScroll + 0x0000)
    sub     #ROUTE_PATTERN_SIZE_X
    neg
    ld      d, a
    push    de
    ld      b, a
111$:
    ld      a, (hl)
    add     a, e
    out     (c), a
    inc     hl
    djnz    111$
    ld      de, #-ROUTE_PATTERN_SIZE_X
    add     hl, de
    pop     de
    ld      a, #ROUTE_PATTERN_VIEW_X
    sub     d
    ld      b, a
112$:
    ld      a, (hl)
    add     a, e
    out     (c), a
    inc     hl
    djnz    112$
    pop     hl
    ld      b, #(0x20 - ROUTE_PATTERN_VIEW_X)
113$:
    outi
    jp      nz, 113$
    ld      de, #ROUTE_PATTERN_VIEW_X
    add     hl, de
    ex      de, hl
    pop     hl
    ld      bc, #ROUTE_PATTERN_SIZE_X
    add     hl, bc
    pop     bc
    djnz    110$

    ; レジスタの復帰
    pop     de

    ; 終了
    ret

; 経路を構築する
;
RouteBuild:

    ; レジスタの保存

    ; 経路の初期化
    ld      hl, #(_route + 0x0000)
    ld      de, #(_route + 0x0001)
    ld      bc, #(ROUTE_SIZE_X * ROUTE_SIZE_Y - 0x0001)
    ld      (hl), #0x00
    ldir
    ld      a, #0x11
    ld      (routePoint), a
    ld      a, #0x01
    ld      (routePointCount), a

    ; ポイントの取得
1000$:
    ld      a, (routePointCount)
    or      a
    jp      z, 1900$
    dec     a
    ld      e, a
    ld      d, #0x00
    ld      hl, #routePoint
    add     hl, de
    ld      c, (hl)

    ; 行き止まりの判定
    ld      b, #0x00
    ld      a, c
    sub     #0x20
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    ld      a, (hl)
    or      a
    jr      nz, 1100$
    set     #ROUTE_UP_BIT, b
1100$:
    ld      a, c
    add     a, #0x20
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    ld      a, (hl)
    or      a
    jr      nz, 1101$
    set     #ROUTE_DOWN_BIT, b
1101$:
    ld      a, c
    and     #0xf0
    ld      e, a
    ld      a, c
    sub     #0x02
    and     #0x0f
    or      e
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    ld      a, (hl)
    or      a
    jr      nz, 1102$
    set     #ROUTE_LEFT_BIT, b
1102$:
    ld      a, c
    and     #0xf0
    ld      e, a
    ld      a, c
    add     a, #0x02
    and     #0x0f
    or      e
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    ld      a, (hl)
    or      a
    jr      nz, 1103$
    set     #ROUTE_RIGHT_BIT, b
1103$:
    ld      a, b
    or      a
    jr      nz, 1200$
    call    1300$
    jr      1000$

    ; ランダムに穴を掘る
1200$:
    call    _SystemGetRandom
    and     #0x03
    jr      z, 1210$
    dec     a
    jr      z, 1220$
    dec     a
    jr      z, 1230$
    jp      1240$
1210$:
    bit     #ROUTE_UP_BIT, b
    jr      z, 1220$
    ld      e, c
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    set     #ROUTE_UP_BIT, (hl)
    res     #ROUTE_UP_BIT, b
    ld      a, b
    or      a
    call    z, 1300$
    ld      a, c
    sub     #0x10
    ld      c, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    ld      (hl), #(ROUTE_UP | ROUTE_DOWN)
    ld      a, c
    sub     #0x10
    ld      c, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    set     #ROUTE_DOWN_BIT, (hl)
    jp      1290$
1220$:
    bit     #ROUTE_DOWN_BIT, b
    jr      z, 1230$
    ld      e, c
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    set     #ROUTE_DOWN_BIT, (hl)
    res     #ROUTE_DOWN_BIT, b
    ld      a, b
    or      a
    call    z, 1300$
    ld      a, c
    add     a, #0x10
    ld      c, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    ld      (hl), #(ROUTE_UP | ROUTE_DOWN)
    ld      a, c
    add     a, #0x10
    ld      c, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    set     #ROUTE_UP_BIT, (hl)
    jr      1290$
1230$:
    bit     #ROUTE_LEFT_BIT, b
    jr      z, 1240$
    ld      e, c
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    set     #ROUTE_LEFT_BIT, (hl)
    res     #ROUTE_LEFT_BIT, b
    ld      a, b
    or      a
    call    z, 1300$
    ld      a, c
    and     #0xf0
    ld      e, a
    ld      a, c
    dec     a
    and     #0x0f
    or      e
    ld      c, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    ld      (hl), #(ROUTE_LEFT | ROUTE_RIGHT)
    ld      a, c
    and     #0xf0
    ld      e, a
    ld      a, c
    dec     a
    and     #0x0f
    or      e
    ld      c, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    set     #ROUTE_RIGHT_BIT, (hl)
    jr      1290$
1240$:
    bit     #ROUTE_RIGHT_BIT, b
    jp      z, 1210$
    ld      e, c
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    set     #ROUTE_RIGHT_BIT, (hl)
    res     #ROUTE_RIGHT_BIT, b
    ld      a, b
    or      a
    call    z, 1300$
    ld      a, c
    and     #0xf0
    ld      e, a
    ld      a, c
    inc     a
    and     #0x0f
    or      e
    ld      c, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    ld      (hl), #(ROUTE_LEFT | ROUTE_RIGHT)
    ld      a, c
    and     #0xf0
    ld      e, a
    ld      a, c
    inc     a
    and     #0x0f
    or      e
    ld      c, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    set     #ROUTE_LEFT_BIT, (hl)
;   jr      1290$
1290$:
    ld      a, (routePointCount)
    ld      e, a
    ld      d, #0x00
    ld      hl, #routePoint
    add     hl, de
    ld      (hl), c
    ld      hl, #routePointCount
    inc     (hl)
    jp      1000$
1300$:
    ld      a, (routePointCount)
    dec     a
    ld      (routePointCount), a
    ret
1900$:

    ; 行き止まりをなくす
    ld      b, #0x10
20$:
    ld      c, #0x01
21$:
    ld      a, b
    or      c
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    ld      a, (hl)
    cp      #ROUTE_UP
    jr      nz, 22$
    set     #ROUTE_DOWN_BIT, (hl)
    ld      a, e
    add     a, #0x10
    ld      e, a
    ld      hl, #_route
    add     hl, de
    ld      (hl), #(ROUTE_UP | ROUTE_DOWN)
    ld      a, e
    add     a, #0x10
    ld      e, a
    ld      hl, #_route
    add     hl, de
    set     #ROUTE_UP_BIT, (hl)
    jr      29$
22$:
    cp      #ROUTE_DOWN
    jr      nz, 23$
    set     #ROUTE_UP_BIT, (hl)
    ld      a, e
    sub     #0x10
    ld      e, a
    ld      hl, #_route
    add     hl, de
    ld      (hl), #(ROUTE_UP | ROUTE_DOWN)
    ld      a, e
    sub     #0x10
    ld      e, a
    ld      hl, #_route
    add     hl, de
    set     #ROUTE_DOWN_BIT, (hl)
    jr      29$
23$:
    cp      #ROUTE_LEFT
    jr      nz, 24$
    set     #ROUTE_RIGHT_BIT, (hl)
    ld      a, e
    and     #0xf0
    ld      l, a
    ld      a, e
    inc     a
    and     #0x0f
    or      l
    ld      e, a
    ld      hl, #_route
    add     hl, de
    ld      (hl), #(ROUTE_LEFT | ROUTE_RIGHT)
    ld      a, e
    and     #0xf0
    ld      l, a
    ld      a, e
    inc     a
    and     #0x0f
    or      l
    ld      e, a
    ld      hl, #_route
    add     hl, de
    set     #ROUTE_LEFT_BIT, (hl)
    jr      29$
24$:
    cp      #ROUTE_RIGHT
    jr      nz, 29$
    set     #ROUTE_LEFT_BIT, (hl)
    ld      a, e
    and     #0xf0
    ld      l, a
    ld      a, e
    dec     a
    and     #0x0f
    or      l
    ld      e, a
    ld      hl, #_route
    add     hl, de
    ld      (hl), #(ROUTE_LEFT | ROUTE_RIGHT)
    ld      a, e
    and     #0xf0
    ld      l, a
    ld      a, e
    dec     a
    and     #0x0f
    or      l
    ld      e, a
    ld      hl, #_route
    add     hl, de
    set     #ROUTE_RIGHT_BIT, (hl)
;   jr      29$
29$:
    ld      a, c
    add     a, #0x02
    ld      c, a
    cp      #0x10
    jp      c, 21$
    ld      a, b
    add     a, #0x20
    ld      b, a
    jp      nc, 20$

    ; パターンの作成 (Y)
300$:
    ld      hl, #routePatternY
    ld      de, #0x0000
    ld      b, #(ROUTE_PATTERN_SIZE_Y / 4)
301$:
    push    bc
    ld      b, #(ROUTE_PATTERN_SIZE_X / 4)
302$:
    call    360$
    call    370$
    call    380$
    ld      a, e
    inc     a
    and     #0x0f
    ld      e, a
    ld      a, d
    sub     #0x10
;   and     #0xf0
    ld      d, a
    djnz    302$
    ld      bc, #ROUTE_PATTERN_SIZE_X
    add     hl, bc
    ld      a, d
    add     a, #0x10
;   and     #0xf0
    ld      d, a
    ld      b, #ROUTE_SIZE_X
303$:
    call    360$
    call    380$
    ld      a, e
    inc     a
    and     #0x0f
    ld      e, a
    ld      a, d
    sub     #0x10
;   and     #0xf0
    ld      d, a
    call    360$
    call    370$
    djnz    303$
    ld      a, e
    inc     a
    and     #0x0f
    ld      e, a
    ld      bc, #ROUTE_PATTERN_SIZE_X
    add     hl, bc
    pop     bc
    djnz    301$
    jr      390$
360$:
    push    hl
    push    de
    ld      a, d
    or      e
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    ld      a, (hl)
    pop     de
    pop     hl
    ret
370$:
    push    af
    push    bc
    push    de
    push    hl
    add     a, a
    add     a, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #routePatternY2x2
    add     hl, de
    ex      de, hl
    pop     hl
    ld      a, (de)
    ld      (hl), a
    inc     de
    inc     hl
    ld      a, (de)
    ld      (hl), a
    inc     de
    ld      bc, #(ROUTE_PATTERN_SIZE_X - 0x0001)
    add     hl, bc
    ld      a, (de)
    ld      (hl), a
    inc     de
    inc     hl
    ld      a, (de)
    ld      (hl), a
;   inc     de
    ld      bc, #-(ROUTE_PATTERN_SIZE_X - 0x0001)
    add     hl, bc
    pop     de
    pop     bc
    pop     af
    ret
380$:
    push    af
    push    bc
    bit     #ROUTE_RIGHT_BIT, a
    jr      nz, 381$
    ld      a, #0x80
    ld      (hl), a
    inc     hl
    ld      (hl), a
    ld      bc, #(ROUTE_PATTERN_SIZE_X - 0x0001)
    add     hl, bc
    ld      (hl), a
    inc     hl
    ld      (hl), a
    ld      bc, #-(ROUTE_PATTERN_SIZE_X - 0x0001)
    add     hl, bc
    jr      389$
381$:
    ld      (hl), #0x70
    inc     hl
    ld      (hl), #0x80
    ld      bc, #(ROUTE_PATTERN_SIZE_X - 0x0001)
    add     hl, bc
    ld      (hl), #0x74
    inc     hl
    ld      (hl), #0x70
    ld      bc, #-(ROUTE_PATTERN_SIZE_X - 0x0001)
    add     hl, bc
;   jr      389$
389$:
    pop     bc
    pop     af
    ret
390$:

    ; パターンの作成 (X)
400$:
    ld      hl, #routePatternX
    ld      de, #0x0000
    ld      b, #(ROUTE_PATTERN_SIZE_Y / 4)
401$:
    push    bc
    ld      b, #(ROUTE_PATTERN_SIZE_X / 4)
402$:
    call    460$
    call    470$
    ld      a, e
    inc     a
    and     #0x0f
    ld      e, a
    call    460$
    call    480$
    ld      a, d
    sub     #0x10
;   and     #0xf0
    ld      d, a
    djnz    402$
    ld      bc, #ROUTE_PATTERN_SIZE_X
    add     hl, bc
    ld      a, d
    add     a, #0x10
;   and     #0xf0
    ld      d, a
    ld      b, #ROUTE_SIZE_X
403$:
    ld      a, e
    inc     a
    and     #0x0f
    ld      e, a
    call    460$
    call    480$
    ld      a, d
    sub     #0x10
;   and     #0xf0
    ld      d, a
    call    460$
    call    470$
    djnz    403$
    ld      a, e
    inc     a
    and     #0x0f
    ld      e, a
    ld      bc, #ROUTE_PATTERN_SIZE_X
    add     hl, bc
    pop     bc
    djnz    401$
    jr      490$
460$:
    push    hl
    push    de
    ld      a, d
    or      e
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    ld      a, (hl)
    pop     de
    pop     hl
    ret
470$:
    push    af
    push    bc
    push    de
    push    hl
    add     a, a
    add     a, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #routePatternX2x2
    add     hl, de
    ex      de, hl
    pop     hl
    ld      a, (de)
    ld      (hl), a
    inc     de
    inc     hl
    ld      a, (de)
    ld      (hl), a
    inc     de
    ld      bc, #(ROUTE_PATTERN_SIZE_X - 0x0001)
    add     hl, bc
    ld      a, (de)
    ld      (hl), a
    inc     de
    inc     hl
    ld      a, (de)
    ld      (hl), a
;   inc     de
    ld      bc, #-(ROUTE_PATTERN_SIZE_X - 0x0001)
    add     hl, bc
    pop     de
    pop     bc
    pop     af
    ret
480$:
    push    af
    push    bc
    bit     #ROUTE_UP_BIT, a
    jr      nz, 481$
    ld      a, #0x80
    ld      (hl), a
    inc     hl
    ld      (hl), a
    ld      bc, #(ROUTE_PATTERN_SIZE_X - 0x0001)
    add     hl, bc
    ld      (hl), a
    inc     hl
    ld      (hl), a
    ld      bc, #-(ROUTE_PATTERN_SIZE_X - 0x0001)
    add     hl, bc
    jr      489$
481$:
    ld      (hl), #0x80
    inc     hl
    ld      (hl), #0x70
    ld      bc, #(ROUTE_PATTERN_SIZE_X - 0x0001)
    add     hl, bc
    ld      (hl), #0x70
    inc     hl
    ld      (hl), #0x74
    ld      bc, #-(ROUTE_PATTERN_SIZE_X - 0x0001)
    add     hl, bc
;   jr      489$
489$:
    pop     bc
    pop     af
    ret
490$:

    ; マップの作成
    ld      hl, #(routeMap + 0x0000)
    ld      de, #(routeMap + 0x0001)
    ld      bc, #(0x0018 * 0x0018 - 0x0001)
    ld      (hl), #0x00
    ldir
    ld      hl, #routeMap + 0x0004 * 0x0018 + 0x0004
    ld      de, #_route
    ld      b, #ROUTE_SIZE_Y
50$:
    push    bc
    ld      b, #ROUTE_SIZE_X
51$:
    ld      a, (de)
    add     a, #0x60
    ld      (hl), a
    inc     de
    inc     hl
    djnz    51$
    ld      bc, #(0x0018 - ROUTE_SIZE_X)
    add     hl, bc
    pop     bc
    djnz    50$

    ; レジスタの復帰
    
    ; 終了
    ret

; 位置を設定する
;
_RouteSetPosition::

    ; レジスタの保存
    push    hl
    push    de

    ; de < Y/X 位置

    ; 位置の取得
    ld      (routePosition), de
    ld      a, e
    and     #0x07
    ld      (routePositionOffset + 0x0000), a
    ld      a, d
    and     #0x07
    ld      (routePositionOffset + 0x0001), a
    ld      a, e
    sub     #0x58
    and     #0xf8
    rrca
    rrca
    rrca
    ld      e, a
    ld      a, d
    and     #0xf8
    rrca
    rrca
    rrca
    ld      d, a
    ld      a, e
    sub     d
    and     #0x3f
    ld      l, a
    ld      a, e
    add     a, d
    and     #0x3f
    ld      h, a
    ld      (routePositionScroll), hl

    ; レジスタの復帰
    pop     de
    pop     hl

    ; 終了
    ret

; 通路を取得する
;
_RouteGetPath::

    ; レジスタの保存
    push    hl
    push    de

    ; de < Y/X 位置
    ; a  > 通路

    ; 通路の取得
    ld      a, e
    and     #0xf0
    rrca
    rrca
    rrca
    rrca
    ld      e, a
    ld      a, d
    and     #0xf0
    add     a, e
    ld      e, a
    ld      d, #0x00
    ld      hl, #_route
    add     hl, de
    ld      a, (hl)

    ; レジスタの復帰
    pop     de
    pop     hl

    ; 終了
    ret

; 通路の数を取得する
;
_RouteGetPathCount::

    ; レジスタの保存
    push    hl
    push    de

    ; de < Y/X 位置
    ; a  > 通路の数

    ; 通路の判定
    call    _RouteGetPath
    ld      e, a
    ld      d, #0x00
    ld      hl, #routePathCount
    add     hl, de
    ld      a, (hl)

    ; レジスタの復帰
    pop     de
    pop     hl

    ; 終了
    ret

; 指定した向きに通路があるかどうかを判定する
;
_RouteIsPath::

    ; レジスタの保存
    push    bc

    ; de < Y/X 位置
    ; c  < 向き
    ; cf > 1 = 通路あり

    ; 通路の判定
    call    _RouteGetPath
    inc     c
10$:
    rrca
    dec     c
    jr      nz, 10$

    ; レジスタの復帰
    pop     bc

    ; 終了
    ret

; 方向転換する
;
_RouteTurn::

    ; レジスタの保存
    push    de

    ; de < Y/X 位置
    ; c  < 向き
    ; c  > 向き

    ; 方向転換
    call    _RouteGetPath
    ld      d, a
    ld      e, c
    inc     e
10$:
    rrca
    dec     e
    jr      nz, 10$
    jr      c, 19$
    ld      a, c
    xor     #0x02
    ld      c, a
    ld      e, a
    ld      a, d
    inc     e
11$:
    rrca
    dec     e
    jr      nz, 11$
    jr      c, 19$
    ld      a, c
    xor     #0x01
    ld      c, a
    ld      e, a
    ld      a, d
    inc     e
12$:
    rrca
    dec     e
    jr      nz, 12$
    jr      c, 19$
    ld      a, c
    xor     #0x02
    ld      c, a
19$:

    ; レジスタの復帰
    pop     de

    ; 終了
    ret

; 分岐点まで移動する
;
_RouteMoveToPoint::

    ; レジスタの保存
    push    hl
    
    ; de < Y/X 位置
    ; b  < 移動量
    ; c  < 向き
    ; de > 移動後の Y/X 位置
    ; b  > 残りの移動量

    ; 移動
    ld      a, b
    or      a
    jr      z, 190$
    ld      a, c
100$:
    or      a
    jr      nz, 110$
    ld      a, d
    and     #0x0f
    jr      z, 190$
    sub     b
    ld      b, #0x00
    jr      nc, 101$
    neg
    ld      b, a
    xor     a
101$:
    ld      h, a
    ld      a, d
    and     #0xf0
    add     a, h
    ld      d, a
    jr      190$
110$:
    dec     a
    jr      nz, 120$
    ld      a, d
    and     #0x0f
    jr      z, 190$
    add     a, b
    ld      b, #0x00
    cp      #0x11
    jr      c, 111$
    sub     #0x10
    ld      b, a
    ld      a, #0x10
111$:
    ld      h, a
    ld      a, d
    and     #0xf0
    add     a, h
    ld      d, a
    jr      190$
120$:
    dec     a
    jr      nz, 130$
    ld      a, e
    and     #0x0f
    jr      z, 190$
    sub     b
    ld      b, #0x00
    jr      nc, 121$
    neg
    ld      b, a
    xor     a
121$:
    ld      l, a
    ld      a, e
    and     #0xf0
    add     a, l
    ld      e, a
    jr      190$
130$:
    ld      a, e
    and     #0x0f
    jr      z, 190$
    add     a, b
    ld      b, #0x00
    cp      #0x11
    jr      c, 131$
    sub     #0x10
    ld      b, a
    ld      a, #0x10
131$:
    ld      l, a
    ld      a, e
    and     #0xf0
    add     a, l
    ld      e, a
;   jr      190$
190$:

    ; レジスタの復帰
    pop     hl

    ; 終了
    ret

; 分岐点から移動する
;
_RouteMoveFromPoint::

    ; レジスタの保存
    
    ; de < Y/X 位置
    ; b  < 移動量
    ; c  < 向き
    ; de > 移動後の Y/X 位置

    ; 移動
    ld      a, b
    or      a
    jr      z, 19$
    ld      a, c
10$:
    or      a
    jr      nz, 11$
    ld      a, d
    sub     b
    ld      d, a
    jr      19$
11$:
    dec     a
    jr      nz, 12$
    ld      a, d
    add     a, b
    ld      d, a
    jr      19$
12$:
    dec     a
    jr      nz, 13$
    ld      a, e
    sub     b
    ld      e, a
    jr      19$
13$:
    ld      a, e
    add     a, b
    ld      e, a
;   jr      19$
19$:

    ; レジスタの復帰

    ; 終了
    ret

; 定数の定義
;

; +---+---+---+---+---+---+---+---+
; |0,0|   |1,3|   |2,2|   |3,1|   |
; +---+---+---+---+---+---+---+---+
; |   |1,0|   |2,3|   |3,2|   |0,1|
; +---+---+---+---+---+---+---+---+
; |1,1|   |2,0|   |3,3|   |0,2|   |
; +---+---+---+---+---+---+---+---+
; |   |2,1|   |3,0|   |0,3|   |1,2|
; +---+---+---+---+---+---+---+---+
; |2,2|   |3,1|   |0,0|   |1,3|   |
; +---+---+---+---+---+---+---+---+
; |   |3,2|   |0,1|   |1,0|   |2,2|
; +---+---+---+---+---+---+---+---+
; |3,3|   |0,2|   |1,1|   |2,0|   |
; +---+---+---+---+---+---+---+---+
; |   |0,3|   |1,2|   |2,1|   |3,0|
; +---+---+---+---+---+---+---+---+

; 経路
;
routePatternY2x2:

    .db     0x80, 0x80, 0x80, 0x80
    .db     0x80, 0x88, 0x80, 0x80
    .db     0x80, 0x90, 0x98, 0x80
    .db     0x80, 0x98, 0x98, 0x80
    .db     0x78, 0xa0, 0x80, 0x80
    .db     0x78, 0xa8, 0x80, 0x80
    .db     0x78, 0xb0, 0x98, 0x80
    .db     0x78, 0xb8, 0x98, 0x80
    .db     0x80, 0xc0, 0x80, 0x78
    .db     0x80, 0xc8, 0x80, 0x78
    .db     0x80, 0xd0, 0x98, 0x78
    .db     0x80, 0xd8, 0x98, 0x78
    .db     0x78, 0xe0, 0x80, 0x78
    .db     0x78, 0xe8, 0x80, 0x78
    .db     0x78, 0xf0, 0x98, 0x78
    .db     0x78, 0xf8, 0x98, 0x78

routePatternX2x2:

    .db     0x80, 0x80, 0x80, 0x80
    .db     0x88, 0x78, 0x80, 0x80
    .db     0x90, 0x80, 0x78, 0x80
    .db     0x98, 0x78, 0x78, 0x80
    .db     0xa0, 0x80, 0x80, 0x80
    .db     0xa8, 0x78, 0x80, 0x80
    .db     0xb0, 0x80, 0x78, 0x80
    .db     0xb8, 0x78, 0x78, 0x80
    .db     0xc0, 0x80, 0x80, 0xe0
    .db     0xc8, 0x78, 0x80, 0xe0
    .db     0xd0, 0x80, 0x78, 0xe0
    .db     0xd8, 0x78, 0x78, 0xe0
    .db     0xe0, 0x80, 0x80, 0xe0
    .db     0xe8, 0x78, 0x80, 0xe0
    .db     0xf0, 0x80, 0x78, 0xe0
    .db     0xf8, 0x78, 0x78, 0xe0

; 通路
;
routePathCount:

    ;       0000  0001  0010  0011  0100  0101  0110  0111  1000  1001  1010  1011  1100  1101  1110  1111
    .db     0x00, 0x01, 0x01, 0x02, 0x01, 0x02, 0x02, 0x03, 0x01, 0x02, 0x02, 0x03, 0x02, 0x03, 0x03, 0x04


; DATA 領域
;
    .area   _DATA

; 変数の定義
;

; 経路
;
_route::
    
    .ds     ROUTE_SIZE_X * ROUTE_SIZE_Y

routePoint:

    .ds     ROUTE_SIZE_X * ROUTE_SIZE_Y

routePointCount:

    .ds     0x01

; 位置
;
routePosition:

    .ds     0x02

routePositionScroll:

    .ds     0x02

routePositionOffset:

    .ds     0x02

routePositionPattern:

    .ds     0x02

; パターン
;
routePatternY:

    .ds     ROUTE_PATTERN_SIZE_X * ROUTE_PATTERN_SIZE_Y

routePatternX:

    .ds     ROUTE_PATTERN_SIZE_X * ROUTE_PATTERN_SIZE_Y

; 転送
;
routeTransferProc:

    .ds     0x02

routeTransferPattern:

    .ds     0x02

routeTransferOffset:

    .ds     0x01

; マップ
;
routeMap:

    .ds     0x0018 * 0x0018
