(module
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32)))
  (type (;5;) (func (param i32 i32 i32)))
  (type (;6;) (func (result i32)))
  (type (;7;) (func (param i32 i64) (result i32)))
  (type (;8;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32)))
  (type (;10;) (func (param i32 i64)))
  (type (;11;) (func (param i32 i32) (result i64)))
  (type (;12;) (func (param i32 i32 i64)))
  (type (;13;) (func (param i32 i32 i64 i32 i32) (result i32)))
  (type (;14;) (func (param i32) (result i64)))
  (type (;15;) (func (param i32 i32 i32) (result i32)))
  (type (;16;) (func (param i64)))
  (type (;17;) (func (param i32 i64 i32 i32)))
  (type (;18;) (func (param i32 i32 i64 i32)))
  (type (;19;) (func (param i32 i32 i32 i32 i32)))
  (type (;20;) (func (param i64) (result i32)))
  (type (;21;) (func (param i64 i32 i32 i32)))
  (type (;22;) (func (param i32 i32 i32) (result i64)))
  (type (;23;) (func (param i32 i64 i32)))
  (type (;24;) (func (param i64 i32)))
  (import "env" "bigIntSetInt64" (func (;0;) (type 10)))
  (import "env" "bigIntAdd" (func (;1;) (type 5)))
  (import "env" "signalError" (func (;2;) (type 0)))
  (import "env" "mBufferNew" (func (;3;) (type 6)))
  (import "env" "mBufferAppend" (func (;4;) (type 1)))
  (import "env" "mBufferEq" (func (;5;) (type 1)))
  (import "env" "managedTransferValueExecute" (func (;6;) (type 13)))
  (import "env" "managedCaller" (func (;7;) (type 4)))
  (import "env" "managedOwnerAddress" (func (;8;) (type 4)))
  (import "env" "managedGetMultiESDTCallValue" (func (;9;) (type 4)))
  (import "env" "mBufferGetLength" (func (;10;) (type 3)))
  (import "env" "bigIntGetCallValue" (func (;11;) (type 4)))
  (import "env" "bigIntGetUnsignedArgument" (func (;12;) (type 0)))
  (import "env" "mBufferGetArgument" (func (;13;) (type 1)))
  (import "env" "smallIntGetUnsignedArgument" (func (;14;) (type 14)))
  (import "env" "getNumArguments" (func (;15;) (type 6)))
  (import "env" "mBufferCopyByteSlice" (func (;16;) (type 8)))
  (import "env" "mBufferAppendBytes" (func (;17;) (type 15)))
  (import "env" "mBufferSetBytes" (func (;18;) (type 15)))
  (import "env" "bigIntTDiv" (func (;19;) (type 5)))
  (import "env" "bigIntMul" (func (;20;) (type 5)))
  (import "env" "mBufferFromBigIntUnsigned" (func (;21;) (type 1)))
  (import "env" "mBufferToBigIntUnsigned" (func (;22;) (type 1)))
  (import "env" "mBufferStorageLoad" (func (;23;) (type 1)))
  (import "env" "mBufferStorageStore" (func (;24;) (type 1)))
  (import "env" "mBufferFinish" (func (;25;) (type 3)))
  (import "env" "managedSignalError" (func (;26;) (type 4)))
  (import "env" "bigIntCmp" (func (;27;) (type 1)))
  (import "env" "managedMultiTransferESDTNFTExecute" (func (;28;) (type 13)))
  (import "env" "checkNoPayment" (func (;29;) (type 2)))
  (import "env" "bigIntSign" (func (;30;) (type 3)))
  (import "env" "smallIntFinishUnsigned" (func (;31;) (type 16)))
  (import "env" "smallIntFinishSigned" (func (;32;) (type 16)))
  (import "env" "finish" (func (;33;) (type 0)))
  (import "env" "bigIntSub" (func (;34;) (type 5)))
  (import "env" "mBufferGetByteSlice" (func (;35;) (type 8)))
  (func (;36;) (type 3) (param i32) (result i32)
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
    i32.const 1049296
    i32.const 1049296
    i32.load
    i32.const 1
    i32.sub
    local.tee 0
    i32.store
    local.get 0)
  (func (;38;) (type 19) (param i32 i32 i32 i32 i32)
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
  (func (;39;) (type 2)
    call 165
    unreachable)
  (func (;40;) (type 20) (param i64) (result i32)
    (local i32)
    call 37
    local.tee 1
    local.get 0
    call 0
    local.get 1)
  (func (;41;) (type 3) (param i32) (result i32)
    (local i32)
    call 3
    local.tee 1
    local.get 0
    call 4
    drop
    local.get 1)
  (func (;42;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 5
    i32.const 0
    i32.gt_s)
  (func (;43;) (type 17) (param i32 i64 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i64 i64)
    local.get 2
    i32.const 24
    i32.add
    i32.load
    local.set 4
    local.get 2
    i32.const 28
    i32.add
    i32.load
    local.get 2
    i64.load offset=16
    local.set 11
    local.get 2
    i64.load
    local.set 12
    local.get 2
    i32.load offset=12
    local.set 6
    local.get 2
    i32.load offset=32
    local.set 7
    local.get 2
    i32.load offset=8
    local.set 8
    i64.const 10000
    call 40
    local.set 9
    call 37
    local.tee 10
    local.get 3
    local.get 9
    call 1
    local.get 10
    call 44
    i64.const 10000
    call 40
    call 45
    local.set 3
    local.get 0
    local.get 8
    i32.store offset=28
    local.get 0
    local.get 7
    i32.store offset=24
    local.get 0
    local.get 1
    i64.store
    local.get 0
    local.get 4
    i32.store offset=36
    local.get 0
    local.get 6
    i32.store offset=32
    local.get 0
    local.get 12
    i64.store offset=8
    local.get 0
    local.get 3
    i32.store offset=40
    local.get 0
    local.get 11
    i64.store offset=16
    local.get 0
    local.get 2
    i32.load offset=36
    i32.store offset=44)
  (func (;44;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 0
    local.get 1
    call 20
    local.get 0)
  (func (;45;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 0
    local.get 1
    call 19
    local.get 0)
  (func (;46;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    call 2
    unreachable)
  (func (;47;) (type 18) (param i32 i32 i64 i32)
    (local i32 i32 i32 i32)
    call 48
    local.set 5
    call 48
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
      call 48
      local.set 7
      local.get 1
      call 41
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
      call 17
      drop
      local.get 0
      local.get 7
      i64.const 0
      local.get 5
      local.get 6
      call 28
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
  (func (;48;) (type 6) (result i32)
    (local i32)
    call 37
    local.tee 0
    i32.const 1049196
    i32.const 0
    call 18
    drop
    local.get 0)
  (func (;49;) (type 6) (result i32)
    (local i32)
    call 37
    local.tee 0
    call 7
    local.get 0)
  (func (;50;) (type 6) (result i32)
    (local i32)
    call 37
    local.tee 0
    call 8
    local.get 0)
  (func (;51;) (type 2)
    call 50
    call 49
    call 42
    if  ;; label = @1
      return
    end
    i32.const 1049196
    i32.const 36
    call 2
    unreachable)
  (func (;52;) (type 4) (param i32)
    (local i32 i32 i32 i32 i64)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    i32.const -21
    local.set 1
    block  ;; label = @1
      i32.const 1059316
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
      i32.const 1059316
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
            i32.const 1048797
            i32.const 34
            call 2
            unreachable
          end
          i32.const -11
          local.set 1
          i32.const 2147483646
          local.set 3
          i32.const 1059312
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
          i32.const 1059312
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
        call 53
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
    i32.const 1048906
    i32.const 29
    call 2
    unreachable)
  (func (;53;) (type 8) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 3
    local.get 2
    call 35
    i32.const 0
    i32.ne)
  (func (;54;) (type 3) (param i32) (result i32)
    local.get 0
    call 37
    local.tee 0
    call 12
    local.get 0)
  (func (;55;) (type 6) (result i32)
    (local i32)
    i32.const 0
    call 37
    local.tee 0
    call 13
    drop
    local.get 0
    call 56)
  (func (;56;) (type 3) (param i32) (result i32)
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
      call 53
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
  (func (;57;) (type 4) (param i32)
    call 15
    local.get 0
    i32.eq
    if  ;; label = @1
      return
    end
    i32.const 1048866
    i32.const 25
    call 2
    unreachable)
  (func (;58;) (type 3) (param i32) (result i32)
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
    call 59
    local.get 0
    local.get 2
    i32.const 4
    call 60
    i32.wrap_i64
    call 61
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func (;59;) (type 5) (param i32 i32 i32)
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
            i32.const 1059304
            i32.load8_u
            local.get 4
            i32.const 10000
            i32.gt_u
            i32.or
            br_if 1 (;@3;)
            i32.const 1049300
            local.get 4
            i32.store
            i32.const 1059304
            i32.const 1
            i32.store8
            local.get 3
            i32.const 8
            i32.add
            local.get 4
            call 72
            local.get 6
            i32.const 0
            local.get 3
            i32.load offset=8
            local.get 3
            i32.load offset=12
            call 66
            drop
            local.get 0
            i32.const 1
            i32.store8 offset=8
          end
          local.get 2
          local.get 5
          i32.add
          local.tee 4
          i32.const 1049300
          i32.load
          i32.gt_u
          br_if 2 (;@1;)
          local.get 3
          local.get 5
          local.get 4
          call 76
          local.get 1
          local.get 2
          local.get 3
          i32.load
          local.get 3
          i32.load offset=4
          call 73
          br 1 (;@2;)
        end
        local.get 0
        i32.const 0
        i32.store8 offset=8
        local.get 6
        local.get 5
        local.get 1
        local.get 2
        call 66
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
    i32.const 1048891
    i32.const 15
    call 62
    unreachable)
  (func (;60;) (type 11) (param i32 i32) (result i64)
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
  (func (;61;) (type 1) (param i32 i32) (result i32)
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
    call 16
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
    i32.const 1048891
    i32.const 15
    call 62
    unreachable)
  (func (;62;) (type 0) (param i32 i32)
    (local i32)
    i32.const 1049023
    i32.const 22
    call 67
    local.tee 2
    local.get 0
    local.get 1
    call 17
    drop
    local.get 2
    call 26
    unreachable)
  (func (;63;) (type 5) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call 17
    drop)
  (func (;64;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 65
    i32.const 255
    i32.and
    i32.eqz)
  (func (;65;) (type 1) (param i32 i32) (result i32)
    i32.const -1
    local.get 0
    local.get 1
    call 27
    local.tee 0
    i32.const 0
    i32.ne
    local.get 0
    i32.const 0
    i32.lt_s
    select)
  (func (;66;) (type 8) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call 53)
  (func (;67;) (type 1) (param i32 i32) (result i32)
    (local i32)
    call 37
    local.tee 2
    local.get 0
    local.get 1
    call 18
    drop
    local.get 2)
  (func (;68;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    call 4
    drop)
  (func (;69;) (type 1) (param i32 i32) (result i32)
    (local i32)
    call 37
    local.tee 2
    local.get 0
    local.get 1
    call 20
    local.get 2)
  (func (;70;) (type 3) (param i32) (result i32)
    (local i32)
    call 37
    local.tee 1
    local.get 0
    call 21
    drop
    local.get 1)
  (func (;71;) (type 3) (param i32) (result i32)
    local.get 0
    call 37
    local.tee 0
    call 22
    drop
    local.get 0)
  (func (;72;) (type 0) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 8
    i32.add
    i32.const 1049304
    i32.const 10000
    local.get 1
    call 133
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
  (func (;73;) (type 9) (param i32 i32 i32 i32)
    local.get 1
    local.get 3
    i32.eq
    if  ;; label = @1
      local.get 0
      local.get 2
      local.get 1
      call 168
      return
    end
    call 165
    unreachable)
  (func (;74;) (type 1) (param i32 i32) (result i32)
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
    call 75
    local.get 2
    i32.load offset=8
    local.get 2
    i32.load8_u offset=12
    if  ;; label = @1
      i32.const 1049300
      i32.const 0
      i32.store
      i32.const 1059304
      i32.const 0
      i32.store8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;75;) (type 4) (param i32)
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
      i32.const 1049300
      i32.load
      call 76
      local.get 0
      i32.load
      local.get 1
      i32.load offset=8
      local.get 1
      i32.load offset=12
      call 17
      drop
      i32.const 1049300
      i32.const 0
      i32.store
      i32.const 1059304
      i32.const 0
      i32.store8
    end
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func (;76;) (type 5) (param i32 i32 i32)
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
    i32.const 1049304
    i32.add
    i32.store)
  (func (;77;) (type 0) (param i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 8
    i32.add
    local.tee 3
    local.get 1
    call 78
    local.get 3
    call 79
    local.set 1
    local.get 2
    i32.const 8
    i32.add
    call 79
    local.set 3
    local.get 2
    i32.load offset=24
    local.get 2
    i32.load offset=20
    i32.eq
    if  ;; label = @1
      local.get 2
      i32.load8_u offset=16
      if  ;; label = @2
        i32.const 1049300
        i32.const 0
        i32.store
        i32.const 1059304
        i32.const 0
        i32.store8
      end
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 0
      local.get 1
      i32.store
      local.get 2
      i32.const 32
      i32.add
      global.set 0
      return
    end
    i32.const 1048576
    i32.const 14
    call 62
    unreachable)
  (func (;78;) (type 0) (param i32 i32)
    (local i32)
    local.get 0
    local.get 1
    call 83
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
  (func (;79;) (type 3) (param i32) (result i32)
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
    call 59
    local.get 0
    i32.const 4
    call 60
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    i32.wrap_i64)
  (func (;80;) (type 3) (param i32) (result i32)
    (local i64)
    local.get 0
    call 81
    local.tee 1
    i64.const 4294967296
    i64.ge_u
    if  ;; label = @1
      i32.const 1048576
      i32.const 14
      call 62
      unreachable
    end
    local.get 1
    i32.wrap_i64)
  (func (;81;) (type 14) (param i32) (result i64)
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
    call 83
    local.tee 0
    call 10
    local.tee 2
    i32.const 9
    i32.ge_u
    if  ;; label = @1
      i32.const 1048576
      i32.const 14
      call 62
      unreachable
    end
    local.get 1
    local.get 1
    i32.const 8
    i32.add
    i32.const 8
    local.get 2
    call 133
    local.get 0
    i32.const 0
    local.get 1
    i32.load
    local.tee 0
    local.get 1
    i32.load offset=4
    local.tee 2
    call 53
    drop
    local.get 0
    local.get 2
    call 60
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func (;82;) (type 0) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 1
    i32.const -25
    call 23
    drop
    block  ;; label = @1
      block  ;; label = @2
        i32.const -25
        call 10
        i32.eqz
        if  ;; label = @3
          i32.const 0
          local.set 1
          br 1 (;@2;)
        end
        local.get 2
        i32.const 8
        i32.add
        local.tee 3
        local.get 1
        call 78
        local.get 3
        call 79
        local.set 1
        local.get 2
        i32.const 8
        i32.add
        call 79
        local.set 3
        local.get 2
        i32.const 8
        i32.add
        call 79
        local.set 4
        local.get 2
        i32.const 8
        i32.add
        call 79
        local.set 5
        local.get 2
        i32.load offset=24
        local.get 2
        i32.load offset=20
        i32.ne
        br_if 1 (;@1;)
        local.get 2
        i32.load8_u offset=16
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1049300
        i32.const 0
        i32.store
        i32.const 1059304
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
      local.get 1
      i32.store
      local.get 2
      i32.const 32
      i32.add
      global.set 0
      return
    end
    i32.const 1048576
    i32.const 14
    call 62
    unreachable)
  (func (;83;) (type 3) (param i32) (result i32)
    local.get 0
    call 37
    local.tee 0
    call 23
    drop
    local.get 0)
  (func (;84;) (type 10) (param i32 i64)
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
    call 63
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;85;) (type 4) (param i32)
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
      i32.const 1059304
      i32.load8_u
      i32.eqz
      if  ;; label = @2
        i32.const 1
        local.set 4
        i32.const 1059304
        i32.const 1
        i32.store8
        i32.const 1049300
        i32.const 0
        i32.store
        local.get 1
        i32.const 8
        i32.add
        i32.const 0
        call 72
        local.get 1
        i32.load offset=8
        local.get 1
        i32.load offset=12
        i32.const 1049196
        i32.const 0
        call 73
        call 48
        br 1 (;@1;)
      end
      i32.const 1049196
      i32.const 0
      call 67
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
  (func (;86;) (type 0) (param i32 i32)
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
    call 132
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;87;) (type 5) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call 74
    call 24
    drop)
  (func (;88;) (type 0) (param i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      local.get 1
      i32.load
      local.tee 3
      if  ;; label = @2
        local.get 2
        call 85
        local.get 2
        local.get 2
        i32.load8_u offset=4
        i32.store8 offset=12
        local.get 2
        local.get 2
        i32.load
        i32.store offset=8
        local.get 3
        local.get 2
        i32.const 8
        i32.add
        local.tee 3
        call 86
        local.get 1
        i32.load offset=4
        local.get 3
        call 86
        local.get 1
        i32.load offset=8
        local.get 3
        call 86
        local.get 1
        i32.load offset=12
        local.get 3
        call 86
        local.get 0
        local.get 2
        i32.load offset=8
        local.get 2
        i32.load8_u offset=12
        call 87
        br 1 (;@1;)
      end
      local.get 0
      i32.const 1049196
      i32.const 0
      call 89
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;89;) (type 5) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call 67
    call 24
    drop)
  (func (;90;) (type 4) (param i32)
    local.get 0
    i32.const 1049196
    i32.const 0
    call 89)
  (func (;91;) (type 4) (param i32)
    i32.const -20
    i32.const 0
    i32.const 0
    call 18
    drop
    local.get 0
    i32.const -20
    call 24
    drop)
  (func (;92;) (type 7) (param i32 i64) (result i32)
    local.get 0
    i32.load
    call 41
    local.tee 0
    i32.const 1048939
    i32.const 7
    call 17
    drop
    local.get 0
    local.get 1
    call 84
    local.get 0)
  (func (;93;) (type 12) (param i32 i32 i64)
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
    call 92
    call 78
    local.get 4
    i32.const 32
    call 61
    local.set 1
    local.get 3
    i32.const 32
    i32.add
    local.get 4
    call 94
    local.get 3
    i32.const 48
    i32.add
    local.tee 5
    local.get 4
    call 94
    local.get 4
    call 95
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
        i32.const 1049300
        i32.const 0
        i32.store
        i32.const 1059304
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
    call 62
    unreachable)
  (func (;94;) (type 0) (param i32 i32)
    (local i32 i32 i32 i64)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 1
    call 58
    call 56
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
    call 59
    local.get 4
    i32.const 8
    call 60
    local.set 5
    local.get 0
    local.get 1
    call 95
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
  (func (;95;) (type 3) (param i32) (result i32)
    local.get 0
    call 58
    call 71)
  (func (;96;) (type 12) (param i32 i32 i64)
    (local i64)
    local.get 0
    local.get 1
    i32.load offset=4
    local.get 2
    call 97
    if (result i64)  ;; label = @1
      local.get 0
      i32.const 8
      i32.add
      local.get 1
      local.get 2
      call 93
      i64.const 1
    else
      i64.const 0
    end
    i64.store)
  (func (;97;) (type 7) (param i32 i64) (result i32)
    local.get 0
    local.get 1
    call 110
    i32.const 0
    i32.ne)
  (func (;98;) (type 18) (param i32 i32 i64 i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 4
    global.set 0
    local.get 0
    local.get 1
    local.get 2
    call 96
    local.get 1
    local.get 2
    call 92
    local.get 4
    i32.const 8
    i32.add
    call 85
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
    call 99
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
    call 100
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
    call 100
    local.get 3
    i32.load offset=36
    local.get 5
    call 101
    local.get 4
    i32.load offset=32
    local.get 4
    i32.load8_u offset=36
    call 87
    local.get 1
    i32.load offset=4
    local.tee 5
    local.get 2
    call 97
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
      call 102
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
        call 103
        local.get 1
        local.get 3
        local.get 4
        i32.load
        local.get 0
        call 104
      end
      local.get 1
      local.get 0
      local.get 3
      i32.const 0
      call 104
      local.get 4
      i32.const 24
      i32.add
      local.tee 3
      local.get 0
      i32.store
      local.get 1
      i32.const 1048988
      i32.const 6
      local.get 0
      call 105
      local.get 2
      call 106
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
      call 107
      local.get 5
      local.get 2
      call 108
      local.get 0
      i64.extend_i32_u
      call 106
    end
    local.get 4
    i32.const 48
    i32.add
    global.set 0)
  (func (;99;) (type 0) (param i32 i32)
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
            i32.const 1049300
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
            call 137
            local.get 1
            i32.const 0
            local.get 2
            i32.load offset=8
            local.get 2
            i32.load offset=12
            call 66
            drop
            i32.const 1049300
            local.get 4
            i32.store
            br 1 (;@3;)
          end
          local.get 0
          i32.load
          local.get 1
          call 68
        end
        local.get 0
        local.get 3
        i32.store8 offset=4
        br 1 (;@1;)
      end
      local.get 0
      call 75
      local.get 0
      i32.load
      local.get 1
      call 68
      local.get 0
      i32.load8_u offset=4
      local.get 0
      local.get 3
      i32.store8 offset=4
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1049300
      i32.const 0
      i32.store
      i32.const 1059304
      i32.const 0
      i32.store8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;100;) (type 21) (param i64 i32 i32 i32)
    local.get 1
    local.get 3
    call 136
    local.get 0
    local.get 3
    call 131
    local.get 2
    local.get 3
    call 101)
  (func (;101;) (type 0) (param i32 i32)
    local.get 0
    call 70
    local.get 1
    call 130)
  (func (;102;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    call 116
    call 82)
  (func (;103;) (type 5) (param i32 i32 i32)
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
    i32.const 1048977
    i32.const 11
    local.get 2
    call 105
    call 77
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
  (func (;104;) (type 9) (param i32 i32 i32 i32)
    local.get 0
    i32.const 1048977
    i32.const 11
    local.get 1
    call 105
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    call 85
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
    call 86
    local.get 3
    local.get 2
    call 86
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load8_u offset=12
    call 87
    local.get 0
    i32.const 16
    i32.add
    global.set 0)
  (func (;105;) (type 8) (param i32 i32 i32 i32) (result i32)
    local.get 0
    call 41
    local.tee 0
    local.get 1
    local.get 2
    call 17
    drop
    local.get 3
    local.get 0
    call 121
    local.get 0)
  (func (;106;) (type 10) (param i32 i64)
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
    call 134
    local.get 0
    local.get 2
    i32.load
    local.get 2
    i32.load offset=4
    call 89
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;107;) (type 0) (param i32 i32)
    local.get 0
    call 116
    local.get 1
    call 88)
  (func (;108;) (type 7) (param i32 i64) (result i32)
    local.get 0
    call 41
    local.tee 0
    i32.const 1048946
    i32.const 8
    call 17
    drop
    local.get 0
    local.get 1
    call 84
    local.get 0)
  (func (;109;) (type 12) (param i32 i32 i64)
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
    call 110
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
      call 103
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
      call 102
      block  ;; label = @2
        local.get 6
        if  ;; label = @3
          local.get 3
          i32.const 16
          i32.add
          local.get 4
          local.get 6
          call 103
          local.get 4
          local.get 6
          local.get 3
          i32.load offset=16
          local.get 5
          call 104
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
          call 103
          local.get 4
          local.get 5
          local.get 6
          local.get 3
          i32.load offset=12
          call 104
          br 1 (;@2;)
        end
        local.get 3
        local.get 6
        i32.store offset=40
      end
      local.get 4
      i32.const 1048977
      i32.const 11
      local.get 7
      call 105
      call 90
      local.get 4
      local.get 7
      call 111
      drop
      local.get 4
      i32.const 1048988
      i32.const 6
      local.get 7
      call 105
      call 90
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
      call 107
      local.get 8
      local.get 2
      call 108
      call 90
      local.get 0
      i32.const 8
      i32.add
      local.get 1
      local.get 2
      call 93
      local.get 1
      local.get 2
      call 92
      call 91
      i64.const 1
    else
      i64.const 0
    end
    i64.store
    local.get 3
    i32.const -64
    i32.sub
    global.set 0)
  (func (;110;) (type 7) (param i32 i64) (result i32)
    local.get 0
    local.get 1
    call 108
    call 80)
  (func (;111;) (type 11) (param i32 i32) (result i64)
    local.get 0
    i32.const 1048988
    i32.const 6
    local.get 1
    call 105
    call 81)
  (func (;112;) (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 0
    call 41
    local.tee 0
    i32.const 1048946
    i32.const 8
    call 17
    drop
    block  ;; label = @1
      local.get 1
      i32.const 2147483646
      i32.ne
      if  ;; label = @2
        local.get 2
        local.get 1
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
        local.get 0
        local.get 2
        i32.const 12
        i32.add
        i32.const 4
        call 17
        drop
        local.get 0
        local.get 1
        call 4
        drop
        br 1 (;@1;)
      end
      i32.const 4
      local.get 0
      call 113
      local.get 0
      i32.const 1048935
      i32.const 4
      call 17
      drop
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func (;113;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    call 121)
  (func (;114;) (type 5) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 0
    local.get 2
    call 115
    i32.eqz
    if  ;; label = @1
      local.get 3
      i32.const 16
      i32.add
      local.get 1
      call 116
      call 82
      local.get 3
      local.get 3
      i32.load offset=28
      i32.const 1
      i32.add
      local.tee 4
      i32.store offset=28
      block  ;; label = @2
        local.get 3
        i32.load offset=16
        local.tee 6
        i32.eqz
        if  ;; label = @3
          local.get 3
          local.get 4
          i32.store offset=20
          br 1 (;@2;)
        end
        local.get 3
        i32.const 8
        i32.add
        local.get 1
        i32.const 1048977
        i32.const 11
        local.get 3
        i32.load offset=24
        local.tee 5
        call 105
        call 77
        local.get 1
        local.get 5
        local.get 3
        i32.load offset=8
        local.get 4
        call 104
      end
      local.get 1
      local.get 4
      local.get 5
      i32.const 0
      call 104
      local.get 3
      local.get 4
      i32.store offset=24
      local.get 1
      i32.const 1048988
      i32.const 6
      local.get 4
      call 105
      local.set 5
      block  ;; label = @2
        local.get 2
        i32.const 2147483646
        i32.ne
        if  ;; label = @3
          local.get 5
          local.get 2
          call 24
          drop
          br 1 (;@2;)
        end
        local.get 5
        i32.const 1048935
        i32.const 4
        call 89
      end
      local.get 3
      local.get 6
      i32.const 1
      i32.add
      i32.store offset=16
      local.get 3
      i32.const 40
      i32.add
      local.get 3
      i32.const 24
      i32.add
      i64.load
      i64.store
      local.get 3
      local.get 3
      i64.load offset=16
      i64.store offset=32
      local.get 1
      call 116
      local.get 3
      i32.const 32
      i32.add
      call 88
      local.get 0
      local.get 2
      call 112
      local.get 4
      i64.extend_i32_u
      call 106
    end
    local.get 3
    i32.const 48
    i32.add
    global.set 0)
  (func (;115;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 112
    call 80
    i32.const 0
    i32.ne)
  (func (;116;) (type 3) (param i32) (result i32)
    local.get 0
    call 41
    local.tee 0
    i32.const 1048994
    i32.const 5
    call 17
    drop
    local.get 0)
  (func (;117;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    i64.extend_i32_u
    call 106)
  (func (;118;) (type 11) (param i32 i32) (result i64)
    local.get 0
    local.get 1
    call 119
    call 81)
  (func (;119;) (type 1) (param i32 i32) (result i32)
    local.get 0
    call 41
    local.tee 0
    i32.const 1048972
    i32.const 5
    call 17
    drop
    local.get 1
    local.get 0
    call 113
    local.get 0)
  (func (;120;) (type 22) (param i32 i32 i32) (result i64)
    local.get 1
    call 80
    local.get 2
    i32.ge_u
    if  ;; label = @1
      local.get 0
      local.get 2
      call 118
      return
    end
    i32.const 1048954
    i32.const 18
    call 2
    unreachable)
  (func (;121;) (type 0) (param i32 i32)
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
    call 63
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;122;) (type 3) (param i32) (result i32)
    (local i64)
    block (result i32)  ;; label = @1
      block  ;; label = @2
        local.get 0
        call 81
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
        i32.const 1049005
        i32.const 18
        call 62
        unreachable
      end
      i32.const 1
    end)
  (func (;123;) (type 3) (param i32) (result i32)
    local.get 0
    call 83
    call 71)
  (func (;124;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    call 70
    call 24
    drop)
  (func (;125;) (type 7) (param i32 i64) (result i32)
    local.get 0
    i32.load
    call 41
    local.tee 0
    i32.const 1048999
    i32.const 6
    call 17
    drop
    local.get 0
    local.get 1
    call 84
    local.get 0)
  (func (;126;) (type 10) (param i32 i64)
    (local i32 i32)
    local.get 0
    local.get 1
    call 127
    i32.eqz
    if  ;; label = @1
      local.get 0
      i32.const 8
      i32.add
      i32.load
      local.tee 3
      call 80
      local.set 2
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.get 2
      i32.const 1
      i32.add
      local.tee 2
      call 119
      local.get 1
      call 106
      local.get 3
      local.get 2
      call 117
      local.get 0
      local.get 1
      local.get 3
      call 80
      call 128
    end)
  (func (;127;) (type 7) (param i32 i64) (result i32)
    local.get 0
    local.get 1
    call 125
    call 80)
  (func (;128;) (type 23) (param i32 i64 i32)
    local.get 0
    local.get 1
    call 125
    local.get 2
    i64.extend_i32_u
    call 106)
  (func (;129;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    call 74
    call 25
    drop)
  (func (;130;) (type 0) (param i32 i32)
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
    call 132
    local.get 1
    local.get 0
    call 99
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;131;) (type 24) (param i64 i32)
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
    call 132
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;132;) (type 5) (param i32 i32 i32)
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
          i32.const 1049300
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
          call 137
          local.get 3
          i32.load offset=8
          local.get 3
          i32.load offset=12
          local.get 1
          local.get 2
          call 73
          i32.const 1049300
          local.get 0
          i32.store
          br 2 (;@1;)
        end
        local.get 0
        i32.load
        local.get 1
        local.get 2
        call 17
        drop
        br 1 (;@1;)
      end
      local.get 0
      call 75
      local.get 0
      i32.load
      local.get 1
      local.get 2
      call 17
      drop
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0)
  (func (;133;) (type 9) (param i32 i32 i32 i32)
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
  (func (;134;) (type 17) (param i32 i64 i32 i32)
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
            i32.const 1049196
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
      call 165
      unreachable
    end
    call 167
    unreachable)
  (func (;135;) (type 0) (param i32 i32)
    (local i32)
    local.get 1
    call 41
    local.set 2
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func (;136;) (type 0) (param i32 i32)
    local.get 0
    i32.const 2147483646
    i32.ne
    if  ;; label = @1
      local.get 0
      local.get 1
      call 130
      return
    end
    i32.const 4
    local.get 1
    call 86
    local.get 1
    i32.const 1048935
    i32.const 4
    call 132)
  (func (;137;) (type 5) (param i32 i32 i32)
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
    i32.const 1049304
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
  (func (;138;) (type 4) (param i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 8
    i32.add
    i32.const 1049049
    i32.const 15
    call 67
    call 135
    local.get 1
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 1
    i32.load offset=8
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func (;139;) (type 4) (param i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 8
    i32.add
    i32.const 1049064
    i32.const 17
    call 67
    call 135
    local.get 1
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 1
    i32.load offset=8
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func (;140;) (type 4) (param i32)
    (local i32 i32 i32)
    i32.const 1049081
    i32.const 19
    call 67
    local.tee 1
    call 41
    local.set 2
    local.get 1
    call 41
    local.tee 3
    i32.const 1049045
    i32.const 4
    call 17
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
  (func (;141;) (type 6) (result i32)
    i32.const 1049100
    i32.const 19
    call 67)
  (func (;142;) (type 6) (result i32)
    i32.const 1049119
    i32.const 30
    call 67)
  (func (;143;) (type 6) (result i32)
    i32.const 1049149
    i32.const 33
    call 67)
  (func (;144;) (type 4) (param i32)
    (local i32 i32 i32)
    i32.const 1049182
    i32.const 6
    call 67
    local.tee 1
    call 41
    local.set 2
    local.get 1
    call 41
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
  (func (;145;) (type 6) (result i32)
    i32.const 1049188
    i32.const 5
    call 67)
  (func (;146;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 65
    i32.const 255
    i32.and
    i32.const 2
    i32.lt_u)
  (func (;147;) (type 9) (param i32 i32 i32 i32)
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
  (func (;148;) (type 9) (param i32 i32 i32 i32)
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
  (func (;149;) (type 0) (param i32 i32)
    local.get 0
    i64.load
    local.get 1
    call 131
    local.get 1
    local.get 0
    i32.load offset=24
    call 99
    local.get 0
    i32.load offset=28
    local.get 1
    call 136
    local.get 0
    i64.load offset=8
    local.get 1
    call 131
    local.get 0
    i32.load offset=32
    local.get 1
    call 101
    local.get 0
    i32.load offset=36
    local.get 1
    call 136
    local.get 0
    i64.load offset=16
    local.get 1
    call 131
    local.get 0
    i32.load offset=40
    local.get 1
    call 101
    local.get 0
    i32.load offset=44
    local.get 1
    call 101)
  (func (;150;) (type 2)
    call 29
    i32.const 0
    call 57)
  (func (;151;) (type 2)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64)
    global.get 0
    i32.const 176
    i32.sub
    local.tee 0
    global.set 0
    i32.const 2
    call 57
    i32.const 0
    call 14
    local.set 12
    i32.const 1
    call 54
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          call 145
          call 122
          i32.eqz
          if  ;; label = @4
            call 49
            local.get 0
            i32.const 72
            i32.add
            local.tee 2
            call 144
            local.get 0
            i32.const 8
            i32.add
            local.get 2
            local.get 12
            call 96
            local.get 0
            i32.const 56
            i32.add
            call 52
            local.get 0
            i64.load offset=8
            i64.const 1
            i64.ne
            br_if 1 (;@3;)
            local.get 0
            i32.const 48
            i32.add
            i32.load
            local.set 7
            local.get 0
            i32.const 40
            i32.add
            i32.load
            local.set 2
            local.get 0
            i32.const 32
            i32.add
            i64.load
            local.set 13
            local.get 0
            i32.const 28
            i32.add
            i32.load
            local.set 8
            local.get 0
            i32.const 24
            i32.add
            i32.load
            local.set 9
            local.get 0
            i32.const 52
            i32.add
            i32.load
            local.set 4
            local.get 0
            i32.const 44
            i32.add
            i32.load
            local.set 10
            local.get 0
            i64.load offset=16
            local.set 14
            call 143
            call 123
            local.set 3
            call 142
            call 123
            local.set 6
            local.get 10
            local.get 1
            call 69
            local.tee 5
            local.get 5
            local.get 5
            local.get 3
            call 69
            i64.const 10000
            call 40
            call 45
            call 1
            local.get 4
            local.get 1
            call 146
            i32.eqz
            br_if 2 (;@2;)
            local.get 2
            local.get 0
            i32.load offset=64
            local.tee 3
            i32.ne
            if  ;; label = @5
              local.get 3
              i32.const 2147483646
              i32.eq
              local.get 2
              i32.const 2147483646
              i32.eq
              i32.or
              br_if 4 (;@1;)
              local.get 3
              local.get 2
              call 42
              i32.eqz
              br_if 4 (;@1;)
            end
            local.get 0
            i64.load offset=56
            local.get 13
            i64.ne
            br_if 3 (;@1;)
            local.get 0
            i32.load offset=68
            local.get 5
            call 64
            i32.eqz
            br_if 3 (;@1;)
            local.get 5
            local.get 6
            call 69
            local.tee 3
            local.get 3
            i64.const 10000
            call 40
            call 19
            call 37
            local.tee 6
            local.get 5
            local.get 3
            call 152
            local.get 7
            local.get 2
            local.get 13
            local.get 6
            call 47
            local.get 9
            local.get 14
            local.get 8
            local.get 1
            call 69
            call 47
            block  ;; label = @5
              local.get 4
              local.get 1
              call 64
              i32.eqz
              if  ;; label = @6
                local.get 4
                local.get 4
                local.get 1
                call 152
                local.get 0
                i32.const 120
                i32.add
                local.tee 1
                call 144
                local.get 0
                i32.const 164
                i32.add
                local.get 10
                i32.store
                local.get 0
                i32.const 160
                i32.add
                local.get 2
                i32.store
                local.get 0
                local.get 4
                i32.store offset=172
                local.get 0
                local.get 7
                i32.store offset=168
                local.get 0
                local.get 13
                i64.store offset=152
                local.get 0
                local.get 8
                i32.store offset=148
                local.get 0
                local.get 9
                i32.store offset=144
                local.get 0
                local.get 14
                i64.store offset=136
                local.get 0
                i32.const 72
                i32.add
                local.get 1
                local.get 12
                local.get 0
                i32.const 136
                i32.add
                call 98
                br 1 (;@5;)
              end
              local.get 0
              i32.const 136
              i32.add
              local.tee 2
              call 144
              local.get 0
              i32.const 72
              i32.add
              local.tee 1
              local.get 2
              local.get 12
              call 109
              local.get 1
              call 140
              local.get 1
              local.get 12
              call 126
            end
            local.get 0
            i32.const 176
            i32.add
            global.set 0
            return
          end
          i32.const 1048590
          i32.const 18
          call 46
          unreachable
        end
        i32.const 1048608
        i32.const 15
        call 46
        unreachable
      end
      i32.const 1048623
      i32.const 19
      call 46
      unreachable
    end
    i32.const 1048642
    i32.const 19
    call 46
    unreachable)
  (func (;152;) (type 5) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call 34
    local.get 0
    call 30
    i32.const 0
    i32.ge_s
    if  ;; label = @1
      return
    end
    i32.const 1049232
    i32.const 48
    call 2
    unreachable)
  (func (;153;) (type 2)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    call 29
    call 51
    i32.const 1
    call 57
    call 55
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    call 139
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load offset=12
    local.get 1
    call 114
    local.get 0
    i32.const 16
    i32.add
    global.set 0)
  (func (;154;) (type 2)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    call 29
    call 51
    i32.const 1
    call 57
    call 55
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    call 138
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load offset=12
    local.get 1
    call 114
    local.get 0
    i32.const 16
    i32.add
    global.set 0)
  (func (;155;) (type 2)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64)
    global.get 0
    i32.const 144
    i32.sub
    local.tee 0
    global.set 0
    i32.const 1059308
    call 15
    i32.store
    i32.const 1059308
    i32.load
    i32.const 3
    i32.lt_s
    if  ;; label = @1
      i32.const 1048831
      i32.const 17
      call 2
      unreachable
    end
    call 55
    local.set 6
    i32.const 1
    call 14
    local.set 12
    i32.const 2
    call 54
    local.set 7
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
      i32.const 1059308
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
      call 54
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
    i32.const 1059308
    i32.load
    local.get 0
    i32.load offset=40
    i32.gt_s
    if  ;; label = @1
      i32.const 1048848
      i32.const 18
      call 2
      unreachable
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              call 145
              call 122
              i32.eqz
              if  ;; label = @6
                call 49
                local.set 8
                local.get 0
                i32.const 24
                i32.add
                call 52
                local.get 0
                i32.const 8
                i32.add
                call 139
                local.get 0
                i32.load offset=8
                local.get 6
                call 115
                i32.eqz
                br_if 1 (;@5;)
                local.get 0
                call 138
                local.get 0
                i32.load
                local.get 0
                i32.load offset=32
                call 115
                i32.eqz
                br_if 2 (;@4;)
                local.get 0
                i32.load offset=36
                local.tee 2
                call 36
                local.set 3
                i64.const 1
                call 40
                local.set 4
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 5
                      i32.eqz
                      if  ;; label = @10
                        local.get 1
                        call 30
                        i32.const 0
                        i32.le_s
                        br_if 1 (;@9;)
                        local.get 2
                        local.get 1
                        call 146
                        i32.eqz
                        br_if 2 (;@8;)
                        call 37
                        local.tee 3
                        local.get 2
                        local.get 1
                        call 19
                        local.get 1
                        local.set 4
                      end
                      local.get 0
                      local.get 3
                      i32.store offset=36
                      local.get 0
                      i32.const 40
                      i32.add
                      call 140
                      local.get 0
                      i32.const 48
                      i32.add
                      local.tee 2
                      i32.load
                      call 80
                      i32.eqz
                      br_if 2 (;@7;)
                      local.get 0
                      i32.const 40
                      i32.add
                      local.tee 1
                      call 140
                      local.get 0
                      i32.load offset=44
                      local.get 2
                      i32.load
                      i32.const 1
                      call 120
                      local.set 10
                      local.get 1
                      call 140
                      local.get 1
                      local.get 10
                      call 127
                      local.tee 1
                      i32.eqz
                      br_if 7 (;@2;)
                      local.get 0
                      i32.const 48
                      i32.add
                      i32.load
                      local.tee 3
                      call 80
                      local.tee 2
                      local.get 1
                      i32.lt_u
                      br_if 8 (;@1;)
                      local.get 1
                      local.get 2
                      i32.eq
                      local.tee 5
                      br_if 6 (;@3;)
                      local.get 0
                      i32.load offset=44
                      local.tee 9
                      local.get 3
                      local.get 2
                      call 120
                      local.set 11
                      local.get 3
                      call 80
                      local.get 1
                      i32.lt_u
                      br_if 8 (;@1;)
                      local.get 9
                      local.get 1
                      call 119
                      local.get 11
                      call 106
                      br 6 (;@3;)
                    end
                    i32.const 1048719
                    i32.const 31
                    call 46
                    unreachable
                  end
                  i32.const 1048750
                  i32.const 47
                  call 46
                  unreachable
                end
                call 141
                call 81
                local.set 10
                call 141
                local.get 10
                i64.const 1
                i64.add
                call 106
                br 4 (;@2;)
              end
              i32.const 1048590
              i32.const 18
              call 46
              unreachable
            end
            i32.const 1048701
            i32.const 18
            call 46
            unreachable
          end
          i32.const 1048701
          i32.const 18
          call 46
          unreachable
        end
        local.get 3
        call 80
        local.get 2
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=44
        local.get 2
        call 119
        call 91
        local.get 3
        local.get 2
        i32.const 1
        i32.sub
        call 117
        local.get 5
        i32.eqz
        if  ;; label = @3
          local.get 0
          i32.const 40
          i32.add
          local.get 11
          local.get 1
          call 128
        end
        local.get 0
        i32.const 40
        i32.add
        local.get 10
        call 125
        call 91
      end
      local.get 0
      i32.const 88
      i32.add
      local.tee 1
      call 144
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
      local.get 7
      i32.store
      local.get 0
      i32.const 128
      i32.add
      local.get 6
      i32.store
      local.get 0
      local.get 0
      i64.load offset=24
      i64.store offset=104
      local.get 0
      local.get 4
      i32.store offset=140
      local.get 0
      local.get 8
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
      call 98
      local.get 10
      call 31
      local.get 0
      i32.const 144
      i32.add
      global.set 0
      return
    end
    i32.const 1048954
    i32.const 18
    call 2
    unreachable)
  (func (;156;) (type 2)
    (local i32 i32 i32 i32 i32 i32 i32 i64 i64)
    global.get 0
    i32.const 112
    i32.sub
    local.tee 0
    global.set 0
    call 29
    i32.const 1
    call 57
    i32.const 0
    call 14
    local.set 7
    block  ;; label = @1
      block  ;; label = @2
        call 145
        call 122
        i32.eqz
        if  ;; label = @3
          local.get 0
          i32.const 48
          i32.add
          local.tee 1
          call 144
          local.get 0
          local.get 1
          local.get 7
          call 96
          call 49
          local.set 1
          call 50
          local.set 2
          local.get 0
          i64.load
          i64.const 1
          i64.ne
          br_if 1 (;@2;)
          local.get 0
          i32.const 44
          i32.add
          i32.load
          local.set 3
          local.get 0
          i32.const 20
          i32.add
          i32.load
          local.set 4
          local.get 0
          i32.const 16
          i32.add
          i32.load
          local.set 5
          local.get 0
          i64.load offset=8
          local.set 8
          local.get 1
          local.get 0
          i32.const 40
          i32.add
          i32.load
          local.tee 6
          call 42
          i32.eqz
          if  ;; label = @4
            local.get 1
            local.get 2
            call 42
            i32.eqz
            br_if 3 (;@1;)
          end
          local.get 6
          local.get 5
          local.get 8
          local.get 4
          local.get 3
          call 44
          call 47
          local.get 0
          i32.const 96
          i32.add
          local.tee 2
          call 144
          local.get 0
          i32.const 48
          i32.add
          local.tee 1
          local.get 2
          local.get 7
          call 109
          local.get 1
          call 140
          local.get 1
          local.get 7
          call 126
          local.get 0
          i32.const 112
          i32.add
          global.set 0
          return
        end
        i32.const 1048590
        i32.const 18
        call 46
        unreachable
      end
      i32.const 1048608
      i32.const 15
      call 46
      unreachable
    end
    i32.const 1048661
    i32.const 40
    call 46
    unreachable)
  (func (;157;) (type 2)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 0
    global.set 0
    call 29
    i32.const 0
    call 57
    local.get 0
    call 144
    local.get 0
    i32.const 16
    i32.add
    local.get 0
    i32.const 8
    i32.add
    i32.load
    call 102
    local.get 0
    i64.load32_u offset=16
    call 31
    local.get 0
    i32.const 32
    i32.add
    global.set 0)
  (func (;158;) (type 2)
    (local i32 i32)
    call 29
    call 51
    i32.const 2
    call 57
    i32.const 0
    call 54
    local.set 0
    i32.const 1
    call 54
    local.set 1
    call 143
    local.get 1
    call 124
    call 142
    local.get 0
    call 124)
  (func (;159;) (type 2)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    call 29
    call 51
    i32.const 0
    call 57
    call 145
    call 145
    call 122
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
    call 134
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call 89
    local.get 0
    i32.const 16
    i32.add
    global.set 0)
  (func (;160;) (type 2)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    call 29
    i32.const 0
    call 57
    local.get 0
    call 140
    local.get 0
    i32.const 8
    i32.add
    i32.load
    call 80
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
        call 118
        call 31
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
  (func (;161;) (type 2)
    call 29
    i32.const 0
    call 57
    call 141
    call 81
    call 31)
  (func (;162;) (type 2)
    call 29
    i32.const 0
    call 57
    call 145
    call 122
    i64.extend_i32_u
    call 32)
  (func (;163;) (type 2)
    (local i32 i32 i32 i32 i64)
    global.get 0
    i32.const 160
    i32.sub
    local.tee 0
    global.set 0
    call 29
    i32.const 1
    call 57
    i32.const 0
    call 14
    local.set 4
    local.get 0
    i32.const 16
    i32.add
    local.tee 1
    call 144
    local.get 0
    i32.const 72
    i32.add
    local.get 1
    local.get 4
    call 96
    call 143
    call 123
    local.set 2
    block  ;; label = @1
      local.get 0
      i64.load offset=72
      i64.const 1
      i64.ne
      if  ;; label = @2
        i32.const 1049196
        i32.const 0
        call 33
        br 1 (;@1;)
      end
      local.get 0
      i32.const 120
      i32.add
      local.tee 1
      local.get 0
      i32.const 80
      i32.add
      i32.const 40
      call 168
      local.get 0
      i32.const 24
      i32.add
      local.tee 3
      local.get 4
      local.get 1
      local.get 2
      call 43
      local.get 0
      i64.const 1
      i64.store offset=16
      local.get 0
      i32.const 8
      i32.add
      call 85
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
      i32.store8 offset=120
      local.get 0
      i32.const 72
      i32.add
      local.tee 2
      local.get 1
      i32.const 1
      call 132
      local.get 3
      local.get 2
      call 149
      local.get 0
      i32.load offset=72
      local.get 0
      i32.load8_u offset=76
      call 129
    end
    local.get 0
    i32.const 160
    i32.add
    global.set 0)
  (func (;164;) (type 2)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64)
    global.get 0
    i32.const 336
    i32.sub
    local.tee 0
    global.set 0
    call 29
    i32.const 2
    call 57
    i32.const 0
    call 14
    local.set 13
    i32.const 1
    call 14
    local.set 14
    call 48
    local.set 8
    call 143
    call 123
    local.set 6
    local.get 0
    i32.const 168
    i32.add
    call 144
    local.get 0
    i32.const 288
    i32.add
    local.get 0
    i32.const 176
    i32.add
    i32.load
    call 102
    local.get 0
    i32.load offset=292
    local.set 1
    local.get 0
    i32.const 296
    i32.add
    local.set 5
    loop  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.const 160
            i32.add
            local.get 0
            i32.load offset=176
            local.tee 3
            local.get 1
            call 103
            local.get 0
            i32.load offset=164
            local.set 9
            local.get 0
            i32.const 288
            i32.add
            local.get 0
            i32.const 168
            i32.add
            local.get 3
            local.get 1
            call 111
            local.tee 11
            call 96
            local.get 0
            i64.load offset=288
            i64.eqz
            br_if 1 (;@3;)
            local.get 0
            i32.const 184
            i32.add
            local.get 5
            i32.const 40
            call 168
            local.get 12
            local.get 13
            i64.lt_u
            br_if 2 (;@2;)
            local.get 12
            local.get 14
            i64.ge_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 288
            i32.add
            local.tee 1
            local.get 0
            i32.const 184
            i32.add
            i32.const 40
            call 168
            local.get 0
            i32.const 224
            i32.add
            local.get 11
            local.get 1
            local.get 6
            call 43
            local.get 1
            call 169
            local.get 0
            local.get 0
            i64.load offset=224
            local.tee 11
            i64.const 56
            i64.shl
            local.get 11
            i64.const 40
            i64.shl
            i64.const 71776119061217280
            i64.and
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
            i64.store offset=280
            local.get 0
            i32.const 152
            i32.add
            local.get 1
            i32.const 0
            i32.const 8
            call 148
            local.get 0
            i32.load offset=152
            local.get 0
            i32.load offset=156
            local.get 0
            i32.const 280
            i32.add
            local.tee 3
            i32.const 8
            call 73
            local.get 0
            local.get 0
            i32.load offset=248
            local.tee 2
            i32.const 24
            i32.shl
            local.get 2
            i32.const 8
            i32.shl
            i32.const 16711680
            i32.and
            i32.or
            local.get 2
            i32.const 8
            i32.shr_u
            i32.const 65280
            i32.and
            local.get 2
            i32.const 24
            i32.shr_u
            i32.or
            i32.or
            i32.store offset=280
            local.get 0
            i32.const 144
            i32.add
            local.get 1
            i32.const 8
            i32.const 12
            call 148
            local.get 0
            i32.load offset=144
            local.get 0
            i32.load offset=148
            local.get 3
            i32.const 4
            call 73
            local.get 0
            i32.const 0
            i32.store offset=276
            local.get 0
            local.get 0
            i32.load offset=252
            local.tee 2
            i32.const 24
            i32.shl
            local.get 2
            i32.const 8
            i32.shl
            i32.const 16711680
            i32.and
            i32.or
            local.get 2
            i32.const 8
            i32.shr_u
            i32.const 65280
            i32.and
            local.get 2
            i32.const 24
            i32.shr_u
            i32.or
            i32.or
            i32.store offset=280
            local.get 0
            i32.const 276
            i32.add
            local.tee 2
            i32.const 4
            local.get 3
            i32.const 4
            call 73
            local.get 0
            i32.const 136
            i32.add
            local.get 1
            i32.const 12
            i32.const 16
            call 148
            local.get 0
            i32.load offset=136
            local.get 0
            i32.load offset=140
            local.get 2
            i32.const 4
            call 73
            local.get 0
            local.get 0
            i64.load offset=232
            local.tee 11
            i64.const 56
            i64.shl
            local.get 11
            i64.const 40
            i64.shl
            i64.const 71776119061217280
            i64.and
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
            i64.store offset=280
            local.get 0
            i32.const 128
            i32.add
            local.get 1
            i32.const 16
            i32.const 24
            call 148
            local.get 0
            i32.load offset=128
            local.get 0
            i32.load offset=132
            local.get 3
            i32.const 8
            call 73
            local.get 0
            local.get 0
            i32.load offset=256
            local.tee 4
            i32.const 24
            i32.shl
            local.get 4
            i32.const 8
            i32.shl
            i32.const 16711680
            i32.and
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
            i32.store offset=280
            local.get 0
            i32.const 120
            i32.add
            local.get 1
            i32.const 24
            i32.const 28
            call 148
            local.get 0
            i32.load offset=120
            local.get 0
            i32.load offset=124
            local.get 3
            i32.const 4
            call 73
            local.get 0
            i32.const 0
            i32.store offset=276
            local.get 0
            local.get 0
            i32.load offset=260
            local.tee 4
            i32.const 24
            i32.shl
            local.get 4
            i32.const 8
            i32.shl
            i32.const 16711680
            i32.and
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
            i32.store offset=280
            local.get 2
            i32.const 4
            local.get 3
            i32.const 4
            call 73
            local.get 0
            i32.const 112
            i32.add
            local.get 1
            i32.const 28
            i32.const 32
            call 148
            local.get 0
            i32.load offset=112
            local.get 0
            i32.load offset=116
            local.get 2
            i32.const 4
            call 73
            local.get 0
            local.get 0
            i64.load offset=240
            local.tee 11
            i64.const 56
            i64.shl
            local.get 11
            i64.const 40
            i64.shl
            i64.const 71776119061217280
            i64.and
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
            i64.store offset=280
            local.get 0
            i32.const 104
            i32.add
            local.get 1
            i32.const 32
            i32.const 40
            call 148
            local.get 0
            i32.load offset=104
            local.get 0
            i32.load offset=108
            local.get 3
            i32.const 8
            call 73
            local.get 0
            local.get 0
            i32.load offset=264
            local.tee 2
            i32.const 24
            i32.shl
            local.get 2
            i32.const 8
            i32.shl
            i32.const 16711680
            i32.and
            i32.or
            local.get 2
            i32.const 8
            i32.shr_u
            i32.const 65280
            i32.and
            local.get 2
            i32.const 24
            i32.shr_u
            i32.or
            i32.or
            i32.store offset=280
            local.get 0
            i32.const 96
            i32.add
            local.get 1
            i32.const 40
            i32.const 44
            call 148
            local.get 0
            i32.load offset=96
            local.get 0
            i32.load offset=100
            local.get 3
            i32.const 4
            call 73
            local.get 0
            local.get 0
            i32.load offset=268
            local.tee 2
            i32.const 24
            i32.shl
            local.get 2
            i32.const 8
            i32.shl
            i32.const 16711680
            i32.and
            i32.or
            local.get 2
            i32.const 8
            i32.shr_u
            i32.const 65280
            i32.and
            local.get 2
            i32.const 24
            i32.shr_u
            i32.or
            i32.or
            i32.store offset=280
            local.get 0
            i32.const 88
            i32.add
            local.get 1
            i32.const 44
            i32.const 48
            call 148
            local.get 0
            i32.load offset=88
            local.get 0
            i32.load offset=92
            local.get 3
            i32.const 4
            call 73
            local.get 8
            local.get 1
            i32.const 48
            call 17
            drop
            br 2 (;@2;)
          end
          local.get 0
          i32.const 80
          i32.add
          call 85
          local.get 0
          local.get 0
          i32.load8_u offset=84
          i32.store8 offset=188
          local.get 0
          local.get 0
          i32.load offset=80
          i32.store offset=184
          local.get 8
          call 10
          local.set 10
          i32.const 0
          local.set 1
          loop  ;; label = @4
            local.get 10
            local.get 1
            i32.const 48
            i32.add
            local.tee 9
            i32.ge_u
            if  ;; label = @5
              local.get 0
              i32.const 288
              i32.add
              local.tee 3
              call 169
              local.get 8
              local.get 1
              local.get 3
              i32.const 48
              call 53
              drop
              local.get 0
              i64.const 0
              i64.store offset=224
              local.get 0
              i32.const 72
              i32.add
              local.get 3
              i32.const 0
              i32.const 8
              call 147
              local.get 0
              i32.const 224
              i32.add
              local.tee 1
              i32.const 8
              local.get 0
              i32.load offset=72
              local.get 0
              i32.load offset=76
              call 73
              local.get 0
              i64.load offset=224
              local.set 11
              local.get 0
              i32.const 0
              i32.store offset=224
              local.get 0
              i32.const -64
              i32.sub
              local.get 3
              i32.const 8
              i32.const 12
              call 147
              local.get 1
              i32.const 4
              local.get 0
              i32.load offset=64
              local.get 0
              i32.load offset=68
              call 73
              local.get 0
              i32.load offset=224
              local.set 2
              local.get 0
              i32.const 0
              i32.store offset=168
              local.get 0
              i32.const 56
              i32.add
              local.get 3
              i32.const 12
              i32.const 16
              call 147
              local.get 0
              i32.const 168
              i32.add
              local.tee 5
              i32.const 4
              local.get 0
              i32.load offset=56
              local.get 0
              i32.load offset=60
              call 73
              local.get 0
              i32.const 0
              i32.store offset=224
              local.get 1
              i32.const 4
              local.get 5
              i32.const 4
              call 73
              local.get 0
              i32.load offset=224
              local.set 4
              local.get 0
              i64.const 0
              i64.store offset=224
              local.get 0
              i32.const 48
              i32.add
              local.get 3
              i32.const 16
              i32.const 24
              call 147
              local.get 1
              i32.const 8
              local.get 0
              i32.load offset=48
              local.get 0
              i32.load offset=52
              call 73
              local.get 0
              i64.load offset=224
              local.set 12
              local.get 0
              i32.const 0
              i32.store offset=224
              local.get 0
              i32.const 40
              i32.add
              local.get 3
              i32.const 24
              i32.const 28
              call 147
              local.get 1
              i32.const 4
              local.get 0
              i32.load offset=40
              local.get 0
              i32.load offset=44
              call 73
              local.get 0
              i32.load offset=224
              local.set 6
              local.get 0
              i32.const 0
              i32.store offset=168
              local.get 0
              i32.const 32
              i32.add
              local.get 3
              i32.const 28
              i32.const 32
              call 147
              local.get 5
              i32.const 4
              local.get 0
              i32.load offset=32
              local.get 0
              i32.load offset=36
              call 73
              local.get 0
              i32.const 0
              i32.store offset=224
              local.get 1
              i32.const 4
              local.get 5
              i32.const 4
              call 73
              local.get 0
              i32.load offset=224
              local.set 5
              local.get 0
              i64.const 0
              i64.store offset=224
              local.get 0
              i32.const 24
              i32.add
              local.get 3
              i32.const 32
              i32.const 40
              call 147
              local.get 1
              i32.const 8
              local.get 0
              i32.load offset=24
              local.get 0
              i32.load offset=28
              call 73
              local.get 0
              i64.load offset=224
              local.set 13
              local.get 0
              i32.const 0
              i32.store offset=224
              local.get 0
              i32.const 16
              i32.add
              local.get 3
              i32.const 40
              i32.const 44
              call 147
              local.get 1
              i32.const 4
              local.get 0
              i32.load offset=16
              local.get 0
              i32.load offset=20
              call 73
              local.get 0
              i32.load offset=224
              local.set 7
              local.get 0
              i32.const 0
              i32.store offset=224
              local.get 0
              i32.const 8
              i32.add
              local.get 3
              i32.const 44
              i32.const 48
              call 147
              local.get 1
              i32.const 4
              local.get 0
              i32.load offset=8
              local.get 0
              i32.load offset=12
              call 73
              local.get 0
              i32.load offset=224
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
              i32.store offset=328
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
              i32.store offset=324
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
              i32.store offset=320
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
              i32.store offset=316
              local.get 0
              local.get 2
              i32.const 8
              i32.shl
              i32.const 16711680
              i32.and
              local.get 2
              i32.const 24
              i32.shl
              i32.or
              local.get 2
              i32.const 8
              i32.shr_u
              i32.const 65280
              i32.and
              local.get 2
              i32.const 24
              i32.shr_u
              i32.or
              i32.or
              i32.store offset=312
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
              i64.store offset=304
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
              i64.store offset=296
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
              i64.store offset=288
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
              i32.store offset=332
              local.get 3
              local.get 0
              i32.const 184
              i32.add
              call 149
              local.get 9
              local.set 1
              br 1 (;@4;)
            end
          end
          local.get 0
          i32.load offset=184
          local.get 0
          i32.load8_u offset=188
          call 129
          local.get 0
          i32.const 336
          i32.add
          global.set 0
          return
        end
        call 165
        unreachable
      end
      local.get 12
      i64.const 1
      i64.add
      local.set 12
      local.get 9
      local.set 1
      br 0 (;@1;)
    end
    unreachable)
  (func (;165;) (type 2)
    call 167
    unreachable)
  (func (;166;) (type 2)
    nop)
  (func (;167;) (type 2)
    i32.const 1049280
    i32.const 14
    call 2
    unreachable)
  (func (;168;) (type 5) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 0
    local.set 3
    local.get 2
    i32.const 15
    i32.gt_u
    if  ;; label = @1
      local.get 3
      i32.const 0
      local.get 3
      i32.sub
      i32.const 3
      i32.and
      local.tee 0
      i32.add
      local.set 4
      local.get 0
      if  ;; label = @2
        local.get 1
        local.set 5
        loop  ;; label = @3
          local.get 3
          local.get 5
          i32.load8_u
          i32.store8
          local.get 5
          i32.const 1
          i32.add
          local.set 5
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          local.get 4
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 4
      local.get 2
      local.get 0
      i32.sub
      local.tee 7
      i32.const -4
      i32.and
      local.tee 6
      i32.add
      local.set 3
      block  ;; label = @2
        local.get 0
        local.get 1
        i32.add
        local.tee 0
        i32.const 3
        i32.and
        local.tee 2
        if  ;; label = @3
          local.get 6
          i32.const 0
          i32.le_s
          br_if 1 (;@2;)
          local.get 0
          i32.const -4
          i32.and
          local.tee 5
          i32.const 4
          i32.add
          local.set 1
          i32.const 0
          local.get 2
          i32.const 3
          i32.shl
          local.tee 8
          i32.sub
          i32.const 24
          i32.and
          local.set 2
          local.get 5
          i32.load
          local.set 5
          loop  ;; label = @4
            local.get 4
            local.get 5
            local.get 8
            i32.shr_u
            local.get 1
            i32.load
            local.tee 5
            local.get 2
            i32.shl
            i32.or
            i32.store
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 4
            i32.const 4
            i32.add
            local.tee 4
            local.get 3
            i32.lt_u
            br_if 0 (;@4;)
          end
          br 1 (;@2;)
        end
        local.get 6
        i32.const 0
        i32.le_s
        br_if 0 (;@2;)
        local.get 0
        local.set 1
        loop  ;; label = @3
          local.get 4
          local.get 1
          i32.load
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 4
          i32.const 4
          i32.add
          local.tee 4
          local.get 3
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 7
      i32.const 3
      i32.and
      local.set 2
      local.get 0
      local.get 6
      i32.add
      local.set 1
    end
    local.get 2
    if  ;; label = @1
      local.get 2
      local.get 3
      i32.add
      local.set 0
      loop  ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        local.get 0
        i32.lt_u
        br_if 0 (;@2;)
      end
    end)
  (func (;169;) (type 4) (param i32)
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
  (global (;1;) i32 (i32.const 1059317))
  (global (;2;) i32 (i32.const 1059328))
  (export "memory" (memory 0))
  (export "init" (func 150))
  (export "acceptOffer" (func 151))
  (export "addAcceptedPayment" (func 153))
  (export "addAcceptedToken" (func 154))
  (export "addOffer" (func 155))
  (export "cancelOffer" (func 156))
  (export "numberOfOffers" (func 157))
  (export "setFees" (func 158))
  (export "togglePause" (func 159))
  (export "viewEmptyOfferIndexes" (func 160))
  (export "viewHighestOfferIndex" (func 161))
  (export "viewIsPaused" (func 162))
  (export "viewOffer" (func 163))
  (export "viewOffers" (func 164))
  (export "callBack" (func 166))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (data (;0;) (i32.const 1048576) "input too longContract is pausedOffer not foundNot enough quantityWrong token paymentOnly special addresses can cancel offersToken not acceptedQuantity must be greater than 0Quantity must be less than offered token amountincorrect number of ESDT transferstoo few argumentstoo many argumentswrong number of argumentsinput too shortManagedVec index out of rangeEGLD.mapped.node_idindex out of range.item.node_links.value.info.indexinput out of rangestorage decode error: .lenaccepted_tokensaccepted_paymentsempty_offer_indexeshighest_offer_indexpercentage_from_adder_to_ownerpercentage_from_accepter_to_ownerofferspause\00\00\00Endpoint can only be called by ownercannot subtract because result would be negativepanic occurred")
  (data (;1;) (i32.const 1049296) "\9c\ff\ff\ff"))
