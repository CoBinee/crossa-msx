; Enemy.inc : エネミー
;


; マクロの定義
;

; エネミー
ENEMY_PROC_L                    =   0x00
ENEMY_PROC_H                    =   0x01
ENEMY_TYPE                      =   0x02
ENEMY_STATE                     =   0x03
ENEMY_FLAG                      =   0x04
ENEMY_POSITION_X                =   0x05
ENEMY_POSITION_Y                =   0x06
ENEMY_DIRECTION                 =   0x07
ENEMY_SPEED                     =   0x08
ENEMY_COLOR                     =   0x09
ENEMY_ANIMATION                 =   0x0a
ENEMY_SPRITE_L                  =   0x0b
ENEMY_SPRITE_H                  =   0x0c
ENEMY_SPRITE_X                  =   0x0d
ENEMY_SPRITE_Y                  =   0x0e
ENEMY_SPRITE_COLOR              =   0x0f
ENEMY_LENGTH                    =   0x10

; 処理
ENEMY_PROC_NULL                 =   0x00

; 種類
ENEMY_TYPE_NULL                 =   0x00
ENEMY_TYPE_NEAR                 =   0x00
ENEMY_TYPE_FAR                  =   0x01
ENEMY_TYPE_RANDOM               =   0x02
ENEMY_TYPE_STRAIGHT             =   0x03

; 状態
ENEMY_STATE_NULL                =   0x00

; フラグ
ENEMY_FLAG_NULL                 =   0x00
ENEMY_FLAG_ACTIVE_BIT           =   0x00
ENEMY_FLAG_ACTIVE               =   (1 << ENEMY_FLAG_ACTIVE_BIT)
ENEMY_FLAG_CLIP_BIT             =   0x06
ENEMY_FLAG_CLIP                 =   (1 << ENEMY_FLAG_CLIP_BIT)
ENEMY_FLAG_RENDER_BIT           =   0x07
ENEMY_FLAG_RENDER               =   (1 << ENEMY_FLAG_RENDER_BIT)

; 位置
ENEMY_POSITION_NULL             =   0x00

; 向き
ENEMY_DIRECTION_NULL            =   0x00
ENEMY_DIRECTION_UP              =   0x00
ENEMY_DIRECTION_DOWN            =   0x01
ENEMY_DIRECTION_LEFT            =   0x02
ENEMY_DIRECTION_RIGHT           =   0x03

; 速度
ENEMY_SPEED_NULL                =   0x00

; 色
ENEMY_COLOR_NULL                =   0x00
ENEMY_COLOR_RED                 =   0x00
ENEMY_COLOR_GREEN               =   0x01
ENEMY_COLOR_BLUE                =   0x02
ENEMY_COLOR_YELLOW              =   0x03

; アニメーション
ENEMY_ANIMATION_NULL            =   0x00

; 色

; スプライト
ENEMY_SPRITE_NULL               =   0x00

; エントリ
ENEMY_ENTRY                     =   0x0c

; ヒット
ENEMY_HIT_DISTANCE              =   0x08

; 外部関数宣言
;

    .globl  _EnemyInitialize
    .globl  _EnemyUpdate
    .globl  _EnemyRender
    .globl  _EnemyHit

; 外部変数宣言
;

    .globl  _enemy
