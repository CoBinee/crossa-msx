; Title.s : タイトル
;


; モジュール宣言
;
    .module Title

; 参照ファイル
;
    .include    "bios.inc"
    .include    "vdp.inc"
    .include    "System.inc"
    .include    "Sound.inc"
    .include    "App.inc"
    .include	"Title.inc"

; 外部変数宣言
;

; マクロの定義
;


; CODE 領域
;
    .area   _CODE

; タイトルを初期化する
;
_TitleInitialize::
    
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

    ; タイトルの初期化
    ld      hl, #titleDefault
    ld      de, #_title
    ld      bc, #TITLE_LENGTH
    ldir

    ; 転送の設定
    ld      hl, #_SystemUpdatePatternName
    ld      (_transfer), hl

    ; 描画の開始
    ld      hl, #(_videoRegister + VDP_R1)
    set     #VDP_R1_BL, (hl)
    
    ; 処理の設定
    ld      hl, #TitleIdle
    ld      (_title + TITLE_PROC_L), hl
    xor     a
    ld      (_title + TITLE_STATE), a

    ; 状態の設定
    ld      a, #APP_STATE_TITLE_UPDATE
    ld      (_app + APP_STATE), a
    
    ; レジスタの復帰
    
    ; 終了
    ret

; タイトルを更新する
;
_TitleUpdate::
    
    ; レジスタの保存
    
    ; スプライトのクリア
    call    _SystemClearSprite

    ; 色の更新
    ld      a, (_title + TITLE_ANIMATION)
    and     #0x78
    rrca
    rrca
    rrca
    add     a, #(APP_COLOR_TABLE >> 6)
    ld      (_videoRegister + VDP_R3), a

    ; 状態別の処理
    ld      hl, #10$
    push    hl
    ld      hl, (_title + TITLE_PROC_L)
    jp      (hl)
;   pop     hl
10$:

    ; アニメーションの更新
    ld      hl, #(_title + TITLE_ANIMATION)
    inc     (hl)

    ; レジスタの復帰
    
    ; 終了
    ret

; 何もしない
;
TitleNull:

    ; レジスタの保存

    ; レジスタの復帰

    ; 終了
    ret

; タイトルを待機する
;
TitleIdle:

    ; レジスタの保存

    ; 初期化
    ld      a, (_title + TITLE_STATE)
    or      a
    jr      nz, 09$

    ; タイトル画面の表示
    call    TitlePrintScreen

    ; フレームの設定
    xor     a
    ld      (_title + TITLE_FRAME), a

    ; BGM の再生
    ld      a, #SOUND_BGM_TITLE
    call    _SoundPlayBgm

    ; 初期化の完了
    ld      hl, #(_title + TITLE_STATE)
    inc     (hl)
09$:

    ; キー入力
    ld      a, (_input + INPUT_BUTTON_SPACE)
    dec     a
    jr      nz, 19$

    ; 処理の更新
    ld      hl, #TitleStart
    ld      (_title + TITLE_PROC_L), hl
    xor     a
    ld      (_title + TITLE_STATE), a
19$:

    ; HIT SPACE BAR の表示
    ld      a, (_title + TITLE_FRAME)
    rrca
    rrca
    rrca
    rrca
    and     #0x01
    xor     #0x01
    call    TitlePrintHitSpaceBar

    ; フレームの更新
    ld      hl, #(_title + TITLE_FRAME)
    inc     (hl)

    ; レジスタの復帰

    ; 終了
    ret

; タイトルを開始する
;
TitleStart:

    ; レジスタの保存

    ; 初期化
    ld      a, (_title + TITLE_STATE)
    or      a
    jr      nz, 09$

    ; フレームの設定
    ld      a, #0x30
    ld      (_title + TITLE_FRAME), a

    ; SE の再生
    call    _SoundStop
    ld      a, #SOUND_SE_BOOT
    call    _SoundPlaySe

    ; 初期化の完了
    ld      hl, #(_title + TITLE_STATE)
    inc     (hl)
09$:

    ; フレームの更新
    ld      hl, #(_title + TITLE_FRAME)
    dec     (hl)
    jr      nz, 19$

    ; 状態の更新
    ld      a, #APP_STATE_GAME_INITIALIZE
    ld      (_app + APP_STATE), a
19$:

    ; HIT SPACE BAR の表示
    ld      a, (_title + TITLE_FRAME)
    rrca
    and     #0x01
    xor     #0x01
    call    TitlePrintHitSpaceBar

    ; レジスタの復帰

    ; 終了
    ret

; タイトル画面を表示する
;
TitlePrintScreen:

    ; レジスタの保存
    push    hl
    push    bc
    push    de

    ; ロゴの描画
    ld      hl, #(_patternName + 0x0002 * 0x0020 + 0x000a)
    ld      de, #titleLogo
    ld      b, #0x0c
10$:
    push    bc
    ld      b, #0x0c
11$:
    ld      a, (de)
    ld      (hl), a
    inc     de
    inc     hl
    djnz    11$
    ld      bc, #(0x0020 - 0x000c)
    add     hl, bc
    pop     bc
    djnz    10$

    ; スコアの描画
    ld      hl, #titleScoreString
    ld      de, #(_patternName + 0x0010 * 0x0020 + 0x0009)
    call    TitlePrintString
    ld      hl, #(_app + APP_SCORE_10000000)
    ld      de, #(_patternName + 0x0010 * 0x0020 + 0x000e)
    ld      b, #(APP_SCORE_LENGTH - 0x01)
20$:
    ld      a, (hl)
    or      a
    jr      nz, 21$
    ld      (de), a
    inc     hl
    inc     de
    djnz    20$
21$:
    inc     b
22$:
    ld      a, (hl)
    add     a, #0x10
    ld      (de), a
    inc     hl
    inc     de
    djnz    22$

    ; レジスタの復帰
    pop     de
    pop     bc
    pop     hl

    ; 終了
    ret

; HIT SPACE BAR を表示する
;
TitlePrintHitSpaceBar:

    ; レジスタの保存
    push    hl
    push    bc
    push    de

    ; a < 1 = 表示

    ; ロゴの描画

    ; HIT SPACE BAR の描画
    ld      de, #(_patternName + 0x0014 * 0x0020 + 0x0009)
    or      a
    jr      z, 10$
    ld      hl, #titleHitSpaceBarString
    call    TitlePrintString
    jr      19$
10$:
    ld      b, #0x0d
11$:
    ld      (de), a
    inc     de
    djnz    11$
19$:

    ; レジスタの復帰
    pop     de
    pop     bc
    pop     hl

    ; 終了
    ret

; 文字列を表示する
;
TitlePrintString:

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

; タイトルの初期値
;
titleDefault:

    .dw     TITLE_PROC_NULL
    .db     TITLE_STATE_NULL
    .db     TITLE_FLAG_NULL
    .db     TITLE_FRAME_NULL
    .db     TITLE_COUNT_NULL
    .db     TITLE_ANIMATION_NULL

; ロゴ
;
titleLogo:

    .db     0x00, 0x88, 0x78, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x78, 0x00
    .db     0x88, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x78
    .db     0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x88
    .db     0x00, 0x78, 0x00, 0x00, 0x00, 0x78, 0x88, 0x00, 0x00, 0x00, 0x88, 0x00
    .db     0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00
    .db     0x00, 0x88, 0x00, 0x00, 0x00, 0x88, 0x78, 0x00, 0x00, 0x00, 0x78, 0x00
    .db     0x88, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x78
    .db     0x78, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x88
    .db     0x00, 0x78, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x78, 0x88, 0x00

; スコア
;
titleScoreString:

    .ascii  "TOP"
    .db     0x00

; HIT SPACE BAR
;
titleHitSpaceBarString:

    .ascii  "HIT SPACE BAR"
    .db     0x00


; DATA 領域
;
    .area   _DATA

; 変数の定義
;

; タイトル
;
_title::

    .ds     TITLE_LENGTH

