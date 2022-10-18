(module
  (type (;0;) (func))
  (type (;1;) (func (param i32 i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32)))
  (type (;4;) (func (param i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32)))
  (type (;6;) (func (result i32)))
  (type (;7;) (func (param i32 i64) (result i32)))
  (type (;8;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32)))
  (type (;10;) (func (param i32 i64)))
  (type (;11;) (func (param i32 i32) (result i64)))
  (type (;12;) (func (param i32 i32 i64)))
  (type (;13;) (func (param i32 i32 i64 i32 i32) (result i32)))
  (type (;14;) (func (param i32 i32 i32) (result i32)))
  (type (;15;) (func (param i32) (result i64)))
  (type (;16;) (func (param i64)))
  (type (;17;) (func (param i32 i32 i64 i32)))
  (type (;18;) (func (param i32 i32 i32 i32 i32)))
  (type (;19;) (func (param i64 i32 i32 i32)))
  (type (;20;) (func (param i32 i32 i32) (result i64)))
  (type (;21;) (func (param i32 i64 i32)))
  (type (;22;) (func (param i64 i32)))
  (type (;23;) (func (param i32 i64 i32 i32)))
  (import "env" "bigIntSetInt64" (func (;0;) (type 10)))
  (import "env" "bigIntAdd" (func (;1;) (type 5)))
  (import "env" "signalError" (func (;2;) (type 1)))
  (import "env" "mBufferNew" (func (;3;) (type 6)))
  (import "env" "mBufferAppend" (func (;4;) (type 2)))
  (import "env" "mBufferEq" (func (;5;) (type 2)))
  (import "env" "managedTransferValueExecute" (func (;6;) (type 13)))
  (import "env" "managedCaller" (func (;7;) (type 3)))
  (import "env" "managedOwnerAddress" (func (;8;) (type 3)))
  (import "env" "managedGetMultiESDTCallValue" (func (;9;) (type 3)))
  (import "env" "mBufferGetLength" (func (;10;) (type 4)))
  (import "env" "bigIntGetCallValue" (func (;11;) (type 3)))
  (import "env" "bigIntGetUnsignedArgument" (func (;12;) (type 1)))
  (import "env" "mBufferAppendBytes" (func (;13;) (type 14)))
  (import "env" "managedSignalError" (func (;14;) (type 3)))
  (import "env" "smallIntGetUnsignedArgument" (func (;15;) (type 15)))
  (import "env" "getNumArguments" (func (;16;) (type 6)))
  (import "env" "mBufferCopyByteSlice" (func (;17;) (type 8)))
  (import "env" "mBufferSetBytes" (func (;18;) (type 14)))
  (import "env" "bigIntMul" (func (;19;) (type 5)))
  (import "env" "mBufferStorageLoad" (func (;20;) (type 2)))
  (import "env" "mBufferStorageStore" (func (;21;) (type 2)))
  (import "env" "mBufferFinish" (func (;22;) (type 4)))
  (import "env" "mBufferToBigIntUnsigned" (func (;23;) (type 2)))
  (import "env" "mBufferFromBigIntUnsigned" (func (;24;) (type 2)))
  (import "env" "mBufferGetArgument" (func (;25;) (type 2)))
  (import "env" "bigIntCmp" (func (;26;) (type 2)))
  (import "env" "managedMultiTransferESDTNFTExecute" (func (;27;) (type 13)))
  (import "env" "checkNoPayment" (func (;28;) (type 0)))
  (import "env" "bigIntSub" (func (;29;) (type 5)))
  (import "env" "bigIntSign" (func (;30;) (type 4)))
  (import "env" "bigIntTDiv" (func (;31;) (type 5)))
  (import "env" "smallIntFinishUnsigned" (func (;32;) (type 16)))
  (import "env" "smallIntFinishSigned" (func (;33;) (type 16)))
  (import "env" "finish" (func (;34;) (type 1)))
  (import "env" "mBufferGetByteSlice" (func (;35;) (type 8)))
  (func (;36;) (type 4) (param i32) (result i32)
    (local i32)
    call 37
    local.tee 1
    i64.const 0
    call 0
    local.get 1
    local.get 1
    local.get 0
    call 1
    local.get 1)
  (func (;37;) (type 6) (result i32)
    (local i32)
    i32.const 1049312
    i32.const 1049312
    i32.load
    i32.const 1
    i32.sub
    local.tee 0
    i32.store
    local.get 0)
  (func (;38;) (type 18) (param i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.le_u
      if  ;; label = @2
        local.get 2
        local.get 4
        i32.le_u
        br_if 1 (;@1;)
        call 39
        unreachable
      end
      call 39
      unreachable
    end
    local.get 0
    local.get 2
    local.get 1
    i32.sub
    i32.store offset=4
    local.get 0
    local.get 1
    local.get 3
    i32.add
    i32.store)
  (func (;39;) (type 0)
    call 155
    unreachable)
  (func (;40;) (type 4) (param i32) (result i32)
    (local i32)
    call 3
    local.tee 1
    local.get 0
    call 4
    drop
    local.get 1)
  (func (;41;) (type 2) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 5
    i32.const 0
    i32.gt_s)
  (func (;42;) (type 1) (param i32 i32)
    local.get 0
    local.get 1
    call 2
    unreachable)
  (func (;43;) (type 17) (param i32 i32 i64 i32)
    (local i32 i32 i32 i32)
    call 44
    local.set 5
    call 44
    local.set 6
    local.get 1
    i32.const 2147483646
    i32.ne
    if  ;; label = @1
      global.get 0
      i32.const 16
      i32.sub
      local.tee 4
      global.set 0
      call 44
      local.set 7
      local.get 1
      call 40
      local.set 1
      local.get 3
      call 36
      local.set 3
      local.get 4
      local.get 2
      i64.const 40
      i64.shl
      i64.const 71776119061217280
      i64.and
      local.get 2
      i64.const 56
      i64.shl
      i64.or
      local.get 2
      i64.const 24
      i64.shl
      i64.const 280375465082880
      i64.and
      local.get 2
      i64.const 8
      i64.shl
      i64.const 1095216660480
      i64.and
      i64.or
      i64.or
      local.get 2
      i64.const 8
      i64.shr_u
      i64.const 4278190080
      i64.and
      local.get 2
      i64.const 24
      i64.shr_u
      i64.const 16711680
      i64.and
      i64.or
      local.get 2
      i64.const 40
      i64.shr_u
      i64.const 65280
      i64.and
      local.get 2
      i64.const 56
      i64.shr_u
      i64.or
      i64.or
      i64.or
      i64.store offset=4 align=4
      local.get 4
      local.get 1
      i32.const 8
      i32.shl
      i32.const 16711680
      i32.and
      local.get 1
      i32.const 24
      i32.shl
      i32.or
      local.get 1
      i32.const 8
      i32.shr_u
      i32.const 65280
      i32.and
      local.get 1
      i32.const 24
      i32.shr_u
      i32.or
      i32.or
      i32.store
      local.get 4
      local.get 3
      i32.const 8
      i32.shl
      i32.const 16711680
      i32.and
      local.get 3
      i32.const 24
      i32.shl
      i32.or
      local.get 3
      i32.const 8
      i32.shr_u
      i32.const 65280
      i32.and
      local.get 3
      i32.const 24
      i32.shr_u
      i32.or
      i32.or
      i32.store offset=12
      local.get 7
      local.get 4
      i32.const 16
      call 13
      drop
      local.get 0
      local.get 7
      i64.const 0
      local.get 5
      local.get 6
      call 27
      drop
      local.get 4
      i32.const 16
      i32.add
      global.set 0
      return
    end
    local.get 0
    local.get 3
    i64.const 0
    local.get 5
    local.get 6
    call 6
    drop)
  (func (;44;) (type 6) (result i32)
    (local i32)
    call 37
    local.tee 0
    i32.const 1049212
    i32.const 0
    call 18
    drop
    local.get 0)
  (func (;45;) (type 6) (result i32)
    (local i32)
    call 37
    local.tee 0
    call 7
    local.get 0)
  (func (;46;) (type 6) (result i32)
    (local i32)
    call 37
    local.tee 0
    call 8
    local.get 0)
  (func (;47;) (type 0)
    call 46
    call 45
    call 41
    if  ;; label = @1
      return
    end
    i32.const 1049212
    i32.const 36
    call 2
    unreachable)
  (func (;48;) (type 3) (param i32)
    (local i32 i32 i32 i32 i64)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    i32.const -21
    local.set 1
    block  ;; label = @1
      i32.const 1059332
      i32.load8_u
      local.tee 3
      if  ;; label = @2
        i32.const -21
        i32.const 2147483647
        local.get 3
        select
        local.set 1
        br 1 (;@1;)
      end
      i32.const 1059332
      i32.const 1
      i32.store8
      i32.const -21
      call 9
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              call 10
              i32.const 4
              i32.shr_u
              br_table 1 (;@4;) 2 (;@3;) 0 (;@5;)
            end
            i32.const 1048590
            i32.const 34
            call 2
            unreachable
          end
          i32.const -11
          local.set 1
          i32.const 2147483646
          local.set 3
          i32.const 1059328
          i32.load8_u
          local.tee 4
          if  ;; label = @4
            i32.const -11
            i32.const 2147483647
            local.get 4
            select
            local.set 1
            br 2 (;@2;)
          end
          i32.const 1059328
          i32.const 1
          i32.store8
          i32.const -11
          call 11
          br 1 (;@2;)
        end
        local.get 2
        i32.const 8
        i32.add
        i64.const 0
        i64.store
        local.get 2
        i64.const 0
        i64.store
        local.get 1
        i32.const 0
        local.get 2
        i32.const 16
        call 49
        br_if 1 (;@1;)
        local.get 2
        i64.load offset=4 align=4
        local.tee 5
        i64.const 56
        i64.shl
        local.get 5
        i64.const 40
        i64.shl
        i64.const 71776119061217280
        i64.and
        i64.or
        local.get 5
        i64.const 24
        i64.shl
        i64.const 280375465082880
        i64.and
        local.get 5
        i64.const 8
        i64.shl
        i64.const 1095216660480
        i64.and
        i64.or
        i64.or
        local.get 5
        i64.const 8
        i64.shr_u
        i64.const 4278190080
        i64.and
        local.get 5
        i64.const 24
        i64.shr_u
        i64.const 16711680
        i64.and
        i64.or
        local.get 5
        i64.const 40
        i64.shr_u
        i64.const 65280
        i64.and
        local.get 5
        i64.const 56
        i64.shr_u
        i64.or
        i64.or
        i64.or
        local.set 5
        local.get 2
        i32.load
        local.tee 1
        i32.const 24
        i32.shl
        local.get 1
        i32.const 8
        i32.shl
        i32.const 16711680
        i32.and
        i32.or
        local.get 1
        i32.const 8
        i32.shr_u
        i32.const 65280
        i32.and
        local.get 1
        i32.const 24
        i32.shr_u
        i32.or
        i32.or
        local.set 3
        local.get 2
        i32.load offset=12
        local.tee 1
        i32.const 24
        i32.shl
        local.get 1
        i32.const 8
        i32.shl
        i32.const 16711680
        i32.and
        i32.or
        local.get 1
        i32.const 8
        i32.shr_u
        i32.const 65280
        i32.and
        local.get 1
        i32.const 24
        i32.shr_u
        i32.or
        i32.or
        local.set 1
      end
      local.get 0
      local.get 1
      i32.store offset=12
      local.get 0
      local.get 5
      i64.store
      local.get 0
      local.get 3
      i32.store offset=8
      local.get 2
      i32.const 16
      i32.add
      global.set 0
      return
    end
    i32.const 1048725
    i32.const 29
    call 2
    unreachable)
  (func (;49;) (type 8) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 3
    local.get 2
    call 35
    i32.const 0
    i32.ne)
  (func (;50;) (type 4) (param i32) (result i32)
    local.get 0
    call 37
    local.tee 0
    call 12
    local.get 0)
  (func (;51;) (type 2) (param i32 i32) (result i32)
    (local i32)
    call 37
    local.tee 2
    local.get 0
    local.get 1
    call 18
    drop
    local.get 2)
  (func (;52;) (type 6) (result i32)
    (local i32)
    call 53
    local.tee 0
    call 10
    i32.const 32
    i32.ne
    if  ;; label = @1
      i32.const 1048624
      i32.const 23
      call 51
      local.tee 0
      i32.const 1049112
      i32.const 7
      call 13
      drop
      local.get 0
      i32.const 1048647
      i32.const 3
      call 13
      drop
      local.get 0
      i32.const 1048864
      i32.const 16
      call 13
      drop
      local.get 0
      call 14
      unreachable
    end
    local.get 0)
  (func (;53;) (type 6) (result i32)
    (local i32)
    i32.const 0
    call 37
    local.tee 0
    call 25
    drop
    local.get 0)
  (func (;54;) (type 4) (param i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 0
    call 10
    i32.const 4
    i32.eq
    if  ;; label = @1
      local.get 1
      i32.const 0
      i32.store offset=12
      local.get 0
      i32.const 0
      local.get 1
      i32.const 12
      i32.add
      i32.const 4
      call 49
      drop
      i32.const 2147483646
      local.get 0
      local.get 1
      i32.load offset=12
      i32.const 1145849669
      i32.eq
      select
      local.set 0
    end
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func (;55;) (type 3) (param i32)
    call 16
    local.get 0
    i32.eq
    if  ;; label = @1
      return
    end
    i32.const 1048685
    i32.const 25
    call 2
    unreachable)
  (func (;56;) (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 0
    i32.store offset=12
    local.get 0
    local.get 1
    i32.const 12
    i32.add
    local.tee 2
    i32.const 4
    call 57
    local.get 0
    local.get 2
    i32.const 4
    call 58
    i32.wrap_i64
    call 59
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func (;57;) (type 5) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 0
    i32.load offset=12
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u offset=8
          i32.eqz
          if  ;; label = @4
            local.get 0
            i32.load
            local.tee 6
            call 10
            local.set 4
            i32.const 1059320
            i32.load8_u
            local.get 4
            i32.const 10000
            i32.gt_u
            i32.or
            br_if 1 (;@3;)
            i32.const 1049316
            local.get 4
            i32.store
            i32.const 1059320
            i32.const 1
            i32.store8
            local.get 3
            i32.const 8
            i32.add
            local.get 4
            call 67
            local.get 6
            i32.const 0
            local.get 3
            i32.load offset=8
            local.get 3
            i32.load offset=12
            call 64
            drop
            local.get 0
            i32.const 1
            i32.store8 offset=8
          end
          local.get 2
          local.get 5
          i32.add
          local.tee 4
          i32.const 1049316
          i32.load
          i32.gt_u
          br_if 2 (;@1;)
          local.get 3
          local.get 5
          local.get 4
          call 71
          local.get 1
          local.get 2
          local.get 3
          i32.load
          local.get 3
          i32.load offset=4
          call 68
          br 1 (;@2;)
        end
        local.get 0
        i32.const 0
        i32.store8 offset=8
        local.get 6
        local.get 5
        local.get 1
        local.get 2
        call 64
        br_if 1 (;@1;)
        local.get 2
        local.get 5
        i32.add
        local.set 4
      end
      local.get 0
      local.get 4
      i32.store offset=12
      local.get 3
      i32.const 16
      i32.add
      global.set 0
      return
    end
    i32.const 1048710
    i32.const 15
    call 60
    unreachable)
  (func (;58;) (type 11) (param i32 i32) (result i64)
    (local i64)
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 1
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        i32.const 1
        i32.sub
        local.set 1
        local.get 0
        i64.load8_u
        local.get 2
        i64.const 8
        i64.shl
        i64.or
        local.set 2
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        br 0 (;@2;)
      end
      unreachable
    end
    local.get 2)
  (func (;59;) (type 2) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.load offset=12
    local.set 2
    call 3
    local.set 3
    local.get 0
    i32.load
    local.get 2
    local.get 1
    local.get 3
    call 17
    i32.eqz
    if  ;; label = @1
      local.get 0
      local.get 1
      local.get 2
      i32.add
      i32.store offset=12
      local.get 3
      return
    end
    i32.const 1048710
    i32.const 15
    call 60
    unreachable)
  (func (;60;) (type 1) (param i32 i32)
    (local i32)
    i32.const 1048842
    i32.const 22
    call 51
    local.tee 2
    local.get 0
    local.get 1
    call 13
    drop
    local.get 2
    call 14
    unreachable)
  (func (;61;) (type 5) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call 13
    drop)
  (func (;62;) (type 2) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 63
    i32.const 255
    i32.and
    i32.eqz)
  (func (;63;) (type 2) (param i32 i32) (result i32)
    i32.const -1
    local.get 0
    local.get 1
    call 26
    local.tee 0
    i32.const 0
    i32.ne
    local.get 0
    i32.const 0
    i32.lt_s
    select)
  (func (;64;) (type 8) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call 49)
  (func (;65;) (type 1) (param i32 i32)
    local.get 0
    local.get 1
    call 4
    drop)
  (func (;66;) (type 2) (param i32 i32) (result i32)
    (local i32)
    call 37
    local.tee 2
    local.get 0
    local.get 1
    call 19
    local.get 2)
  (func (;67;) (type 1) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 8
    i32.add
    i32.const 1049320
    i32.const 10000
    local.get 1
    call 125
    local.get 2
    i32.load offset=12
    local.set 1
    local.get 0
    local.get 2
    i32.load offset=8
    i32.store
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;68;) (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 1
    local.get 3
    i32.eq
    if  ;; label = @1
      local.get 1
      local.tee 3
      i32.const 15
      i32.gt_u
      if  ;; label = @2
        local.get 0
        i32.const 0
        local.get 0
        i32.sub
        i32.const 3
        i32.and
        local.tee 5
        i32.add
        local.set 4
        local.get 5
        if  ;; label = @3
          local.get 2
          local.set 1
          loop  ;; label = @4
            local.get 0
            local.get 1
            i32.load8_u
            i32.store8
            local.get 1
            i32.const 1
            i32.add
            local.set 1
            local.get 0
            i32.const 1
            i32.add
            local.tee 0
            local.get 4
            i32.lt_u
            br_if 0 (;@4;)
          end
        end
        local.get 4
        local.get 3
        local.get 5
        i32.sub
        local.tee 3
        i32.const -4
        i32.and
        local.tee 6
        i32.add
        local.set 0
        block  ;; label = @3
          local.get 2
          local.get 5
          i32.add
          local.tee 5
          i32.const 3
          i32.and
          local.tee 1
          if  ;; label = @4
            local.get 6
            i32.const 0
            i32.le_s
            br_if 1 (;@3;)
            local.get 5
            i32.const -4
            i32.and
            local.tee 7
            i32.const 4
            i32.add
            local.set 2
            i32.const 0
            local.get 1
            i32.const 3
            i32.shl
            local.tee 8
            i32.sub
            i32.const 24
            i32.and
            local.set 9
            local.get 7
            i32.load
            local.set 1
            loop  ;; label = @5
              local.get 4
              local.get 1
              local.get 8
              i32.shr_u
              local.get 2
              i32.load
              local.tee 1
              local.get 9
              i32.shl
              i32.or
              i32.store
              local.get 2
              i32.const 4
              i32.add
              local.set 2
              local.get 4
              i32.const 4
              i32.add
              local.tee 4
              local.get 0
              i32.lt_u
              br_if 0 (;@5;)
            end
            br 1 (;@3;)
          end
          local.get 6
          i32.const 0
          i32.le_s
          br_if 0 (;@3;)
          local.get 5
          local.set 2
          loop  ;; label = @4
            local.get 4
            local.get 2
            i32.load
            i32.store
            local.get 2
            i32.const 4
            i32.add
            local.set 2
            local.get 4
            i32.const 4
            i32.add
            local.tee 4
            local.get 0
            i32.lt_u
            br_if 0 (;@4;)
          end
        end
        local.get 3
        i32.const 3
        i32.and
        local.set 3
        local.get 5
        local.get 6
        i32.add
        local.set 2
      end
      local.get 3
      if  ;; label = @2
        local.get 0
        local.get 3
        i32.add
        local.set 1
        loop  ;; label = @3
          local.get 0
          local.get 2
          i32.load8_u
          i32.store8
          local.get 2
          i32.const 1
          i32.add
          local.set 2
          local.get 0
          i32.const 1
          i32.add
          local.tee 0
          local.get 1
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      return
    end
    call 155
    unreachable)
  (func (;69;) (type 2) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    i32.store8 offset=12
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    i32.const 8
    i32.add
    call 70
    local.get 2
    i32.load offset=8
    local.get 2
    i32.load8_u offset=12
    if  ;; label = @1
      i32.const 1049316
      i32.const 0
      i32.store
      i32.const 1059320
      i32.const 0
      i32.store8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;70;) (type 3) (param i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 0
    i32.load8_u offset=4
    local.get 0
    i32.const 0
    i32.store8 offset=4
    i32.const 1
    i32.and
    if  ;; label = @1
      local.get 1
      i32.const 8
      i32.add
      i32.const 0
      i32.const 1049316
      i32.load
      call 71
      local.get 0
      i32.load
      local.get 1
      i32.load offset=8
      local.get 1
      i32.load offset=12
      call 13
      drop
      i32.const 1049316
      i32.const 0
      i32.store
      i32.const 1059320
      i32.const 0
      i32.store8
    end
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func (;71;) (type 5) (param i32 i32 i32)
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.le_u
      if  ;; label = @2
        local.get 2
        i32.const 10000
        i32.le_u
        br_if 1 (;@1;)
        call 39
        unreachable
      end
      call 39
      unreachable
    end
    local.get 0
    local.get 2
    local.get 1
    i32.sub
    i32.store offset=4
    local.get 0
    local.get 1
    i32.const 1049320
    i32.add
    i32.store)
  (func (;72;) (type 4) (param i32) (result i32)
    (local i64)
    local.get 0
    call 73
    local.tee 1
    i64.const 4294967296
    i64.ge_u
    if  ;; label = @1
      i32.const 1048576
      i32.const 14
      call 60
      unreachable
    end
    local.get 1
    i32.wrap_i64)
  (func (;73;) (type 15) (param i32) (result i64)
    (local i32 i32 i64)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i64.const 0
    i64.store offset=8
    local.get 0
    call 75
    local.tee 0
    call 10
    local.tee 2
    i32.const 9
    i32.ge_u
    if  ;; label = @1
      i32.const 1048576
      i32.const 14
      call 60
      unreachable
    end
    local.get 1
    local.get 1
    i32.const 8
    i32.add
    i32.const 8
    local.get 2
    call 125
    local.get 0
    i32.const 0
    local.get 1
    i32.load
    local.tee 0
    local.get 1
    i32.load offset=4
    local.tee 2
    call 49
    drop
    local.get 0
    local.get 2
    call 58
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func (;74;) (type 4) (param i32) (result i32)
    local.get 0
    call 75
    local.tee 0
    call 10
    i32.const 32
    i32.ne
    if  ;; label = @1
      i32.const 1048864
      i32.const 16
      call 60
      unreachable
    end
    local.get 0)
  (func (;75;) (type 4) (param i32) (result i32)
    local.get 0
    call 37
    local.tee 0
    call 20
    drop
    local.get 0)
  (func (;76;) (type 1) (param i32 i32)
    (local i32)
    local.get 0
    local.get 1
    call 75
    local.tee 1
    call 10
    local.tee 2
    i32.store offset=16
    local.get 0
    i32.const 0
    i32.store offset=12
    local.get 0
    i32.const 0
    i32.store8 offset=8
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func (;77;) (type 4) (param i32) (result i32)
    (local i32 i64)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 0
    i32.store offset=12
    local.get 0
    local.get 1
    i32.const 12
    i32.add
    local.tee 0
    i32.const 4
    call 57
    local.get 0
    i32.const 4
    call 58
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    i32.wrap_i64)
  (func (;78;) (type 10) (param i32 i64)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    i64.const 40
    i64.shl
    i64.const 71776119061217280
    i64.and
    local.get 1
    i64.const 56
    i64.shl
    i64.or
    local.get 1
    i64.const 24
    i64.shl
    i64.const 280375465082880
    i64.and
    local.get 1
    i64.const 8
    i64.shl
    i64.const 1095216660480
    i64.and
    i64.or
    i64.or
    local.get 1
    i64.const 8
    i64.shr_u
    i64.const 4278190080
    i64.and
    local.get 1
    i64.const 24
    i64.shr_u
    i64.const 16711680
    i64.and
    i64.or
    local.get 1
    i64.const 40
    i64.shr_u
    i64.const 65280
    i64.and
    local.get 1
    i64.const 56
    i64.shr_u
    i64.or
    i64.or
    i64.or
    i64.store offset=8
    local.get 0
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    call 61
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;79;) (type 3) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 8
    i32.add
    local.set 3
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    block (result i32)  ;; label = @1
      i32.const 1059320
      i32.load8_u
      i32.eqz
      if  ;; label = @2
        i32.const 1
        local.set 4
        i32.const 1059320
        i32.const 1
        i32.store8
        i32.const 1049316
        i32.const 0
        i32.store
        local.get 1
        i32.const 8
        i32.add
        i32.const 0
        call 67
        local.get 1
        i32.load offset=8
        local.get 1
        i32.load offset=12
        i32.const 1049212
        i32.const 0
        call 68
        call 44
        br 1 (;@1;)
      end
      i32.const 1049212
      i32.const 0
      call 51
    end
    local.set 5
    local.get 3
    local.get 4
    i32.store8 offset=4
    local.get 3
    local.get 5
    i32.store
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    local.get 2
    i32.load offset=8
    local.set 1
    local.get 0
    local.get 2
    i32.load8_u offset=12
    i32.const 1
    i32.and
    i32.store8 offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;80;) (type 1) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.const 8
    i32.shl
    i32.const 16711680
    i32.and
    local.get 0
    i32.const 24
    i32.shl
    i32.or
    local.get 0
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 0
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store offset=12
    local.get 1
    local.get 2
    i32.const 12
    i32.add
    i32.const 4
    call 124
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;81;) (type 5) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call 69
    call 21
    drop)
  (func (;82;) (type 5) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call 51
    call 21
    drop)
  (func (;83;) (type 3) (param i32)
    local.get 0
    i32.const 1049212
    i32.const 0
    call 82)
  (func (;84;) (type 1) (param i32 i32)
    local.get 0
    local.get 1
    call 21
    drop)
  (func (;85;) (type 3) (param i32)
    i32.const -20
    i32.const 0
    i32.const 0
    call 18
    drop
    local.get 0
    i32.const -20
    call 21
    drop)
  (func (;86;) (type 7) (param i32 i64) (result i32)
    local.get 0
    i32.load
    call 40
    local.tee 0
    i32.const 1048758
    i32.const 7
    call 13
    drop
    local.get 0
    local.get 1
    call 78
    local.get 0)
  (func (;87;) (type 12) (param i32 i32 i64)
    (local i32 i32 i32)
    global.get 0
    i32.const -64
    i32.add
    local.tee 3
    global.set 0
    local.get 3
    i32.const 8
    i32.add
    local.tee 4
    local.get 1
    local.get 2
    call 86
    call 76
    local.get 4
    i32.const 32
    call 59
    local.set 1
    local.get 3
    i32.const 32
    i32.add
    local.get 4
    call 88
    local.get 3
    i32.const 48
    i32.add
    local.tee 5
    local.get 4
    call 88
    local.get 4
    call 89
    local.set 4
    local.get 3
    i32.load offset=24
    local.get 3
    i32.load offset=20
    i32.eq
    if  ;; label = @1
      local.get 0
      local.get 3
      i64.load offset=32
      i64.store
      local.get 0
      i32.const 24
      i32.add
      local.get 3
      i32.const 56
      i32.add
      i64.load
      i64.store
      local.get 0
      i32.const 16
      i32.add
      local.get 5
      i64.load
      i64.store
      local.get 0
      i32.const 8
      i32.add
      local.get 3
      i32.const 40
      i32.add
      i64.load
      i64.store
      local.get 3
      i32.load8_u offset=16
      if  ;; label = @2
        i32.const 1049316
        i32.const 0
        i32.store
        i32.const 1059320
        i32.const 0
        i32.store8
      end
      local.get 0
      local.get 4
      i32.store offset=36
      local.get 0
      local.get 1
      i32.store offset=32
      local.get 3
      i32.const -64
      i32.sub
      global.set 0
      return
    end
    i32.const 1048576
    i32.const 14
    call 60
    unreachable)
  (func (;88;) (type 1) (param i32 i32)
    (local i32 i32 i32 i64)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 1
    call 56
    call 54
    local.set 3
    local.get 2
    i64.const 0
    i64.store offset=8
    local.get 1
    local.get 2
    i32.const 8
    i32.add
    local.tee 4
    i32.const 8
    call 57
    local.get 4
    i32.const 8
    call 58
    local.set 5
    local.get 0
    local.get 1
    call 89
    i32.store offset=12
    local.get 0
    local.get 3
    i32.store offset=8
    local.get 0
    local.get 5
    i64.store
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;89;) (type 4) (param i32) (result i32)
    local.get 0
    call 56
    call 37
    local.tee 0
    call 23
    drop
    local.get 0)
  (func (;90;) (type 12) (param i32 i32 i64)
    (local i64)
    local.get 0
    local.get 1
    i32.load offset=4
    local.get 2
    call 91
    if (result i64)  ;; label = @1
      local.get 0
      i32.const 8
      i32.add
      local.get 1
      local.get 2
      call 87
      i64.const 1
    else
      i64.const 0
    end
    i64.store)
  (func (;91;) (type 7) (param i32 i64) (result i32)
    local.get 0
    local.get 1
    call 104
    i32.const 0
    i32.ne)
  (func (;92;) (type 17) (param i32 i32 i64 i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 4
    global.set 0
    local.get 0
    local.get 1
    local.get 2
    call 90
    local.get 1
    local.get 2
    call 86
    local.get 4
    i32.const 8
    i32.add
    call 79
    local.get 4
    local.get 4
    i32.load8_u offset=12
    i32.store8 offset=36
    local.get 4
    local.get 4
    i32.load offset=8
    i32.store offset=32
    local.get 4
    i32.const 32
    i32.add
    local.tee 5
    local.get 3
    i32.load offset=32
    call 93
    local.get 3
    i64.load
    local.get 3
    i32.const 8
    i32.add
    i32.load
    local.get 3
    i32.const 12
    i32.add
    i32.load
    local.get 5
    call 94
    local.get 3
    i32.const 16
    i32.add
    i64.load
    local.get 3
    i32.const 24
    i32.add
    i32.load
    local.get 3
    i32.const 28
    i32.add
    i32.load
    local.get 5
    call 94
    local.get 3
    i32.load offset=36
    local.get 5
    call 95
    local.get 4
    i32.load offset=32
    local.get 4
    i32.load8_u offset=36
    call 81
    local.get 1
    i32.load offset=4
    local.tee 5
    local.get 2
    call 91
    i32.eqz
    if  ;; label = @1
      local.get 4
      i32.const 16
      i32.add
      local.get 1
      i32.const 8
      i32.add
      i32.load
      local.tee 1
      call 96
      local.get 4
      local.get 4
      i32.load offset=28
      i32.const 1
      i32.add
      local.tee 0
      i32.store offset=28
      block  ;; label = @2
        local.get 4
        i32.load offset=16
        local.tee 6
        i32.eqz
        if  ;; label = @3
          local.get 4
          local.get 0
          i32.store offset=20
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 4
        local.get 1
        local.get 4
        i32.load offset=24
        local.tee 3
        call 97
        local.get 1
        local.get 3
        local.get 4
        i32.load
        local.get 0
        call 98
      end
      local.get 1
      local.get 0
      local.get 3
      i32.const 0
      call 98
      local.get 4
      i32.const 24
      i32.add
      local.tee 3
      local.get 0
      i32.store
      local.get 1
      i32.const 1048807
      i32.const 6
      local.get 0
      call 99
      local.get 2
      call 100
      local.get 4
      local.get 6
      i32.const 1
      i32.add
      i32.store offset=16
      local.get 4
      i32.const 40
      i32.add
      local.get 3
      i64.load
      i64.store
      local.get 4
      local.get 4
      i64.load offset=16
      i64.store offset=32
      local.get 1
      local.get 4
      i32.const 32
      i32.add
      call 101
      local.get 5
      local.get 2
      call 102
      local.get 0
      i64.extend_i32_u
      call 100
    end
    local.get 4
    i32.const 48
    i32.add
    global.set 0)
  (func (;93;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 0
    i32.load8_u offset=4
    local.set 3
    local.get 0
    i32.const 0
    i32.store8 offset=4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 1
          i32.and
          local.tee 3
          if  ;; label = @4
            local.get 1
            call 10
            local.tee 5
            i32.const 10000
            i32.const 1049316
            i32.load
            local.tee 4
            i32.sub
            i32.gt_u
            br_if 2 (;@2;)
            local.get 2
            i32.const 8
            i32.add
            local.get 4
            local.get 4
            local.get 5
            i32.add
            local.tee 4
            call 128
            local.get 1
            i32.const 0
            local.get 2
            i32.load offset=8
            local.get 2
            i32.load offset=12
            call 64
            drop
            i32.const 1049316
            local.get 4
            i32.store
            br 1 (;@3;)
          end
          local.get 0
          i32.load
          local.get 1
          call 65
        end
        local.get 0
        local.get 3
        i32.store8 offset=4
        br 1 (;@1;)
      end
      local.get 0
      call 70
      local.get 0
      i32.load
      local.get 1
      call 65
      local.get 0
      i32.load8_u offset=4
      local.get 0
      local.get 3
      i32.store8 offset=4
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1049316
      i32.const 0
      i32.store
      i32.const 1059320
      i32.const 0
      i32.store8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;94;) (type 19) (param i64 i32 i32 i32)
    local.get 1
    local.get 3
    call 127
    local.get 0
    local.get 3
    call 123
    local.get 2
    local.get 3
    call 95)
  (func (;95;) (type 1) (param i32 i32)
    (local i32)
    call 37
    local.tee 2
    local.get 0
    call 24
    drop
    local.get 2
    local.get 1
    call 122)
  (func (;96;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      call 114
      local.set 2
      global.get 0
      i32.const 32
      i32.sub
      local.tee 1
      global.set 0
      local.get 2
      i32.const -25
      call 20
      drop
      block  ;; label = @2
        block  ;; label = @3
          i32.const -25
          call 10
          i32.eqz
          if  ;; label = @4
            i32.const 0
            local.set 2
            br 1 (;@3;)
          end
          local.get 1
          i32.const 8
          i32.add
          local.tee 3
          local.get 2
          call 76
          local.get 3
          call 77
          local.set 2
          local.get 3
          call 77
          local.set 3
          local.get 1
          i32.const 8
          i32.add
          call 77
          local.set 4
          local.get 1
          i32.const 8
          i32.add
          call 77
          local.set 5
          local.get 1
          i32.load offset=24
          local.get 1
          i32.load offset=20
          i32.ne
          br_if 1 (;@2;)
          local.get 1
          i32.load8_u offset=16
          i32.eqz
          br_if 0 (;@3;)
          i32.const 1049316
          i32.const 0
          i32.store
          i32.const 1059320
          i32.const 0
          i32.store8
        end
        local.get 0
        local.get 5
        i32.store offset=12
        local.get 0
        local.get 4
        i32.store offset=8
        local.get 0
        local.get 3
        i32.store offset=4
        local.get 0
        local.get 2
        i32.store
        local.get 1
        i32.const 32
        i32.add
        global.set 0
        br 1 (;@1;)
      end
      i32.const 1048576
      i32.const 14
      call 60
      unreachable
    end)
  (func (;97;) (type 5) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 8
    i32.add
    local.set 5
    local.get 1
    i32.const 1048796
    i32.const 11
    local.get 2
    call 99
    local.set 2
    global.get 0
    i32.const 32
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 8
    i32.add
    local.tee 4
    local.get 2
    call 76
    local.get 4
    call 77
    local.set 2
    local.get 4
    call 77
    local.set 4
    block  ;; label = @1
      local.get 1
      i32.load offset=24
      local.get 1
      i32.load offset=20
      i32.eq
      if  ;; label = @2
        local.get 1
        i32.load8_u offset=16
        if  ;; label = @3
          i32.const 1049316
          i32.const 0
          i32.store
          i32.const 1059320
          i32.const 0
          i32.store8
        end
        local.get 5
        local.get 4
        i32.store offset=4
        local.get 5
        local.get 2
        i32.store
        local.get 1
        i32.const 32
        i32.add
        global.set 0
        br 1 (;@1;)
      end
      i32.const 1048576
      i32.const 14
      call 60
      unreachable
    end
    local.get 3
    i32.load offset=12
    local.set 1
    local.get 0
    local.get 3
    i32.load offset=8
    i32.store
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 3
    i32.const 16
    i32.add
    global.set 0)
  (func (;98;) (type 9) (param i32 i32 i32 i32)
    local.get 0
    i32.const 1048796
    i32.const 11
    local.get 1
    call 99
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    call 79
    local.get 0
    local.get 0
    i32.load8_u offset=4
    i32.store8 offset=12
    local.get 0
    local.get 0
    i32.load
    i32.store offset=8
    local.get 2
    local.get 0
    i32.const 8
    i32.add
    local.tee 2
    call 80
    local.get 3
    local.get 2
    call 80
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load8_u offset=12
    call 81
    local.get 0
    i32.const 16
    i32.add
    global.set 0)
  (func (;99;) (type 8) (param i32 i32 i32 i32) (result i32)
    local.get 0
    call 40
    local.tee 0
    local.get 1
    local.get 2
    call 13
    drop
    local.get 3
    local.get 0
    call 113
    local.get 0)
  (func (;100;) (type 10) (param i32 i64)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i64.const 0
    i64.store offset=8
    local.get 2
    local.get 1
    i32.const 0
    local.get 2
    i32.const 8
    i32.add
    call 126
    local.get 0
    local.get 2
    i32.load
    local.get 2
    i32.load offset=4
    call 82
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;101;) (type 1) (param i32 i32)
    (local i32 i32)
    local.get 0
    call 114
    local.set 3
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    block  ;; label = @1
      local.get 1
      i32.load
      local.tee 2
      if  ;; label = @2
        local.get 0
        call 79
        local.get 0
        local.get 0
        i32.load8_u offset=4
        i32.store8 offset=12
        local.get 0
        local.get 0
        i32.load
        i32.store offset=8
        local.get 2
        local.get 0
        i32.const 8
        i32.add
        local.tee 2
        call 80
        local.get 1
        i32.load offset=4
        local.get 2
        call 80
        local.get 1
        i32.load offset=8
        local.get 2
        call 80
        local.get 1
        i32.load offset=12
        local.get 2
        call 80
        local.get 3
        local.get 0
        i32.load offset=8
        local.get 0
        i32.load8_u offset=12
        call 81
        br 1 (;@1;)
      end
      local.get 3
      i32.const 1049212
      i32.const 0
      call 82
    end
    local.get 0
    i32.const 16
    i32.add
    global.set 0)
  (func (;102;) (type 7) (param i32 i64) (result i32)
    local.get 0
    call 40
    local.tee 0
    i32.const 1048765
    i32.const 8
    call 13
    drop
    local.get 0
    local.get 1
    call 78
    local.get 0)
  (func (;103;) (type 12) (param i32 i32 i64)
    (local i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const -64
    i32.add
    local.tee 3
    global.set 0
    local.get 0
    local.get 1
    i32.load offset=4
    local.tee 8
    local.get 2
    call 104
    local.tee 7
    if (result i64)  ;; label = @1
      local.get 3
      i32.const 24
      i32.add
      local.get 1
      i32.const 8
      i32.add
      i32.load
      local.tee 4
      local.get 7
      call 97
      local.get 3
      i32.load offset=28
      local.set 5
      local.get 3
      i32.load offset=24
      local.set 6
      local.get 3
      i32.const 32
      i32.add
      local.get 4
      call 96
      block  ;; label = @2
        local.get 6
        if  ;; label = @3
          local.get 3
          i32.const 16
          i32.add
          local.get 4
          local.get 6
          call 97
          local.get 4
          local.get 6
          local.get 3
          i32.load offset=16
          local.get 5
          call 98
          br 1 (;@2;)
        end
        local.get 3
        local.get 5
        i32.store offset=36
      end
      block  ;; label = @2
        local.get 5
        if  ;; label = @3
          local.get 3
          i32.const 8
          i32.add
          local.get 4
          local.get 5
          call 97
          local.get 4
          local.get 5
          local.get 6
          local.get 3
          i32.load offset=12
          call 98
          br 1 (;@2;)
        end
        local.get 3
        local.get 6
        i32.store offset=40
      end
      local.get 4
      i32.const 1048796
      i32.const 11
      local.get 7
      call 99
      call 83
      local.get 4
      local.get 7
      call 105
      drop
      local.get 4
      i32.const 1048807
      i32.const 6
      local.get 7
      call 99
      call 83
      local.get 3
      local.get 3
      i32.load offset=32
      i32.const 1
      i32.sub
      i32.store offset=32
      local.get 3
      i32.const 56
      i32.add
      local.get 3
      i32.const 40
      i32.add
      i64.load
      i64.store
      local.get 3
      local.get 3
      i64.load offset=32
      i64.store offset=48
      local.get 4
      local.get 3
      i32.const 48
      i32.add
      call 101
      local.get 8
      local.get 2
      call 102
      call 83
      local.get 0
      i32.const 8
      i32.add
      local.get 1
      local.get 2
      call 87
      local.get 1
      local.get 2
      call 86
      call 85
      i64.const 1
    else
      i64.const 0
    end
    i64.store
    local.get 3
    i32.const -64
    i32.sub
    global.set 0)
  (func (;104;) (type 7) (param i32 i64) (result i32)
    local.get 0
    local.get 1
    call 102
    call 72)
  (func (;105;) (type 11) (param i32 i32) (result i64)
    local.get 0
    i32.const 1048807
    i32.const 6
    local.get 1
    call 99
    call 73)
  (func (;106;) (type 2) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 107
    call 72)
  (func (;107;) (type 2) (param i32 i32) (result i32)
    local.get 0
    call 40
    local.tee 0
    i32.const 1048765
    i32.const 8
    call 13
    drop
    local.get 0
    local.get 1
    call 65
    local.get 0)
  (func (;108;) (type 2) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 106
    i32.const 0
    i32.ne)
  (func (;109;) (type 1) (param i32 i32)
    local.get 0
    local.get 1
    i64.extend_i32_u
    call 100)
  (func (;110;) (type 11) (param i32 i32) (result i64)
    local.get 0
    local.get 1
    call 111
    call 73)
  (func (;111;) (type 2) (param i32 i32) (result i32)
    local.get 0
    call 40
    local.tee 0
    i32.const 1048791
    i32.const 5
    call 13
    drop
    local.get 1
    local.get 0
    call 113
    local.get 0)
  (func (;112;) (type 20) (param i32 i32 i32) (result i64)
    local.get 1
    call 72
    local.get 2
    i32.ge_u
    if  ;; label = @1
      local.get 0
      local.get 2
      call 110
      return
    end
    i32.const 1048773
    i32.const 18
    call 2
    unreachable)
  (func (;113;) (type 1) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.const 8
    i32.shl
    i32.const 16711680
    i32.and
    local.get 0
    i32.const 24
    i32.shl
    i32.or
    local.get 0
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 0
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store offset=12
    local.get 1
    local.get 2
    i32.const 12
    i32.add
    i32.const 4
    call 61
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;114;) (type 4) (param i32) (result i32)
    local.get 0
    call 40
    local.tee 0
    i32.const 1048813
    i32.const 5
    call 13
    drop
    local.get 0)
  (func (;115;) (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.const 1048807
    i32.const 6
    local.get 1
    call 99
    call 74)
  (func (;116;) (type 4) (param i32) (result i32)
    (local i64)
    block (result i32)  ;; label = @1
      block  ;; label = @2
        local.get 0
        call 73
        local.tee 1
        i64.const 1
        i64.le_u
        if  ;; label = @3
          i32.const 0
          local.get 1
          i32.wrap_i64
          i32.const 1
          i32.sub
          br_if 2 (;@1;)
          drop
          br 1 (;@2;)
        end
        i32.const 1048824
        i32.const 18
        call 60
        unreachable
      end
      i32.const 1
    end)
  (func (;117;) (type 7) (param i32 i64) (result i32)
    local.get 0
    i32.load
    call 40
    local.tee 0
    i32.const 1048818
    i32.const 6
    call 13
    drop
    local.get 0
    local.get 1
    call 78
    local.get 0)
  (func (;118;) (type 10) (param i32 i64)
    (local i32 i32)
    local.get 0
    local.get 1
    call 119
    i32.eqz
    if  ;; label = @1
      local.get 0
      i32.const 8
      i32.add
      i32.load
      local.tee 3
      call 72
      local.set 2
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.get 2
      i32.const 1
      i32.add
      local.tee 2
      call 111
      local.get 1
      call 100
      local.get 3
      local.get 2
      call 109
      local.get 0
      local.get 1
      local.get 3
      call 72
      call 120
    end)
  (func (;119;) (type 7) (param i32 i64) (result i32)
    local.get 0
    local.get 1
    call 117
    call 72)
  (func (;120;) (type 21) (param i32 i64 i32)
    local.get 0
    local.get 1
    call 117
    local.get 2
    i64.extend_i32_u
    call 100)
  (func (;121;) (type 1) (param i32 i32)
    local.get 0
    local.get 1
    call 69
    call 22
    drop)
  (func (;122;) (type 1) (param i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    call 10
    local.tee 3
    i32.const 24
    i32.shl
    local.get 3
    i32.const 8
    i32.shl
    i32.const 16711680
    i32.and
    i32.or
    local.get 3
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 3
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store offset=12
    local.get 1
    local.get 2
    i32.const 12
    i32.add
    i32.const 4
    call 124
    local.get 1
    local.get 0
    call 93
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;123;) (type 22) (param i64 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i64.const 40
    i64.shl
    i64.const 71776119061217280
    i64.and
    local.get 0
    i64.const 56
    i64.shl
    i64.or
    local.get 0
    i64.const 24
    i64.shl
    i64.const 280375465082880
    i64.and
    local.get 0
    i64.const 8
    i64.shl
    i64.const 1095216660480
    i64.and
    i64.or
    i64.or
    local.get 0
    i64.const 8
    i64.shr_u
    i64.const 4278190080
    i64.and
    local.get 0
    i64.const 24
    i64.shr_u
    i64.const 16711680
    i64.and
    i64.or
    local.get 0
    i64.const 40
    i64.shr_u
    i64.const 65280
    i64.and
    local.get 0
    i64.const 56
    i64.shr_u
    i64.or
    i64.or
    i64.or
    i64.store offset=8
    local.get 1
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    call 124
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;124;) (type 5) (param i32 i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u offset=4
        if  ;; label = @3
          i32.const 10000
          i32.const 1049316
          i32.load
          local.tee 4
          i32.sub
          local.get 2
          i32.lt_u
          br_if 1 (;@2;)
          local.get 3
          i32.const 8
          i32.add
          local.get 4
          local.get 2
          local.get 4
          i32.add
          local.tee 0
          call 128
          local.get 3
          i32.load offset=8
          local.get 3
          i32.load offset=12
          local.get 1
          local.get 2
          call 68
          i32.const 1049316
          local.get 0
          i32.store
          br 2 (;@1;)
        end
        local.get 0
        i32.load
        local.get 1
        local.get 2
        call 13
        drop
        br 1 (;@1;)
      end
      local.get 0
      call 70
      local.get 0
      i32.load
      local.get 1
      local.get 2
      call 13
      drop
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0)
  (func (;125;) (type 9) (param i32 i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    local.get 4
    i32.const 8
    i32.add
    i32.const 0
    local.get 3
    local.get 1
    local.get 2
    call 38
    local.get 4
    i32.load offset=12
    local.set 1
    local.get 0
    local.get 4
    i32.load offset=8
    i32.store
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 4
    i32.const 16
    i32.add
    global.set 0)
  (func (;126;) (type 23) (param i32 i64 i32 i32)
    (local i32 i32 i32 i32 i64)
    local.get 3
    local.get 1
    i64.const 40
    i64.shl
    i64.const 71776119061217280
    i64.and
    local.get 1
    i64.const 56
    i64.shl
    i64.or
    local.get 1
    i64.const 24
    i64.shl
    i64.const 280375465082880
    i64.and
    local.get 1
    i64.const 8
    i64.shl
    i64.const 1095216660480
    i64.and
    i64.or
    i64.or
    local.get 1
    i64.const 8
    i64.shr_u
    i64.const 4278190080
    i64.and
    local.get 1
    i64.const 24
    i64.shr_u
    i64.const 16711680
    i64.and
    i64.or
    local.get 1
    i64.const 40
    i64.shr_u
    i64.const 65280
    i64.and
    local.get 1
    i64.const 56
    i64.shr_u
    i64.or
    i64.or
    i64.or
    local.tee 8
    i64.store align=1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        block (result i32)  ;; label = @3
          local.get 1
          i64.eqz
          if  ;; label = @4
            i32.const 1049212
            local.set 3
            i32.const 0
            br 1 (;@3;)
          end
          local.get 2
          i32.const 0
          local.get 1
          i64.const -1
          i64.eq
          select
          i32.eqz
          if  ;; label = @4
            i32.const 0
            local.get 2
            local.get 8
            i64.const 128
            i64.and
            i64.const 7
            i64.shr_u
            i32.wrap_i64
            i32.and
            local.tee 5
            i32.sub
            i32.const 255
            i32.and
            local.set 6
            loop  ;; label = @5
              local.get 4
              i32.const 8
              i32.eq
              br_if 3 (;@2;)
              local.get 6
              local.get 3
              local.get 4
              i32.add
              i32.load8_u
              local.tee 7
              i32.ne
              if  ;; label = @6
                local.get 4
                local.get 2
                local.get 7
                i32.const 7
                i32.shr_u
                local.get 5
                i32.ne
                i32.and
                local.tee 2
                i32.sub
                i32.const 9
                i32.ge_u
                br_if 5 (;@1;)
                local.get 3
                i32.const 0
                local.get 2
                i32.sub
                local.tee 2
                i32.add
                local.get 4
                i32.add
                local.set 3
                i32.const 8
                local.get 2
                local.get 4
                i32.add
                i32.sub
                br 3 (;@3;)
              else
                local.get 4
                i32.const 1
                i32.add
                local.set 4
                br 1 (;@5;)
              end
              unreachable
            end
            unreachable
          end
          local.get 3
          i32.const 7
          i32.add
          local.set 3
          i32.const 1
        end
        i32.store offset=4
        local.get 0
        local.get 3
        i32.store
        return
      end
      call 155
      unreachable
    end
    call 157
    unreachable)
  (func (;127;) (type 1) (param i32 i32)
    local.get 0
    i32.const 2147483646
    i32.ne
    if  ;; label = @1
      local.get 0
      local.get 1
      call 122
      return
    end
    i32.const 4
    local.get 1
    call 80
    local.get 1
    i32.const 1048754
    i32.const 4
    call 124)
  (func (;128;) (type 5) (param i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 8
    i32.add
    local.get 1
    local.get 2
    i32.const 1049320
    i32.const 10000
    call 38
    local.get 3
    i32.load offset=12
    local.set 1
    local.get 0
    local.get 3
    i32.load offset=8
    i32.store
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 3
    i32.const 16
    i32.add
    global.set 0)
  (func (;129;) (type 2) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 63
    i32.const 255
    i32.and
    i32.const 2
    i32.lt_u)
  (func (;130;) (type 9) (param i32 i32 i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    local.get 4
    i32.const 8
    i32.add
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        local.get 3
        i32.le_u
        if  ;; label = @3
          local.get 3
          i32.const 48
          i32.gt_u
          br_if 1 (;@2;)
          local.get 5
          local.get 3
          local.get 2
          i32.sub
          i32.store offset=4
          local.get 5
          local.get 1
          local.get 2
          i32.add
          i32.store
          br 2 (;@1;)
        end
        call 39
        unreachable
      end
      call 39
      unreachable
    end
    local.get 4
    i32.load offset=12
    local.set 1
    local.get 0
    local.get 4
    i32.load offset=8
    i32.store
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 4
    i32.const 16
    i32.add
    global.set 0)
  (func (;131;) (type 9) (param i32 i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    local.get 4
    i32.const 8
    i32.add
    local.get 2
    local.get 3
    local.get 1
    i32.const 48
    call 38
    local.get 4
    i32.load offset=12
    local.set 1
    local.get 0
    local.get 4
    i32.load offset=8
    i32.store
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 4
    i32.const 16
    i32.add
    global.set 0)
  (func (;132;) (type 3) (param i32)
    (local i32 i32 i32)
    i32.const 1049119
    i32.const 19
    call 51
    local.tee 1
    call 40
    local.set 2
    local.get 1
    call 40
    local.tee 3
    i32.const 1048880
    i32.const 4
    call 13
    drop
    local.get 0
    i32.const 8
    i32.add
    local.get 3
    i32.store
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func (;133;) (type 6) (result i32)
    i32.const 1049138
    i32.const 19
    call 51)
  (func (;134;) (type 6) (result i32)
    i32.const 1049157
    i32.const 20
    call 51)
  (func (;135;) (type 3) (param i32)
    (local i32 i32)
    i32.const 1049177
    i32.const 22
    call 51
    local.tee 1
    call 40
    local.set 2
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func (;136;) (type 3) (param i32)
    (local i32 i32 i32)
    i32.const 1049199
    i32.const 6
    call 51
    local.tee 1
    call 40
    local.set 2
    local.get 1
    call 40
    local.set 3
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    i32.store
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func (;137;) (type 6) (result i32)
    i32.const 1049205
    i32.const 5
    call 51)
  (func (;138;) (type 1) (param i32 i32)
    local.get 0
    i64.load
    local.get 1
    call 123
    local.get 1
    local.get 0
    i32.load offset=24
    call 93
    local.get 0
    i32.load offset=28
    local.get 1
    call 127
    local.get 0
    i64.load offset=8
    local.get 1
    call 123
    local.get 0
    i32.load offset=32
    local.get 1
    call 95
    local.get 0
    i32.load offset=36
    local.get 1
    call 127
    local.get 0
    i64.load offset=16
    local.get 1
    call 123
    local.get 0
    i32.load offset=40
    local.get 1
    call 95
    local.get 0
    i32.load offset=44
    local.get 1
    call 95)
  (func (;139;) (type 0)
    call 28
    i32.const 0
    call 55)
  (func (;140;) (type 0)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64)
    global.get 0
    i32.const 176
    i32.sub
    local.tee 0
    global.set 0
    i32.const 2
    call 55
    i32.const 0
    call 15
    local.set 11
    i32.const 1
    call 50
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            call 137
            call 116
            i32.eqz
            if  ;; label = @5
              call 45
              local.get 0
              i32.const 72
              i32.add
              local.tee 3
              call 136
              local.get 0
              i32.const 8
              i32.add
              local.get 3
              local.get 11
              call 90
              local.get 0
              i32.const 56
              i32.add
              call 48
              local.get 0
              i64.load offset=8
              i64.const 1
              i64.ne
              br_if 1 (;@4;)
              local.get 0
              i32.const 48
              i32.add
              i32.load
              local.set 3
              local.get 0
              i32.const 40
              i32.add
              i32.load
              local.set 4
              local.get 0
              i32.const 32
              i32.add
              i64.load
              local.set 12
              local.get 0
              i32.const 28
              i32.add
              i32.load
              local.set 6
              local.get 0
              i32.const 24
              i32.add
              i32.load
              local.set 7
              local.get 0
              i32.const 52
              i32.add
              i32.load
              local.set 1
              local.get 0
              i64.load offset=16
              local.set 13
              local.get 0
              i32.const 44
              i32.add
              i32.load
              local.tee 10
              local.get 2
              call 66
              local.set 8
              local.get 1
              local.get 2
              call 129
              i32.eqz
              br_if 2 (;@3;)
              local.get 4
              local.get 0
              i32.load offset=64
              local.tee 5
              i32.ne
              if  ;; label = @6
                local.get 5
                i32.const 2147483646
                i32.eq
                local.get 4
                i32.const 2147483646
                i32.eq
                i32.or
                br_if 5 (;@1;)
                local.get 5
                local.get 4
                call 41
                i32.eqz
                br_if 5 (;@1;)
              end
              local.get 0
              i64.load offset=56
              local.get 12
              i64.ne
              br_if 4 (;@1;)
              local.get 0
              i32.load offset=68
              local.get 8
              call 62
              i32.eqz
              br_if 4 (;@1;)
              call 134
              local.tee 5
              i32.const -25
              call 20
              drop
              i32.const -25
              call 10
              if (result i32)  ;; label = @6
                local.get 5
                call 74
              else
                local.get 3
              end
              local.get 4
              local.get 12
              local.get 8
              call 43
              local.get 7
              local.get 13
              local.get 6
              local.get 2
              call 66
              call 43
              block  ;; label = @6
                local.get 1
                local.get 2
                call 62
                i32.eqz
                if  ;; label = @7
                  local.get 1
                  local.get 1
                  local.get 2
                  call 29
                  local.get 1
                  call 30
                  i32.const 0
                  i32.lt_s
                  br_if 5 (;@2;)
                  local.get 0
                  i32.const 120
                  i32.add
                  local.tee 2
                  call 136
                  local.get 0
                  i32.const 164
                  i32.add
                  local.get 10
                  i32.store
                  local.get 0
                  i32.const 160
                  i32.add
                  local.get 4
                  i32.store
                  local.get 0
                  local.get 1
                  i32.store offset=172
                  local.get 0
                  local.get 3
                  i32.store offset=168
                  local.get 0
                  local.get 12
                  i64.store offset=152
                  local.get 0
                  local.get 6
                  i32.store offset=148
                  local.get 0
                  local.get 7
                  i32.store offset=144
                  local.get 0
                  local.get 13
                  i64.store offset=136
                  local.get 0
                  i32.const 72
                  i32.add
                  local.get 2
                  local.get 11
                  local.get 0
                  i32.const 136
                  i32.add
                  call 92
                  br 1 (;@6;)
                end
                local.get 0
                i32.const 136
                i32.add
                local.tee 1
                call 136
                local.get 0
                i32.const 72
                i32.add
                local.tee 3
                local.get 1
                local.get 11
                call 103
                local.get 3
                call 132
                local.get 3
                local.get 11
                call 118
              end
              local.get 0
              i32.const 176
              i32.add
              global.set 0
              return
            end
            i32.const 1048884
            i32.const 18
            call 42
            unreachable
          end
          i32.const 1048902
          i32.const 15
          call 42
          unreachable
        end
        i32.const 1048917
        i32.const 19
        call 42
        unreachable
      end
      i32.const 1049248
      i32.const 48
      call 2
      unreachable
    end
    i32.const 1048936
    i32.const 19
    call 42
    unreachable)
  (func (;141;) (type 0)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64)
    global.get 0
    i32.const 144
    i32.sub
    local.tee 0
    global.set 0
    i32.const 1059324
    call 16
    i32.store
    i32.const 1059324
    i32.load
    i32.const 3
    i32.lt_s
    if  ;; label = @1
      i32.const 1048650
      i32.const 17
      call 2
      unreachable
    end
    call 53
    call 54
    local.set 7
    i32.const 1
    call 15
    local.set 12
    i32.const 2
    call 50
    local.set 8
    local.get 0
    i32.const 3
    i32.store offset=40
    local.get 0
    i32.const 16
    i32.add
    local.set 4
    block  ;; label = @1
      local.get 0
      i32.const 40
      i32.add
      local.tee 1
      i32.load
      local.tee 3
      i32.const 1059324
      i32.load
      i32.ge_s
      if  ;; label = @2
        i32.const 1
        local.set 2
        br 1 (;@1;)
      end
      local.get 1
      local.get 3
      i32.const 1
      i32.add
      i32.store
      local.get 3
      call 50
      local.set 1
    end
    local.get 4
    local.get 1
    i32.store offset=4
    local.get 4
    local.get 2
    i32.store
    local.get 0
    i32.load offset=20
    local.set 1
    local.get 0
    i32.load offset=16
    local.set 5
    i32.const 1059324
    i32.load
    local.get 0
    i32.load offset=40
    i32.gt_s
    if  ;; label = @1
      i32.const 1048667
      i32.const 18
      call 2
      unreachable
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            call 137
            call 116
            i32.eqz
            if  ;; label = @5
              call 45
              local.set 6
              call 46
              local.set 4
              local.get 0
              i32.const 8
              i32.add
              call 135
              local.get 0
              i32.load offset=8
              local.get 6
              call 108
              i32.eqz
              if  ;; label = @6
                local.get 6
                local.get 4
                call 41
                i32.eqz
                br_if 2 (;@4;)
              end
              local.get 0
              i32.const 24
              i32.add
              call 48
              local.get 0
              i32.load offset=36
              local.tee 2
              call 36
              local.set 3
              call 37
              local.tee 4
              i64.const 1
              call 0
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 5
                    i32.eqz
                    if  ;; label = @9
                      local.get 1
                      call 30
                      i32.const 0
                      i32.le_s
                      br_if 1 (;@8;)
                      local.get 2
                      local.get 1
                      call 129
                      i32.eqz
                      br_if 2 (;@7;)
                      call 37
                      local.tee 3
                      local.get 2
                      local.get 1
                      call 31
                      local.get 1
                      local.set 4
                    end
                    local.get 0
                    local.get 3
                    i32.store offset=36
                    local.get 0
                    i32.const 40
                    i32.add
                    call 132
                    local.get 0
                    i32.const 48
                    i32.add
                    local.tee 2
                    i32.load
                    call 72
                    i32.eqz
                    br_if 2 (;@6;)
                    local.get 0
                    i32.const 40
                    i32.add
                    local.tee 1
                    call 132
                    local.get 0
                    i32.load offset=44
                    local.get 2
                    i32.load
                    i32.const 1
                    call 112
                    local.set 10
                    local.get 1
                    call 132
                    local.get 1
                    local.get 10
                    call 119
                    local.tee 1
                    i32.eqz
                    br_if 6 (;@2;)
                    local.get 0
                    i32.const 48
                    i32.add
                    i32.load
                    local.tee 3
                    call 72
                    local.tee 2
                    local.get 1
                    i32.lt_u
                    br_if 7 (;@1;)
                    local.get 1
                    local.get 2
                    i32.eq
                    local.tee 5
                    br_if 5 (;@3;)
                    local.get 0
                    i32.load offset=44
                    local.tee 9
                    local.get 3
                    local.get 2
                    call 112
                    local.set 11
                    local.get 3
                    call 72
                    local.get 1
                    i32.lt_u
                    br_if 7 (;@1;)
                    local.get 9
                    local.get 1
                    call 111
                    local.get 11
                    call 100
                    br 5 (;@3;)
                  end
                  i32.const 1049034
                  i32.const 31
                  call 42
                  unreachable
                end
                i32.const 1049065
                i32.const 47
                call 42
                unreachable
              end
              call 133
              call 73
              local.set 10
              call 133
              local.get 10
              i64.const 1
              i64.add
              call 100
              br 3 (;@2;)
            end
            i32.const 1048884
            i32.const 18
            call 42
            unreachable
          end
          i32.const 1048995
          i32.const 39
          call 42
          unreachable
        end
        local.get 3
        call 72
        local.get 2
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=44
        local.get 2
        call 111
        call 85
        local.get 3
        local.get 2
        i32.const 1
        i32.sub
        call 109
        local.get 5
        i32.eqz
        if  ;; label = @3
          local.get 0
          i32.const 40
          i32.add
          local.get 11
          local.get 1
          call 120
        end
        local.get 0
        i32.const 40
        i32.add
        local.get 10
        call 117
        call 85
      end
      local.get 0
      i32.const 88
      i32.add
      local.tee 1
      call 136
      local.get 0
      i32.const 112
      i32.add
      local.get 0
      i32.const 32
      i32.add
      i64.load
      i64.store
      local.get 0
      i32.const 132
      i32.add
      local.get 8
      i32.store
      local.get 0
      i32.const 128
      i32.add
      local.get 7
      i32.store
      local.get 0
      local.get 0
      i64.load offset=24
      i64.store offset=104
      local.get 0
      local.get 4
      i32.store offset=140
      local.get 0
      local.get 6
      i32.store offset=136
      local.get 0
      local.get 12
      i64.store offset=120
      local.get 0
      i32.const 40
      i32.add
      local.get 1
      local.get 10
      local.get 0
      i32.const 104
      i32.add
      call 92
      local.get 10
      call 32
      local.get 0
      i32.const 144
      i32.add
      global.set 0
      return
    end
    i32.const 1048773
    i32.const 18
    call 2
    unreachable)
  (func (;142;) (type 0)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 0
    global.set 0
    call 28
    call 47
    i32.const 1
    call 55
    call 52
    local.set 4
    local.get 0
    i32.const 8
    i32.add
    call 135
    local.get 0
    i32.load offset=12
    local.set 1
    local.get 0
    i32.load offset=8
    local.tee 5
    local.get 4
    call 108
    i32.eqz
    if  ;; label = @1
      local.get 0
      i32.const 16
      i32.add
      local.get 1
      call 96
      local.get 0
      local.get 0
      i32.load offset=28
      i32.const 1
      i32.add
      local.tee 2
      i32.store offset=28
      block  ;; label = @2
        local.get 0
        i32.load offset=16
        local.tee 6
        i32.eqz
        if  ;; label = @3
          local.get 0
          local.get 2
          i32.store offset=20
          br 1 (;@2;)
        end
        local.get 0
        local.get 1
        local.get 0
        i32.load offset=24
        local.tee 3
        call 97
        local.get 1
        local.get 3
        local.get 0
        i32.load
        local.get 2
        call 98
      end
      local.get 1
      local.get 2
      local.get 3
      i32.const 0
      call 98
      local.get 0
      i32.const 24
      i32.add
      local.tee 3
      local.get 2
      i32.store
      local.get 1
      i32.const 1048807
      i32.const 6
      local.get 2
      call 99
      local.get 4
      call 84
      local.get 0
      local.get 6
      i32.const 1
      i32.add
      i32.store offset=16
      local.get 0
      i32.const 40
      i32.add
      local.get 3
      i64.load
      i64.store
      local.get 0
      local.get 0
      i64.load offset=16
      i64.store offset=32
      local.get 1
      local.get 0
      i32.const 32
      i32.add
      call 101
      local.get 5
      local.get 4
      call 107
      local.get 2
      i64.extend_i32_u
      call 100
    end
    local.get 0
    i32.const 48
    i32.add
    global.set 0)
  (func (;143;) (type 0)
    (local i32 i32 i32 i32 i32 i32 i32 i64 i64)
    global.get 0
    i32.const 128
    i32.sub
    local.tee 0
    global.set 0
    call 28
    i32.const 1
    call 55
    i32.const 0
    call 15
    local.set 7
    block  ;; label = @1
      block  ;; label = @2
        call 137
        call 116
        i32.eqz
        if  ;; label = @3
          local.get 0
          i32.const -64
          i32.sub
          local.tee 1
          call 136
          local.get 0
          i32.const 16
          i32.add
          local.get 1
          local.get 7
          call 90
          call 45
          local.set 1
          call 46
          local.set 3
          local.get 0
          i64.load offset=16
          i64.const 1
          i64.ne
          br_if 1 (;@2;)
          local.get 0
          i32.const 60
          i32.add
          i32.load
          local.set 4
          local.get 0
          i32.const 36
          i32.add
          i32.load
          local.set 2
          local.get 0
          i32.const 32
          i32.add
          i32.load
          local.set 5
          local.get 0
          i64.load offset=24
          local.set 8
          block  ;; label = @4
            local.get 1
            local.get 0
            i32.const 56
            i32.add
            i32.load
            local.tee 6
            call 41
            br_if 0 (;@4;)
            local.get 1
            local.get 3
            call 41
            br_if 0 (;@4;)
            local.get 0
            i32.const 8
            i32.add
            call 135
            local.get 0
            i32.load offset=8
            local.get 1
            call 108
            i32.eqz
            br_if 3 (;@1;)
          end
          local.get 2
          local.get 2
          local.get 4
          call 19
          local.get 6
          local.get 5
          local.get 8
          local.get 2
          call 43
          local.get 0
          i32.const 112
          i32.add
          local.tee 2
          call 136
          local.get 0
          i32.const -64
          i32.sub
          local.tee 1
          local.get 2
          local.get 7
          call 103
          local.get 1
          call 132
          local.get 1
          local.get 7
          call 118
          local.get 0
          i32.const 128
          i32.add
          global.set 0
          return
        end
        i32.const 1048884
        i32.const 18
        call 42
        unreachable
      end
      i32.const 1048902
      i32.const 15
      call 42
      unreachable
    end
    i32.const 1048955
    i32.const 40
    call 42
    unreachable)
  (func (;144;) (type 0)
    call 28
    i32.const 0
    call 55
    call 134
    call 74
    call 22
    drop)
  (func (;145;) (type 0)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 0
    global.set 0
    call 28
    i32.const 0
    call 55
    local.get 0
    call 136
    local.get 0
    i32.const 16
    i32.add
    local.get 0
    i32.const 8
    i32.add
    i32.load
    call 96
    local.get 0
    i64.load32_u offset=16
    call 32
    local.get 0
    i32.const 32
    i32.add
    global.set 0)
  (func (;146;) (type 0)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 0
    global.set 0
    call 28
    i32.const 0
    call 55
    local.get 0
    i32.const 8
    i32.add
    call 135
    local.get 0
    i32.const 16
    i32.add
    local.get 0
    i32.load offset=12
    local.tee 2
    call 96
    local.get 0
    i32.load offset=20
    local.set 1
    loop  ;; label = @1
      local.get 1
      if  ;; label = @2
        local.get 0
        local.get 2
        local.get 1
        call 97
        local.get 0
        i32.load offset=4
        local.get 2
        local.get 1
        call 115
        call 22
        drop
        local.set 1
        br 1 (;@1;)
      end
    end
    local.get 0
    i32.const 32
    i32.add
    global.set 0)
  (func (;147;) (type 0)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const -64
    i32.add
    local.tee 0
    global.set 0
    call 28
    call 47
    i32.const 1
    call 55
    call 52
    local.set 5
    local.get 0
    i32.const 24
    i32.add
    call 135
    local.get 0
    i32.load offset=28
    local.set 1
    local.get 0
    i32.load offset=24
    local.tee 6
    local.get 5
    call 106
    local.tee 4
    if  ;; label = @1
      local.get 0
      i32.const 16
      i32.add
      local.get 1
      local.get 4
      call 97
      local.get 0
      i32.load offset=20
      local.set 2
      local.get 0
      i32.load offset=16
      local.set 3
      local.get 0
      i32.const 32
      i32.add
      local.get 1
      call 96
      block  ;; label = @2
        local.get 3
        if  ;; label = @3
          local.get 0
          i32.const 8
          i32.add
          local.get 1
          local.get 3
          call 97
          local.get 1
          local.get 3
          local.get 0
          i32.load offset=8
          local.get 2
          call 98
          br 1 (;@2;)
        end
        local.get 0
        local.get 2
        i32.store offset=36
      end
      block  ;; label = @2
        local.get 2
        if  ;; label = @3
          local.get 0
          local.get 1
          local.get 2
          call 97
          local.get 1
          local.get 2
          local.get 3
          local.get 0
          i32.load offset=4
          call 98
          br 1 (;@2;)
        end
        local.get 0
        local.get 3
        i32.store offset=40
      end
      local.get 1
      i32.const 1048796
      i32.const 11
      local.get 4
      call 99
      call 83
      local.get 1
      local.get 4
      call 115
      drop
      local.get 1
      i32.const 1048807
      i32.const 6
      local.get 4
      call 99
      call 83
      local.get 0
      local.get 0
      i32.load offset=32
      i32.const 1
      i32.sub
      i32.store offset=32
      local.get 0
      i32.const 56
      i32.add
      local.get 0
      i32.const 40
      i32.add
      i64.load
      i64.store
      local.get 0
      local.get 0
      i64.load offset=32
      i64.store offset=48
      local.get 1
      local.get 0
      i32.const 48
      i32.add
      call 101
      local.get 6
      local.get 5
      call 107
      call 83
    end
    local.get 0
    i32.const -64
    i32.sub
    global.set 0)
  (func (;148;) (type 0)
    (local i32)
    call 28
    call 47
    i32.const 1
    call 55
    call 52
    local.set 0
    call 134
    local.get 0
    call 84)
  (func (;149;) (type 0)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    call 28
    call 47
    i32.const 0
    call 55
    call 137
    call 137
    call 116
    local.set 2
    local.get 0
    i64.const 0
    i64.store offset=8
    local.get 0
    local.get 2
    i32.const 1
    i32.xor
    i64.extend_i32_u
    i32.const 1
    local.get 0
    i32.const 8
    i32.add
    call 126
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call 82
    local.get 0
    i32.const 16
    i32.add
    global.set 0)
  (func (;150;) (type 0)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    call 28
    i32.const 0
    call 55
    local.get 0
    call 132
    local.get 0
    i32.const 8
    i32.add
    i32.load
    call 72
    local.set 2
    local.get 0
    i32.load offset=4
    local.set 3
    i32.const 1
    local.set 1
    loop  ;; label = @1
      local.get 1
      local.get 2
      i32.gt_u
      i32.eqz
      if  ;; label = @2
        local.get 3
        local.get 1
        call 110
        call 32
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        br 1 (;@1;)
      end
    end
    local.get 0
    i32.const 16
    i32.add
    global.set 0)
  (func (;151;) (type 0)
    call 28
    i32.const 0
    call 55
    call 133
    call 73
    call 32)
  (func (;152;) (type 0)
    call 28
    i32.const 0
    call 55
    call 137
    call 116
    i64.extend_i32_u
    call 33)
  (func (;153;) (type 0)
    (local i32 i32 i64)
    global.get 0
    i32.const 128
    i32.sub
    local.tee 0
    global.set 0
    call 28
    i32.const 1
    call 55
    i32.const 0
    call 15
    local.set 2
    local.get 0
    i32.const 16
    i32.add
    local.tee 1
    call 136
    local.get 0
    i32.const 72
    i32.add
    local.get 1
    local.get 2
    call 90
    block  ;; label = @1
      local.get 0
      i64.load offset=72
      i64.const 1
      i64.ne
      if  ;; label = @2
        i32.const 1049212
        i32.const 0
        call 34
        br 1 (;@1;)
      end
      local.get 0
      i32.const 32
      i32.add
      local.get 0
      i64.load offset=80
      i64.store
      local.get 0
      i32.const 68
      i32.add
      local.get 0
      i32.const 116
      i32.add
      i32.load
      i32.store
      local.get 0
      i32.const -64
      i32.sub
      local.get 0
      i32.const 108
      i32.add
      i32.load
      i32.store
      local.get 0
      i32.const 60
      i32.add
      local.get 0
      i32.const 104
      i32.add
      i32.load
      i32.store
      local.get 0
      i32.const 56
      i32.add
      local.get 0
      i32.const 92
      i32.add
      i32.load
      i32.store
      local.get 0
      i32.const 52
      i32.add
      local.get 0
      i32.const 88
      i32.add
      i32.load
      i32.store
      local.get 0
      i32.const 48
      i32.add
      local.get 0
      i32.const 112
      i32.add
      i32.load
      i32.store
      local.get 0
      i32.const 40
      i32.add
      local.get 0
      i32.const 96
      i32.add
      i64.load
      i64.store
      local.get 0
      local.get 2
      i64.store offset=24
      local.get 0
      i64.const 1
      i64.store offset=16
      local.get 0
      i32.const 8
      i32.add
      call 79
      local.get 0
      local.get 0
      i32.load8_u offset=12
      i32.store8 offset=76
      local.get 0
      local.get 0
      i32.load offset=8
      i32.store offset=72
      local.get 0
      i32.const 1
      i32.store8 offset=127
      local.get 0
      i32.const 72
      i32.add
      local.tee 1
      local.get 0
      i32.const 127
      i32.add
      i32.const 1
      call 124
      local.get 0
      i32.const 24
      i32.add
      local.get 1
      call 138
      local.get 0
      i32.load offset=72
      local.get 0
      i32.load8_u offset=76
      call 121
    end
    local.get 0
    i32.const 128
    i32.add
    global.set 0)
  (func (;154;) (type 0)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64)
    global.get 0
    i32.const 240
    i32.sub
    local.tee 0
    global.set 0
    call 28
    i32.const 2
    call 55
    i32.const 0
    call 15
    local.set 15
    i32.const 1
    call 15
    local.set 16
    call 44
    local.set 9
    local.get 0
    i32.const 160
    i32.add
    call 136
    local.get 0
    i32.const 184
    i32.add
    local.get 0
    i32.const 168
    i32.add
    i32.load
    call 96
    local.get 0
    i32.load offset=188
    local.set 1
    loop  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.const 152
            i32.add
            local.get 0
            i32.load offset=168
            local.tee 2
            local.get 1
            call 97
            local.get 0
            i32.load offset=156
            local.set 10
            local.get 0
            i32.const 184
            i32.add
            local.get 0
            i32.const 160
            i32.add
            local.get 2
            local.get 1
            call 105
            local.tee 11
            call 90
            local.get 0
            i64.load offset=184
            i64.eqz
            br_if 1 (;@3;)
            local.get 14
            local.get 15
            i64.lt_u
            br_if 2 (;@2;)
            local.get 14
            local.get 16
            i64.ge_u
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=228
            local.set 5
            local.get 0
            i32.load offset=224
            local.set 3
            local.get 0
            i32.load offset=220
            local.set 6
            local.get 0
            i32.load offset=216
            local.set 4
            local.get 0
            i64.load offset=208
            local.set 12
            local.get 0
            i32.load offset=204
            local.set 7
            local.get 0
            i32.load offset=200
            local.set 8
            local.get 0
            i64.load offset=192
            local.set 13
            local.get 0
            i32.const 184
            i32.add
            local.tee 1
            call 158
            local.get 0
            local.get 11
            i64.const 40
            i64.shl
            i64.const 71776119061217280
            i64.and
            local.get 11
            i64.const 56
            i64.shl
            i64.or
            local.get 11
            i64.const 24
            i64.shl
            i64.const 280375465082880
            i64.and
            local.get 11
            i64.const 8
            i64.shl
            i64.const 1095216660480
            i64.and
            i64.or
            i64.or
            local.get 11
            i64.const 8
            i64.shr_u
            i64.const 4278190080
            i64.and
            local.get 11
            i64.const 24
            i64.shr_u
            i64.const 16711680
            i64.and
            i64.or
            local.get 11
            i64.const 40
            i64.shr_u
            i64.const 65280
            i64.and
            local.get 11
            i64.const 56
            i64.shr_u
            i64.or
            i64.or
            i64.or
            i64.store offset=176
            local.get 0
            i32.const 144
            i32.add
            local.get 1
            i32.const 0
            i32.const 8
            call 131
            local.get 0
            i32.load offset=144
            local.get 0
            i32.load offset=148
            local.get 0
            i32.const 176
            i32.add
            local.tee 2
            i32.const 8
            call 68
            local.get 0
            local.get 3
            i32.const 8
            i32.shl
            i32.const 16711680
            i32.and
            local.get 3
            i32.const 24
            i32.shl
            i32.or
            local.get 3
            i32.const 8
            i32.shr_u
            i32.const 65280
            i32.and
            local.get 3
            i32.const 24
            i32.shr_u
            i32.or
            i32.or
            i32.store offset=176
            local.get 0
            i32.const 136
            i32.add
            local.get 1
            i32.const 8
            i32.const 12
            call 131
            local.get 0
            i32.load offset=136
            local.get 0
            i32.load offset=140
            local.get 2
            i32.const 4
            call 68
            local.get 0
            i32.const 0
            i32.store offset=236
            local.get 0
            local.get 8
            i32.const 8
            i32.shl
            i32.const 16711680
            i32.and
            local.get 8
            i32.const 24
            i32.shl
            i32.or
            local.get 8
            i32.const 8
            i32.shr_u
            i32.const 65280
            i32.and
            local.get 8
            i32.const 24
            i32.shr_u
            i32.or
            i32.or
            i32.store offset=176
            local.get 0
            i32.const 236
            i32.add
            local.tee 3
            i32.const 4
            local.get 2
            i32.const 4
            call 68
            local.get 0
            i32.const 128
            i32.add
            local.get 1
            i32.const 12
            i32.const 16
            call 131
            local.get 0
            i32.load offset=128
            local.get 0
            i32.load offset=132
            local.get 3
            i32.const 4
            call 68
            local.get 0
            local.get 13
            i64.const 40
            i64.shl
            i64.const 71776119061217280
            i64.and
            local.get 13
            i64.const 56
            i64.shl
            i64.or
            local.get 13
            i64.const 24
            i64.shl
            i64.const 280375465082880
            i64.and
            local.get 13
            i64.const 8
            i64.shl
            i64.const 1095216660480
            i64.and
            i64.or
            i64.or
            local.get 13
            i64.const 8
            i64.shr_u
            i64.const 4278190080
            i64.and
            local.get 13
            i64.const 24
            i64.shr_u
            i64.const 16711680
            i64.and
            i64.or
            local.get 13
            i64.const 40
            i64.shr_u
            i64.const 65280
            i64.and
            local.get 13
            i64.const 56
            i64.shr_u
            i64.or
            i64.or
            i64.or
            i64.store offset=176
            local.get 0
            i32.const 120
            i32.add
            local.get 1
            i32.const 16
            i32.const 24
            call 131
            local.get 0
            i32.load offset=120
            local.get 0
            i32.load offset=124
            local.get 2
            i32.const 8
            call 68
            local.get 0
            local.get 7
            i32.const 8
            i32.shl
            i32.const 16711680
            i32.and
            local.get 7
            i32.const 24
            i32.shl
            i32.or
            local.get 7
            i32.const 8
            i32.shr_u
            i32.const 65280
            i32.and
            local.get 7
            i32.const 24
            i32.shr_u
            i32.or
            i32.or
            i32.store offset=176
            local.get 0
            i32.const 112
            i32.add
            local.get 1
            i32.const 24
            i32.const 28
            call 131
            local.get 0
            i32.load offset=112
            local.get 0
            i32.load offset=116
            local.get 2
            i32.const 4
            call 68
            local.get 0
            i32.const 0
            i32.store offset=236
            local.get 0
            local.get 4
            i32.const 8
            i32.shl
            i32.const 16711680
            i32.and
            local.get 4
            i32.const 24
            i32.shl
            i32.or
            local.get 4
            i32.const 8
            i32.shr_u
            i32.const 65280
            i32.and
            local.get 4
            i32.const 24
            i32.shr_u
            i32.or
            i32.or
            i32.store offset=176
            local.get 3
            i32.const 4
            local.get 2
            i32.const 4
            call 68
            local.get 0
            i32.const 104
            i32.add
            local.get 1
            i32.const 28
            i32.const 32
            call 131
            local.get 0
            i32.load offset=104
            local.get 0
            i32.load offset=108
            local.get 3
            i32.const 4
            call 68
            local.get 0
            local.get 12
            i64.const 40
            i64.shl
            i64.const 71776119061217280
            i64.and
            local.get 12
            i64.const 56
            i64.shl
            i64.or
            local.get 12
            i64.const 24
            i64.shl
            i64.const 280375465082880
            i64.and
            local.get 12
            i64.const 8
            i64.shl
            i64.const 1095216660480
            i64.and
            i64.or
            i64.or
            local.get 12
            i64.const 8
            i64.shr_u
            i64.const 4278190080
            i64.and
            local.get 12
            i64.const 24
            i64.shr_u
            i64.const 16711680
            i64.and
            i64.or
            local.get 12
            i64.const 40
            i64.shr_u
            i64.const 65280
            i64.and
            local.get 12
            i64.const 56
            i64.shr_u
            i64.or
            i64.or
            i64.or
            i64.store offset=176
            local.get 0
            i32.const 96
            i32.add
            local.get 1
            i32.const 32
            i32.const 40
            call 131
            local.get 0
            i32.load offset=96
            local.get 0
            i32.load offset=100
            local.get 2
            i32.const 8
            call 68
            local.get 0
            local.get 6
            i32.const 8
            i32.shl
            i32.const 16711680
            i32.and
            local.get 6
            i32.const 24
            i32.shl
            i32.or
            local.get 6
            i32.const 8
            i32.shr_u
            i32.const 65280
            i32.and
            local.get 6
            i32.const 24
            i32.shr_u
            i32.or
            i32.or
            i32.store offset=176
            local.get 0
            i32.const 88
            i32.add
            local.get 1
            i32.const 40
            i32.const 44
            call 131
            local.get 0
            i32.load offset=88
            local.get 0
            i32.load offset=92
            local.get 2
            i32.const 4
            call 68
            local.get 0
            local.get 5
            i32.const 8
            i32.shl
            i32.const 16711680
            i32.and
            local.get 5
            i32.const 24
            i32.shl
            i32.or
            local.get 5
            i32.const 8
            i32.shr_u
            i32.const 65280
            i32.and
            local.get 5
            i32.const 24
            i32.shr_u
            i32.or
            i32.or
            i32.store offset=176
            local.get 0
            i32.const 80
            i32.add
            local.get 1
            i32.const 44
            i32.const 48
            call 131
            local.get 0
            i32.load offset=80
            local.get 0
            i32.load offset=84
            local.get 2
            i32.const 4
            call 68
            local.get 9
            local.get 1
            i32.const 48
            call 13
            drop
            br 2 (;@2;)
          end
          local.get 0
          i32.const 72
          i32.add
          call 79
          local.get 0
          local.get 0
          i32.load8_u offset=76
          i32.store8 offset=180
          local.get 0
          local.get 0
          i32.load offset=72
          i32.store offset=176
          local.get 9
          call 10
          local.set 8
          i32.const 0
          local.set 1
          loop  ;; label = @4
            local.get 8
            local.get 1
            i32.const 48
            i32.add
            local.tee 10
            i32.ge_u
            if  ;; label = @5
              local.get 0
              i32.const 184
              i32.add
              local.tee 2
              call 158
              local.get 9
              local.get 1
              local.get 2
              i32.const 48
              call 49
              drop
              local.get 0
              i64.const 0
              i64.store offset=160
              local.get 0
              i32.const -64
              i32.sub
              local.get 2
              i32.const 0
              i32.const 8
              call 130
              local.get 0
              i32.const 160
              i32.add
              local.tee 1
              i32.const 8
              local.get 0
              i32.load offset=64
              local.get 0
              i32.load offset=68
              call 68
              local.get 0
              i64.load offset=160
              local.set 11
              local.get 0
              i32.const 0
              i32.store offset=160
              local.get 0
              i32.const 56
              i32.add
              local.get 2
              i32.const 8
              i32.const 12
              call 130
              local.get 1
              i32.const 4
              local.get 0
              i32.load offset=56
              local.get 0
              i32.load offset=60
              call 68
              local.get 0
              i32.load offset=160
              local.set 5
              local.get 0
              i32.const 0
              i32.store offset=236
              local.get 0
              i32.const 48
              i32.add
              local.get 2
              i32.const 12
              i32.const 16
              call 130
              local.get 0
              i32.const 236
              i32.add
              local.tee 4
              i32.const 4
              local.get 0
              i32.load offset=48
              local.get 0
              i32.load offset=52
              call 68
              local.get 0
              i32.const 0
              i32.store offset=160
              local.get 1
              i32.const 4
              local.get 4
              i32.const 4
              call 68
              local.get 0
              i32.load offset=160
              local.set 3
              local.get 0
              i64.const 0
              i64.store offset=160
              local.get 0
              i32.const 40
              i32.add
              local.get 2
              i32.const 16
              i32.const 24
              call 130
              local.get 1
              i32.const 8
              local.get 0
              i32.load offset=40
              local.get 0
              i32.load offset=44
              call 68
              local.get 0
              i64.load offset=160
              local.set 12
              local.get 0
              i32.const 0
              i32.store offset=160
              local.get 0
              i32.const 32
              i32.add
              local.get 2
              i32.const 24
              i32.const 28
              call 130
              local.get 1
              i32.const 4
              local.get 0
              i32.load offset=32
              local.get 0
              i32.load offset=36
              call 68
              local.get 0
              i32.load offset=160
              local.set 6
              local.get 0
              i32.const 0
              i32.store offset=236
              local.get 0
              i32.const 24
              i32.add
              local.get 2
              i32.const 28
              i32.const 32
              call 130
              local.get 4
              i32.const 4
              local.get 0
              i32.load offset=24
              local.get 0
              i32.load offset=28
              call 68
              local.get 0
              i32.const 0
              i32.store offset=160
              local.get 1
              i32.const 4
              local.get 4
              i32.const 4
              call 68
              local.get 0
              i32.load offset=160
              local.set 4
              local.get 0
              i64.const 0
              i64.store offset=160
              local.get 0
              i32.const 16
              i32.add
              local.get 2
              i32.const 32
              i32.const 40
              call 130
              local.get 1
              i32.const 8
              local.get 0
              i32.load offset=16
              local.get 0
              i32.load offset=20
              call 68
              local.get 0
              i64.load offset=160
              local.set 13
              local.get 0
              i32.const 0
              i32.store offset=160
              local.get 0
              i32.const 8
              i32.add
              local.get 2
              i32.const 40
              i32.const 44
              call 130
              local.get 1
              i32.const 4
              local.get 0
              i32.load offset=8
              local.get 0
              i32.load offset=12
              call 68
              local.get 0
              i32.load offset=160
              local.set 7
              local.get 0
              i32.const 0
              i32.store offset=160
              local.get 0
              local.get 2
              i32.const 44
              i32.const 48
              call 130
              local.get 1
              i32.const 4
              local.get 0
              i32.load
              local.get 0
              i32.load offset=4
              call 68
              local.get 0
              i32.load offset=160
              local.set 1
              local.get 0
              local.get 7
              i32.const 8
              i32.shl
              i32.const 16711680
              i32.and
              local.get 7
              i32.const 24
              i32.shl
              i32.or
              local.get 7
              i32.const 8
              i32.shr_u
              i32.const 65280
              i32.and
              local.get 7
              i32.const 24
              i32.shr_u
              i32.or
              i32.or
              i32.store offset=224
              local.get 0
              local.get 4
              i32.const 8
              i32.shl
              i32.const 16711680
              i32.and
              local.get 4
              i32.const 24
              i32.shl
              i32.or
              local.get 4
              i32.const 8
              i32.shr_u
              i32.const 65280
              i32.and
              local.get 4
              i32.const 24
              i32.shr_u
              i32.or
              i32.or
              i32.store offset=220
              local.get 0
              local.get 6
              i32.const 8
              i32.shl
              i32.const 16711680
              i32.and
              local.get 6
              i32.const 24
              i32.shl
              i32.or
              local.get 6
              i32.const 8
              i32.shr_u
              i32.const 65280
              i32.and
              local.get 6
              i32.const 24
              i32.shr_u
              i32.or
              i32.or
              i32.store offset=216
              local.get 0
              local.get 3
              i32.const 8
              i32.shl
              i32.const 16711680
              i32.and
              local.get 3
              i32.const 24
              i32.shl
              i32.or
              local.get 3
              i32.const 8
              i32.shr_u
              i32.const 65280
              i32.and
              local.get 3
              i32.const 24
              i32.shr_u
              i32.or
              i32.or
              i32.store offset=212
              local.get 0
              local.get 5
              i32.const 8
              i32.shl
              i32.const 16711680
              i32.and
              local.get 5
              i32.const 24
              i32.shl
              i32.or
              local.get 5
              i32.const 8
              i32.shr_u
              i32.const 65280
              i32.and
              local.get 5
              i32.const 24
              i32.shr_u
              i32.or
              i32.or
              i32.store offset=208
              local.get 0
              local.get 13
              i64.const 40
              i64.shl
              i64.const 71776119061217280
              i64.and
              local.get 13
              i64.const 56
              i64.shl
              i64.or
              local.get 13
              i64.const 24
              i64.shl
              i64.const 280375465082880
              i64.and
              local.get 13
              i64.const 8
              i64.shl
              i64.const 1095216660480
              i64.and
              i64.or
              i64.or
              local.get 13
              i64.const 8
              i64.shr_u
              i64.const 4278190080
              i64.and
              local.get 13
              i64.const 24
              i64.shr_u
              i64.const 16711680
              i64.and
              i64.or
              local.get 13
              i64.const 40
              i64.shr_u
              i64.const 65280
              i64.and
              local.get 13
              i64.const 56
              i64.shr_u
              i64.or
              i64.or
              i64.or
              i64.store offset=200
              local.get 0
              local.get 12
              i64.const 40
              i64.shl
              i64.const 71776119061217280
              i64.and
              local.get 12
              i64.const 56
              i64.shl
              i64.or
              local.get 12
              i64.const 24
              i64.shl
              i64.const 280375465082880
              i64.and
              local.get 12
              i64.const 8
              i64.shl
              i64.const 1095216660480
              i64.and
              i64.or
              i64.or
              local.get 12
              i64.const 8
              i64.shr_u
              i64.const 4278190080
              i64.and
              local.get 12
              i64.const 24
              i64.shr_u
              i64.const 16711680
              i64.and
              i64.or
              local.get 12
              i64.const 40
              i64.shr_u
              i64.const 65280
              i64.and
              local.get 12
              i64.const 56
              i64.shr_u
              i64.or
              i64.or
              i64.or
              i64.store offset=192
              local.get 0
              local.get 11
              i64.const 40
              i64.shl
              i64.const 71776119061217280
              i64.and
              local.get 11
              i64.const 56
              i64.shl
              i64.or
              local.get 11
              i64.const 24
              i64.shl
              i64.const 280375465082880
              i64.and
              local.get 11
              i64.const 8
              i64.shl
              i64.const 1095216660480
              i64.and
              i64.or
              i64.or
              local.get 11
              i64.const 8
              i64.shr_u
              i64.const 4278190080
              i64.and
              local.get 11
              i64.const 24
              i64.shr_u
              i64.const 16711680
              i64.and
              i64.or
              local.get 11
              i64.const 40
              i64.shr_u
              i64.const 65280
              i64.and
              local.get 11
              i64.const 56
              i64.shr_u
              i64.or
              i64.or
              i64.or
              i64.store offset=184
              local.get 0
              local.get 1
              i32.const 8
              i32.shl
              i32.const 16711680
              i32.and
              local.get 1
              i32.const 24
              i32.shl
              i32.or
              local.get 1
              i32.const 8
              i32.shr_u
              i32.const 65280
              i32.and
              local.get 1
              i32.const 24
              i32.shr_u
              i32.or
              i32.or
              i32.store offset=228
              local.get 2
              local.get 0
              i32.const 176
              i32.add
              call 138
              local.get 10
              local.set 1
              br 1 (;@4;)
            end
          end
          local.get 0
          i32.load offset=176
          local.get 0
          i32.load8_u offset=180
          call 121
          local.get 0
          i32.const 240
          i32.add
          global.set 0
          return
        end
        call 155
        unreachable
      end
      local.get 14
      i64.const 1
      i64.add
      local.set 14
      local.get 10
      local.set 1
      br 0 (;@1;)
    end
    unreachable)
  (func (;155;) (type 0)
    call 157
    unreachable)
  (func (;156;) (type 0)
    nop)
  (func (;157;) (type 0)
    i32.const 1049296
    i32.const 14
    call 2
    unreachable)
  (func (;158;) (type 3) (param i32)
    (local i32 i32 i32)
    local.get 0
    i32.const 0
    local.get 0
    i32.sub
    i32.const 3
    i32.and
    local.tee 2
    i32.add
    local.set 1
    local.get 2
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.const 0
        i32.store8
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        local.get 1
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const 48
    local.get 2
    i32.sub
    local.tee 2
    i32.const -4
    i32.and
    local.tee 3
    i32.add
    local.set 0
    local.get 3
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.const 0
        i32.store
        local.get 1
        i32.const 4
        i32.add
        local.tee 1
        local.get 0
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 2
    i32.const 3
    i32.and
    local.tee 1
    if  ;; label = @1
      local.get 0
      local.get 1
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 0
        i32.const 0
        i32.store8
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        local.get 1
        i32.lt_u
        br_if 0 (;@2;)
      end
    end)
  (memory (;0;) 17)
  (global (;0;) (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1059333))
  (global (;2;) i32 (i32.const 1059344))
  (export "memory" (memory 0))
  (export "init" (func 139))
  (export "acceptOffer" (func 140))
  (export "addOffer" (func 141))
  (export "addToWhitelist" (func 142))
  (export "cancelOffer" (func 143))
  (export "getUniqueFundReceiver" (func 144))
  (export "numberOfOffers" (func 145))
  (export "offerAddingWhitelist" (func 146))
  (export "removeFromWhitelist" (func 147))
  (export "setFundReceiver" (func 148))
  (export "togglePause" (func 149))
  (export "viewEmptyOfferIndexes" (func 150))
  (export "viewHighestOfferIndex" (func 151))
  (export "viewIsPaused" (func 152))
  (export "viewOffer" (func 153))
  (export "viewOffers" (func 154))
  (export "callBack" (func 156))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (data (;0;) (i32.const 1048576) "input too longincorrect number of ESDT transfersargument decode error (): too few argumentstoo many argumentswrong number of argumentsinput too shortManagedVec index out of rangeEGLD.mapped.node_idindex out of range.item.node_links.value.info.indexinput out of rangestorage decode error: bad array length.lenContract is pausedOffer not foundNot enough quantityWrong token paymentOnly special addresses can cancel offersNot whitelisted to add offers to marketQuantity must be greater than 0Quantity must be less than offered token amountaddressempty_offer_indexeshighest_offer_indexunique_fund_receiveroffer_adding_whitelistofferspause\00\00Endpoint can only be called by ownercannot subtract because result would be negativepanic occurred")
  (data (;1;) (i32.const 1049312) "\9c\ff\ff\ff"))
