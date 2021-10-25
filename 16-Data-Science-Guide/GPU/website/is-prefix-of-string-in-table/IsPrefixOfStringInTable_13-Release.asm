Opened log file 'S:\Source\website\is-prefix-of-string-in-table\IsPrefixOfStringInTable_13-Release.asm'
0:004> lm
start             end                 module name
00007ff7`07480000 00007ff7`07489000   ModuleLoader   (private pdb symbols)  c:\symcache\ModuleLoader.pdb\6C14CF32ED41445387AD8959CA3B1A9A1\ModuleLoader.pdb
00007ff7`3f5c0000 00007ff7`3fe96000   ntoskrnl   (deferred)             
00007ffc`fd5f0000 00007ffc`fd624000   TraceStore   (deferred)             
00007ffd`09520000 00007ffd`09534000   Rtl        (deferred)             
00007ffd`0da90000 00007ffd`0da9a000   StringTable2   (private pdb symbols)  c:\symcache\StringTable2.pdb\CF8793BF2BBF46BBA901447F241B8B471\StringTable2.pdb
00007ffd`10f30000 00007ffd`10f38000   PythonTracerInjection   (deferred)             
00007ffd`10f60000 00007ffd`10f69000   TraceStoreSqlite3Ext   (deferred)             
00007ffd`10f70000 00007ffd`10f80000   TracedPythonSession   (deferred)             
00007ffd`10f80000 00007ffd`10f86000   InjectionThunk   (deferred)             
00007ffd`11480000 00007ffd`1148b000   PythonTracer   (deferred)             
00007ffd`15460000 00007ffd`1546c000   DebugEngine   (deferred)             
00007ffd`1c330000 00007ffd`1c336000   TracerHeap   (deferred)             
00007ffd`1c8c0000 00007ffd`1c8f3000   rsaenh     (deferred)             
00007ffd`1ce80000 00007ffd`1ce8b000   CRYPTBASE   (deferred)             
00007ffd`1d110000 00007ffd`1d11d000   Python     (deferred)             
00007ffd`1d120000 00007ffd`1d145000   bcrypt     (deferred)             
00007ffd`1d4b0000 00007ffd`1d4c7000   CRYPTSP    (deferred)             
00007ffd`1daa0000 00007ffd`1dd06000   KERNELBASE   (deferred)             
00007ffd`1dfe0000 00007ffd`1e052000   bcryptPrimitives   (deferred)             
00007ffd`1eb80000 00007ffd`1ec1d000   msvcrt     (deferred)             
00007ffd`20530000 00007ffd`205d1000   ADVAPI32   (deferred)             
00007ffd`20be0000 00007ffd`20cff000   RPCRT4     (deferred)             
00007ffd`20d90000 00007ffd`20deb000   sechost    (deferred)             
00007ffd`212e0000 00007ffd`2138e000   KERNEL32   (deferred)             
00007ffd`21430000 00007ffd`21610000   ntdll      (pdb symbols)          c:\symcache\ntdll.pdb\780C0C1B6159AE8B7663B42759BA7B4E1\ntdll.pdb
0:004> .fnent StringTable2!IsPrefixOfStringInTable_13
Debugger function entry 000002cf`b39245b8 for:
(00007ffd`0da91370)   StringTable2!IsPrefixOfStringInTable_13   |  (00007ffd`0da914d0)   StringTable2!IsPrefixOfStringInTable_4
Exact matches:
    StringTable2!IsPrefixOfStringInTable_13 (struct _STRING_TABLE *, struct _STRING *, struct _STRING_MATCH *)

BeginAddress      = 00000000`00001370
EndAddress        = 00000000`000013d0
UnwindInfoAddress = 00000000`000052ec

Unwind info at 00007ffd`0da952ec, 10 bytes
  version 1, flags 0, prolog 10, codes 6
  00: offs 10, unwind op 4, op info 6	UWOP_SAVE_NONVOL FrameOffset: 48 reg: rsi.
  02: offs 10, unwind op 4, op info 5	UWOP_SAVE_NONVOL FrameOffset: 40 reg: rbp.
  04: offs 10, unwind op 2, op info 3	UWOP_ALLOC_SMALL.
  05: offs c, unwind op 0, op info e	UWOP_PUSH_NONVOL reg: r14.
0:004> uf StringTable2!IsPrefixOfStringInTable_13
StringTable2!IsPrefixOfStringInTable_13:
00007ffd`0da91370 48896c2418      mov     qword ptr [rsp+18h],rbp
00007ffd`0da91375 4889742420      mov     qword ptr [rsp+20h],rsi
00007ffd`0da9137a 4156            push    r14
00007ffd`0da9137c 4883ec20        sub     rsp,20h
00007ffd`0da91380 c5fa6f5920      vmovdqu xmm3,xmmword ptr [rcx+20h]
00007ffd`0da91385 4c8b7208        mov     r14,qword ptr [rdx+8]
00007ffd`0da91389 498bf0          mov     rsi,r8
00007ffd`0da9138c 0fb62a          movzx   ebp,byte ptr [rdx]
00007ffd`0da9138f 4c8bd1          mov     r10,rcx
00007ffd`0da91392 40882c24        mov     byte ptr [rsp],bpl
00007ffd`0da91396 c4e279780c24    vpbroadcastb xmm1,byte ptr [rsp]
00007ffd`0da9139c c4c17a6f26      vmovdqu xmm4,xmmword ptr [r14]
00007ffd`0da913a1 c4e259004110    vpshufb xmm0,xmm4,xmmword ptr [rcx+10h]
00007ffd`0da913a7 c5f97411        vpcmpeqb xmm2,xmm0,xmmword ptr [rcx]
00007ffd`0da913ab c5e164c9        vpcmpgtb xmm1,xmm3,xmm1
00007ffd`0da913af c5f1ef0dc93c0000 vpxor   xmm1,xmm1,xmmword ptr [StringTable2!_xmmffffffffffffffffffffffffffffffff (00007ffd`0da95080)]
00007ffd`0da913b7 c5e9dbd1        vpand   xmm2,xmm2,xmm1
00007ffd`0da913bb c5f9d7c2        vpmovmskb eax,xmm2
00007ffd`0da913bf c5fa7f5c2410    vmovdqu xmmword ptr [rsp+10h],xmm3
00007ffd`0da913c5 85c0            test    eax,eax
00007ffd`0da913c7 0f84d7000000    je      StringTable2!IsPrefixOfStringInTable_13+0x134 (00007ffd`0da914a4)

StringTable2!IsPrefixOfStringInTable_13+0x5d:
00007ffd`0da913cd 0fb70a          movzx   ecx,word ptr [rdx]
00007ffd`0da913d0 48897c2438      mov     qword ptr [rsp+38h],rdi
00007ffd`0da913d5 6683f910        cmp     cx,10h
00007ffd`0da913d9 0f83d8000000    jae     StringTable2!IsPrefixOfStringInTable_13+0x147 (00007ffd`0da914b7)

StringTable2!IsPrefixOfStringInTable_13+0x6f:
00007ffd`0da913df 0fb7f9          movzx   edi,cx

StringTable2!IsPrefixOfStringInTable_13+0x72:
00007ffd`0da913e2 48895c2430      mov     qword ptr [rsp+30h],rbx

StringTable2!IsPrefixOfStringInTable_13+0x77:
00007ffd`0da913e7 85c0            test    eax,eax
00007ffd`0da913e9 0f84d2000000    je      StringTable2!IsPrefixOfStringInTable_13+0x151 (00007ffd`0da914c1)

StringTable2!IsPrefixOfStringInTable_13+0x7f:
00007ffd`0da913ef f3440fbcd8      tzcnt   r11d,eax
00007ffd`0da913f4 458bc3          mov     r8d,r11d
00007ffd`0da913f7 49c1e004        shl     r8,4
00007ffd`0da913fb 418bdb          mov     ebx,r11d
00007ffd`0da913fe c4e278f3c8      blsr    eax,eax
00007ffd`0da91403 c48159744c1040  vpcmpeqb xmm1,xmm4,xmmword ptr [r8+r10+40h]
00007ffd`0da9140a 440fb64c1c10    movzx   r9d,byte ptr [rsp+rbx+10h]
00007ffd`0da91410 c5f9d7c9        vpmovmskb ecx,xmm1
00007ffd`0da91414 c4e240f5d1      bzhi    edx,ecx,edi
00007ffd`0da91419 f30fb8d2        popcnt  edx,edx
00007ffd`0da9141d 0fb7ca          movzx   ecx,dx
00007ffd`0da91420 413bc9          cmp     ecx,r9d
00007ffd`0da91423 722e            jb      StringTable2!IsPrefixOfStringInTable_13+0xe3 (00007ffd`0da91453)

StringTable2!IsPrefixOfStringInTable_13+0xb5:
00007ffd`0da91425 4183f910        cmp     r9d,10h
00007ffd`0da91429 772e            ja      StringTable2!IsPrefixOfStringInTable_13+0xe9 (00007ffd`0da91459)

StringTable2!IsPrefixOfStringInTable_13+0xbb:
00007ffd`0da9142b 4885f6          test    rsi,rsi
00007ffd`0da9142e 0f850c230000    jne     StringTable2!IsPrefixOfStringInTable_13+0x23d0 (00007ffd`0da93740)

StringTable2!IsPrefixOfStringInTable_13+0xc4:
00007ffd`0da91434 410fb6c3        movzx   eax,r11b

StringTable2!IsPrefixOfStringInTable_13+0xc8:
00007ffd`0da91438 488b5c2430      mov     rbx,qword ptr [rsp+30h]
00007ffd`0da9143d 488b7c2438      mov     rdi,qword ptr [rsp+38h]
00007ffd`0da91442 488b6c2440      mov     rbp,qword ptr [rsp+40h]
00007ffd`0da91447 488b742448      mov     rsi,qword ptr [rsp+48h]
00007ffd`0da9144c 4883c420        add     rsp,20h
00007ffd`0da91450 415e            pop     r14
00007ffd`0da91452 c3              ret

StringTable2!IsPrefixOfStringInTable_13+0xe3:
00007ffd`0da91453 4183f910        cmp     r9d,10h
00007ffd`0da91457 768e            jbe     StringTable2!IsPrefixOfStringInTable_13+0x77 (00007ffd`0da913e7)

StringTable2!IsPrefixOfStringInTable_13+0xe9:
00007ffd`0da91459 48ffc3          inc     rbx
00007ffd`0da9145c 32d2            xor     dl,dl
00007ffd`0da9145e 48c1e304        shl     rbx,4
00007ffd`0da91462 4983c610        add     r14,10h
00007ffd`0da91466 49035a30        add     rbx,qword ptr [r10+30h]
00007ffd`0da9146a 4080ed10        sub     bpl,10h
00007ffd`0da9146e 7424            je      StringTable2!IsPrefixOfStringInTable_13+0x124 (00007ffd`0da91494)

StringTable2!IsPrefixOfStringInTable_13+0x100:
00007ffd`0da91470 488b4308        mov     rax,qword ptr [rbx+8]
00007ffd`0da91474 492bc6          sub     rax,r14
00007ffd`0da91477 4c8d4810        lea     r9,[rax+10h]

StringTable2!IsPrefixOfStringInTable_13+0x10b:
00007ffd`0da9147b 410fb60e        movzx   ecx,byte ptr [r14]
00007ffd`0da9147f 430fb60431      movzx   eax,byte ptr [r9+r14]
00007ffd`0da91484 4d8d7601        lea     r14,[r14+1]
00007ffd`0da91488 3ac8            cmp     cl,al
00007ffd`0da9148a 7508            jne     StringTable2!IsPrefixOfStringInTable_13+0x124 (00007ffd`0da91494)

StringTable2!IsPrefixOfStringInTable_13+0x11c:
00007ffd`0da9148c fec2            inc     dl
00007ffd`0da9148e 4080c5ff        add     bpl,0FFh
00007ffd`0da91492 75e7            jne     StringTable2!IsPrefixOfStringInTable_13+0x10b (00007ffd`0da9147b)

StringTable2!IsPrefixOfStringInTable_13+0x124:
00007ffd`0da91494 80c210          add     dl,10h
00007ffd`0da91497 0fb6c2          movzx   eax,dl
00007ffd`0da9149a 663b03          cmp     ax,word ptr [rbx]
00007ffd`0da9149d 7529            jne     StringTable2!IsPrefixOfStringInTable_13+0x158 (00007ffd`0da914c8)

StringTable2!IsPrefixOfStringInTable_13+0x12f:
00007ffd`0da9149f 0fb6d2          movzx   edx,dl
00007ffd`0da914a2 eb87            jmp     StringTable2!IsPrefixOfStringInTable_13+0xbb (00007ffd`0da9142b)

StringTable2!IsPrefixOfStringInTable_13+0x134:
00007ffd`0da914a4 488b6c2440      mov     rbp,qword ptr [rsp+40h]
00007ffd`0da914a9 b0ff            mov     al,0FFh
00007ffd`0da914ab 488b742448      mov     rsi,qword ptr [rsp+48h]
00007ffd`0da914b0 4883c420        add     rsp,20h
00007ffd`0da914b4 415e            pop     r14
00007ffd`0da914b6 c3              ret

StringTable2!IsPrefixOfStringInTable_13+0x147:
00007ffd`0da914b7 bf10000000      mov     edi,10h
00007ffd`0da914bc e921ffffff      jmp     StringTable2!IsPrefixOfStringInTable_13+0x72 (00007ffd`0da913e2)

StringTable2!IsPrefixOfStringInTable_13+0x151:
00007ffd`0da914c1 b0ff            mov     al,0FFh
00007ffd`0da914c3 e970ffffff      jmp     StringTable2!IsPrefixOfStringInTable_13+0xc8 (00007ffd`0da91438)

StringTable2!IsPrefixOfStringInTable_13+0x158:
00007ffd`0da914c8 b2ff            mov     dl,0FFh
00007ffd`0da914ca ebd3            jmp     StringTable2!IsPrefixOfStringInTable_13+0x12f (00007ffd`0da9149f)

StringTable2!IsPrefixOfStringInTable_13+0x23d0:
00007ffd`0da93740 885601          mov     byte ptr [rsi+1],dl
00007ffd`0da93743 44881e          mov     byte ptr [rsi],r11b
00007ffd`0da93746 498b5230        mov     rdx,qword ptr [r10+30h]
00007ffd`0da9374a 4883c210        add     rdx,10h
00007ffd`0da9374e 4903d0          add     rdx,r8
00007ffd`0da93751 48895608        mov     qword ptr [rsi+8],rdx
00007ffd`0da93755 e9dadcffff      jmp     StringTable2!IsPrefixOfStringInTable_13+0xc4 (00007ffd`0da91434)
0:004> lm
start             end                 module name
00007ff7`07480000 00007ff7`07489000   ModuleLoader   (private pdb symbols)  c:\symcache\ModuleLoader.pdb\6C14CF32ED41445387AD8959CA3B1A9A1\ModuleLoader.pdb
00007ff7`3f5c0000 00007ff7`3fe96000   ntoskrnl   (deferred)             
00007ffc`fd5f0000 00007ffc`fd624000   TraceStore   (deferred)             
00007ffd`09520000 00007ffd`09534000   Rtl        (deferred)             
00007ffd`0da90000 00007ffd`0da9a000   StringTable2   (private pdb symbols)  c:\symcache\StringTable2.pdb\CF8793BF2BBF46BBA901447F241B8B471\StringTable2.pdb
00007ffd`10f30000 00007ffd`10f38000   PythonTracerInjection   (deferred)             
00007ffd`10f60000 00007ffd`10f69000   TraceStoreSqlite3Ext   (deferred)             
00007ffd`10f70000 00007ffd`10f80000   TracedPythonSession   (deferred)             
00007ffd`10f80000 00007ffd`10f86000   InjectionThunk   (deferred)             
00007ffd`11480000 00007ffd`1148b000   PythonTracer   (deferred)             
00007ffd`15460000 00007ffd`1546c000   DebugEngine   (deferred)             
00007ffd`1c330000 00007ffd`1c336000   TracerHeap   (deferred)             
00007ffd`1c8c0000 00007ffd`1c8f3000   rsaenh     (deferred)             
00007ffd`1ce80000 00007ffd`1ce8b000   CRYPTBASE   (deferred)             
00007ffd`1d110000 00007ffd`1d11d000   Python     (deferred)             
00007ffd`1d120000 00007ffd`1d145000   bcrypt     (deferred)             
00007ffd`1d4b0000 00007ffd`1d4c7000   CRYPTSP    (deferred)             
00007ffd`1daa0000 00007ffd`1dd06000   KERNELBASE   (deferred)             
00007ffd`1dfe0000 00007ffd`1e052000   bcryptPrimitives   (deferred)             
00007ffd`1eb80000 00007ffd`1ec1d000   msvcrt     (deferred)             
00007ffd`20530000 00007ffd`205d1000   ADVAPI32   (deferred)             
00007ffd`20be0000 00007ffd`20cff000   RPCRT4     (deferred)             
00007ffd`20d90000 00007ffd`20deb000   sechost    (deferred)             
00007ffd`212e0000 00007ffd`2138e000   KERNEL32   (deferred)             
00007ffd`21430000 00007ffd`21610000   ntdll      (pdb symbols)          c:\symcache\ntdll.pdb\780C0C1B6159AE8B7663B42759BA7B4E1\ntdll.pdb
0:004> .logclose
Closing open log file S:\Source\website\is-prefix-of-string-in-table\IsPrefixOfStringInTable_13-Release.asm
