[bits 16]
[org 0x7C00]

start:
  xor ax, ax
  mov dx, ax
  mov ex, ax
  mov bx, 0x8000
  
  mov si, h_world
  call print_text
  
  h_world db 'hello world',13,0
  
print_text:
  mov ah, 0x0E
  
.repeat_next_char:
  lodsb
  cmp al, 0
  je .done_print
  int 0x10
  jmp .repeat_next_char
  
.done_print:
  ret

times (510 - ($ - $$)) db 0x00
dw 0xAA55
