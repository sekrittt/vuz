
.model small
.386
.stack 100h
.code
clearScreen proc
    mov ax, 0011h
    int 10h
clearScreen endp

delay proc ; 33 миллисекунды = 30 fps
    ; mov cx, 0fh
    ; mov dx, 4240h
    mov cx, 00h
    mov dx, 8235h
    mov ax, 8600h
    int 15h
    ret
delay endp

drawWhiteLine proc

    push ax
    push dx
    mov dx, ax ; y

    push cx
    mov cx, cx ; x

    mov bh, 0

    mov ah, 0Ch
    mov al, 1

    int 10h

    pop cx
    pop dx
    pop ax

    inc cx
    cmp cx, dx
    jna drawWhiteLine
    ret
drawWhiteLine endp

_wait proc
    mov ah, 01h ; Function 01h Read character from stdin with echo
    int 21h
    cmp al, 1Bh ; Check is Escape
    je exit
    jne _wait ; Continue read
    ret
_wait endp

exit proc
    mov ax, 0003h
    int 10h
    mov ax, 4C00h
    int 21h
exit endp

start proc
    mov ax, @data
    mov ds, ax

    call clearScreen

call clearScreen

    mov ax, 50
    mov cx, 323
    mov dx, 324
    call drawWhiteLine

    mov ax, 51
    mov cx, 322
    mov dx, 325
    call drawWhiteLine

    mov ax, 52
    mov cx, 321
    mov dx, 326
    call drawWhiteLine

    mov ax, 53
    mov cx, 320
    mov dx, 327
    call drawWhiteLine

    mov ax, 54
    mov cx, 319
    mov dx, 328
    call drawWhiteLine

    mov ax, 55
    mov cx, 318
    mov dx, 329
    call drawWhiteLine

    mov ax, 56
    mov cx, 317
    mov dx, 330
    call drawWhiteLine

    mov ax, 57
    mov cx, 316
    mov dx, 331
    call drawWhiteLine

    mov ax, 58
    mov cx, 315
    mov dx, 332
    call drawWhiteLine

    mov ax, 59
    mov cx, 314
    mov dx, 333
    call drawWhiteLine

    mov ax, 60
    mov cx, 195
    mov dx, 275
    call drawWhiteLine

    mov ax, 60
    mov cx, 313
    mov dx, 334
    call drawWhiteLine

    mov ax, 61
    mov cx, 195
    mov dx, 275
    call drawWhiteLine

    mov ax, 61
    mov cx, 312
    mov dx, 335
    call drawWhiteLine

    mov ax, 62
    mov cx, 195
    mov dx, 275
    call drawWhiteLine

    mov ax, 62
    mov cx, 311
    mov dx, 336
    call drawWhiteLine

    mov ax, 63
    mov cx, 195
    mov dx, 275
    call drawWhiteLine

    mov ax, 63
    mov cx, 310
    mov dx, 337
    call drawWhiteLine

    mov ax, 64
    mov cx, 195
    mov dx, 275
    call drawWhiteLine

    mov ax, 64
    mov cx, 309
    mov dx, 339
    call drawWhiteLine

    mov ax, 65
    mov cx, 195
    mov dx, 275
    call drawWhiteLine

    mov ax, 65
    mov cx, 308
    mov dx, 340
    call drawWhiteLine

    mov ax, 66
    mov cx, 195
    mov dx, 275
    call drawWhiteLine

    mov ax, 66
    mov cx, 307
    mov dx, 341
    call drawWhiteLine

    mov ax, 67
    mov cx, 195
    mov dx, 275
    call drawWhiteLine

    mov ax, 67
    mov cx, 306
    mov dx, 323
    call drawWhiteLine

    mov ax, 67
    mov cx, 324
    mov dx, 342
    call drawWhiteLine

    mov ax, 68
    mov cx, 195
    mov dx, 275
    call drawWhiteLine

    mov ax, 68
    mov cx, 305
    mov dx, 322
    call drawWhiteLine

    mov ax, 68
    mov cx, 325
    mov dx, 343
    call drawWhiteLine

    mov ax, 69
    mov cx, 195
    mov dx, 275
    call drawWhiteLine

    mov ax, 69
    mov cx, 304
    mov dx, 321
    call drawWhiteLine

    mov ax, 69
    mov cx, 326
    mov dx, 344
    call drawWhiteLine

    mov ax, 70
    mov cx, 195
    mov dx, 275
    call drawWhiteLine

    mov ax, 70
    mov cx, 303
    mov dx, 320
    call drawWhiteLine

    mov ax, 70
    mov cx, 327
    mov dx, 345
    call drawWhiteLine

    mov ax, 71
    mov cx, 195
    mov dx, 275
    call drawWhiteLine

    mov ax, 71
    mov cx, 302
    mov dx, 319
    call drawWhiteLine

    mov ax, 71
    mov cx, 328
    mov dx, 346
    call drawWhiteLine

    mov ax, 72
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 72
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 72
    mov cx, 301
    mov dx, 318
    call drawWhiteLine

    mov ax, 72
    mov cx, 329
    mov dx, 347
    call drawWhiteLine

    mov ax, 73
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 73
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 73
    mov cx, 300
    mov dx, 317
    call drawWhiteLine

    mov ax, 73
    mov cx, 330
    mov dx, 348
    call drawWhiteLine

    mov ax, 74
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 74
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 74
    mov cx, 299
    mov dx, 316
    call drawWhiteLine

    mov ax, 74
    mov cx, 331
    mov dx, 349
    call drawWhiteLine

    mov ax, 75
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 75
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 75
    mov cx, 298
    mov dx, 315
    call drawWhiteLine

    mov ax, 75
    mov cx, 332
    mov dx, 350
    call drawWhiteLine

    mov ax, 76
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 76
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 76
    mov cx, 297
    mov dx, 314
    call drawWhiteLine

    mov ax, 76
    mov cx, 333
    mov dx, 351
    call drawWhiteLine

    mov ax, 77
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 77
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 77
    mov cx, 296
    mov dx, 313
    call drawWhiteLine

    mov ax, 77
    mov cx, 334
    mov dx, 352
    call drawWhiteLine

    mov ax, 78
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 78
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 78
    mov cx, 295
    mov dx, 312
    call drawWhiteLine

    mov ax, 78
    mov cx, 335
    mov dx, 353
    call drawWhiteLine

    mov ax, 79
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 79
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 79
    mov cx, 294
    mov dx, 311
    call drawWhiteLine

    mov ax, 79
    mov cx, 337
    mov dx, 354
    call drawWhiteLine

    mov ax, 80
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 80
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 80
    mov cx, 293
    mov dx, 310
    call drawWhiteLine

    mov ax, 80
    mov cx, 338
    mov dx, 355
    call drawWhiteLine

    mov ax, 81
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 81
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 81
    mov cx, 292
    mov dx, 309
    call drawWhiteLine

    mov ax, 81
    mov cx, 339
    mov dx, 356
    call drawWhiteLine

    mov ax, 82
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 82
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 82
    mov cx, 291
    mov dx, 308
    call drawWhiteLine

    mov ax, 82
    mov cx, 340
    mov dx, 357
    call drawWhiteLine

    mov ax, 83
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 83
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 83
    mov cx, 290
    mov dx, 307
    call drawWhiteLine

    mov ax, 83
    mov cx, 341
    mov dx, 358
    call drawWhiteLine

    mov ax, 84
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 84
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 84
    mov cx, 289
    mov dx, 306
    call drawWhiteLine

    mov ax, 84
    mov cx, 342
    mov dx, 359
    call drawWhiteLine

    mov ax, 85
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 85
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 85
    mov cx, 288
    mov dx, 305
    call drawWhiteLine

    mov ax, 85
    mov cx, 343
    mov dx, 360
    call drawWhiteLine

    mov ax, 86
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 86
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 86
    mov cx, 287
    mov dx, 304
    call drawWhiteLine

    mov ax, 86
    mov cx, 344
    mov dx, 361
    call drawWhiteLine

    mov ax, 87
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 87
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 87
    mov cx, 286
    mov dx, 303
    call drawWhiteLine

    mov ax, 87
    mov cx, 345
    mov dx, 362
    call drawWhiteLine

    mov ax, 88
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 88
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 88
    mov cx, 285
    mov dx, 302
    call drawWhiteLine

    mov ax, 88
    mov cx, 346
    mov dx, 363
    call drawWhiteLine

    mov ax, 89
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 89
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 89
    mov cx, 284
    mov dx, 301
    call drawWhiteLine

    mov ax, 89
    mov cx, 347
    mov dx, 364
    call drawWhiteLine

    mov ax, 90
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 90
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 90
    mov cx, 283
    mov dx, 300
    call drawWhiteLine

    mov ax, 90
    mov cx, 348
    mov dx, 365
    call drawWhiteLine

    mov ax, 91
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 91
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 91
    mov cx, 282
    mov dx, 299
    call drawWhiteLine

    mov ax, 91
    mov cx, 349
    mov dx, 366
    call drawWhiteLine

    mov ax, 92
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 92
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 92
    mov cx, 281
    mov dx, 298
    call drawWhiteLine

    mov ax, 92
    mov cx, 350
    mov dx, 367
    call drawWhiteLine

    mov ax, 93
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 93
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 93
    mov cx, 280
    mov dx, 297
    call drawWhiteLine

    mov ax, 93
    mov cx, 351
    mov dx, 368
    call drawWhiteLine

    mov ax, 94
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 94
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 94
    mov cx, 279
    mov dx, 296
    call drawWhiteLine

    mov ax, 94
    mov cx, 352
    mov dx, 369
    call drawWhiteLine

    mov ax, 95
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 95
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 95
    mov cx, 278
    mov dx, 295
    call drawWhiteLine

    mov ax, 95
    mov cx, 353
    mov dx, 370
    call drawWhiteLine

    mov ax, 96
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 96
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 96
    mov cx, 277
    mov dx, 294
    call drawWhiteLine

    mov ax, 96
    mov cx, 354
    mov dx, 371
    call drawWhiteLine

    mov ax, 97
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 97
    mov cx, 263
    mov dx, 275
    call drawWhiteLine

    mov ax, 97
    mov cx, 276
    mov dx, 293
    call drawWhiteLine

    mov ax, 97
    mov cx, 355
    mov dx, 372
    call drawWhiteLine

    mov ax, 98
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 98
    mov cx, 263
    mov dx, 292
    call drawWhiteLine

    mov ax, 98
    mov cx, 356
    mov dx, 373
    call drawWhiteLine

    mov ax, 99
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 99
    mov cx, 263
    mov dx, 291
    call drawWhiteLine

    mov ax, 99
    mov cx, 357
    mov dx, 374
    call drawWhiteLine

    mov ax, 100
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 100
    mov cx, 263
    mov dx, 290
    call drawWhiteLine

    mov ax, 100
    mov cx, 358
    mov dx, 375
    call drawWhiteLine

    mov ax, 101
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 101
    mov cx, 263
    mov dx, 289
    call drawWhiteLine

    mov ax, 101
    mov cx, 359
    mov dx, 376
    call drawWhiteLine

    mov ax, 102
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 102
    mov cx, 263
    mov dx, 288
    call drawWhiteLine

    mov ax, 102
    mov cx, 360
    mov dx, 378
    call drawWhiteLine

    mov ax, 103
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 103
    mov cx, 263
    mov dx, 287
    call drawWhiteLine

    mov ax, 103
    mov cx, 361
    mov dx, 379
    call drawWhiteLine

    mov ax, 104
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 104
    mov cx, 263
    mov dx, 286
    call drawWhiteLine

    mov ax, 104
    mov cx, 362
    mov dx, 380
    call drawWhiteLine

    mov ax, 105
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 105
    mov cx, 263
    mov dx, 285
    call drawWhiteLine

    mov ax, 105
    mov cx, 363
    mov dx, 381
    call drawWhiteLine

    mov ax, 106
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 106
    mov cx, 263
    mov dx, 284
    call drawWhiteLine

    mov ax, 106
    mov cx, 364
    mov dx, 382
    call drawWhiteLine

    mov ax, 107
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 107
    mov cx, 263
    mov dx, 283
    call drawWhiteLine

    mov ax, 107
    mov cx, 365
    mov dx, 383
    call drawWhiteLine

    mov ax, 108
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 108
    mov cx, 263
    mov dx, 282
    call drawWhiteLine

    mov ax, 108
    mov cx, 366
    mov dx, 384
    call drawWhiteLine

    mov ax, 109
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 109
    mov cx, 263
    mov dx, 281
    call drawWhiteLine

    mov ax, 109
    mov cx, 367
    mov dx, 385
    call drawWhiteLine

    mov ax, 110
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 110
    mov cx, 263
    mov dx, 280
    call drawWhiteLine

    mov ax, 110
    mov cx, 368
    mov dx, 386
    call drawWhiteLine

    mov ax, 111
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 111
    mov cx, 262
    mov dx, 279
    call drawWhiteLine

    mov ax, 111
    mov cx, 369
    mov dx, 387
    call drawWhiteLine

    mov ax, 112
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 112
    mov cx, 261
    mov dx, 278
    call drawWhiteLine

    mov ax, 112
    mov cx, 370
    mov dx, 388
    call drawWhiteLine

    mov ax, 113
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 113
    mov cx, 260
    mov dx, 277
    call drawWhiteLine

    mov ax, 113
    mov cx, 371
    mov dx, 389
    call drawWhiteLine

    mov ax, 114
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 114
    mov cx, 259
    mov dx, 276
    call drawWhiteLine

    mov ax, 114
    mov cx, 372
    mov dx, 390
    call drawWhiteLine

    mov ax, 115
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 115
    mov cx, 258
    mov dx, 275
    call drawWhiteLine

    mov ax, 115
    mov cx, 373
    mov dx, 391
    call drawWhiteLine

    mov ax, 116
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 116
    mov cx, 257
    mov dx, 274
    call drawWhiteLine

    mov ax, 116
    mov cx, 374
    mov dx, 392
    call drawWhiteLine

    mov ax, 117
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 117
    mov cx, 256
    mov dx, 273
    call drawWhiteLine

    mov ax, 117
    mov cx, 376
    mov dx, 393
    call drawWhiteLine

    mov ax, 118
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 118
    mov cx, 255
    mov dx, 272
    call drawWhiteLine

    mov ax, 118
    mov cx, 377
    mov dx, 394
    call drawWhiteLine

    mov ax, 119
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 119
    mov cx, 254
    mov dx, 271
    call drawWhiteLine

    mov ax, 119
    mov cx, 378
    mov dx, 395
    call drawWhiteLine

    mov ax, 120
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 120
    mov cx, 253
    mov dx, 270
    call drawWhiteLine

    mov ax, 120
    mov cx, 379
    mov dx, 396
    call drawWhiteLine

    mov ax, 121
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 121
    mov cx, 252
    mov dx, 269
    call drawWhiteLine

    mov ax, 121
    mov cx, 380
    mov dx, 397
    call drawWhiteLine

    mov ax, 122
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 122
    mov cx, 251
    mov dx, 268
    call drawWhiteLine

    mov ax, 122
    mov cx, 381
    mov dx, 398
    call drawWhiteLine

    mov ax, 123
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 123
    mov cx, 250
    mov dx, 267
    call drawWhiteLine

    mov ax, 123
    mov cx, 382
    mov dx, 399
    call drawWhiteLine

    mov ax, 124
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 124
    mov cx, 249
    mov dx, 266
    call drawWhiteLine

    mov ax, 124
    mov cx, 383
    mov dx, 400
    call drawWhiteLine

    mov ax, 125
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 125
    mov cx, 248
    mov dx, 265
    call drawWhiteLine

    mov ax, 125
    mov cx, 384
    mov dx, 401
    call drawWhiteLine

    mov ax, 126
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 126
    mov cx, 247
    mov dx, 264
    call drawWhiteLine

    mov ax, 126
    mov cx, 385
    mov dx, 402
    call drawWhiteLine

    mov ax, 127
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 127
    mov cx, 246
    mov dx, 263
    call drawWhiteLine

    mov ax, 127
    mov cx, 386
    mov dx, 403
    call drawWhiteLine

    mov ax, 128
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 128
    mov cx, 245
    mov dx, 262
    call drawWhiteLine

    mov ax, 128
    mov cx, 387
    mov dx, 404
    call drawWhiteLine

    mov ax, 129
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 129
    mov cx, 244
    mov dx, 261
    call drawWhiteLine

    mov ax, 129
    mov cx, 388
    mov dx, 405
    call drawWhiteLine

    mov ax, 130
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 130
    mov cx, 243
    mov dx, 260
    call drawWhiteLine

    mov ax, 130
    mov cx, 389
    mov dx, 406
    call drawWhiteLine

    mov ax, 131
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 131
    mov cx, 242
    mov dx, 259
    call drawWhiteLine

    mov ax, 131
    mov cx, 390
    mov dx, 407
    call drawWhiteLine

    mov ax, 132
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 132
    mov cx, 241
    mov dx, 258
    call drawWhiteLine

    mov ax, 132
    mov cx, 391
    mov dx, 408
    call drawWhiteLine

    mov ax, 133
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 133
    mov cx, 240
    mov dx, 257
    call drawWhiteLine

    mov ax, 133
    mov cx, 392
    mov dx, 409
    call drawWhiteLine

    mov ax, 134
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 134
    mov cx, 239
    mov dx, 256
    call drawWhiteLine

    mov ax, 134
    mov cx, 393
    mov dx, 410
    call drawWhiteLine

    mov ax, 135
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 135
    mov cx, 238
    mov dx, 255
    call drawWhiteLine

    mov ax, 135
    mov cx, 394
    mov dx, 411
    call drawWhiteLine

    mov ax, 136
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 136
    mov cx, 237
    mov dx, 254
    call drawWhiteLine

    mov ax, 136
    mov cx, 395
    mov dx, 412
    call drawWhiteLine

    mov ax, 137
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 137
    mov cx, 236
    mov dx, 253
    call drawWhiteLine

    mov ax, 137
    mov cx, 396
    mov dx, 413
    call drawWhiteLine

    mov ax, 138
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 138
    mov cx, 235
    mov dx, 252
    call drawWhiteLine

    mov ax, 138
    mov cx, 397
    mov dx, 414
    call drawWhiteLine

    mov ax, 139
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 139
    mov cx, 234
    mov dx, 251
    call drawWhiteLine

    mov ax, 139
    mov cx, 398
    mov dx, 415
    call drawWhiteLine

    mov ax, 140
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 140
    mov cx, 233
    mov dx, 250
    call drawWhiteLine

    mov ax, 140
    mov cx, 399
    mov dx, 417
    call drawWhiteLine

    mov ax, 141
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 141
    mov cx, 232
    mov dx, 249
    call drawWhiteLine

    mov ax, 141
    mov cx, 400
    mov dx, 418
    call drawWhiteLine

    mov ax, 142
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 142
    mov cx, 231
    mov dx, 248
    call drawWhiteLine

    mov ax, 142
    mov cx, 401
    mov dx, 419
    call drawWhiteLine

    mov ax, 143
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 143
    mov cx, 230
    mov dx, 247
    call drawWhiteLine

    mov ax, 143
    mov cx, 402
    mov dx, 420
    call drawWhiteLine

    mov ax, 144
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 144
    mov cx, 229
    mov dx, 246
    call drawWhiteLine

    mov ax, 144
    mov cx, 403
    mov dx, 421
    call drawWhiteLine

    mov ax, 145
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 145
    mov cx, 228
    mov dx, 245
    call drawWhiteLine

    mov ax, 145
    mov cx, 404
    mov dx, 422
    call drawWhiteLine

    mov ax, 146
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 146
    mov cx, 227
    mov dx, 244
    call drawWhiteLine

    mov ax, 146
    mov cx, 405
    mov dx, 423
    call drawWhiteLine

    mov ax, 147
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 147
    mov cx, 226
    mov dx, 243
    call drawWhiteLine

    mov ax, 147
    mov cx, 406
    mov dx, 424
    call drawWhiteLine

    mov ax, 148
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 148
    mov cx, 225
    mov dx, 242
    call drawWhiteLine

    mov ax, 148
    mov cx, 407
    mov dx, 425
    call drawWhiteLine

    mov ax, 149
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 149
    mov cx, 224
    mov dx, 241
    call drawWhiteLine

    mov ax, 149
    mov cx, 408
    mov dx, 426
    call drawWhiteLine

    mov ax, 150
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 150
    mov cx, 223
    mov dx, 240
    call drawWhiteLine

    mov ax, 150
    mov cx, 409
    mov dx, 427
    call drawWhiteLine

    mov ax, 151
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 151
    mov cx, 222
    mov dx, 239
    call drawWhiteLine

    mov ax, 151
    mov cx, 410
    mov dx, 428
    call drawWhiteLine

    mov ax, 152
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 152
    mov cx, 221
    mov dx, 238
    call drawWhiteLine

    mov ax, 152
    mov cx, 411
    mov dx, 429
    call drawWhiteLine

    mov ax, 153
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 153
    mov cx, 220
    mov dx, 237
    call drawWhiteLine

    mov ax, 153
    mov cx, 412
    mov dx, 430
    call drawWhiteLine

    mov ax, 154
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 154
    mov cx, 219
    mov dx, 236
    call drawWhiteLine

    mov ax, 154
    mov cx, 413
    mov dx, 431
    call drawWhiteLine

    mov ax, 155
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 155
    mov cx, 218
    mov dx, 235
    call drawWhiteLine

    mov ax, 155
    mov cx, 415
    mov dx, 432
    call drawWhiteLine

    mov ax, 156
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 156
    mov cx, 217
    mov dx, 234
    call drawWhiteLine

    mov ax, 156
    mov cx, 416
    mov dx, 433
    call drawWhiteLine

    mov ax, 157
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 157
    mov cx, 216
    mov dx, 233
    call drawWhiteLine

    mov ax, 157
    mov cx, 417
    mov dx, 434
    call drawWhiteLine

    mov ax, 158
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 158
    mov cx, 215
    mov dx, 232
    call drawWhiteLine

    mov ax, 158
    mov cx, 418
    mov dx, 435
    call drawWhiteLine

    mov ax, 159
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 159
    mov cx, 214
    mov dx, 231
    call drawWhiteLine

    mov ax, 159
    mov cx, 419
    mov dx, 436
    call drawWhiteLine

    mov ax, 160
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 160
    mov cx, 213
    mov dx, 230
    call drawWhiteLine

    mov ax, 160
    mov cx, 420
    mov dx, 437
    call drawWhiteLine

    mov ax, 161
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 161
    mov cx, 212
    mov dx, 229
    call drawWhiteLine

    mov ax, 161
    mov cx, 421
    mov dx, 438
    call drawWhiteLine

    mov ax, 162
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 162
    mov cx, 211
    mov dx, 228
    call drawWhiteLine

    mov ax, 162
    mov cx, 422
    mov dx, 439
    call drawWhiteLine

    mov ax, 163
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 163
    mov cx, 210
    mov dx, 227
    call drawWhiteLine

    mov ax, 163
    mov cx, 423
    mov dx, 440
    call drawWhiteLine

    mov ax, 164
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 164
    mov cx, 209
    mov dx, 226
    call drawWhiteLine

    mov ax, 164
    mov cx, 424
    mov dx, 441
    call drawWhiteLine

    mov ax, 165
    mov cx, 195
    mov dx, 207
    call drawWhiteLine

    mov ax, 165
    mov cx, 208
    mov dx, 225
    call drawWhiteLine

    mov ax, 165
    mov cx, 425
    mov dx, 442
    call drawWhiteLine

    mov ax, 166
    mov cx, 195
    mov dx, 224
    call drawWhiteLine

    mov ax, 166
    mov cx, 426
    mov dx, 443
    call drawWhiteLine

    mov ax, 167
    mov cx, 195
    mov dx, 223
    call drawWhiteLine

    mov ax, 167
    mov cx, 427
    mov dx, 444
    call drawWhiteLine

    mov ax, 168
    mov cx, 195
    mov dx, 222
    call drawWhiteLine

    mov ax, 168
    mov cx, 428
    mov dx, 445
    call drawWhiteLine

    mov ax, 169
    mov cx, 195
    mov dx, 221
    call drawWhiteLine

    mov ax, 169
    mov cx, 429
    mov dx, 446
    call drawWhiteLine

    mov ax, 170
    mov cx, 195
    mov dx, 220
    call drawWhiteLine

    mov ax, 170
    mov cx, 430
    mov dx, 447
    call drawWhiteLine

    mov ax, 171
    mov cx, 195
    mov dx, 219
    call drawWhiteLine

    mov ax, 171
    mov cx, 431
    mov dx, 448
    call drawWhiteLine

    mov ax, 172
    mov cx, 195
    mov dx, 218
    call drawWhiteLine

    mov ax, 172
    mov cx, 432
    mov dx, 449
    call drawWhiteLine

    mov ax, 173
    mov cx, 195
    mov dx, 217
    call drawWhiteLine

    mov ax, 173
    mov cx, 433
    mov dx, 450
    call drawWhiteLine

    mov ax, 174
    mov cx, 195
    mov dx, 216
    call drawWhiteLine

    mov ax, 174
    mov cx, 434
    mov dx, 451
    call drawWhiteLine

    mov ax, 175
    mov cx, 195
    mov dx, 215
    call drawWhiteLine

    mov ax, 175
    mov cx, 435
    mov dx, 452
    call drawWhiteLine

    mov ax, 176
    mov cx, 195
    mov dx, 214
    call drawWhiteLine

    mov ax, 176
    mov cx, 436
    mov dx, 453
    call drawWhiteLine

    mov ax, 177
    mov cx, 195
    mov dx, 213
    call drawWhiteLine

    mov ax, 177
    mov cx, 437
    mov dx, 454
    call drawWhiteLine

    mov ax, 178
    mov cx, 195
    mov dx, 212
    call drawWhiteLine

    mov ax, 178
    mov cx, 438
    mov dx, 456
    call drawWhiteLine

    mov ax, 179
    mov cx, 194
    mov dx, 211
    call drawWhiteLine

    mov ax, 179
    mov cx, 439
    mov dx, 457
    call drawWhiteLine

    mov ax, 180
    mov cx, 193
    mov dx, 210
    call drawWhiteLine

    mov ax, 180
    mov cx, 440
    mov dx, 458
    call drawWhiteLine

    mov ax, 181
    mov cx, 192
    mov dx, 209
    call drawWhiteLine

    mov ax, 181
    mov cx, 441
    mov dx, 459
    call drawWhiteLine

    mov ax, 182
    mov cx, 191
    mov dx, 208
    call drawWhiteLine

    mov ax, 182
    mov cx, 442
    mov dx, 460
    call drawWhiteLine

    mov ax, 183
    mov cx, 190
    mov dx, 207
    call drawWhiteLine

    mov ax, 183
    mov cx, 443
    mov dx, 461
    call drawWhiteLine

    mov ax, 184
    mov cx, 189
    mov dx, 206
    call drawWhiteLine

    mov ax, 184
    mov cx, 444
    mov dx, 462
    call drawWhiteLine

    mov ax, 185
    mov cx, 188
    mov dx, 205
    call drawWhiteLine

    mov ax, 185
    mov cx, 445
    mov dx, 463
    call drawWhiteLine

    mov ax, 186
    mov cx, 187
    mov dx, 204
    call drawWhiteLine

    mov ax, 186
    mov cx, 446
    mov dx, 464
    call drawWhiteLine

    mov ax, 187
    mov cx, 186
    mov dx, 203
    call drawWhiteLine

    mov ax, 187
    mov cx, 447
    mov dx, 465
    call drawWhiteLine

    mov ax, 188
    mov cx, 185
    mov dx, 202
    call drawWhiteLine

    mov ax, 188
    mov cx, 448
    mov dx, 466
    call drawWhiteLine

    mov ax, 189
    mov cx, 184
    mov dx, 201
    call drawWhiteLine

    mov ax, 189
    mov cx, 449
    mov dx, 467
    call drawWhiteLine

    mov ax, 190
    mov cx, 183
    mov dx, 200
    call drawWhiteLine

    mov ax, 190
    mov cx, 450
    mov dx, 468
    call drawWhiteLine

    mov ax, 191
    mov cx, 182
    mov dx, 199
    call drawWhiteLine

    mov ax, 191
    mov cx, 451
    mov dx, 469
    call drawWhiteLine

    mov ax, 192
    mov cx, 181
    mov dx, 198
    call drawWhiteLine

    mov ax, 192
    mov cx, 452
    mov dx, 470
    call drawWhiteLine

    mov ax, 193
    mov cx, 180
    mov dx, 197
    call drawWhiteLine

    mov ax, 193
    mov cx, 454
    mov dx, 471
    call drawWhiteLine

    mov ax, 194
    mov cx, 179
    mov dx, 196
    call drawWhiteLine

    mov ax, 194
    mov cx, 455
    mov dx, 472
    call drawWhiteLine

    mov ax, 195
    mov cx, 178
    mov dx, 195
    call drawWhiteLine

    mov ax, 195
    mov cx, 456
    mov dx, 473
    call drawWhiteLine

    mov ax, 196
    mov cx, 177
    mov dx, 194
    call drawWhiteLine

    mov ax, 196
    mov cx, 457
    mov dx, 474
    call drawWhiteLine

    mov ax, 197
    mov cx, 176
    mov dx, 193
    call drawWhiteLine

    mov ax, 197
    mov cx, 458
    mov dx, 475
    call drawWhiteLine

    mov ax, 198
    mov cx, 175
    mov dx, 192
    call drawWhiteLine

    mov ax, 198
    mov cx, 459
    mov dx, 476
    call drawWhiteLine

    mov ax, 199
    mov cx, 174
    mov dx, 191
    call drawWhiteLine

    mov ax, 199
    mov cx, 460
    mov dx, 477
    call drawWhiteLine

    mov ax, 200
    mov cx, 173
    mov dx, 190
    call drawWhiteLine

    mov ax, 200
    mov cx, 461
    mov dx, 478
    call drawWhiteLine

    mov ax, 201
    mov cx, 172
    mov dx, 189
    call drawWhiteLine

    mov ax, 201
    mov cx, 462
    mov dx, 479
    call drawWhiteLine

    mov ax, 202
    mov cx, 171
    mov dx, 188
    call drawWhiteLine

    mov ax, 202
    mov cx, 463
    mov dx, 480
    call drawWhiteLine

    mov ax, 203
    mov cx, 170
    mov dx, 187
    call drawWhiteLine

    mov ax, 203
    mov cx, 464
    mov dx, 481
    call drawWhiteLine

    mov ax, 204
    mov cx, 169
    mov dx, 186
    call drawWhiteLine

    mov ax, 204
    mov cx, 465
    mov dx, 482
    call drawWhiteLine

    mov ax, 205
    mov cx, 168
    mov dx, 185
    call drawWhiteLine

    mov ax, 205
    mov cx, 466
    mov dx, 483
    call drawWhiteLine

    mov ax, 206
    mov cx, 167
    mov dx, 184
    call drawWhiteLine

    mov ax, 206
    mov cx, 467
    mov dx, 484
    call drawWhiteLine

    mov ax, 207
    mov cx, 166
    mov dx, 183
    call drawWhiteLine

    mov ax, 207
    mov cx, 468
    mov dx, 485
    call drawWhiteLine

    mov ax, 208
    mov cx, 165
    mov dx, 182
    call drawWhiteLine

    mov ax, 208
    mov cx, 469
    mov dx, 486
    call drawWhiteLine

    mov ax, 209
    mov cx, 164
    mov dx, 181
    call drawWhiteLine

    mov ax, 209
    mov cx, 470
    mov dx, 487
    call drawWhiteLine

    mov ax, 210
    mov cx, 163
    mov dx, 180
    call drawWhiteLine

    mov ax, 210
    mov cx, 471
    mov dx, 488
    call drawWhiteLine

    mov ax, 211
    mov cx, 162
    mov dx, 179
    call drawWhiteLine

    mov ax, 211
    mov cx, 472
    mov dx, 489
    call drawWhiteLine

    mov ax, 212
    mov cx, 161
    mov dx, 178
    call drawWhiteLine

    mov ax, 212
    mov cx, 473
    mov dx, 490
    call drawWhiteLine

    mov ax, 213
    mov cx, 160
    mov dx, 177
    call drawWhiteLine

    mov ax, 213
    mov cx, 474
    mov dx, 491
    call drawWhiteLine

    mov ax, 214
    mov cx, 159
    mov dx, 176
    call drawWhiteLine

    mov ax, 214
    mov cx, 475
    mov dx, 492
    call drawWhiteLine

    mov ax, 215
    mov cx, 158
    mov dx, 175
    call drawWhiteLine

    mov ax, 215
    mov cx, 476
    mov dx, 493
    call drawWhiteLine

    mov ax, 216
    mov cx, 157
    mov dx, 174
    call drawWhiteLine

    mov ax, 216
    mov cx, 477
    mov dx, 495
    call drawWhiteLine

    mov ax, 217
    mov cx, 156
    mov dx, 173
    call drawWhiteLine

    mov ax, 217
    mov cx, 478
    mov dx, 496
    call drawWhiteLine

    mov ax, 218
    mov cx, 155
    mov dx, 172
    call drawWhiteLine

    mov ax, 218
    mov cx, 479
    mov dx, 497
    call drawWhiteLine

    mov ax, 219
    mov cx, 154
    mov dx, 171
    call drawWhiteLine

    mov ax, 219
    mov cx, 480
    mov dx, 498
    call drawWhiteLine

    mov ax, 220
    mov cx, 153
    mov dx, 170
    call drawWhiteLine

    mov ax, 220
    mov cx, 481
    mov dx, 499
    call drawWhiteLine

    mov ax, 221
    mov cx, 152
    mov dx, 169
    call drawWhiteLine

    mov ax, 221
    mov cx, 482
    mov dx, 500
    call drawWhiteLine

    mov ax, 222
    mov cx, 151
    mov dx, 168
    call drawWhiteLine

    mov ax, 222
    mov cx, 483
    mov dx, 501
    call drawWhiteLine

    mov ax, 223
    mov cx, 150
    mov dx, 167
    call drawWhiteLine

    mov ax, 223
    mov cx, 484
    mov dx, 502
    call drawWhiteLine

    mov ax, 224
    mov cx, 149
    mov dx, 166
    call drawWhiteLine

    mov ax, 224
    mov cx, 485
    mov dx, 503
    call drawWhiteLine

    mov ax, 225
    mov cx, 148
    mov dx, 165
    call drawWhiteLine

    mov ax, 225
    mov cx, 486
    mov dx, 504
    call drawWhiteLine

    mov ax, 226
    mov cx, 147
    mov dx, 164
    call drawWhiteLine

    mov ax, 226
    mov cx, 487
    mov dx, 505
    call drawWhiteLine

    mov ax, 227
    mov cx, 146
    mov dx, 163
    call drawWhiteLine

    mov ax, 227
    mov cx, 488
    mov dx, 506
    call drawWhiteLine

    mov ax, 228
    mov cx, 145
    mov dx, 162
    call drawWhiteLine

    mov ax, 228
    mov cx, 489
    mov dx, 507
    call drawWhiteLine

    mov ax, 229
    mov cx, 144
    mov dx, 161
    call drawWhiteLine

    mov ax, 229
    mov cx, 490
    mov dx, 508
    call drawWhiteLine

    mov ax, 230
    mov cx, 143
    mov dx, 160
    call drawWhiteLine

    mov ax, 230
    mov cx, 491
    mov dx, 509
    call drawWhiteLine

    mov ax, 231
    mov cx, 142
    mov dx, 160
    call drawWhiteLine

    mov ax, 231
    mov cx, 492
    mov dx, 510
    call drawWhiteLine

    mov ax, 232
    mov cx, 141
    mov dx, 511
    call drawWhiteLine

    mov ax, 233
    mov cx, 140
    mov dx, 512
    call drawWhiteLine

    mov ax, 234
    mov cx, 139
    mov dx, 513
    call drawWhiteLine

    mov ax, 235
    mov cx, 138
    mov dx, 514
    call drawWhiteLine

    mov ax, 236
    mov cx, 137
    mov dx, 515
    call drawWhiteLine

    mov ax, 237
    mov cx, 136
    mov dx, 516
    call drawWhiteLine

    mov ax, 238
    mov cx, 135
    mov dx, 517
    call drawWhiteLine

    mov ax, 239
    mov cx, 134
    mov dx, 518
    call drawWhiteLine

    mov ax, 240
    mov cx, 133
    mov dx, 519
    call drawWhiteLine

    mov ax, 241
    mov cx, 132
    mov dx, 520
    call drawWhiteLine

    mov ax, 242
    mov cx, 131
    mov dx, 521
    call drawWhiteLine

    mov ax, 243
    mov cx, 130
    mov dx, 522
    call drawWhiteLine

    mov ax, 244
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 244
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 245
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 245
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 246
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 246
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 247
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 247
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 248
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 248
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 249
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 249
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 250
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 250
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 251
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 251
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 252
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 252
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 253
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 253
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 254
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 254
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 255
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 255
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 256
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 256
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 257
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 257
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 258
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 258
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 259
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 259
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 260
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 260
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 261
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 261
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 262
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 262
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 263
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 263
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 264
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 264
    mov cx, 328
    mov dx, 438
    call drawWhiteLine

    mov ax, 264
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 265
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 265
    mov cx, 328
    mov dx, 438
    call drawWhiteLine

    mov ax, 265
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 266
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 266
    mov cx, 328
    mov dx, 438
    call drawWhiteLine

    mov ax, 266
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 267
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 267
    mov cx, 328
    mov dx, 438
    call drawWhiteLine

    mov ax, 267
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 268
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 268
    mov cx, 328
    mov dx, 438
    call drawWhiteLine

    mov ax, 268
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 269
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 269
    mov cx, 328
    mov dx, 438
    call drawWhiteLine

    mov ax, 269
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 270
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 270
    mov cx, 328
    mov dx, 438
    call drawWhiteLine

    mov ax, 270
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 271
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 271
    mov cx, 328
    mov dx, 438
    call drawWhiteLine

    mov ax, 271
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 272
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 272
    mov cx, 328
    mov dx, 438
    call drawWhiteLine

    mov ax, 272
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 273
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 273
    mov cx, 328
    mov dx, 438
    call drawWhiteLine

    mov ax, 273
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 274
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 274
    mov cx, 328
    mov dx, 438
    call drawWhiteLine

    mov ax, 274
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 275
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 275
    mov cx, 328
    mov dx, 438
    call drawWhiteLine

    mov ax, 275
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 276
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 276
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 276
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 276
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 277
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 277
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 277
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 277
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 278
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 278
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 278
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 278
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 279
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 279
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 279
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 279
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 280
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 280
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 280
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 280
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 281
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 281
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 281
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 281
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 282
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 282
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 282
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 282
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 283
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 283
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 283
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 283
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 283
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 284
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 284
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 284
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 284
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 284
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 285
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 285
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 285
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 285
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 285
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 286
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 286
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 286
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 286
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 286
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 287
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 287
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 287
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 287
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 287
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 288
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 288
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 288
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 288
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 288
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 289
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 289
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 289
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 289
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 289
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 290
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 290
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 290
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 290
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 290
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 291
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 291
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 291
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 291
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 291
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 292
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 292
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 292
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 292
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 292
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 293
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 293
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 293
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 293
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 293
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 294
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 294
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 294
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 294
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 294
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 295
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 295
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 295
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 295
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 295
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 295
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 295
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 296
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 296
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 296
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 296
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 296
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 296
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 296
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 297
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 297
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 297
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 297
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 297
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 297
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 297
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 298
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 298
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 298
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 298
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 298
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 298
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 298
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 299
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 299
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 299
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 299
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 299
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 299
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 299
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 300
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 300
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 300
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 300
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 300
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 300
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 300
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 301
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 301
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 301
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 301
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 301
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 301
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 301
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 302
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 302
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 302
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 302
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 302
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 302
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 302
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 303
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 303
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 303
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 303
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 303
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 303
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 303
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 304
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 304
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 304
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 304
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 304
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 304
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 304
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 305
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 305
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 305
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 305
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 305
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 305
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 305
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 306
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 306
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 306
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 306
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 306
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 306
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 306
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 307
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 307
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 307
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 307
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 307
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 307
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 307
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 308
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 308
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 308
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 308
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 308
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 308
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 308
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 309
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 309
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 309
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 309
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 309
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 309
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 309
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 310
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 310
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 310
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 310
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 310
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 310
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 310
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 311
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 311
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 311
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 311
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 311
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 311
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 311
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 312
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 312
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 312
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 312
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 312
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 312
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 312
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 313
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 313
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 313
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 313
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 313
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 313
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 313
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 314
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 314
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 314
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 314
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 314
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 314
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 314
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 315
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 315
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 315
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 315
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 315
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 315
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 315
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 316
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 316
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 316
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 316
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 316
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 316
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 316
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 317
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 317
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 317
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 317
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 317
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 317
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 317
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 318
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 318
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 318
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 318
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 318
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 318
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 318
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 319
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 319
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 319
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 319
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 319
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 319
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 319
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 320
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 320
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 320
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 320
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 320
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 321
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 321
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 321
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 321
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 321
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 322
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 322
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 322
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 322
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 322
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 323
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 323
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 323
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 323
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 323
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 324
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 324
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 324
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 324
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 324
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 325
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 325
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 325
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 325
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 325
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 326
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 326
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 326
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 326
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 326
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 327
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 327
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 327
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 327
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 327
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 328
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 328
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 328
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 328
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 328
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 329
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 329
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 329
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 329
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 329
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 330
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 330
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 330
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 330
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 330
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 331
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 331
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 331
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 331
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 331
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 332
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 332
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 332
    mov cx, 248
    mov dx, 261
    call drawWhiteLine

    mov ax, 332
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 332
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 332
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 332
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 333
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 333
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 333
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 333
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 333
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 333
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 333
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 334
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 334
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 334
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 334
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 334
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 334
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 334
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 335
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 335
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 335
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 335
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 335
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 335
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 335
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 336
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 336
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 336
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 336
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 336
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 336
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 336
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 337
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 337
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 337
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 337
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 337
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 337
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 337
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 338
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 338
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 338
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 338
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 338
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 338
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 338
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 339
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 339
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 339
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 339
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 339
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 339
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 339
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 340
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 340
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 340
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 340
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 340
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 340
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 340
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 341
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 341
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 341
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 341
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 341
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 341
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 341
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 342
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 342
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 342
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 342
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 342
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 342
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 342
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 343
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 343
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 343
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 343
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 343
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 343
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 343
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 344
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 344
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 344
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 344
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 344
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 344
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 344
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 345
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 345
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 345
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 345
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 345
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 345
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 345
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 346
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 346
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 346
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 346
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 346
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 346
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 346
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 347
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 347
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 347
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 347
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 347
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 347
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 347
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 348
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 348
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 348
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 348
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 348
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 348
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 348
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 349
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 349
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 349
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 349
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 349
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 349
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 349
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 350
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 350
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 350
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 350
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 350
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 350
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 350
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 351
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 351
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 351
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 351
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 351
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 351
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 351
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 352
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 352
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 352
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 352
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 352
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 352
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 352
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 353
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 353
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 353
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 353
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 353
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 353
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 353
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 354
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 354
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 354
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 354
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 354
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 354
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 354
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 355
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 355
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 355
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 355
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 355
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 355
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 355
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 356
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 356
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 356
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 356
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 356
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 356
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 356
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 357
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 357
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 357
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 357
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 357
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 357
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 357
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 358
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 358
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 358
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 358
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 358
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 358
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 358
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 359
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 359
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 359
    mov cx, 249
    mov dx, 261
    call drawWhiteLine

    mov ax, 359
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 359
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 359
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 359
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 360
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 360
    mov cx, 209
    mov dx, 221
    call drawWhiteLine

    mov ax, 360
    mov cx, 248
    mov dx, 261
    call drawWhiteLine

    mov ax, 360
    mov cx, 286
    mov dx, 298
    call drawWhiteLine

    mov ax, 360
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 360
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 360
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 361
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 361
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 361
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 361
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 361
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 362
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 362
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 362
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 362
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 362
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 363
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 363
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 363
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 363
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 363
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 364
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 364
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 364
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 364
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 364
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 365
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 365
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 365
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 365
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 365
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 366
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 366
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 366
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 366
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 366
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 367
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 367
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 367
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 367
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 367
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 368
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 368
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 368
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 368
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 368
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 369
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 369
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 369
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 369
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 369
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 370
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 370
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 370
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 370
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 370
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 371
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 371
    mov cx, 209
    mov dx, 298
    call drawWhiteLine

    mov ax, 371
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 371
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 371
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 372
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 372
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 372
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 372
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 373
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 373
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 373
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 373
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 374
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 374
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 374
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 374
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 375
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 375
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 375
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 375
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 376
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 376
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 376
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 376
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 377
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 377
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 377
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 377
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 378
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 378
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 378
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 378
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 379
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 379
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 379
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 379
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 380
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 380
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 380
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 380
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 381
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 381
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 381
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 381
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 382
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 382
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 382
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 382
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 383
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 383
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 383
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 383
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 384
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 384
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 384
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 384
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 385
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 385
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 385
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 385
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 386
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 386
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 386
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 386
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 387
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 387
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 387
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 387
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 388
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 388
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 388
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 388
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 389
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 389
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 389
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 389
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 390
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 390
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 390
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 390
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 391
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 391
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 391
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 391
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 392
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 392
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 392
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 392
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 393
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 393
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 393
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 393
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 394
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 394
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 394
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 394
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 395
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 395
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 395
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 395
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 396
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 396
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 396
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 396
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 397
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 397
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 397
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 397
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 398
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 398
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 398
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 398
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 399
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 399
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 399
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 399
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 400
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 400
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 400
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 400
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 401
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 401
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 401
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 401
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 402
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 402
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 402
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 402
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 403
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 403
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 403
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 403
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 404
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 404
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 404
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 404
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 405
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 405
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 405
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 405
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 406
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 406
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 406
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 406
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 407
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 407
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 407
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 407
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 408
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 408
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 408
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 408
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 409
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 409
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 409
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 409
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 410
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 410
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 410
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 410
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 411
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 411
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 411
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 411
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 412
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 412
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 412
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 412
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 413
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 413
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 413
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 413
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 414
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 414
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 414
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 414
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 415
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 415
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 415
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 415
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 416
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 416
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 416
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 416
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 417
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 417
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 417
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 417
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 418
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 418
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 418
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 418
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 419
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 419
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 419
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 419
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 420
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 420
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 420
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 420
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 421
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 421
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 421
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 421
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 422
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 422
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 422
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 422
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 423
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 423
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 423
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 423
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 424
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 424
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 424
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 424
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 425
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 425
    mov cx, 328
    mov dx, 340
    call drawWhiteLine

    mov ax, 425
    mov cx, 426
    mov dx, 438
    call drawWhiteLine

    mov ax, 425
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 426
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 426
    mov cx, 328
    mov dx, 438
    call drawWhiteLine

    mov ax, 426
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 427
    mov cx, 170
    mov dx, 182
    call drawWhiteLine

    mov ax, 427
    mov cx, 328
    mov dx, 438
    call drawWhiteLine

    mov ax, 427
    mov cx, 469
    mov dx, 481
    call drawWhiteLine

    mov ax, 428
    mov cx, 170
    mov dx, 481
    call drawWhiteLine

    mov ax, 429
    mov cx, 170
    mov dx, 481
    call drawWhiteLine

    mov ax, 430
    mov cx, 170
    mov dx, 481
    call drawWhiteLine

    mov ax, 431
    mov cx, 170
    mov dx, 481
    call drawWhiteLine

    mov ax, 432
    mov cx, 170
    mov dx, 481
    call drawWhiteLine

    mov ax, 433
    mov cx, 170
    mov dx, 481
    call drawWhiteLine

    mov ax, 434
    mov cx, 170
    mov dx, 481
    call drawWhiteLine

    mov ax, 435
    mov cx, 170
    mov dx, 481
    call drawWhiteLine

    mov ax, 436
    mov cx, 170
    mov dx, 481
    call drawWhiteLine

    mov ax, 437
    mov cx, 170
    mov dx, 481
    call drawWhiteLine

    mov ax, 438
    mov cx, 170
    mov dx, 481
    call drawWhiteLine

    mov ax, 439
    mov cx, 170
    mov dx, 481
    call drawWhiteLine

    call delay

    jmp _wait
start endp

end start
