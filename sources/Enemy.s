; Enemy.s : エネミー
;


; モジュール宣言
;
    .module Enemy

; 参照ファイル
;
    .include    "bios.inc"
    .include    "vdp.inc"
    .include    "System.inc"
    .include    "Sound.inc"
    .include    "App.inc"
    .include    "Game.inc"
    .include    "Route.inc"
    .include    "Player.inc"
    .include	"Enemy.inc"

; 外部変数宣言
;

; マクロの定義
;


; CODE 領域
;
    .area   _CODE

; エネミーを初期化する
;
_EnemyInitialize::
    
    ; レジスタの保存
    
    ; エネミーの初期化
    ld      hl, #(_enemy + 0x0000)
    ld      de, #(_enemy + 0x0001)
    ld      bc, #(ENEMY_LENGTH * ENEMY_ENTRY - 0x0001)
    ld      (hl), #0x00
    ldir
    ld      ix, #_enemy
    ld      hl, #EnemyIdle
    ld      de, #ENEMY_LENGTH
    ld      bc, #0x0001
10$:
    ld      ENEMY_PROC_L(ix), l
    ld      ENEMY_PROC_H(ix), h
    ld      a, b
    and     #0x03
    ld      ENEMY_TYPE(ix), a
    ld      ENEMY_COLOR(ix), a
    ld      ENEMY_ANIMATION(ix), c
    ld      a, c
    add     a, #0x07
    ld      c, a
    add     ix, de
    inc     b
    ld      a, b
    cp      #ENEMY_ENTRY
    jr      c, 10$

    ; スプライトの初期化
    xor     a
    ld      (enemySpriteRotate), a

    ; レジスタの復帰
    
    ; 終了
    ret

; エネミーを更新する
;
_EnemyUpdate::
    
    ; レジスタの保存

    ; エネミーの走査
    ld      ix, #_enemy
    ld      b, #ENEMY_ENTRY
100$:
    push    bc

    ; 生成
    ld      l, ENEMY_PROC_L(ix)
    ld      h, ENEMY_PROC_H(ix)
;   ld      a, h
;   or      l
;   jr      nz, 110$
;   ld      hl, #EnemyBorn
;   ld      ENEMY_PROC_L(ix), l
;   ld      ENEMY_PROC_H(ix), h
;110$:

    ; 種類別の処理
    ld      de, #120$
    push    de
    jp      (hl)
;   pop     hl
120$:

    ; スプライトの設定
    call    _PlayerGetPosition
    ld      a, ENEMY_POSITION_X(ix)
    sub     e
    ld      b, #0x00
    jp      p, 130$
    dec     b
130$:
    ld      c, a
    ld      a, ENEMY_POSITION_Y(ix)
    sub     d
    ld      d, #0x00
    jp      p, 131$
    dec     d
131$:
    ld      e, a
    ld      l, c
    ld      h, b
    or      a
    sbc     hl, de
    push    de
    ld      de, #0x0060
    add     hl, de
    pop     de
    ld      a, h
    or      a
    jr      nz, 138$
    ld      a, l
    cp      #0xc0
    jr      nc, 138$
    ld      ENEMY_SPRITE_X(ix), a
    ld      l, c
    ld      h, b
    add     hl, de
    ld      de, #0x0060
    add     hl, de
    ld      a, h
    or      a
    jr      nz, 138$
    ld      a, l
    cp      #0xc0
    jr      nc, 138$
    ld      ENEMY_SPRITE_Y(ix), a
    set     #ENEMY_FLAG_CLIP_BIT, ENEMY_FLAG(ix)
    jr      139$
138$:
    res     #ENEMY_FLAG_CLIP_BIT, ENEMY_FLAG(ix)
139$:

    ; 次のエネミーへ
190$:
    ld      bc, #ENEMY_LENGTH
    add     ix, bc
    pop     bc
    dec     b
    jp      nz, 100$

    ; レジスタの復帰
    
    ; 終了
    ret

; エネミーを描画する
;
_EnemyRender::

    ; レジスタの保存

    ; エネミーの走査
    ld      ix, #_enemy
    ld      a, (enemySpriteRotate)
    ld      e, a
    ld      d, #0x00
    ld      b, #ENEMY_ENTRY
10$:
    push    bc

    ; 描画の確認
    ld      a, ENEMY_PROC_H(ix)
    or      ENEMY_PROC_L(ix)
    jr      z, 19$
    bit     #ENEMY_FLAG_RENDER_BIT, ENEMY_FLAG(ix)
    jr      z, 19$
    bit     #ENEMY_FLAG_CLIP_BIT, ENEMY_FLAG(ix)
    jr      z, 19$

    ; 位置の取得
    ld      a, ENEMY_SPRITE_X(ix)
    add     a, #0x20
    ld      c, a
    ld      b, ENEMY_SPRITE_Y(ix)

    ; スプライトの描画
    push    de
    ld      hl, #(_sprite + GAME_SPRITE_ENEMY_0)
    add     hl, de
    ex      de, hl
    ld      l, ENEMY_SPRITE_L(ix)
    ld      h, ENEMY_SPRITE_H(ix)
    ld      a, (hl)
    add     a, b
    ld      (de), a
    inc     hl
    inc     de
    ld      a, (hl)
    add     a, c
    ld      (de), a
    inc     hl
    inc     de
    ld      a, (hl)
    ld      (de), a
    inc     hl
    inc     de
    ld      a, ENEMY_SPRITE_COLOR(ix)
    or      #0x80
    ld      (de), a
    inc     hl
    inc     de
    push    hl
    ld      hl, #(GAME_SPRITE_ENEMY_1 - GAME_SPRITE_ENEMY_0)
    add     hl, de
    ex      de, hl
    pop     hl
    ld      a, (hl)
    add     a, b
    ld      (de), a
    inc     hl
    inc     de
    ld      a, (hl)
    add     a, c
    ld      (de), a
    inc     hl
    inc     de
    ld      a, (hl)
    ld      (de), a
    inc     hl
    inc     de
    ld      a, #(VDP_COLOR_BLACK | 0x80)
    or      #0x80
    ld      (de), a
;   inc     hl
;   inc     de
    pop     de

    ; スプライトのローテート
    ld      a, e
    add     a, #0x04
    cp      #(ENEMY_ENTRY * 0x04)
    jr      c, 18$
    xor     a
18$:
    ld      e, a

    ; 次のエネミーへ
19$:
    ld      bc, #ENEMY_LENGTH
    add     ix, bc
    pop     bc
    djnz    10$

    ; スプライトの更新
    ld      a, (enemySpriteRotate)
    add     a, #0x04
    cp      #(ENEMY_ENTRY * 0x04)
    jr      c, 20$
    xor     a
20$:
    ld      (enemySpriteRotate), a

    ; レジスタの復帰

    ; 終了
    ret

; 何もしない
;
EnemyNull:

    ; レジスタの保存

    ; レジスタの復帰

    ; 終了
    ret

; エネミーが待機する
;
EnemyIdle:

    ; レジスタの保存

    ; 初期化
    ld      a, ENEMY_STATE(ix)
    or      a
    jr      nz, 09$

    ; フラグの設定
    res     #ENEMY_FLAG_ACTIVE_BIT, ENEMY_FLAG(ix)
    res     #ENEMY_FLAG_RENDER_BIT, ENEMY_FLAG(ix)

    ; 初期化の完了
    inc     ENEMY_STATE(ix)
09$:

    ; アニメーションの更新
    dec     ENEMY_ANIMATION(ix)
    jr      nz, 19$

    ; 処理の更新
    ld      hl, #EnemyBorn
    ld      ENEMY_PROC_L(ix), l
    ld      ENEMY_PROC_H(ix), h
    xor     a
    ld      ENEMY_STATE(ix), a
19$:

    ; レジスタの復帰

    ; 終了
    ret

; エネミーを生成する
;
EnemyBorn:

    ; レジスタの保存

    ; 初期化
    ld      a, ENEMY_STATE(ix)
    or      a
    jr      nz, 09$

    ; フラグの設定
    res     #ENEMY_FLAG_ACTIVE_BIT, ENEMY_FLAG(ix)

    ; 位置の設定
    call    _PlayerGetPosition
    ld      a, e
    and     #0xe0
    ld      e, a
    ld      a, d
    and     #0xe0
    ld      d, a
    call    _SystemGetRandom
    bit     #0x07, a
    jr      nz, 00$
    and     #0x60
    add     a, e
    add     a, #0x50
    ld      e, a
    call    _SystemGetRandom
    and     #0xe0
    add     a, #0x10
    ld      d, a
    jr      01$
00$:
    and     #0x60
    add     a, d
    add     a, #0x50
    ld      d, a
    call    _SystemGetRandom
    and     #0xe0
    add     a, #0x10
    ld      e, a
;   jr      01$
01$:
    ld      ENEMY_POSITION_X(ix), e
    ld      ENEMY_POSITION_Y(ix), d

    ; 向きの設定
    call    _SystemGetRandom
    and     #0x03
    ld      c, a
    call    _RouteTurn
    ld      ENEMY_DIRECTION(ix), c

    ; 速度の設定
    ld      ENEMY_SPEED(ix), #0x01

    ; アニメーションの設定
    ld      ENEMY_ANIMATION(ix), #0x18

    ; スプライトの設定
    ld      hl, #enemySpritePlay
    ld      ENEMY_SPRITE_L(ix), l
    ld      ENEMY_SPRITE_H(ix), h
    ld      e, ENEMY_TYPE(ix)
    ld      d, #0x00
    ld      hl, #enemyColor
    add     hl, de
    ld      a, (hl)
    ld      ENEMY_SPRITE_COLOR(ix), a

    ; 初期化の完了
    inc     ENEMY_STATE(ix)
09$:

    ; アニメーションの更新
    dec     ENEMY_ANIMATION(ix)
    jr      nz, 19$

    ; 処理の更新
    ld      hl, #EnemyPlay
    ld      ENEMY_PROC_L(ix), l
    ld      ENEMY_PROC_H(ix), h
    xor     a
    ld      ENEMY_STATE(ix), a
19$:

    ; フラグの更新
    bit     #0x01, ENEMY_ANIMATION(ix)
    jr      z, 20$
    res     #ENEMY_FLAG_RENDER_BIT, ENEMY_FLAG(ix)
    jr      21$
20$:
    set     #ENEMY_FLAG_RENDER_BIT, ENEMY_FLAG(ix)
;   jr      21$
21$:

    ; 生成の完了
90$:

    ; レジスタの復帰

    ; 終了
    ret

; エネミーが行動する
;
EnemyPlay:

    ; レジスタの保存

    ; 初期化
    ld      a, ENEMY_STATE(ix)
    or      a
    jr      nz, 09$

    ; フラグの設定
    set     #ENEMY_FLAG_ACTIVE_BIT, ENEMY_FLAG(ix)
    set     #ENEMY_FLAG_RENDER_BIT, ENEMY_FLAG(ix)

    ; アニメーションの設定
    ld      ENEMY_ANIMATION(ix), #0x00 

    ; 初期化の完了
    inc     ENEMY_STATE(ix)
09$:

    ; 経過時間の確認
    call    _GameIsDelta
    jr      nc, 90$

    ; 位置などの取得
    ld      e, ENEMY_POSITION_X(ix)
    ld      d, ENEMY_POSITION_Y(ix)
    ld      c, ENEMY_DIRECTION(ix)
    ld      b, ENEMY_SPEED(ix)
    ld      a, d
    or      e
    and     #0x0f
    jr      z, 20$

    ; 分岐点まで移動
10$:
    call    _RouteMoveToPoint
    ld      ENEMY_POSITION_X(ix), e
    ld      ENEMY_POSITION_Y(ix), d
    call    EnemyThink
    ld      ENEMY_DIRECTION(ix), c

    ; 残りを移動
20$:
    call    _RouteMoveFromPoint
    ld      ENEMY_POSITION_X(ix), e
    ld      ENEMY_POSITION_Y(ix), d

    ; アニメーションの更新
    ld      a, ENEMY_DIRECTION(ix)
    cp      #ENEMY_DIRECTION_UP
    jr      z, 30$
    cp      #ENEMY_DIRECTION_RIGHT
    jr      z, 30$
    dec     ENEMY_ANIMATION(ix)
    ld      a, ENEMY_ANIMATION(ix)
    cp      #(0x03 * 0x02)
    jr      c, 31$
    ld      a, #(0x03 * 0x02 - 0x01)
    jr      31$
30$:
    inc     ENEMY_ANIMATION(ix)
    ld      a, ENEMY_ANIMATION(ix)
    cp      #(0x03 * 0x02)
    jr      c, 31$
    xor     a
;   jr      31$
31$:
    ld      ENEMY_ANIMATION(ix), a

    ; 行動の完了
90$:

    ; スプライトの設定
    ld      a, ENEMY_ANIMATION(ix)
    and     #0xfe
    add     a, a
    add     a, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #enemySpritePlay
    add     hl, de
    ld      ENEMY_SPRITE_L(ix), l
    ld      ENEMY_SPRITE_H(ix), h

    ; レジスタの復帰

    ; 終了
    ret

; エネミーが死亡する
;
EnemyDead:

    ; レジスタの保存

    ; 初期化
    ld      a, ENEMY_STATE(ix)
    or      a
    jr      nz, 09$

    ; フラグの設定
    res     #ENEMY_FLAG_ACTIVE_BIT, ENEMY_FLAG(ix)
    set     #ENEMY_FLAG_RENDER_BIT, ENEMY_FLAG(ix)

    ; アニメーションの設定
    ld      ENEMY_ANIMATION(ix), #(0x06 * 0x02)

    ; SE の再生
    ld      a, #SOUND_SE_HIT
    call    _SoundPlaySe
    
    ; 初期化の完了
    inc     ENEMY_STATE(ix)
09$:

    ; アニメーションの更新
    dec     ENEMY_ANIMATION(ix)
    jr      z, 10$

    ; スプライトの設定
    ld      a, ENEMY_ANIMATION(ix)
    and     #0xfe
    add     a, a
    add     a, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #enemySpriteDead
    add     hl, de
    ld      ENEMY_SPRITE_L(ix), l
    ld      ENEMY_SPRITE_H(ix), h
    jr      19$

    ; フラグの更新
10$:
    res     #ENEMY_FLAG_RENDER_BIT, ENEMY_FLAG(ix)

    ; スコアの加算
    ld      a, ENEMY_COLOR(ix)
    call    _GameAddScore

    ; 処理の更新
    ld      hl, #EnemyIdle
    ld      ENEMY_PROC_L(ix), l
    ld      ENEMY_PROC_H(ix), h
    ld      ENEMY_STATE(ix), #0x00
    ld      ENEMY_ANIMATION(ix), #0x18
;   jr      19$
19$:

    ; レジスタの復帰

    ; 終了
    ret

; 分岐点で思考する
;
EnemyThink:

    ; レジスタの保存

    ; c > 向き

    ; 位置と向きの取得
    ld      e, ENEMY_POSITION_X(ix)
    ld      d, ENEMY_POSITION_Y(ix)
    ld      c, ENEMY_DIRECTION(ix)

    ; 種類別の思考
    ld      a, e
    or      d
    and     #0x0f
    jp      nz, 90$

    ; 通路の数の確認
    call    _RouteGetPathCount
    cp      #0x03
    jp      c, 80$

    ; ENEMY_TYPE_NEAR
10$:
    ld      a, ENEMY_TYPE(ix)
    or      a
    jr      nz, 20$
    call    70$
    cp      c
    jp      z, 80$
    xor     #0x01
    cp      c
    jp      z, 80$
    xor     #0x01
    ld      c, a
    call    _RouteIsPath
    jp      c, 90$
    jp      80$

    ; ENEMY_TYPE_FAR
20$:
    dec     a
    jr      nz, 30$
    call    70$
    cp      c
    jp      nz, 80$
    xor     #0x02
    ld      c, a
    call    _RouteIsPath
    jp      c, 90$
    ld      a, c
    xor     #0x01
    ld      c, a
    call    _RouteIsPath
    jp      c, 90$
    jr      80$

    ; ENEMY_TYPE_RANDOM
30$:
    dec     a
    jr      nz, 40$
    call    _SystemGetRandom
    and     #0x03
    ld      c, a
    xor     #0x01
    cp      ENEMY_DIRECTION(ix)
    jr      z, 31$
    call    _RouteIsPath
    jr      c, 90$
31$:
    ld      a, c
    inc     a
    and     #0x03
    ld      c, a
    xor     #0x01
    cp      ENEMY_DIRECTION(ix)
    jr      z, 32$
    call    _RouteIsPath
    jr      c, 90$
32$:
    ld      a, c
    inc     a
    and     #0x03
    ld      c, a
    xor     #0x01
    cp      ENEMY_DIRECTION(ix)
    jr      z, 33$
    call    _RouteIsPath
    jr      c, 90$
33$:
    ld      a, c
    inc     a
    and     #0x03
    ld      c, a
    jr      90$

    ; ENEMY_TYPE_STRAIGHT
40$:
    jr      80$

    ; プレイヤのいる方向を取得する
70$:
    push    de
    call    _PlayerGetPosition
    ld      a, e
    add     a, #0x08
    and     #0xf0
    ld      l, a
    ld      a, d
    add     a, #0x08
    and     #0xf0
    ld      h, a
    ld      a, l
    sub     ENEMY_POSITION_X(ix)
    jp      p, 71$
    neg
71$:
    ld      e, a
    ld      a, h
    sub     ENEMY_POSITION_Y(ix)
    jp      p, 72$
    neg
72$:
;   ld      d, a
    cp      e
    pop     de
    jr      c, 73$
    ld      a, h
    sub     d
    ld      a, #ENEMY_DIRECTION_UP
    jp      m, 79$
    ld      a, #ENEMY_DIRECTION_DOWN
    jr      79$
73$:
    ld      a, l
    sub     e
    ld      a, #ENEMY_DIRECTION_LEFT
    jp      m, 79$
    ld      a, #ENEMY_DIRECTION_RIGHT
;   jr      79$
79$:
    ret

    ; 直進する
80$:
;   ld      e, ENEMY_POSITION_X(ix)
;   ld      d, ENEMY_POSITION_Y(ix)
    ld      c, ENEMY_DIRECTION(ix)
    call    _RouteTurn
;   jr      90$

    ; 思考の完了
90$:

    ; レジスタの復帰

    ; 終了
    ret

; エネミーとプレイヤのヒット判定を行う
;
_EnemyHit::

    ; レジスタの保存
    push    hl
    push    bc
    push    de
    push    ix

    ; a > ヒットした数

    ; ヒット判定
    call    _PlayerGetPosition
    ld      ix, #_enemy
    ld      h, #0x00
    ld      b, #ENEMY_ENTRY
10$:
    push    bc
    bit     #ENEMY_FLAG_ACTIVE_BIT, ENEMY_FLAG(ix)
    jr      z, 19$
    ld      a, ENEMY_POSITION_X(ix)
    sub     e
    jp      p, 11$
    neg
11$:
    cp      #(ENEMY_HIT_DISTANCE + 0x01)
    jr      nc, 19$
    ld      c, a
    ld      a, ENEMY_POSITION_Y(ix)
    sub     d
    jp      p, 12$
    neg
12$:
    cp      #(ENEMY_HIT_DISTANCE + 0x01)
    jr      nc, 19$
    add     a, c
    cp      #(ENEMY_HIT_DISTANCE + 0x01)
    jr      nc, 19$
    ld      bc, #EnemyDead
    ld      ENEMY_PROC_L(ix), c
    ld      ENEMY_PROC_H(ix), b
    ld      ENEMY_STATE(ix), #0x00
    inc     h
19$:
    ld      bc, #ENEMY_LENGTH
    add     ix, bc
    pop     bc
    djnz    10$

    ; ヒットした数の取得
    ld      a, h

    ; レジスタの復帰
    pop     ix
    pop     de
    pop     bc
    pop     hl

    ; 終了
    ret


; 定数の定義
;

; 色
;
enemyColor:

    .db     VDP_COLOR_LIGHT_RED
    .db     VDP_COLOR_LIGHT_GREEN
    .db     VDP_COLOR_CYAN
    .db     VDP_COLOR_LIGHT_YELLOW

; スプライト
;
enemySpritePlay:

    .db     -0x08 - 0x01, -0x08, 0x40, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x50, VDP_COLOR_BLACK
    .db     -0x08 - 0x01, -0x08, 0x44, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x54, VDP_COLOR_BLACK
    .db     -0x08 - 0x01, -0x08, 0x48, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x58, VDP_COLOR_BLACK

enemySpriteDead:

    .db     -0x08 - 0x01, -0x08, 0x74, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x94, VDP_COLOR_BLACK
    .db     -0x08 - 0x01, -0x08, 0x70, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x90, VDP_COLOR_BLACK
    .db     -0x08 - 0x01, -0x08, 0x6c, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x8c, VDP_COLOR_BLACK
    .db     -0x08 - 0x01, -0x08, 0x68, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x88, VDP_COLOR_BLACK
    .db     -0x08 - 0x01, -0x08, 0x64, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x84, VDP_COLOR_BLACK
    .db     -0x08 - 0x01, -0x08, 0x60, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x80, VDP_COLOR_BLACK


; DATA 領域
;
    .area   _DATA

; 変数の定義
;

; エネミー
;
_enemy::
    
    .ds     ENEMY_LENGTH * ENEMY_ENTRY

; スプライト
;
enemySpriteRotate:

    .ds     0x01

