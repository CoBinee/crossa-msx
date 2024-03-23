; Game.s : ゲーム
;


; モジュール宣言
;
    .module Game

; 参照ファイル
;
    .include    "bios.inc"
    .include    "vdp.inc"
    .include    "System.inc"
    .include    "Sound.inc"
    .include    "App.inc"
    .include	"Game.inc"
    .include    "Route.inc"
    .include    "Player.inc"
    .include    "Enemy.inc"

; 外部変数宣言
;

; マクロの定義
;


; CODE 領域
;
    .area   _CODE

; ゲームを初期化する
;
_GameInitialize::
    
    ; レジスタの保存
    
    ; スプライトのクリア
    call    _SystemClearSprite
    
    ; パターンネームのクリア
    xor     a
    call    _SystemClearPatternName
    
    ; パターンジェネレータの設定
    ld      a, #(APP_PATTERN_GENERATOR_TABLE >> 11)
    ld      (_videoRegister + VDP_R4), a

    ; カラーテーブルの設定
    ld      a, #(APP_COLOR_TABLE >> 6)
    ld      (_videoRegister + VDP_R3), a

    ; ゲームの初期化
    ld      hl, #gameDefault
    ld      de, #_game
    ld      bc, #GAME_LENGTH
    ldir

    ; ゲーム画面の表示
    call    GamePrintScreen

    ; 経路の初期化
    call    _RouteInitialize

    ; プレイヤの初期化
    call    _PlayerInitialize

    ; エネミーの初期化
    call    _EnemyInitialize

    ; ステータスの表示
    call    GamePrintStatus

    ; 転送の設定
    ld      hl, #_SystemUpdatePatternName
    ld      (_transfer), hl

    ; 描画の開始
    ld      hl, #(_videoRegister + VDP_R1)
    set     #VDP_R1_BL, (hl)
    
    ; 処理の設定
    ld      hl, #GameStart
    ld      (_game + GAME_PROC_L), hl
    xor     a
    ld      (_game + GAME_STATE), a

    ; 状態の設定
    ld      a, #APP_STATE_GAME_UPDATE
    ld      (_app + APP_STATE), a
    
    ; レジスタの復帰
    
    ; 終了
    ret

; ゲームを更新する
;
_GameUpdate::
    
    ; レジスタの保存
    
    ; スプライトのクリア
    call    _SystemClearSprite

    ; 色の更新
    ld      a, (_game + GAME_ANIMATION)
    and     #0x18
    rrca
    rrca
    rrca
    ld      e, a
    ld      a, (_game + GAME_COLOR)
    add     a, a
    add     a, a
    add     a, e
    add     a, #(APP_COLOR_TABLE >> 6)
    ld      (_videoRegister + VDP_R3), a

    ; 状態別の処理
    ld      hl, #10$
    push    hl
    ld      hl, (_game + GAME_PROC_L)
    jp      (hl)
;   pop     hl
10$:

    ; アニメーションの更新
    ld      hl, #(_game + GAME_ANIMATION)
    inc     (hl)

    ; レジスタの復帰
    
    ; 終了
    ret

; 何もしない
;
GameNull:

    ; レジスタの保存

    ; レジスタの復帰

    ; 終了
    ret

; ゲームを待機する
;
GameIdle:

    ; レジスタの保存

    ; 初期化
    ld      a, (_game + GAME_STATE)
    or      a
    jr      nz, 09$

    ; 初期化の完了
    ld      hl, #(_game + GAME_STATE)
    inc     (hl)
09$:

    ; レジスタの復帰

    ; 終了
    ret

; ゲームを開始する
;
GameStart:

    ; レジスタの保存

    ; 初期化
    ld      a, (_game + GAME_STATE)
    or      a
    jr      nz, 09$

    ; 経過時間の設定
    ld      a, #0x01
    ld      (_game + GAME_DELTA), a

    ; フレームの設定
    ld      a, #0x30
    ld      (_game + GAME_FRAME), a

    ; 転送の設定
    ld      hl, #GameTransfer
    ld      (_transfer), hl

    ; BGM の再生
    ld      a, #SOUND_BGM_PLAY
    call    _SoundPlayBgm

    ; 初期化の完了
    ld      hl, #(_game + GAME_STATE)
    inc     (hl)
09$:

    ; 経路の更新
    call    _RouteUpdate

    ; プレイヤの更新
    call    _PlayerUpdate

    ; エネミーの更新
    call    _EnemyUpdate

    ; 経路の描画
    call    _RouteRender

    ; プレイヤの描画
    call    _PlayerRender

    ; エネミーの描画
    call    _EnemyRender

    ; ステータスの描画
    call    GamePrintStatus

    ; アナウンスの描画
    xor     a
    call    GamePrintAnnounce

    ; フレームの更新
    ld      hl, #(_game + GAME_FRAME)
    dec     (hl)
    jr      nz, 19$

    ; 処理の更新
    ld      hl, #GamePlay
    ld      (_game + GAME_PROC_L), hl
    xor     a
    ld      (_game + GAME_STATE), a
19$:

    ; レジスタの復帰

    ; 終了
    ret

; ゲームをプレイする
;
GamePlay:

    ; レジスタの保存

    ; 初期化
    ld      a, (_game + GAME_STATE)
    or      a
    jr      nz, 09$

    ; 初期化の完了
    ld      hl, #(_game + GAME_STATE)
    inc     (hl)
09$:

    ; 経過時間の更新
    ld      hl, #(_game + GAME_DELTA)
    ld      a, (hl)
    or      a
    jr      z, 19$
    dec     (hl)
19$:

    ; ヒット判定
    ld      a, (_game + GAME_DELTA)
    or      a
    jr      nz, 29$
    call    _EnemyHit
    or      a
    jr      z, 29$
    ld      a, #GAME_DELTA_HIT
    ld      (_game + GAME_DELTA), a
29$:

    ; タイムの更新
    ld      hl, #(_game + GAME_TIME_FRAME)
    ld      a, (hl)
    or      a
    jr      z, 30$
    dec     (hl)
    jr      39$
30$:
    ld      (hl), #29
    dec     hl
    ld      a, (hl)
    or      a
    jr      z, 31$
    dec     (hl)
    jr      39$
31$:
    ld      (hl), #9
    dec     hl
    ld      a, (hl)
    or      a
    jr      z, 32$
    dec     (hl)
    jr      39$
32$:
    xor     a
    ld      (hl), a
    inc     hl
    ld      (hl), a
    inc     hl
    ld      (hl), a
39$:

    ; 経路の更新
    call    _RouteUpdate

    ; プレイヤの更新
    call    _PlayerUpdate

    ; エネミーの更新
    call    _EnemyUpdate

    ; 経路の描画
    call    _RouteRender

    ; プレイヤの描画
    call    _PlayerRender

    ; エネミーの描画
    call    _EnemyRender

    ; ステータスの描画
    call    GamePrintStatus

    ; タイムアップの判定
    ld      hl, #(_game + GAME_TIME_SECOND_10)
    ld      a, (hl)
    inc     hl
    or      (hl)
    inc     hl
    or      (hl)
    jr      nz, 89$

    ; 処理の更新
    ld      hl, #GameTimeup
    ld      (_game + GAME_PROC_L), hl
    xor     a
    ld      (_game + GAME_STATE), a
89$:

    ; レジスタの復帰

    ; 終了
    ret

; タイムアップになる
;
GameTimeup:

    ; レジスタの保存

    ; 初期化
    ld      a, (_game + GAME_STATE)
    or      a
    jr      nz, 09$

    ; 経過時間の設定
    ld      a, #0x01
    ld      (_game + GAME_DELTA), a

    ; フレームの設定
    ld      a, #0x60
    ld      (_game + GAME_FRAME), a

    ; BGM の再生
    ld      a, #SOUND_BGM_TIMEUP
    call    _SoundPlayBgm

    ; 初期化の完了
    ld      hl, #(_game + GAME_STATE)
    inc     (hl)
09$:

    ; 経路の更新
    call    _RouteUpdate

    ; プレイヤの更新
    call    _PlayerUpdate

    ; エネミーの更新
    call    _EnemyUpdate

    ; 経路の描画
    call    _RouteRender

    ; プレイヤの描画
    call    _PlayerRender

    ; エネミーの描画
    call    _EnemyRender

    ; ステータスの描画
    call    GamePrintStatus

    ; アナウンスの描画
    ld      a, #GAME_ANNOUNCE_TIMEUP
    call    GamePrintAnnounce

    ; フレームの更新
    ld      hl, #(_game + GAME_FRAME)
    dec     (hl)
    jr      nz, 19$

    ; 処理の更新
    ld      hl, #GameResult
    ld      (_game + GAME_PROC_L), hl
    xor     a
    ld      (_game + GAME_STATE), a
19$:

    ; レジスタの復帰

    ; 終了
    ret

; 結果を表示する
;
GameResult:

    ; レジスタの保存

    ; 初期化
    ld      a, (_game + GAME_STATE)
    or      a
    jr      nz, 09$

    ; 画面をクリアする
    xor     a
    call    _SystemClearPatternName

    ; フレームの設定
    ld      a, #0x01
    ld      (_game + GAME_FRAME), a

    ; 転送の設定
    ld      hl, #_SystemUpdatePatternName
    ld      (_transfer), hl

    ; BGM の再生
    ld      a, #SOUND_BGM_RESULT
    call    _SoundPlayBgm

    ; 初期化の完了
    ld      hl, #(_game + GAME_STATE)
    inc     (hl)
09$:

    ; フレームの更新
    ld      hl, #(_game + GAME_FRAME)
    ld      a, (hl)
    or      a
    jr      z, 100$
    dec     (hl)
    jp      nz, 90$

    ; RESULT
100$:
    ld      a, (_game + GAME_STATE)
    dec     a
    jr      nz, 110$
    call    GamePrintResultTitle
    ld      a, #0x18
    ld      (_game + GAME_FRAME), a
    jp      80$

    ; RED MONSTER
110$:
    dec     a
    jr      nz, 120$
    call    GamePrintResultMonsterRed
    ld      a, #0x18
    ld      (_game + GAME_FRAME), a
    jr      80$

    ; GREEN MONSTER
120$:
    dec     a
    jr      nz, 130$
    call    GamePrintResultMonsterGreen
    ld      a, #0x18
    ld      (_game + GAME_FRAME), a
    jr      80$

    ; BLUE MONSTER
130$:
    dec     a
    jr      nz, 140$
    call    GamePrintResultMonsterBlue
    ld      a, #0x18
    ld      (_game + GAME_FRAME), a
    jr      80$

    ; YELLOW MONSTER
140$:
    dec     a
    jr      nz, 150$
    call    GamePrintResultMonsterYellow
    ld      a, #0x18
    ld      (_game + GAME_FRAME), a
    jr      80$

    ; MAX COMBO
150$:
    dec     a
    jr      nz, 160$
    call    GamePrintResultCombo
    ld      a, #0x18
    ld      (_game + GAME_FRAME), a
    jr      80$

    ; SCORE
160$:
    dec     a
    jr      nz, 170$
    call    GamePrintResultScore
    ld      a, #0x18
    ld      (_game + GAME_FRAME), a
    jr      80$

    ; TOP SCORE
170$:
    dec     a
    jr      nz, 180$
    ld      de, #(_game + GAME_SCORE_10000000)
    call    _AppRecordScore
    jr      nc, 171$
    call    GamePrintResultTop
    ld      a, #0x18
    ld      (_game + GAME_FRAME), a
    jr      80$
171$:
    ld      a, #0x01
    ld      (_game + GAME_FRAME), a
    jr      80$

    ; キー入力
180$:
    dec     a
    jr      nz, 190$
    ld      a, (_input + INPUT_BUTTON_SPACE)
    dec     a
    jr      nz, 90$
    call    _SoundStop
    ld      a, #SOUND_SE_CLICK
    call    _SoundPlaySe
    ld      a, #0x30
    ld      (_game + GAME_FRAME), a
    jr      80$

    ; 待機
190$:
    ld      a, #APP_STATE_TITLE_INITIALIZE
    ld      (_app + APP_STATE), a
    jr      90$

    ; 状態の更新
80$:
    ld      hl, #(_game + GAME_STATE)
    inc     (hl)

    ; 結果の完了
90$:

    ; レジスタの復帰

    ; 終了
    ret

; VRAM へ転送する
;
GameTransfer:

    ; レジスタの保存

    ; d < ポート #0
    ; e < ポート #1

    ; 経路の転送
    call    _RouteTransfer

    ; デバッグの転送
    ld      hl, #(23 * 0x0020 + 0)
    ld      b, #20
    call    _GameTransferPatternName

    ; レジスタの復帰

    ; 終了
    ret

_GameTransferPatternName::

    ; レジスタの保存
    push    de

    ; d  < ポート #0
    ; e  < ポート #1
    ; hl < 相対アドレス
    ; b  < 転送バイト数

    ; パターンネームテーブルの取得    
    ld      a, (_videoRegister + VDP_R2)
    add     a, a
    add     a, a
    add     a, h

    ; VRAM アドレスの設定
    ld      c, e
    out     (c), l
    or      #0b01000000
    out     (c), a

    ; パターンネームテーブルの転送
    ld      c, d
    ld      de, #_patternName
    add     hl, de
10$:
    outi
    jp      nz, 10$

    ; レジスタの復帰
    pop     de

    ; 終了
    ret

; 色を取得する
;
_GameGetColor::

    ; レジスタの保存

    ; a > 色

    ; 色の取得
    ld      a, (_game + GAME_COLOR)

    ; レジスタの復帰

    ; 終了
    ret

_GameGetAnimationColor::

    ; レジスタの保存
    push    hl
    push    de

    ; a > 色

    ; 色の取得
    ld      a, (_game + GAME_ANIMATION)
    and     #0x18
    rrca
    rrca
    rrca
    ld      e, a
    ld      a, (_game + GAME_COLOR)
    add     a, a
    add     a, a
    add     a, e
    ld      e, a
    ld      d, #0x00
    ld      hl, #gameColor
    add     hl, de
    ld      a, (hl)

    ; レジスタの復帰
    pop     de
    pop     hl

    ; 終了
    ret

; 時間が経過しているかどうかを判定する
;
_GameIsDelta::

    ; レジスタの保存

    ; cf > 1 = 時間が経過している

    ; 経過時間の判定
    ld      a, (_game + GAME_DELTA)
    or      a
    jr      nz, 10$
    scf
10$:

    ; レジスタの復帰

    ; 終了
    ret

; スコアを加算する
;
_GameAddScore::

    ; レジスタの保存
    push    hl
    push    bc
    push    de

    ; a < 色

    ; モンスターの更新
    ld      e, a
    ld      d, #0x00
    ld      hl, #(_game + GAME_MONSTER_RED)
    add     hl, de
    inc     (hl)

    ; 色の更新
    ld      hl, #(_game + GAME_COLOR)
    cp      (hl)
    jr      nz, 10$
    ld      hl, #(_game + GAME_COMBO_01)
    inc     (hl)
    ld      a, (hl)
    cp      #0x0a
    jr      c, 19$
    ld      (hl), #0x00
    dec     hl
    inc     (hl)
    ld      a, (hl)
    cp      #0x0a
    jr      c, 19$
    ld      a, #0x09
    jr      11$
10$:
    ld      (hl), a
    xor     a
11$:
    ld      (_game + GAME_COMBO_10), a
    ld      (_game + GAME_COMBO_01), a
19$:

    ; スコアの更新
    ld      hl, #(_game + GAME_SCORE_00000100)
    ld      de, (_game + GAME_COMBO_10)
    inc     d
    ld      a, d
    add     a, (hl)
    ld      (hl), a
    sub     #0x0a
    jr      c, 20$
    ld      (hl), a
    inc     e
20$:
    dec     hl
    ld      a, e
    add     a, (hl)
    ld      (hl), a
    sub     #0x0a
    jr      c, 29$
    ld      b, #(GAME_SCORE_LENGTH - 0x04)
21$:
    dec     hl
    inc     (hl)
    ld      a, (hl)
    cp      #0x0a
    jr      c, 29$
    ld      (hl), a
    djnz    21$
    ld      b, #(GAME_SCORE_LENGTH - 0x02)
    ld      a, #0x09
22$:
    ld      (hl), a
    inc     hl
    djnz    22$
29$:

    ; コンボの更新
    ld      a, (_game + GAME_COMBO_10)
    ld      hl, #(_game + GAME_COMBO_MAXIMUM_10)
    cp      (hl)
    jr      c, 39$
    jr      nz, 30$
    ld      a, (_game + GAME_COMBO_01)
    ld      hl, #(_game + GAME_COMBO_MAXIMUM_01)
    cp      (hl)
    jr      c, 39$
30$:
    ld      a, (_game + GAME_COMBO_10)
    ld      (_game + GAME_COMBO_MAXIMUM_10), a
    ld      a, (_game + GAME_COMBO_01)
    ld      (_game + GAME_COMBO_MAXIMUM_01), a
39$:

    ; レジスタの復帰
    pop     de
    pop     bc
    pop     hl

    ; 終了
    ret

; コンボを取得する
;
_GameGetCombo::

    ; レジスタの保存
    push    de

    ; a > コンボ

    ; コンボの取得
    ld      de, (_game + GAME_COMBO_10)
    ld      a, e
    add     a, a
    ld      e, a
    add     a, a
    add     a, a
    add     a, e
    add     a, d

    ; レジスタの復帰
    pop     de

    ; 終了
    ret

; ゲーム画面を表示する
;
GamePrintScreen:

    ; レジスタの保存

    ; スコアの表示
    ld      hl, #gameScoreString
    ld      de, #(_patternName + 0x0000 * 0x0020 + 0x0018)
    call    GamePrintString

    ; コンボの表示

    ; タイムの表示
    ld      hl, #gameTimeString
    ld      de, #(_patternName + 0x0014 * 0x0020 + 0x0018)
    call    GamePrintString

    ; 速度の表示

    ; レジスタの復帰

    ; 終了
    ret

; ステータスを表示する
;
GamePrintStatus:

    ; レジスタの保存

    ; スコアの表示
    ld      hl, #(_game + GAME_SCORE_10000000)
    ld      de, #(_patternName + 0x0001 * 0x0020 + 0x0018)
    ld      b, #(GAME_SCORE_LENGTH - 1)
10$:
    ld      a, (hl)
    or      a
    jr      nz, 11$
    ld      (de), a
    inc     hl
    inc     de
    djnz    10$
11$:
    inc     b
12$:
    ld      a, (hl)
    add     a, #0x10
    ld      (de), a
    inc     hl
    inc     de
    djnz    12$

    ; コンボの表示
    ld      de, #(_patternName + 0x0003 * 0x0020 + 0x0018)
    ld      hl, (_game + GAME_COMBO_10)
    ld      a, l
    or      a
    jr      nz, 21$
    ld      a, h
    or      a
    jr      nz, 20$
    ld      hl, #gameComboString_0
    call    GamePrintString
    jr      29$
20$:
    dec     a
    jr      nz, 21$
    ld      hl, #gameComboString_1
    call    GamePrintString
    jr      29$
21$:
    push    hl
    push    de
    ld      hl, #gameComboString_2
    call    GamePrintString
    pop     de
    pop     hl
    ld      a, l
    or      a
    jr      z, 22$
    add     a, #0x10
22$:
    ld      (de), a
    inc     de
    ld      a, h
    add     a, #0x10
    ld      (de), a
29$:

    ; タイムの表示
    ld      hl, #(_game + GAME_TIME_SECOND_10)
    ld      de, #(_patternName + 0x0015 * 0x0020 + 0x001b)
    ld      a, (hl)
    or      a
    jr      z, 30$
    add     a, #0x10
30$:
    ld      (de), a
    inc     hl
    inc     de
    ld      a, (hl)
    add     a, #0x10
    ld      (de), a
    inc     hl
    inc     de
    ld      a, #0x02
    ld      (de), a
    inc     de
    ld      c, (hl)
    ld      b, #0x00
    ld      hl, #gameTimeFrame
    add     hl, bc
    ld      a, (hl)
    rrca
    rrca
    rrca
    rrca
    and     #0x0f
    add     a, #0x10
    ld      (de), a
    inc     de
    ld      a, (hl)
    and     #0x0f
    add     a, #0x10
    ld      (de), a

    ; 速度の表示
    call    _PlayerGetSpeed
    ld      c, a
    sub     #PLAYER_SPEED_MINIMUM
    inc     a
    ld      b, a
    ld      de, #(_patternName + 0x0017 * 0x0020 + 0x0018)
    ld      a, #0x1e
40$:
    ld      (de), a
    inc     de
    djnz    40$
    ld      a, #PLAYER_SPEED_MAXIMUM
    sub     c
    jr      z, 49$
    ld      b, a
    xor     a
41$:
    ld      (de), a
    inc     de
    djnz    41$
49$:

    ; レジスタの復帰

    ; 終了
    ret

; アナウンスを表示する
;
GamePrintAnnounce:

    ; レジスタの保存
    push    hl
    push    bc
    push    de

    ; a < アナウンス

    ; アナウンスの描画
    add     a, a
    add     a, a
    add     a, a
    add     a, a
    add     a, #0xa0
    ld      b, a
;   call    _SystemGetRandom
;   and     #0x0f
    call    _GameGetAnimationColor
    ld      c, a
    ld      hl, #(_sprite + GAME_SPRITE_ANNOUNCE)
    ld      de, #(((0x40 - 0x01) << 8) | (0x40))
    ld      a, #0x04
10$:
    push    af
    ld      (hl), d
    inc     hl
    ld      (hl), e
    inc     hl
    ld      (hl), b
    inc     hl
    ld      (hl), c
    inc     hl
    ld      a, e
    add     a, #0x10
    ld      e, a
    ld      a, b
    add     a, #0x04
    ld      b, a
    pop     af
    dec     a
    jr      nz, 10$
19$:

    ; レジスタの復帰
    pop     de
    pop     bc
    pop     hl

    ; 終了
    ret

; 結果を表示する
;
GamePrintResultTitle:

    ; レジスタの保存
    push    hl
    push    de

    ; 結果の表示
    ld      hl, #gameResultString_Title
    ld      de, #(_patternName + 0x0003 * 0x0020 + 0x000d)
    call    GamePrintString

    ; レジスタの復帰
    pop     de
    pop     hl

    ; 終了
    ret

GamePrintResultMonsterRed:

    ; レジスタの保存
    push    hl
    push    bc
    push    de

    ; 結果の表示
    ld      hl, #gameResultString_MonsterRed
    ld      de, #(_patternName + 0x0006 * 0x0020 + 0x0005)
    ld      a, (_game + GAME_MONSTER_RED)
    ld      c, a
    call    GamePrintResultMonster

    ; レジスタの復帰
    pop     de
    pop     bc
    pop     hl

    ; 終了
    ret

GamePrintResultMonsterGreen:

    ; レジスタの保存
    push    hl
    push    bc
    push    de

    ; 結果の表示
    ld      hl, #gameResultString_MonsterGreen
    ld      de, #(_patternName + 0x0008 * 0x0020 + 0x0003)
    ld      a, (_game + GAME_MONSTER_GREEN)
    ld      c, a
    call    GamePrintResultMonster

    ; レジスタの復帰
    pop     de
    pop     bc
    pop     hl

    ; 終了
    ret

GamePrintResultMonsterBlue:

    ; レジスタの保存
    push    hl
    push    bc
    push    de

    ; 結果の表示
    ld      hl, #gameResultString_MonsterBlue
    ld      de, #(_patternName + 0x000a * 0x0020 + 0x0004)
    ld      a, (_game + GAME_MONSTER_BLUE)
    ld      c, a
    call    GamePrintResultMonster

    ; レジスタの復帰
    pop     de
    pop     bc
    pop     hl

    ; 終了
    ret

GamePrintResultMonsterYellow:

    ; レジスタの保存
    push    hl
    push    bc
    push    de

    ; 結果の表示
    ld      hl, #gameResultString_MonsterYellow
    ld      de, #(_patternName + 0x000c * 0x0020 + 0x0002)
    ld      a, (_game + GAME_MONSTER_YELLOW)
    ld      c, a
    call    GamePrintResultMonster

    ; レジスタの復帰
    pop     de
    pop     bc
    pop     hl

    ; 終了
    ret

GamePrintResultCombo:

    ; レジスタの保存
    push    hl
    push    de

    ; 結果の表示
    ld      hl, #gameResultString_Combo
    ld      de, #(_patternName + 0x000e * 0x0020 + 0x0007)
    call    GamePrintString
    ld      hl, #(_patternName + 0x000e * 0x0020 + 0x0017)
    ld      a, (_game + GAME_COMBO_MAXIMUM_10)
    or      a
    jr      z, 10$
    add     a, #0x10
10$:
    ld      (hl), a
    inc     hl
    ld      a, (_game + GAME_COMBO_MAXIMUM_01)
    add     a, #0x10
    ld      (hl), a
;   inc     hl

    ; レジスタの復帰
    pop     de
    pop     hl

    ; 終了
    ret

GamePrintResultScore:

    ; レジスタの保存
    push    hl
    push    bc
    push    de

    ; 結果の表示
    ld      hl, #gameResultString_Score
    ld      de, #(_patternName + 0x0011 * 0x0020 + 0x000b)
    call    GamePrintString
    ld      hl, #(_game + GAME_SCORE_10000000)
    ld      de, #(_patternName + 0x0011 * 0x0020 + 0x0011)
    ld      b, #(GAME_SCORE_LENGTH - 0x01)
10$:
    ld      a, (hl)
    or      a
    jr      nz, 11$
    ld      (de), a
    inc     hl
    inc     de
    djnz    10$
11$:
    inc     b
12$:
    ld      a, (hl)
    add     a, #0x10
    ld      (de), a
    inc     hl
    inc     de
    djnz    12$

    ; レジスタの復帰
    pop     de
    pop     bc
    pop     hl

    ; 終了
    ret

GamePrintResultTop:

    ; レジスタの保存
    push    hl
    push    de

    ; 結果の表示
    ld      hl, #gameResultString_Top
    ld      de, #(_patternName + 0x0013 * 0x0020 + 0x000b)
    call    GamePrintString

    ; レジスタの復帰
    pop     de
    pop     hl

    ; 終了
    ret

GamePrintResultMonster:

    ; レジスタの保存

    ; hl < 文字列
    ; de < 表示位置
    ; c  < モンスターの数

    ; 文字列の描画
10$:
    ld      a, (hl)
    or      a
    jr      z, 19$
    sub     #0x20
    ld      (de), a
    inc     hl
    inc     de
    jr      10$
19$:
    ld      hl, #0x0006
    add     hl, de

    ; 数値の表示
    ld      a, c
    cp      #200
    jr      c, 200$
    ld      (hl), #0x12
    inc     hl
    sub     #200
    jr      210$
200$:
    cp      #100
    jr      c, 201$
    ld      (hl), #0x11
    inc     hl
    sub     #100
    jr      210$
201$:
    ld      (hl), #0x00
    inc     hl
    cp      #10
    jr      nc, 210$
    ld      (hl), #0x00
    inc     hl
    jr      220$
210$:
    ld      b, #0x00
211$:
    inc     b
    sub     #10
    jr      nc, 211$
    add     a, #10
    dec     b
    ld      c, a
    ld      a, b
    add     a, #0x10
    ld      (hl), a
    inc     hl
    ld      a, c
;   jr      220$
220$:
    add     a, #0x10
    ld      (hl), a

    ; レジスタの復帰

    ; 終了
    ret

; 文字列を表示する
;
GamePrintString:

    ; レジスタの保存
    push    hl
    push    de

    ; hl < 文字列
    ; de < 表示位置

    ; 文字列の描画
10$:
    ld      a, (hl)
    or      a
    jr      z, 19$
    sub     #0x20
    ld      (de), a
    inc     hl
    inc     de
    jr      10$
19$:

    ; レジスタの復帰
    pop     de
    pop     hl

    ; 終了
    ret

; 定数の定義
;

; ゲームの初期値
;
gameDefault:

    .dw     GAME_PROC_NULL
    .db     GAME_STATE_NULL
    .db     GAME_FLAG_NULL
    .db     GAME_FRAME_NULL
    .db     GAME_COUNT_NULL
    .db     GAME_COLOR_YELLOW ; GAME_COLOR_NULL
    .db     GAME_ANIMATION_NULL
    .db     GAME_DELTA_NULL
    .db     9 ; GAME_TIME_NULL
    .db     9 ; GAME_TIME_NULL
    .db     0 ; GAME_TIME_NULL
    .db     GAME_SCORE_NULL
    .db     GAME_SCORE_NULL
    .db     GAME_SCORE_NULL
    .db     GAME_SCORE_NULL
    .db     GAME_SCORE_NULL
    .db     GAME_SCORE_NULL
    .db     GAME_SCORE_NULL
    .db     GAME_SCORE_NULL
    .db     GAME_COMBO_NULL
    .db     GAME_COMBO_NULL
    .db     GAME_COMBO_NULL
    .db     GAME_COMBO_NULL
    .db     GAME_MONSTER_NULL
    .db     GAME_MONSTER_NULL
    .db     GAME_MONSTER_NULL
    .db     GAME_MONSTER_NULL

; 色
;
gameColor:

    .db     VDP_COLOR_DARK_RED
    .db     VDP_COLOR_MEDIUM_RED
    .db     VDP_COLOR_LIGHT_RED
    .db     VDP_COLOR_MEDIUM_RED
    .db     VDP_COLOR_DARK_GREEN
    .db     VDP_COLOR_MEDIUM_GREEN
    .db     VDP_COLOR_LIGHT_GREEN
    .db     VDP_COLOR_MEDIUM_GREEN
    .db     VDP_COLOR_DARK_BLUE
    .db     VDP_COLOR_LIGHT_BLUE
    .db     VDP_COLOR_CYAN
    .db     VDP_COLOR_LIGHT_BLUE
    .db     VDP_COLOR_DARK_YELLOW
    .db     VDP_COLOR_LIGHT_YELLOW
    .db     VDP_COLOR_GRAY
    .db     VDP_COLOR_LIGHT_YELLOW

; スコア
;
gameScoreString:

    .ascii  "SCORE"
    .db     0x00

; コンボ
;
gameComboString_0:

    .ascii  "        "
    .db     0x00

gameComboString_1:

    .ascii  "  COMBO "
    .db     0x00

gameComboString_2:

    .ascii  "  COMBOS"
    .db     0x00

; タイム
;
gameTimeString:

    .ascii  "TIME"
    .db     0x00

gameTimeFrame:

    .db     0x00, 0x03, 0x06
    .db     0x10, 0x13, 0x16
    .db     0x20, 0x23, 0x26
    .db     0x30, 0x33, 0x36
    .db     0x40, 0x43, 0x46
    .db     0x50, 0x53, 0x56
    .db     0x60, 0x63, 0x66
    .db     0x70, 0x73, 0x76
    .db     0x80, 0x83, 0x86
    .db     0x90, 0x93, 0x96

; 結果
;
gameResultString_Title:

    .ascii  "RESULT"
    .db     0x00

gameResultString_MonsterRed:

    .ascii  "RED MONSTER"
    .db     0x00

gameResultString_MonsterGreen:

    .ascii  "GREEN MONSTER"
    .db     0x00

gameResultString_MonsterBlue:

    .ascii  "BLUE MONSTER"
    .db     0x00

gameResultString_MonsterYellow:

    .ascii  "YELLOW MONSTER"
    .db     0x00

gameResultString_Combo:

    .ascii  "MAX COMBO"
    .db     0x00

gameResultString_Score:

    .ascii  "SCORE"
    .db     0x00

gameResultString_Top:

    .ascii  "TOP SCORE!"
    .db     0x00


; DATA 領域
;
    .area   _DATA

; 変数の定義
;

; ゲーム
;
_game::

    .ds     GAME_LENGTH

