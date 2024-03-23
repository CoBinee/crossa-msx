; Player.s : プレイヤ
;


; モジュール宣言
;
    .module Player

; 参照ファイル
;
    .include    "bios.inc"
    .include    "vdp.inc"
    .include    "System.inc"
    .include    "Sound.inc"
    .include    "App.inc"
    .include    "Game.inc"
    .include    "Route.inc"
    .include	"Player.inc"

; 外部変数宣言
;

; マクロの定義
;


; CODE 領域
;
    .area   _CODE

; プレイヤを初期化する
;
_PlayerInitialize::
    
    ; レジスタの保存
    
    ; プレイヤの初期化
    ld      hl, #playerDefault
    ld      de, #_player
    ld      bc, #PLAYER_LENGTH
    ldir

    ; 処理の設定
    ld      hl, #PlayerPlay
    ld      (_player + PLAYER_PROC_L), hl
    xor     a
    ld      (_player + PLAYER_STATE), a
    
    ; レジスタの復帰
    
    ; 終了
    ret

; プレイヤを更新する
;
_PlayerUpdate::
    
    ; レジスタの保存

    ; 状態別の処理
    ld      hl, #10$
    push    hl
    ld      hl, (_player + PLAYER_PROC_L)
    jp      (hl)
;   pop     hl
10$:

    ; レジスタの復帰
    
    ; 終了
    ret

; プレイヤを描画する
;
_PlayerRender::

    ; レジスタの保存

    ; 位置の取得
    ld      bc, #0x6060

    ; スプライトの描画
    ld      hl, (_player + PLAYER_SPRITE_L)
    ld      de, #(_sprite + GAME_SPRITE_PLAYER_0)
    ld      a, b
    add     a, (hl)
    ld      (de), a
    inc     hl
    inc     de
    ld      a, c
    add     a, (hl)
    ld      (de), a
    inc     hl
    inc     de
    ld      a, (hl)
    ld      (de), a
    inc     hl
    inc     de
    call    _GameGetAnimationColor
    ld      (de), a
    inc     hl
    inc     de
    ld      de, #(_sprite + GAME_SPRITE_PLAYER_1)
    ld      a, b
    add     a, (hl)
    ld      (de), a
    inc     hl
    inc     de
    ld      a, c
    add     a, (hl)
    ld      (de), a
    inc     hl
    inc     de
    ld      a, (hl)
    ld      (de), a
    inc     hl
    inc     de
    ld      a, (hl)
    ld      (de), a
;   inc     hl
;   inc     de

    ; レジスタの復帰

    ; 終了
    ret

; 何もしない
;
PlayerNull:

    ; レジスタの保存

    ; レジスタの復帰

    ; 終了
    ret

; プレイヤを操作する
;
PlayerPlay:

    ; レジスタの保存

    ; 初期化
    ld      a, (_player + PLAYER_STATE)
    or      a
    jr      nz, 09$

    ; 向きの設定
    call    _SystemGetRandom
    and     #0x03
    ld      c, a
    ld      de, (_player + PLAYER_POSITION_X)
    call    _RouteTurn
    ld      a, c
    ld      (_player + PLAYER_DIRECTION), a

    ; 初期化の完了
    ld      hl, #(_player + PLAYER_STATE)
    inc     (hl)
09$:

    ; 経過時間の確認
    call    _GameIsDelta
    jp      nc, 90$

    ; キーの取得
    ld      c, #0x00
    ld      a, (_input + INPUT_KEY_UP)
    or      a
    jr      z, 10$
    set     #PLAYER_DIRECTION_UP, c
10$:
    ld      a, (_input + INPUT_KEY_DOWN)
    or      a
    jr      z, 11$
    set     #PLAYER_DIRECTION_DOWN, c
11$:
    ld      a, (_input + INPUT_KEY_LEFT)
    or      a
    jr      z, 12$
    set     #PLAYER_DIRECTION_LEFT, c
12$:
    ld      a, (_input + INPUT_KEY_RIGHT)
    or      a
    jr      z, 13$
    set     #PLAYER_DIRECTION_RIGHT, c
13$:

    ; 方向転換（後ろ）
    ld      a, (_player + PLAYER_DIRECTION)
    ld      e, a
    ld      d, #0x00
    ld      hl, #playerTurnBack
    add     hl, de
    ld      a, (hl)
    and     c
    jr      z, 29$
    ld      a, e
    xor     #0x01
    ld      (_player + PLAYER_DIRECTION), a
    ld      c, #0x00
29$:

    ; 速度の更新
    call    _GameGetCombo
    cp      #PLAYER_SPEED_MINIMUM
    jr      nc, 30$
    ld      a, #PLAYER_SPEED_MINIMUM
    jr      31$
30$:
    cp      #PLAYER_SPEED_MAXIMUM
    jr      c, 31$
    ld      a, #PLAYER_SPEED_MAXIMUM
;   jr      31$
31$:
    ld      (_player + PLAYER_SPEED), a

    ; 分岐まで移動
    ld      h, c
    ld      de, (_player + PLAYER_POSITION_X)
    ld      a, (_player + PLAYER_SPEED)
    ld      b, a
    ld      a, (_player + PLAYER_DIRECTION)
    ld      c, a
    call    _RouteMoveToPoint
    ld      c, h

    ; 方向転換
    ld      a, d
    or      e
    and     #0x0f
    jr      nz, 49$
    ld      a, c
    or      c
    jr      z, 45$
40$:
    bit     #PLAYER_DIRECTION_UP, c
    jr      z, 41$
    ld      c, #PLAYER_DIRECTION_UP
    jr      44$
41$:
    bit     #PLAYER_DIRECTION_DOWN, c
    jr      z, 42$
    ld      c, #PLAYER_DIRECTION_DOWN
    jr      44$
42$:
    bit     #PLAYER_DIRECTION_LEFT, c
    jr      z, 43$
    ld      c, #PLAYER_DIRECTION_LEFT
    jr      44$
43$:
    bit     #PLAYER_DIRECTION_RIGHT, c
    jr      z, 45$
    ld      c, #PLAYER_DIRECTION_RIGHT
44$:
    call    _RouteIsPath
    jr      c, 48$
45$:
    ld      a, (_player + PLAYER_DIRECTION)
    ld      c, a
    call    _RouteTurn
48$:
    ld      a, c
    ld      (_player + PLAYER_DIRECTION), a
49$:

    ; 残りを移動
    ld      a, (_player + PLAYER_DIRECTION)
    ld      c, a
    call    _RouteMoveFromPoint
    ld      (_player + PLAYER_POSITION_X), de

    ; アニメーションの更新
    ld      hl, #(_player + PLAYER_ANIMATION)
    ld      a, (hl)
    inc     a
    cp      #(0x06 * 0x02)
    jr      c, 60$
    xor     a
60$:
    ld      (hl), a

    ; 操作の完了
90$:

    ; 位置の更新
    ld      de, (_player + PLAYER_POSITION_X)
    call    _RouteSetPosition

    ; スプライトの設定
    ld      a, (_player + PLAYER_ANIMATION)
    and     #0xfe
    add     a, a
    add     a, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #playerSprite
    add     hl, de
    ld      (_player + PLAYER_SPRITE_L), hl

    ; レジスタの復帰

    ; 終了
    ret

; プレイヤの位置を取得する
;
_PlayerGetPosition::

    ; レジスタの保存

    ; de > Y/X 位置

    ; 位置の取得
    ld      de, (_player + PLAYER_POSITION_X)

    ; レジスタの復帰

    ; 終了
    ret

; プレイヤの速度を取得する
;
_PlayerGetSpeed::

    ; レジスタの保存

    ; a > 速度

    ; 速度の取得
    ld      a, (_player + PLAYER_SPEED)

    ; レジスタの復帰

    ; 終了
    ret

; 定数の定義
;

; プレイヤの初期値
;
playerDefault:

    .dw     PLAYER_PROC_NULL
    .db     PLAYER_STATE_NULL
    .db     PLAYER_FLAG_NULL
    .db     0x10 ; PLAYER_POSITION_NULL
    .db     0x10 ; PLAYER_POSITION_NULL
    .db     PLAYER_DIRECTION_NULL
    .db     PLAYER_SPEED_MINIMUM ; PLAYER_SPEED_NULL
    .db     PLAYER_ANIMATION_NULL
    .dw     PLAYER_SPRITE_NULL

; 方向転換
;
playerTurnBack:

    .db     1 << PLAYER_DIRECTION_DOWN
    .db     1 << PLAYER_DIRECTION_UP
    .db     1 << PLAYER_DIRECTION_RIGHT
    .db     1 << PLAYER_DIRECTION_LEFT

; スプライト
;
playerSprite:

    .db     -0x08 - 0x01, -0x08, 0x20, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x30, VDP_COLOR_BLACK
    .db     -0x08 - 0x01, -0x08, 0x24, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x34, VDP_COLOR_BLACK
    .db     -0x08 - 0x01, -0x08, 0x28, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x38, VDP_COLOR_BLACK
    .db     -0x08 - 0x01, -0x08, 0x2c, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x3c, VDP_COLOR_BLACK
    .db     -0x08 - 0x01, -0x08, 0x28, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x38, VDP_COLOR_BLACK
    .db     -0x08 - 0x01, -0x08, 0x24, VDP_COLOR_TRANSPARENT
    .db     -0x08 - 0x01, -0x08, 0x34, VDP_COLOR_BLACK


; DATA 領域
;
    .area   _DATA

; 変数の定義
;

; プレイヤ
;
_player::
    
    .ds     PLAYER_LENGTH

