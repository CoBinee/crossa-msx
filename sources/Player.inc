; Player.inc : プレイヤ
;


; マクロの定義
;

; プレイヤ
PLAYER_PROC_L                   =   0x00
PLAYER_PROC_H                   =   0x01
PLAYER_STATE                    =   0x02
PLAYER_FLAG                     =   0x03
PLAYER_POSITION_X               =   0x04
PLAYER_POSITION_Y               =   0x05
PLAYER_DIRECTION                =   0x06
PLAYER_SPEED                    =   0x07
PLAYER_ANIMATION                =   0x08
PLAYER_SPRITE_L                 =   0x09
PLAYER_SPRITE_H                 =   0x0a
PLAYER_LENGTH                   =   0x0b

; 処理
PLAYER_PROC_NULL                =   0x00

; 状態
PLAYER_STATE_NULL               =   0x00

; フラグ
PLAYER_FLAG_NULL                =   0x00

; 位置
PLAYER_POSITION_NULL            =   0x00

; 向き
PLAYER_DIRECTION_NULL           =   0x00
PLAYER_DIRECTION_UP             =   0x00
PLAYER_DIRECTION_DOWN           =   0x01
PLAYER_DIRECTION_LEFT           =   0x02
PLAYER_DIRECTION_RIGHT          =   0x03

; 速度
PLAYER_SPEED_NULL               =   0x00
PLAYER_SPEED_MINIMUM            =   0x02
PLAYER_SPEED_MAXIMUM            =   0x08

; アニメーション
PLAYER_ANIMATION_NULL           =   0x00

; スプライト
PLAYER_SPRITE_NULL              =   0x00

; 外部関数宣言
;

    .globl  _PlayerInitialize
    .globl  _PlayerUpdate
    .globl  _PlayerRender
    .globl  _PlayerGetPosition
    .globl  _PlayerGetSpeed

; 外部変数宣言
;

    .globl  _player
