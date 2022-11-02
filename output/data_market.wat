(module
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32)))
  (type (;4;) (func (param i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32)))
  (type (;6;) (func (result i32)))
  (type (;7;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;8;) (func (param i32 i32 i32 i32)))
  (type (;9;) (func (param i32 i64) (result i32)))
  (type (;10;) (func (param i32 i64)))
  (type (;11;) (func (param i32 i32) (result i64)))
  (type (;12;) (func (param i32) (result i64)))
  (type (;13;) (func (param i32 i32 i64 i32)))
  (type (;14;) (func (param i32 i32 i64)))
  (type (;15;) (func (param i32 i32 i64 i32 i32) (result i32)))
  (type (;16;) (func (param i64) (result i32)))
  (type (;17;) (func (param i32 i32 i32) (result i32)))
  (type (;18;) (func (param i64)))
  (type (;19;) (func (param i32 i32 i32 i32 i32)))
  (type (;20;) (func (param i32 i64 i32 i32)))
  (type (;21;) (func (param i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32)))
  (type (;22;) (func (param i64 i32)))
  (type (;23;) (func (param i32 i32 i32) (result i64)))
  (type (;24;) (func (param i32 i64 i32)))
  (import "env" "bigIntSetInt64" (func (;0;) (type 10)))
  (import "env" "bigIntAdd" (func (;1;) (type 5)))
  (import "env" "signalError" (func (;2;) (type 0)))
  (import "env" "mBufferNew" (func (;3;) (type 6)))
  (import "env" "mBufferAppend" (func (;4;) (type 1)))
  (import "env" "mBufferEq" (func (;5;) (type 1)))
  (import "env" "managedTransferValueExecute" (func (;6;) (type 15)))
  (import "env" "managedCaller" (func (;7;) (type 3)))
  (import "env" "managedOwnerAddress" (func (;8;) (type 3)))
  (import "env" "managedGetMultiESDTCallValue" (func (;9;) (type 3)))
  (import "env" "bigIntGetUnsignedArgument" (func (;10;) (type 0)))
  (import "env" "smallIntGetUnsignedArgument" (func (;11;) (type 12)))
  (import "env" "getNumArguments" (func (;12;) (type 6)))
  (import "env" "bigIntNew" (func (;13;) (type 16)))
  (import "env" "mBufferGetLength" (func (;14;) (type 4)))
  (import "env" "mBufferAppendBytes" (func (;15;) (type 17)))
  (import "env" "mBufferSetBytes" (func (;16;) (type 17)))
  (import "env" "bigIntTDiv" (func (;17;) (type 5)))
  (import "env" "bigIntMul" (func (;18;) (type 5)))
  (import "env" "mBufferFromBigIntUnsigned" (func (;19;) (type 1)))
  (import "env" "mBufferToBigIntUnsigned" (func (;20;) (type 1)))
  (import "env" "mBufferCopyByteSlice" (func (;21;) (type 7)))
  (import "env" "mBufferStorageLoad" (func (;22;) (type 1)))
  (import "env" "mBufferStorageStore" (func (;23;) (type 1)))
  (import "env" "mBufferFinish" (func (;24;) (type 4)))
  (import "env" "mBufferGetArgument" (func (;25;) (type 1)))
  (import "env" "managedSignalError" (func (;26;) (type 3)))
  (import "env" "bigIntCmp" (func (;27;) (type 1)))
  (import "env" "managedMultiTransferESDTNFTExecute" (func (;28;) (type 15)))
  (import "env" "checkNoPayment" (func (;29;) (type 2)))
  (import "env" "bigIntGetCallValue" (func (;30;) (type 3)))
  (import "env" "managedSCAddress" (func (;31;) (type 3)))
  (import "env" "managedGetESDTTokenData" (func (;32;) (type 21)))
  (import "env" "bigIntFinishUnsigned" (func (;33;) (type 3)))
  (import "env" "bigIntSign" (func (;34;) (type 4)))
  (import "env" "smallIntFinishUnsigned" (func (;35;) (type 18)))
  (import "env" "smallIntFinishSigned" (func (;36;) (type 18)))
  (import "env" "finish" (func (;37;) (type 0)))
  (import "env" "bigIntSub" (func (;38;) (type 5)))
  (import "env" "mBufferGetByteSlice" (func (;39;) (type 7)))
  (func (;40;) (type 4) (param i32) (result i32)
    (local i32)
    call 41
    local.tee 1
    i64.const 0
    call 0
    local.get 1
    local.get 1
    local.get 0
    call 1
    local.get 1)
  (func (;41;) (type 6) (result i32)
    (local i32)
    i32.const 1049360
    i32.const 1049360
    i32.load
    i32.const 1
    i32.sub
    local.tee 0
    i32.store
    local.get 0)
  (func (;42;) (type 19) (param i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.le_u
      if  ;; label = @2
        local.get 2
        local.get 4
        i32.le_u
        br_if 1 (;@1;)
        call 43
        unreachable
      end
      call 43
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
  (func (;43;) (type 2)
    call 173
    unreachable)
  (func (;44;) (type 16) (param i64) (result i32)
    (local i32)
    call 41
    local.tee 1
    local.get 0
    call 0
    local.get 1)
  (func (;45;) (type 4) (param i32) (result i32)
    (local i32)
    call 3
    local.tee 1
    local.get 0
    call 4
    drop
    local.get 1)
  (func (;46;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 5
    i32.const 0
    i32.gt_s)
  (func (;47;) (type 20) (param i32 i64 i32 i32)
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
    call 44
    local.set 9
    call 41
    local.tee 10
    local.get 3
    local.get 9
    call 1
    local.get 10
    call 48
    i64.const 10000
    call 44
    call 49
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
  (func (;48;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 0
    local.get 1
    call 18
    local.get 0)
  (func (;49;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 0
    local.get 1
    call 17
    local.get 0)
  (func (;50;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    call 2
    unreachable)
  (func (;51;) (type 13) (param i32 i32 i64 i32)
    (local i32 i32 i32 i32)
    call 52
    local.set 6
    call 52
    local.set 7
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    call 52
    local.set 5
    local.get 1
    call 45
    local.set 1
    local.get 3
    call 40
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
    local.get 5
    local.get 4
    i32.const 16
    call 15
    drop
    local.get 0
    local.get 5
    i64.const 0
    local.get 6
    local.get 7
    call 28
    drop
    local.get 4
    i32.const 16
    i32.add
    global.set 0)
  (func (;52;) (type 6) (result i32)
    (local i32)
    call 41
    local.tee 0
    i32.const 1049260
    i32.const 0
    call 16
    drop
    local.get 0)
  (func (;53;) (type 13) (param i32 i32 i64 i32)
    local.get 1
    i32.const 2147483646
    i32.ne
    if  ;; label = @1
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      call 51
      return
    end
    local.get 0
    local.get 3
    i64.const 0
    call 52
    call 52
    call 6
    drop)
  (func (;54;) (type 6) (result i32)
    (local i32)
    call 41
    local.tee 0
    call 7
    local.get 0)
  (func (;55;) (type 6) (result i32)
    (local i32)
    call 41
    local.tee 0
    call 8
    local.get 0)
  (func (;56;) (type 2)
    call 55
    call 54
    call 46
    if  ;; label = @1
      return
    end
    i32.const 1049260
    i32.const 36
    call 2
    unreachable)
  (func (;57;) (type 6) (result i32)
    (local i32)
    i32.const 1059380
    i32.load8_u
    local.tee 0
    if  ;; label = @1
      i32.const -21
      i32.const 2147483647
      local.get 0
      select
      return
    end
    i32.const 1059380
    i32.const 1
    i32.store8
    i32.const -21
    call 9
    i32.const -21)
  (func (;58;) (type 4) (param i32) (result i32)
    local.get 0
    call 41
    local.tee 0
    call 10
    local.get 0)
  (func (;59;) (type 6) (result i32)
    (local i32)
    i32.const 0
    call 41
    local.tee 0
    call 25
    drop
    local.get 0)
  (func (;60;) (type 4) (param i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 0
    call 14
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
      call 77
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
  (func (;61;) (type 3) (param i32)
    call 12
    local.get 0
    i32.eq
    if  ;; label = @1
      return
    end
    i32.const 1048866
    i32.const 25
    call 2
    unreachable)
  (func (;62;) (type 4) (param i32) (result i32)
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
    call 63
    local.get 0
    local.get 2
    i32.const 4
    call 64
    i32.wrap_i64
    call 65
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func (;63;) (type 5) (param i32 i32 i32)
    local.get 0
    local.get 0
    i32.load offset=12
    local.get 1
    local.get 2
    call 90
    if  ;; label = @1
      i32.const 1048891
      i32.const 15
      call 70
      unreachable
    end
    local.get 0
    local.get 0
    i32.load offset=12
    local.get 2
    i32.add
    i32.store offset=12)
  (func (;64;) (type 11) (param i32 i32) (result i64)
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
  (func (;65;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 8
    i32.add
    local.get 0
    i32.load
    local.get 0
    i32.load offset=12
    local.tee 3
    local.get 1
    call 69
    local.get 2
    i32.load offset=8
    i32.const 1
    i32.eq
    if  ;; label = @1
      local.get 2
      i32.load offset=12
      local.get 0
      local.get 1
      local.get 3
      i32.add
      i32.store offset=12
      local.get 2
      i32.const 16
      i32.add
      global.set 0
      return
    end
    i32.const 1048891
    i32.const 15
    call 70
    unreachable)
  (func (;66;) (type 3) (param i32)
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
    call 67
    local.get 0
    local.get 2
    i32.const 4
    call 64
    i32.wrap_i64
    call 68
    drop
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func (;67;) (type 5) (param i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 32
    i32.store offset=12
    local.get 3
    i32.const 1048935
    i32.store offset=8
    local.get 0
    local.get 0
    i32.load offset=12
    local.get 1
    local.get 2
    call 90
    if  ;; label = @1
      local.get 3
      i32.const 8
      i32.add
      i32.const 1048891
      i32.const 15
      call 71
      unreachable
    end
    local.get 0
    local.get 0
    i32.load offset=12
    local.get 2
    i32.add
    i32.store offset=12
    local.get 3
    i32.const 16
    i32.add
    global.set 0)
  (func (;68;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 32
    i32.store offset=12
    local.get 2
    i32.const 1048935
    i32.store offset=8
    local.get 2
    local.get 0
    i32.load
    local.get 0
    i32.load offset=12
    local.tee 3
    local.get 1
    call 69
    local.get 2
    i32.load
    i32.const 1
    i32.eq
    if  ;; label = @1
      local.get 2
      i32.load offset=4
      local.get 0
      local.get 1
      local.get 3
      i32.add
      i32.store offset=12
      local.get 2
      i32.const 16
      i32.add
      global.set 0
      return
    end
    local.get 2
    i32.const 8
    i32.add
    i32.const 1048891
    i32.const 15
    call 71
    unreachable)
  (func (;69;) (type 8) (param i32 i32 i32 i32)
    local.get 1
    local.get 2
    local.get 3
    call 3
    local.tee 1
    call 21
    local.set 2
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 2
    i32.eqz
    i32.store)
  (func (;70;) (type 0) (param i32 i32)
    (local i32)
    i32.const 1049055
    i32.const 22
    call 78
    local.tee 2
    local.get 0
    local.get 1
    call 15
    drop
    local.get 2
    call 26
    unreachable)
  (func (;71;) (type 5) (param i32 i32 i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call 78
    local.tee 0
    local.get 1
    local.get 2
    call 15
    drop
    local.get 0
    call 26
    unreachable)
  (func (;72;) (type 0) (param i32 i32)
    (local i32)
    local.get 0
    local.get 1
    call 14
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
  (func (;73;) (type 5) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call 15
    drop)
  (func (;74;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 75
    i32.const 255
    i32.and
    i32.eqz)
  (func (;75;) (type 1) (param i32 i32) (result i32)
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
  (func (;76;) (type 7) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call 77)
  (func (;77;) (type 7) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 3
    local.get 2
    call 39
    i32.const 0
    i32.ne)
  (func (;78;) (type 1) (param i32 i32) (result i32)
    (local i32)
    call 41
    local.tee 2
    local.get 0
    local.get 1
    call 16
    drop
    local.get 2)
  (func (;79;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    call 4
    drop)
  (func (;80;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 0
    local.get 1
    call 81
    local.get 0)
  (func (;81;) (type 5) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call 38
    local.get 0
    call 34
    i32.const 0
    i32.ge_s
    if  ;; label = @1
      return
    end
    i32.const 1049296
    i32.const 48
    call 2
    unreachable)
  (func (;82;) (type 1) (param i32 i32) (result i32)
    (local i32)
    call 41
    local.tee 2
    local.get 0
    local.get 1
    call 18
    local.get 2)
  (func (;83;) (type 4) (param i32) (result i32)
    (local i32)
    call 41
    local.tee 1
    local.get 0
    call 19
    drop
    local.get 1)
  (func (;84;) (type 4) (param i32) (result i32)
    local.get 0
    call 41
    local.tee 0
    call 20
    drop
    local.get 0)
  (func (;85;) (type 4) (param i32) (result i32)
    local.get 0
    call 14
    i32.const 4
    i32.shr_u)
  (func (;86;) (type 1) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 0
    i32.store offset=12
    local.get 2
    local.get 0
    i32.const 16
    local.get 1
    i32.load
    local.tee 0
    local.get 0
    i32.const 4
    i32.add
    local.tee 0
    call 87
    local.get 2
    i32.const 12
    i32.add
    i32.const 4
    local.get 2
    i32.load
    local.get 2
    i32.load offset=4
    call 88
    local.get 1
    local.get 0
    i32.store
    local.get 2
    i32.load offset=12
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set 0
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
    i32.or)
  (func (;87;) (type 19) (param i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 3
      local.get 4
      i32.le_u
      if  ;; label = @2
        local.get 2
        local.get 4
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        local.get 4
        local.get 3
        i32.sub
        i32.store offset=4
        local.get 0
        local.get 1
        local.get 3
        i32.add
        i32.store
        return
      end
      call 43
      unreachable
    end
    call 43
    unreachable)
  (func (;88;) (type 8) (param i32 i32 i32 i32)
    local.get 1
    local.get 3
    i32.eq
    if  ;; label = @1
      local.get 0
      local.get 2
      local.get 1
      call 185
      return
    end
    call 173
    unreachable)
  (func (;89;) (type 11) (param i32 i32) (result i64)
    (local i64 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i64.const 0
    i64.store offset=8
    local.get 3
    local.get 0
    i32.const 16
    local.get 1
    i32.load
    local.tee 0
    local.get 0
    i32.const 8
    i32.add
    local.tee 0
    call 87
    local.get 3
    i32.const 8
    i32.add
    i32.const 8
    local.get 3
    i32.load
    local.get 3
    i32.load offset=4
    call 88
    local.get 1
    local.get 0
    i32.store
    local.get 3
    i64.load offset=8
    local.set 2
    local.get 3
    i32.const 16
    i32.add
    global.set 0
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
    i64.or)
  (func (;90;) (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    block (result i32)  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u offset=8
        i32.eqz
        if  ;; label = @3
          local.get 0
          i32.load
          local.tee 6
          call 14
          local.set 5
          i32.const 1059368
          i32.load8_u
          local.get 5
          i32.const 10000
          i32.gt_u
          i32.or
          br_if 1 (;@2;)
          i32.const 1049364
          local.get 5
          i32.store
          i32.const 1059368
          i32.const 1
          i32.store8
          local.get 4
          i32.const 8
          i32.add
          local.get 5
          call 91
          local.get 6
          i32.const 0
          local.get 4
          i32.load offset=8
          local.get 4
          i32.load offset=12
          call 76
          drop
          local.get 0
          i32.const 1
          i32.store8 offset=8
        end
        i32.const 1
        local.get 1
        local.get 3
        i32.add
        local.tee 0
        i32.const 1049364
        i32.load
        i32.gt_u
        br_if 1 (;@1;)
        drop
        local.get 4
        local.get 1
        local.get 0
        call 92
        local.get 2
        local.get 3
        local.get 4
        i32.load
        local.get 4
        i32.load offset=4
        call 88
        i32.const 0
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store8 offset=8
      local.get 6
      local.get 1
      local.get 2
      local.get 3
      call 76
    end
    local.get 4
    i32.const 16
    i32.add
    global.set 0)
  (func (;91;) (type 0) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 8
    i32.add
    i32.const 1049368
    i32.const 10000
    local.get 1
    call 153
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
  (func (;92;) (type 5) (param i32 i32 i32)
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.le_u
      if  ;; label = @2
        local.get 2
        i32.const 10000
        i32.le_u
        br_if 1 (;@1;)
        call 43
        unreachable
      end
      call 43
      unreachable
    end
    local.get 0
    local.get 2
    local.get 1
    i32.sub
    i32.store offset=4
    local.get 0
    local.get 1
    i32.const 1049368
    i32.add
    i32.store)
  (func (;93;) (type 1) (param i32 i32) (result i32)
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
    call 94
    local.get 2
    i32.load offset=8
    local.get 2
    i32.load8_u offset=12
    if  ;; label = @1
      i32.const 1049364
      i32.const 0
      i32.store
      i32.const 1059368
      i32.const 0
      i32.store8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;94;) (type 3) (param i32)
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
      i32.const 1049364
      i32.load
      call 92
      local.get 0
      i32.load
      local.get 1
      i32.load offset=8
      local.get 1
      i32.load offset=12
      call 15
      drop
      i32.const 1049364
      i32.const 0
      i32.store
      i32.const 1059368
      i32.const 0
      i32.store8
    end
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func (;95;) (type 0) (param i32 i32)
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
    call 96
    local.get 3
    call 97
    local.set 1
    local.get 2
    i32.const 8
    i32.add
    call 97
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
        i32.const 1049364
        i32.const 0
        i32.store
        i32.const 1059368
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
    call 70
    unreachable)
  (func (;96;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    call 101
    call 72)
  (func (;97;) (type 4) (param i32) (result i32)
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
    call 63
    local.get 0
    i32.const 4
    call 64
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    i32.wrap_i64)
  (func (;98;) (type 4) (param i32) (result i32)
    (local i64)
    local.get 0
    call 99
    local.tee 1
    i64.const 4294967296
    i64.ge_u
    if  ;; label = @1
      i32.const 1048576
      i32.const 14
      call 70
      unreachable
    end
    local.get 1
    i32.wrap_i64)
  (func (;99;) (type 12) (param i32) (result i64)
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
    call 101
    local.tee 0
    call 14
    local.tee 2
    i32.const 9
    i32.ge_u
    if  ;; label = @1
      i32.const 1048576
      i32.const 14
      call 70
      unreachable
    end
    local.get 1
    local.get 1
    i32.const 8
    i32.add
    i32.const 8
    local.get 2
    call 153
    local.get 0
    i32.const 0
    local.get 1
    i32.load
    local.tee 0
    local.get 1
    i32.load offset=4
    local.tee 2
    call 77
    drop
    local.get 0
    local.get 2
    call 64
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func (;100;) (type 0) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 1
    i32.const -25
    call 22
    drop
    block  ;; label = @1
      block  ;; label = @2
        i32.const -25
        call 14
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
        call 96
        local.get 3
        call 97
        local.set 1
        local.get 2
        i32.const 8
        i32.add
        call 97
        local.set 3
        local.get 2
        i32.const 8
        i32.add
        call 97
        local.set 4
        local.get 2
        i32.const 8
        i32.add
        call 97
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
        i32.const 1049364
        i32.const 0
        i32.store
        i32.const 1059368
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
    call 70
    unreachable)
  (func (;101;) (type 4) (param i32) (result i32)
    local.get 0
    call 41
    local.tee 0
    call 22
    drop
    local.get 0)
  (func (;102;) (type 10) (param i32 i64)
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
    call 73
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;103;) (type 3) (param i32)
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
      i32.const 1059368
      i32.load8_u
      i32.eqz
      if  ;; label = @2
        i32.const 1
        local.set 4
        i32.const 1059368
        i32.const 1
        i32.store8
        i32.const 1049364
        i32.const 0
        i32.store
        local.get 1
        i32.const 8
        i32.add
        i32.const 0
        call 91
        local.get 1
        i32.load offset=8
        local.get 1
        i32.load offset=12
        i32.const 1049260
        i32.const 0
        call 88
        call 52
        br 1 (;@1;)
      end
      i32.const 1049260
      i32.const 0
      call 78
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
  (func (;104;) (type 0) (param i32 i32)
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
    call 152
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;105;) (type 5) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call 93
    call 23
    drop)
  (func (;106;) (type 0) (param i32 i32)
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
        call 103
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
        call 104
        local.get 1
        i32.load offset=4
        local.get 3
        call 104
        local.get 1
        i32.load offset=8
        local.get 3
        call 104
        local.get 1
        i32.load offset=12
        local.get 3
        call 104
        local.get 0
        local.get 2
        i32.load offset=8
        local.get 2
        i32.load8_u offset=12
        call 105
        br 1 (;@1;)
      end
      local.get 0
      i32.const 1049260
      i32.const 0
      call 107
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;107;) (type 5) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call 78
    call 23
    drop)
  (func (;108;) (type 3) (param i32)
    local.get 0
    i32.const 1049260
    i32.const 0
    call 107)
  (func (;109;) (type 3) (param i32)
    i32.const -20
    i32.const 0
    i32.const 0
    call 16
    drop
    local.get 0
    i32.const -20
    call 23
    drop)
  (func (;110;) (type 9) (param i32 i64) (result i32)
    local.get 0
    i32.load
    call 45
    local.tee 0
    i32.const 1048971
    i32.const 7
    call 15
    drop
    local.get 0
    local.get 1
    call 102
    local.get 0)
  (func (;111;) (type 14) (param i32 i32 i64)
    (local i32 i32 i32 i32 i32 i32 i64)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 8
    i32.add
    local.tee 4
    local.get 1
    local.get 2
    call 110
    call 96
    local.get 4
    i32.const 32
    call 65
    local.set 1
    local.get 4
    call 62
    local.set 5
    local.get 4
    call 112
    local.set 2
    local.get 4
    call 113
    local.set 4
    local.get 3
    i32.const 8
    i32.add
    call 62
    call 60
    local.set 6
    local.get 3
    i32.const 8
    i32.add
    call 112
    local.set 9
    local.get 3
    i32.const 8
    i32.add
    call 113
    local.set 7
    local.get 3
    i32.const 8
    i32.add
    call 113
    local.set 8
    local.get 3
    i32.load offset=24
    local.get 3
    i32.load offset=20
    i32.eq
    if  ;; label = @1
      local.get 3
      i32.load8_u offset=16
      if  ;; label = @2
        i32.const 1049364
        i32.const 0
        i32.store
        i32.const 1059368
        i32.const 0
        i32.store8
      end
      local.get 0
      local.get 8
      i32.store offset=36
      local.get 0
      local.get 1
      i32.store offset=32
      local.get 0
      local.get 9
      i64.store offset=16
      local.get 0
      local.get 4
      i32.store offset=12
      local.get 0
      local.get 5
      i32.store offset=8
      local.get 0
      local.get 2
      i64.store
      local.get 0
      i32.const 28
      i32.add
      local.get 7
      i32.store
      local.get 0
      i32.const 24
      i32.add
      local.get 6
      i32.store
      local.get 3
      i32.const 32
      i32.add
      global.set 0
      return
    end
    i32.const 1048576
    i32.const 14
    call 70
    unreachable)
  (func (;112;) (type 12) (param i32) (result i64)
    (local i32 i64)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i64.const 0
    i64.store offset=8
    local.get 0
    local.get 1
    i32.const 8
    i32.add
    local.tee 0
    i32.const 8
    call 63
    local.get 0
    i32.const 8
    call 64
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func (;113;) (type 4) (param i32) (result i32)
    local.get 0
    call 62
    call 84)
  (func (;114;) (type 14) (param i32 i32 i64)
    (local i64)
    local.get 0
    local.get 1
    i32.load offset=4
    local.get 2
    call 115
    if (result i64)  ;; label = @1
      local.get 0
      i32.const 8
      i32.add
      local.get 1
      local.get 2
      call 111
      i64.const 1
    else
      i64.const 0
    end
    i64.store)
  (func (;115;) (type 9) (param i32 i64) (result i32)
    local.get 0
    local.get 1
    call 130
    i32.const 0
    i32.ne)
  (func (;116;) (type 13) (param i32 i32 i64 i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 4
    global.set 0
    local.get 0
    local.get 1
    local.get 2
    call 114
    local.get 1
    local.get 2
    call 110
    local.get 4
    i32.const 8
    i32.add
    call 103
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
    call 117
    local.get 3
    i32.load offset=8
    local.get 5
    call 118
    local.get 3
    i64.load
    local.get 5
    call 119
    local.get 3
    i32.load offset=12
    local.get 5
    call 120
    local.get 3
    i32.const 24
    i32.add
    i32.load
    local.get 5
    call 121
    local.get 3
    i64.load offset=16
    local.get 5
    call 119
    local.get 3
    i32.const 28
    i32.add
    i32.load
    local.get 5
    call 120
    local.get 3
    i32.load offset=36
    local.get 5
    call 120
    local.get 4
    i32.load offset=32
    local.get 4
    i32.load8_u offset=36
    call 105
    local.get 1
    i32.load offset=4
    local.tee 5
    local.get 2
    call 115
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
      call 122
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
        call 123
        local.get 1
        local.get 3
        local.get 4
        i32.load
        local.get 0
        call 124
      end
      local.get 1
      local.get 0
      local.get 3
      i32.const 0
      call 124
      local.get 4
      i32.const 24
      i32.add
      local.tee 3
      local.get 0
      i32.store
      local.get 1
      i32.const 1049020
      i32.const 6
      local.get 0
      call 125
      local.get 2
      call 126
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
      call 127
      local.get 5
      local.get 2
      call 128
      local.get 0
      i64.extend_i32_u
      call 126
    end
    local.get 4
    i32.const 48
    i32.add
    global.set 0)
  (func (;117;) (type 0) (param i32 i32)
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
            call 14
            local.tee 5
            i32.const 10000
            i32.const 1049364
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
            call 155
            local.get 1
            i32.const 0
            local.get 2
            i32.load offset=8
            local.get 2
            i32.load offset=12
            call 76
            drop
            i32.const 1049364
            local.get 4
            i32.store
            br 1 (;@3;)
          end
          local.get 0
          i32.load
          local.get 1
          call 79
        end
        local.get 0
        local.get 3
        i32.store8 offset=4
        br 1 (;@1;)
      end
      local.get 0
      call 94
      local.get 0
      i32.load
      local.get 1
      call 79
      local.get 0
      i32.load8_u offset=4
      local.get 0
      local.get 3
      i32.store8 offset=4
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1049364
      i32.const 0
      i32.store
      i32.const 1059368
      i32.const 0
      i32.store8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;118;) (type 0) (param i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    call 14
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
    call 152
    local.get 1
    local.get 0
    call 117
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;119;) (type 22) (param i64 i32)
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
    call 152
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;120;) (type 0) (param i32 i32)
    local.get 0
    call 83
    local.get 1
    call 118)
  (func (;121;) (type 0) (param i32 i32)
    local.get 0
    i32.const 2147483646
    i32.ne
    if  ;; label = @1
      local.get 0
      local.get 1
      call 118
      return
    end
    i32.const 4
    local.get 1
    call 104
    local.get 1
    i32.const 1048967
    i32.const 4
    call 152)
  (func (;122;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    call 142
    call 100)
  (func (;123;) (type 5) (param i32 i32 i32)
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
    i32.const 1049009
    i32.const 11
    local.get 2
    call 125
    call 95
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
  (func (;124;) (type 8) (param i32 i32 i32 i32)
    local.get 0
    i32.const 1049009
    i32.const 11
    local.get 1
    call 125
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    call 103
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
    call 104
    local.get 3
    local.get 2
    call 104
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load8_u offset=12
    call 105
    local.get 0
    i32.const 16
    i32.add
    global.set 0)
  (func (;125;) (type 7) (param i32 i32 i32 i32) (result i32)
    local.get 0
    call 45
    local.tee 0
    local.get 1
    local.get 2
    call 15
    drop
    local.get 3
    local.get 0
    call 143
    local.get 0)
  (func (;126;) (type 10) (param i32 i64)
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
    call 154
    local.get 0
    local.get 2
    i32.load
    local.get 2
    i32.load offset=4
    call 107
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;127;) (type 0) (param i32 i32)
    local.get 0
    call 142
    local.get 1
    call 106)
  (func (;128;) (type 9) (param i32 i64) (result i32)
    local.get 0
    call 45
    local.tee 0
    i32.const 1048978
    i32.const 8
    call 15
    drop
    local.get 0
    local.get 1
    call 102
    local.get 0)
  (func (;129;) (type 14) (param i32 i32 i64)
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
    call 130
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
      call 123
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
      call 122
      block  ;; label = @2
        local.get 6
        if  ;; label = @3
          local.get 3
          i32.const 16
          i32.add
          local.get 4
          local.get 6
          call 123
          local.get 4
          local.get 6
          local.get 3
          i32.load offset=16
          local.get 5
          call 124
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
          call 123
          local.get 4
          local.get 5
          local.get 6
          local.get 3
          i32.load offset=12
          call 124
          br 1 (;@2;)
        end
        local.get 3
        local.get 6
        i32.store offset=40
      end
      local.get 4
      i32.const 1049009
      i32.const 11
      local.get 7
      call 125
      call 108
      local.get 4
      local.get 7
      call 131
      drop
      local.get 4
      i32.const 1049020
      i32.const 6
      local.get 7
      call 125
      call 108
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
      call 127
      local.get 8
      local.get 2
      call 128
      call 108
      local.get 0
      i32.const 8
      i32.add
      local.get 1
      local.get 2
      call 111
      local.get 1
      local.get 2
      call 110
      call 109
      i64.const 1
    else
      i64.const 0
    end
    i64.store
    local.get 3
    i32.const -64
    i32.sub
    global.set 0)
  (func (;130;) (type 9) (param i32 i64) (result i32)
    local.get 0
    local.get 1
    call 128
    call 98)
  (func (;131;) (type 11) (param i32 i32) (result i64)
    local.get 0
    i32.const 1049020
    i32.const 6
    local.get 1
    call 125
    call 99)
  (func (;132;) (type 1) (param i32 i32) (result i32)
    local.get 0
    call 45
    local.tee 0
    i32.const 1048978
    i32.const 8
    call 15
    drop
    local.get 1
    local.get 0
    call 133
    local.get 0)
  (func (;133;) (type 0) (param i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    call 14
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
    call 73
    local.get 1
    local.get 0
    call 79
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;134;) (type 1) (param i32 i32) (result i32)
    local.get 0
    call 45
    local.tee 0
    i32.const 1048978
    i32.const 8
    call 15
    drop
    local.get 1
    i32.const 2147483646
    i32.ne
    if  ;; label = @1
      local.get 1
      local.get 0
      call 133
      local.get 0
      return
    end
    i32.const 4
    local.get 0
    call 135
    local.get 0
    i32.const 1048967
    i32.const 4
    call 15
    drop
    local.get 0)
  (func (;135;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    call 143)
  (func (;136;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 134
    call 98
    i32.const 0
    i32.ne)
  (func (;137;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 132
    call 98
    i32.const 0
    i32.ne)
  (func (;138;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    i64.extend_i32_u
    call 126)
  (func (;139;) (type 11) (param i32 i32) (result i64)
    local.get 0
    local.get 1
    call 140
    call 99)
  (func (;140;) (type 1) (param i32 i32) (result i32)
    local.get 0
    call 45
    local.tee 0
    i32.const 1049004
    i32.const 5
    call 15
    drop
    local.get 1
    local.get 0
    call 135
    local.get 0)
  (func (;141;) (type 23) (param i32 i32 i32) (result i64)
    local.get 1
    call 98
    local.get 2
    i32.ge_u
    if  ;; label = @1
      local.get 0
      local.get 2
      call 139
      return
    end
    i32.const 1048986
    i32.const 18
    call 2
    unreachable)
  (func (;142;) (type 4) (param i32) (result i32)
    local.get 0
    call 45
    local.tee 0
    i32.const 1049026
    i32.const 5
    call 15
    drop
    local.get 0)
  (func (;143;) (type 0) (param i32 i32)
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
    call 73
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;144;) (type 4) (param i32) (result i32)
    (local i64)
    block (result i32)  ;; label = @1
      block  ;; label = @2
        local.get 0
        call 99
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
        i32.const 1049037
        i32.const 18
        call 70
        unreachable
      end
      i32.const 1
    end)
  (func (;145;) (type 4) (param i32) (result i32)
    local.get 0
    call 101
    call 84)
  (func (;146;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    call 83
    call 23
    drop)
  (func (;147;) (type 9) (param i32 i64) (result i32)
    local.get 0
    i32.load
    call 45
    local.tee 0
    i32.const 1049031
    i32.const 6
    call 15
    drop
    local.get 0
    local.get 1
    call 102
    local.get 0)
  (func (;148;) (type 10) (param i32 i64)
    (local i32 i32)
    local.get 0
    local.get 1
    call 149
    i32.eqz
    if  ;; label = @1
      local.get 0
      i32.const 8
      i32.add
      i32.load
      local.tee 3
      call 98
      local.set 2
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.get 2
      i32.const 1
      i32.add
      local.tee 2
      call 140
      local.get 1
      call 126
      local.get 3
      local.get 2
      call 138
      local.get 0
      local.get 1
      local.get 3
      call 98
      call 150
    end)
  (func (;149;) (type 9) (param i32 i64) (result i32)
    local.get 0
    local.get 1
    call 147
    call 98)
  (func (;150;) (type 24) (param i32 i64 i32)
    local.get 0
    local.get 1
    call 147
    local.get 2
    i64.extend_i32_u
    call 126)
  (func (;151;) (type 0) (param i32 i32)
    local.get 0
    local.get 1
    call 93
    call 24
    drop)
  (func (;152;) (type 5) (param i32 i32 i32)
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
          i32.const 1049364
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
          call 155
          local.get 3
          i32.load offset=8
          local.get 3
          i32.load offset=12
          local.get 1
          local.get 2
          call 88
          i32.const 1049364
          local.get 0
          i32.store
          br 2 (;@1;)
        end
        local.get 0
        i32.load
        local.get 1
        local.get 2
        call 15
        drop
        br 1 (;@1;)
      end
      local.get 0
      call 94
      local.get 0
      i32.load
      local.get 1
      local.get 2
      call 15
      drop
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0)
  (func (;153;) (type 8) (param i32 i32 i32 i32)
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
    call 42
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
  (func (;154;) (type 20) (param i32 i64 i32 i32)
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
            i32.const 1049260
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
      call 173
      unreachable
    end
    call 184
    unreachable)
  (func (;155;) (type 5) (param i32 i32 i32)
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
    i32.const 1049368
    i32.const 10000
    call 42
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
  (func (;156;) (type 3) (param i32)
    (local i32 i32)
    i32.const 1049113
    i32.const 15
    call 78
    local.tee 1
    call 45
    local.set 2
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func (;157;) (type 3) (param i32)
    (local i32 i32)
    i32.const 1049128
    i32.const 17
    call 78
    local.tee 1
    call 45
    local.set 2
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func (;158;) (type 3) (param i32)
    (local i32 i32 i32)
    i32.const 1049145
    i32.const 19
    call 78
    local.tee 1
    call 45
    local.set 2
    local.get 1
    call 45
    local.tee 3
    i32.const 1049077
    i32.const 4
    call 15
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
  (func (;159;) (type 6) (result i32)
    i32.const 1049164
    i32.const 19
    call 78)
  (func (;160;) (type 6) (result i32)
    i32.const 1049183
    i32.const 30
    call 78)
  (func (;161;) (type 6) (result i32)
    i32.const 1049213
    i32.const 33
    call 78)
  (func (;162;) (type 3) (param i32)
    (local i32 i32 i32)
    i32.const 1049246
    i32.const 6
    call 78
    local.tee 1
    call 45
    local.set 2
    local.get 1
    call 45
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
  (func (;163;) (type 6) (result i32)
    i32.const 1049252
    i32.const 5
    call 78)
  (func (;164;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 75
    i32.const 255
    i32.and
    i32.const 2
    i32.lt_u)
  (func (;165;) (type 8) (param i32 i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    local.get 4
    i32.const 8
    i32.add
    local.get 1
    i32.const 48
    local.get 2
    local.get 3
    call 87
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
  (func (;166;) (type 8) (param i32 i32 i32 i32)
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
    call 42
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
  (func (;167;) (type 0) (param i32 i32)
    local.get 0
    i64.load
    local.get 1
    call 119
    local.get 1
    local.get 0
    i32.load offset=24
    call 117
    local.get 0
    i32.load offset=28
    local.get 1
    call 118
    local.get 0
    i64.load offset=8
    local.get 1
    call 119
    local.get 0
    i32.load offset=32
    local.get 1
    call 120
    local.get 0
    i32.load offset=36
    local.get 1
    call 121
    local.get 0
    i64.load offset=16
    local.get 1
    call 119
    local.get 0
    i32.load offset=40
    local.get 1
    call 120
    local.get 0
    i32.load offset=44
    local.get 1
    call 120)
  (func (;168;) (type 2)
    call 29
    i32.const 0
    call 61)
  (func (;169;) (type 2)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64)
    global.get 0
    i32.const 160
    i32.sub
    local.tee 0
    global.set 0
    i32.const 2
    call 61
    i32.const 0
    call 11
    local.set 16
    i32.const 1
    call 58
    local.set 6
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                call 163
                call 144
                i32.eqz
                if  ;; label = @7
                  call 54
                  local.set 14
                  local.get 0
                  i32.const 56
                  i32.add
                  local.tee 2
                  call 162
                  local.get 0
                  i32.const 8
                  i32.add
                  local.get 2
                  local.get 16
                  call 114
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            call 57
                            local.tee 2
                            call 85
                            br_table 1 (;@11;) 2 (;@10;) 0 (;@12;)
                          end
                          i32.const 1048797
                          i32.const 34
                          call 2
                          unreachable
                        end
                        i32.const -11
                        local.set 3
                        i32.const 2147483646
                        local.set 1
                        i32.const 1059376
                        i32.load8_u
                        local.tee 2
                        i32.eqz
                        br_if 1 (;@9;)
                        i32.const -11
                        i32.const 2147483647
                        local.get 2
                        select
                        local.set 3
                        br 2 (;@8;)
                      end
                      local.get 0
                      i32.const -64
                      i32.sub
                      i64.const 0
                      i64.store
                      local.get 0
                      i64.const 0
                      i64.store offset=56
                      local.get 2
                      i32.const 0
                      local.get 0
                      i32.const 56
                      i32.add
                      local.tee 2
                      i32.const 16
                      call 77
                      local.get 0
                      i32.const 0
                      i32.store offset=120
                      local.get 2
                      local.get 0
                      i32.const 120
                      i32.add
                      local.tee 3
                      local.tee 5
                      call 86
                      local.set 1
                      local.get 2
                      local.get 5
                      call 89
                      local.set 17
                      local.get 2
                      local.get 3
                      call 86
                      local.set 3
                      i32.eqz
                      br_if 1 (;@8;)
                      i32.const 1048906
                      i32.const 29
                      call 2
                      unreachable
                    end
                    i32.const 1059376
                    i32.const 1
                    i32.store8
                    i32.const -11
                    call 30
                  end
                  local.get 0
                  i64.load offset=8
                  i64.const 1
                  i64.ne
                  br_if 1 (;@6;)
                  local.get 0
                  i32.const 48
                  i32.add
                  i32.load
                  local.set 11
                  local.get 0
                  i32.const 40
                  i32.add
                  i32.load
                  local.set 2
                  local.get 0
                  i32.const 32
                  i32.add
                  i64.load
                  local.set 19
                  local.get 0
                  i32.const 28
                  i32.add
                  i32.load
                  local.set 12
                  local.get 0
                  i32.const 24
                  i32.add
                  i32.load
                  local.set 8
                  local.get 0
                  i32.const 52
                  i32.add
                  i32.load
                  local.set 5
                  local.get 0
                  i32.const 44
                  i32.add
                  i32.load
                  local.set 13
                  local.get 0
                  i64.load offset=16
                  local.set 18
                  call 161
                  call 145
                  local.set 7
                  call 160
                  call 145
                  local.set 9
                  local.get 13
                  local.get 6
                  call 82
                  local.tee 4
                  local.get 7
                  call 82
                  local.tee 7
                  local.get 7
                  i64.const 10000
                  call 44
                  call 17
                  local.get 4
                  local.get 4
                  local.get 7
                  call 1
                  local.get 5
                  local.get 6
                  call 164
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 1
                  local.get 2
                  i32.ne
                  if  ;; label = @8
                    local.get 1
                    i32.const 2147483646
                    i32.eq
                    local.get 2
                    i32.const 2147483646
                    i32.eq
                    i32.or
                    br_if 7 (;@1;)
                    local.get 1
                    local.get 2
                    call 46
                    i32.eqz
                    br_if 7 (;@1;)
                  end
                  local.get 17
                  local.get 19
                  i64.ne
                  br_if 6 (;@1;)
                  local.get 3
                  local.get 4
                  call 74
                  i32.eqz
                  br_if 6 (;@1;)
                  call 41
                  local.tee 1
                  call 31
                  local.get 1
                  local.get 8
                  local.get 18
                  i64.const 0
                  call 13
                  call 3
                  local.tee 3
                  call 3
                  call 3
                  call 3
                  local.tee 10
                  call 3
                  local.tee 1
                  i64.const 0
                  call 13
                  local.tee 15
                  call 3
                  call 32
                  local.get 1
                  call 14
                  i32.eqz
                  if  ;; label = @8
                    local.get 1
                    i32.const 1049081
                    i32.const 32
                    call 16
                    drop
                  end
                  local.get 0
                  i32.const 0
                  i32.store16 offset=56
                  local.get 3
                  i32.const 0
                  local.get 0
                  i32.const 56
                  i32.add
                  local.tee 1
                  i32.const 2
                  call 77
                  drop
                  local.get 10
                  call 45
                  local.set 3
                  local.get 0
                  i32.const 32
                  i32.store offset=108
                  local.get 0
                  i32.const 1048935
                  i32.store offset=104
                  local.get 1
                  local.get 3
                  call 72
                  local.get 1
                  call 66
                  local.get 1
                  call 66
                  local.get 1
                  call 66
                  local.get 1
                  i32.const 32
                  call 68
                  local.set 3
                  local.get 0
                  i64.const 0
                  i64.store offset=120
                  local.get 1
                  local.get 0
                  i32.const 120
                  i32.add
                  local.tee 1
                  i32.const 8
                  call 67
                  local.get 1
                  i32.const 8
                  call 64
                  drop
                  local.get 0
                  i32.load offset=72
                  local.get 0
                  i32.load offset=68
                  i32.ne
                  br_if 3 (;@4;)
                  local.get 0
                  i32.load8_u offset=64
                  if  ;; label = @8
                    i32.const 1049364
                    i32.const 0
                    i32.store
                    i32.const 1059368
                    i32.const 0
                    i32.store8
                  end
                  local.get 4
                  local.get 15
                  call 82
                  i64.const 10000
                  call 44
                  call 49
                  local.set 1
                  local.get 4
                  local.get 9
                  call 82
                  i64.const 10000
                  call 44
                  call 49
                  local.set 9
                  call 41
                  local.tee 10
                  i64.const 0
                  call 0
                  local.get 1
                  local.get 10
                  call 75
                  i32.const 255
                  i32.and
                  i32.const 1
                  i32.eq
                  br_if 4 (;@3;)
                  br 5 (;@2;)
                end
                i32.const 1048590
                i32.const 18
                call 50
                unreachable
              end
              i32.const 1048608
              i32.const 15
              call 50
              unreachable
            end
            i32.const 1048623
            i32.const 19
            call 50
            unreachable
          end
          local.get 0
          i32.const 104
          i32.add
          i32.const 1048576
          i32.const 14
          call 71
          unreachable
        end
        local.get 3
        local.get 2
        local.get 17
        local.get 1
        call 53
      end
      call 41
      local.tee 3
      local.get 4
      local.get 1
      call 81
      local.get 11
      local.get 2
      local.get 17
      local.get 3
      local.get 9
      call 80
      local.get 7
      call 80
      call 53
      local.get 14
      local.get 8
      local.get 18
      local.get 12
      local.get 6
      call 82
      call 51
      block  ;; label = @2
        local.get 5
        local.get 6
        call 74
        i32.eqz
        if  ;; label = @3
          local.get 5
          local.get 5
          local.get 6
          call 81
          local.get 0
          i32.const 104
          i32.add
          local.tee 4
          call 162
          local.get 0
          i32.const 148
          i32.add
          local.get 13
          i32.store
          local.get 0
          i32.const 144
          i32.add
          local.get 2
          i32.store
          local.get 0
          local.get 5
          i32.store offset=156
          local.get 0
          local.get 11
          i32.store offset=152
          local.get 0
          local.get 17
          i64.store offset=136
          local.get 0
          local.get 12
          i32.store offset=132
          local.get 0
          local.get 8
          i32.store offset=128
          local.get 0
          local.get 18
          i64.store offset=120
          local.get 0
          i32.const 56
          i32.add
          local.get 4
          local.get 16
          local.get 0
          i32.const 120
          i32.add
          call 116
          br 1 (;@2;)
        end
        local.get 0
        i32.const 120
        i32.add
        local.tee 4
        call 162
        local.get 0
        i32.const 56
        i32.add
        local.tee 2
        local.get 4
        local.get 16
        call 129
        local.get 2
        call 158
        local.get 2
        local.get 16
        call 148
      end
      local.get 1
      call 33
      local.get 0
      i32.const 160
      i32.add
      global.set 0
      return
    end
    i32.const 1048642
    i32.const 19
    call 50
    unreachable)
  (func (;170;) (type 2)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 0
    global.set 0
    call 29
    call 56
    i32.const 1
    call 61
    call 59
    call 60
    local.set 4
    local.get 0
    i32.const 8
    i32.add
    call 157
    local.get 0
    i32.load offset=12
    local.set 1
    local.get 0
    i32.load offset=8
    local.tee 5
    local.get 4
    call 136
    i32.eqz
    if  ;; label = @1
      local.get 0
      i32.const 16
      i32.add
      local.get 1
      call 142
      call 100
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
        i32.const 1049009
        i32.const 11
        local.get 0
        i32.load offset=24
        local.tee 3
        call 125
        call 95
        local.get 1
        local.get 3
        local.get 0
        i32.load
        local.get 2
        call 124
      end
      local.get 1
      local.get 2
      local.get 3
      i32.const 0
      call 124
      local.get 0
      local.get 2
      i32.store offset=24
      local.get 1
      i32.const 1049020
      i32.const 6
      local.get 2
      call 125
      local.set 3
      block  ;; label = @2
        local.get 4
        i32.const 2147483646
        i32.ne
        if  ;; label = @3
          local.get 3
          local.get 4
          call 23
          drop
          br 1 (;@2;)
        end
        local.get 3
        i32.const 1048967
        i32.const 4
        call 107
      end
      local.get 0
      local.get 6
      i32.const 1
      i32.add
      i32.store offset=16
      local.get 0
      i32.const 40
      i32.add
      local.get 0
      i32.const 24
      i32.add
      i64.load
      i64.store
      local.get 0
      local.get 0
      i64.load offset=16
      i64.store offset=32
      local.get 1
      call 142
      local.get 0
      i32.const 32
      i32.add
      call 106
      local.get 5
      local.get 4
      call 134
      local.get 2
      i64.extend_i32_u
      call 126
    end
    local.get 0
    i32.const 48
    i32.add
    global.set 0)
  (func (;171;) (type 2)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 0
    global.set 0
    call 29
    call 56
    i32.const 1
    call 61
    call 59
    local.set 4
    local.get 0
    i32.const 8
    i32.add
    call 156
    local.get 0
    i32.load offset=12
    local.set 1
    local.get 0
    i32.load offset=8
    local.tee 5
    local.get 4
    call 137
    i32.eqz
    if  ;; label = @1
      local.get 0
      i32.const 16
      i32.add
      local.get 1
      call 142
      call 100
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
        i32.const 1049009
        i32.const 11
        local.get 0
        i32.load offset=24
        local.tee 3
        call 125
        call 95
        local.get 1
        local.get 3
        local.get 0
        i32.load
        local.get 2
        call 124
      end
      local.get 1
      local.get 2
      local.get 3
      i32.const 0
      call 124
      local.get 0
      i32.const 24
      i32.add
      local.tee 3
      local.get 2
      i32.store
      local.get 1
      i32.const 1049020
      i32.const 6
      local.get 2
      call 125
      local.get 4
      call 23
      drop
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
      call 142
      local.get 0
      i32.const 32
      i32.add
      call 106
      local.get 5
      local.get 4
      call 132
      local.get 2
      i64.extend_i32_u
      call 126
    end
    local.get 0
    i32.const 48
    i32.add
    global.set 0)
  (func (;172;) (type 2)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64)
    global.get 0
    i32.const 128
    i32.sub
    local.tee 0
    global.set 0
    i32.const 1059372
    call 12
    i32.store
    i32.const 1059372
    i32.load
    i32.const 3
    i32.lt_s
    if  ;; label = @1
      i32.const 1048831
      i32.const 17
      call 2
      unreachable
    end
    call 59
    call 60
    local.set 8
    i32.const 1
    call 11
    local.set 17
    i32.const 2
    call 58
    local.set 10
    local.get 0
    i32.const 3
    i32.store offset=24
    local.get 0
    i32.const 16
    i32.add
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.const 24
      i32.add
      local.tee 1
      i32.load
      local.tee 4
      i32.const 1059372
      i32.load
      i32.ge_s
      if  ;; label = @2
        i32.const 1
        local.set 3
        br 1 (;@1;)
      end
      local.get 1
      local.get 4
      i32.const 1
      i32.add
      i32.store
      local.get 4
      call 58
      local.set 1
    end
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    local.get 3
    i32.store
    local.get 0
    i32.load offset=20
    local.set 4
    local.get 0
    i32.load offset=16
    local.set 11
    i32.const 1059372
    i32.load
    local.get 0
    i32.load offset=24
    i32.gt_s
    if  ;; label = @1
      i32.const 1048848
      i32.const 18
      call 2
      unreachable
    end
    block  ;; label = @1
      call 163
      call 144
      i32.eqz
      if  ;; label = @2
        call 54
        local.set 12
        call 57
        local.tee 7
        call 85
        i32.const 1
        i32.eq
        if  ;; label = @3
          i32.const 1
          local.set 1
          local.get 7
          call 14
          local.set 13
          local.get 0
          i32.const 32
          i32.add
          local.set 14
          loop  ;; label = @4
            local.get 5
            i32.const 16
            i32.add
            local.tee 2
            local.get 13
            i32.gt_u
            br_if 3 (;@1;)
            local.get 14
            i64.const 0
            i64.store
            local.get 0
            i64.const 0
            i64.store offset=24
            local.get 7
            local.get 5
            local.get 0
            i32.const 24
            i32.add
            local.tee 5
            i32.const 16
            call 77
            drop
            local.get 0
            i32.const 0
            i32.store offset=88
            local.get 1
            local.get 5
            local.get 0
            i32.const 88
            i32.add
            local.tee 1
            call 86
            local.set 9
            local.get 5
            local.get 1
            call 89
            local.set 18
            local.get 5
            local.get 1
            call 86
            local.set 6
            local.get 2
            local.set 5
            i32.const 0
            local.set 1
            br_if 0 (;@4;)
          end
          call 173
          unreachable
        end
        i32.const 1048797
        i32.const 34
        call 2
        unreachable
      end
      i32.const 1048590
      i32.const 18
      call 50
      unreachable
    end
    local.get 0
    i32.const 8
    i32.add
    call 157
    block (result i32)  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=8
          local.get 8
          call 136
          if  ;; label = @4
            local.get 0
            call 156
            local.get 0
            i32.load
            local.get 9
            call 137
            i32.eqz
            br_if 1 (;@3;)
            local.get 6
            call 40
            local.set 5
            i64.const 1
            call 44
            local.get 11
            br_if 3 (;@1;)
            drop
            local.get 4
            call 34
            i32.const 0
            i32.le_s
            if  ;; label = @5
              i32.const 1048719
              i32.const 31
              call 50
              unreachable
            end
            local.get 6
            local.get 4
            call 164
            br_if 2 (;@2;)
            i32.const 1048750
            i32.const 47
            call 50
            unreachable
          end
          i32.const 1048701
          i32.const 18
          call 50
          unreachable
        end
        i32.const 1048701
        i32.const 18
        call 50
        unreachable
      end
      call 41
      local.tee 5
      local.get 6
      local.get 4
      call 17
      local.get 4
    end
    local.set 4
    local.get 0
    i32.const 24
    i32.add
    call 158
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 32
          i32.add
          local.tee 2
          i32.load
          call 98
          if  ;; label = @4
            local.get 0
            i32.const 24
            i32.add
            local.tee 1
            call 158
            local.get 0
            i32.load offset=28
            local.get 2
            i32.load
            i32.const 1
            call 141
            local.set 15
            local.get 1
            call 158
            local.get 1
            local.get 15
            call 149
            local.tee 1
            i32.eqz
            br_if 2 (;@2;)
            local.get 0
            i32.const 32
            i32.add
            i32.load
            local.tee 3
            call 98
            local.tee 2
            local.get 1
            i32.lt_u
            br_if 3 (;@1;)
            local.get 1
            local.get 2
            i32.eq
            local.tee 6
            br_if 1 (;@3;)
            local.get 0
            i32.load offset=28
            local.tee 7
            local.get 3
            local.get 2
            call 141
            local.set 16
            local.get 3
            call 98
            local.get 1
            i32.lt_u
            br_if 3 (;@1;)
            local.get 7
            local.get 1
            call 140
            local.get 16
            call 126
            br 1 (;@3;)
          end
          call 159
          call 99
          local.set 15
          call 159
          local.get 15
          i64.const 1
          i64.add
          call 126
          br 1 (;@2;)
        end
        local.get 3
        call 98
        local.get 2
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=28
        local.get 2
        call 140
        call 109
        local.get 3
        local.get 2
        i32.const 1
        i32.sub
        call 138
        local.get 6
        i32.eqz
        if  ;; label = @3
          local.get 0
          i32.const 24
          i32.add
          local.get 16
          local.get 1
          call 150
        end
        local.get 0
        i32.const 24
        i32.add
        local.get 15
        call 147
        call 109
      end
      local.get 0
      i32.const 72
      i32.add
      local.tee 1
      call 162
      local.get 0
      i32.const 116
      i32.add
      local.get 10
      i32.store
      local.get 0
      i32.const 112
      i32.add
      local.get 8
      i32.store
      local.get 0
      local.get 4
      i32.store offset=124
      local.get 0
      local.get 12
      i32.store offset=120
      local.get 0
      local.get 17
      i64.store offset=104
      local.get 0
      local.get 5
      i32.store offset=100
      local.get 0
      local.get 9
      i32.store offset=96
      local.get 0
      local.get 18
      i64.store offset=88
      local.get 0
      i32.const 24
      i32.add
      local.get 1
      local.get 15
      local.get 0
      i32.const 88
      i32.add
      call 116
      local.get 15
      call 35
      local.get 0
      i32.const 128
      i32.add
      global.set 0
      return
    end
    i32.const 1048986
    i32.const 18
    call 2
    unreachable)
  (func (;173;) (type 2)
    call 184
    unreachable)
  (func (;174;) (type 2)
    (local i32 i32 i32 i32 i32 i32 i32 i64 i64)
    global.get 0
    i32.const 112
    i32.sub
    local.tee 0
    global.set 0
    call 29
    i32.const 1
    call 61
    i32.const 0
    call 11
    local.set 7
    block  ;; label = @1
      block  ;; label = @2
        call 163
        call 144
        i32.eqz
        if  ;; label = @3
          local.get 0
          i32.const 48
          i32.add
          local.tee 1
          call 162
          local.get 0
          local.get 1
          local.get 7
          call 114
          call 54
          local.set 1
          call 55
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
          call 46
          i32.eqz
          if  ;; label = @4
            local.get 1
            local.get 2
            call 46
            i32.eqz
            br_if 3 (;@1;)
          end
          local.get 6
          local.get 5
          local.get 8
          local.get 4
          local.get 3
          call 48
          call 51
          local.get 0
          i32.const 96
          i32.add
          local.tee 2
          call 162
          local.get 0
          i32.const 48
          i32.add
          local.tee 1
          local.get 2
          local.get 7
          call 129
          local.get 1
          call 158
          local.get 1
          local.get 7
          call 148
          local.get 0
          i32.const 112
          i32.add
          global.set 0
          return
        end
        i32.const 1048590
        i32.const 18
        call 50
        unreachable
      end
      i32.const 1048608
      i32.const 15
      call 50
      unreachable
    end
    i32.const 1048661
    i32.const 40
    call 50
    unreachable)
  (func (;175;) (type 2)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 0
    global.set 0
    call 29
    i32.const 0
    call 61
    local.get 0
    call 162
    local.get 0
    i32.const 16
    i32.add
    local.get 0
    i32.const 8
    i32.add
    i32.load
    call 122
    local.get 0
    i64.load32_u offset=16
    call 35
    local.get 0
    i32.const 32
    i32.add
    global.set 0)
  (func (;176;) (type 2)
    (local i32 i32)
    call 29
    call 56
    i32.const 2
    call 61
    i32.const 0
    call 58
    local.set 0
    i32.const 1
    call 58
    local.set 1
    call 161
    local.get 1
    call 146
    call 160
    local.get 0
    call 146)
  (func (;177;) (type 2)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    call 29
    call 56
    i32.const 0
    call 61
    call 163
    call 163
    call 144
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
    call 154
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call 107
    local.get 0
    i32.const 16
    i32.add
    global.set 0)
  (func (;178;) (type 2)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    call 29
    i32.const 0
    call 61
    local.get 0
    call 158
    local.get 0
    i32.const 8
    i32.add
    i32.load
    call 98
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
        call 139
        call 35
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
  (func (;179;) (type 2)
    call 29
    i32.const 0
    call 61
    call 159
    call 99
    call 35)
  (func (;180;) (type 2)
    call 29
    i32.const 0
    call 61
    call 163
    call 144
    i64.extend_i32_u
    call 36)
  (func (;181;) (type 2)
    (local i32 i32 i32 i32 i64)
    global.get 0
    i32.const 160
    i32.sub
    local.tee 0
    global.set 0
    call 29
    i32.const 1
    call 61
    i32.const 0
    call 11
    local.set 4
    local.get 0
    i32.const 16
    i32.add
    local.tee 1
    call 162
    local.get 0
    i32.const 72
    i32.add
    local.get 1
    local.get 4
    call 114
    call 161
    call 145
    local.set 2
    block  ;; label = @1
      local.get 0
      i64.load offset=72
      i64.const 1
      i64.ne
      if  ;; label = @2
        i32.const 1049260
        i32.const 0
        call 37
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
      call 185
      local.get 0
      i32.const 24
      i32.add
      local.tee 3
      local.get 4
      local.get 1
      local.get 2
      call 47
      local.get 0
      i64.const 1
      i64.store offset=16
      local.get 0
      i32.const 8
      i32.add
      call 103
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
      call 152
      local.get 3
      local.get 2
      call 167
      local.get 0
      i32.load offset=72
      local.get 0
      i32.load8_u offset=76
      call 151
    end
    local.get 0
    i32.const 160
    i32.add
    global.set 0)
  (func (;182;) (type 2)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64)
    global.get 0
    i32.const 320
    i32.sub
    local.tee 0
    global.set 0
    call 29
    i32.const 2
    call 61
    i32.const 0
    call 11
    local.set 13
    i32.const 1
    call 11
    local.set 14
    call 52
    local.set 8
    call 161
    call 145
    local.set 4
    local.get 0
    i32.const 160
    i32.add
    call 162
    local.get 0
    i32.const 272
    i32.add
    local.get 0
    i32.const 168
    i32.add
    i32.load
    call 122
    local.get 0
    i32.load offset=276
    local.set 1
    local.get 0
    i32.const 280
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
            i32.const 152
            i32.add
            local.get 0
            i32.load offset=168
            local.tee 3
            local.get 1
            call 123
            local.get 0
            i32.load offset=156
            local.set 9
            local.get 0
            i32.const 272
            i32.add
            local.get 0
            i32.const 160
            i32.add
            local.get 3
            local.get 1
            call 131
            local.tee 11
            call 114
            local.get 0
            i64.load offset=272
            i64.eqz
            br_if 1 (;@3;)
            local.get 0
            i32.const 176
            i32.add
            local.get 5
            i32.const 40
            call 185
            local.get 12
            local.get 13
            i64.lt_u
            br_if 2 (;@2;)
            local.get 12
            local.get 14
            i64.ge_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 272
            i32.add
            local.tee 1
            local.get 0
            i32.const 176
            i32.add
            i32.const 40
            call 185
            local.get 0
            i32.const 216
            i32.add
            local.get 11
            local.get 1
            local.get 4
            call 47
            local.get 1
            call 186
            local.get 0
            local.get 0
            i64.load offset=216
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
            i64.store offset=264
            local.get 0
            i32.const 144
            i32.add
            local.get 1
            i32.const 0
            i32.const 8
            call 166
            local.get 0
            i32.load offset=144
            local.get 0
            i32.load offset=148
            local.get 0
            i32.const 264
            i32.add
            local.tee 3
            i32.const 8
            call 88
            local.get 0
            local.get 0
            i32.load offset=240
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
            i32.store offset=264
            local.get 0
            i32.const 136
            i32.add
            local.get 1
            i32.const 8
            i32.const 12
            call 166
            local.get 0
            i32.load offset=136
            local.get 0
            i32.load offset=140
            local.get 3
            i32.const 4
            call 88
            local.get 0
            local.get 0
            i32.load offset=244
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
            i32.store offset=264
            local.get 0
            i32.const 128
            i32.add
            local.get 1
            i32.const 12
            i32.const 16
            call 166
            local.get 0
            i32.load offset=128
            local.get 0
            i32.load offset=132
            local.get 3
            i32.const 4
            call 88
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
            i64.store offset=264
            local.get 0
            i32.const 120
            i32.add
            local.get 1
            i32.const 16
            i32.const 24
            call 166
            local.get 0
            i32.load offset=120
            local.get 0
            i32.load offset=124
            local.get 3
            i32.const 8
            call 88
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
            i32.store offset=264
            local.get 0
            i32.const 112
            i32.add
            local.get 1
            i32.const 24
            i32.const 28
            call 166
            local.get 0
            i32.load offset=112
            local.get 0
            i32.load offset=116
            local.get 3
            i32.const 4
            call 88
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
            i32.store offset=264
            local.get 0
            i32.const 104
            i32.add
            local.get 1
            i32.const 28
            i32.const 32
            call 166
            local.get 0
            i32.load offset=104
            local.get 0
            i32.load offset=108
            local.get 3
            i32.const 4
            call 88
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
            i64.store offset=264
            local.get 0
            i32.const 96
            i32.add
            local.get 1
            i32.const 32
            i32.const 40
            call 166
            local.get 0
            i32.load offset=96
            local.get 0
            i32.load offset=100
            local.get 3
            i32.const 8
            call 88
            local.get 0
            local.get 0
            i32.load offset=256
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
            i32.store offset=264
            local.get 0
            i32.const 88
            i32.add
            local.get 1
            i32.const 40
            i32.const 44
            call 166
            local.get 0
            i32.load offset=88
            local.get 0
            i32.load offset=92
            local.get 3
            i32.const 4
            call 88
            local.get 0
            local.get 0
            i32.load offset=260
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
            i32.store offset=264
            local.get 0
            i32.const 80
            i32.add
            local.get 1
            i32.const 44
            i32.const 48
            call 166
            local.get 0
            i32.load offset=80
            local.get 0
            i32.load offset=84
            local.get 3
            i32.const 4
            call 88
            local.get 8
            local.get 1
            i32.const 48
            call 15
            drop
            br 2 (;@2;)
          end
          local.get 0
          i32.const 72
          i32.add
          call 103
          local.get 0
          local.get 0
          i32.load8_u offset=76
          i32.store8 offset=180
          local.get 0
          local.get 0
          i32.load offset=72
          i32.store offset=176
          local.get 8
          call 14
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
              i32.const 272
              i32.add
              local.tee 3
              call 186
              local.get 8
              local.get 1
              local.get 3
              i32.const 48
              call 77
              drop
              local.get 0
              i64.const 0
              i64.store offset=216
              local.get 0
              i32.const -64
              i32.sub
              local.get 3
              i32.const 0
              i32.const 8
              call 165
              local.get 0
              i32.const 216
              i32.add
              local.tee 1
              i32.const 8
              local.get 0
              i32.load offset=64
              local.get 0
              i32.load offset=68
              call 88
              local.get 0
              i64.load offset=216
              local.set 11
              local.get 0
              i32.const 0
              i32.store offset=216
              local.get 0
              i32.const 56
              i32.add
              local.get 3
              i32.const 8
              i32.const 12
              call 165
              local.get 1
              i32.const 4
              local.get 0
              i32.load offset=56
              local.get 0
              i32.load offset=60
              call 88
              local.get 0
              i32.load offset=216
              local.set 2
              local.get 0
              i32.const 0
              i32.store offset=216
              local.get 0
              i32.const 48
              i32.add
              local.get 3
              i32.const 12
              i32.const 16
              call 165
              local.get 1
              i32.const 4
              local.get 0
              i32.load offset=48
              local.get 0
              i32.load offset=52
              call 88
              local.get 0
              i32.load offset=216
              local.set 4
              local.get 0
              i64.const 0
              i64.store offset=216
              local.get 0
              i32.const 40
              i32.add
              local.get 3
              i32.const 16
              i32.const 24
              call 165
              local.get 1
              i32.const 8
              local.get 0
              i32.load offset=40
              local.get 0
              i32.load offset=44
              call 88
              local.get 0
              i64.load offset=216
              local.set 12
              local.get 0
              i32.const 0
              i32.store offset=216
              local.get 0
              i32.const 32
              i32.add
              local.get 3
              i32.const 24
              i32.const 28
              call 165
              local.get 1
              i32.const 4
              local.get 0
              i32.load offset=32
              local.get 0
              i32.load offset=36
              call 88
              local.get 0
              i32.load offset=216
              local.set 5
              local.get 0
              i32.const 0
              i32.store offset=216
              local.get 0
              i32.const 24
              i32.add
              local.get 3
              i32.const 28
              i32.const 32
              call 165
              local.get 1
              i32.const 4
              local.get 0
              i32.load offset=24
              local.get 0
              i32.load offset=28
              call 88
              local.get 0
              i32.load offset=216
              local.set 6
              local.get 0
              i64.const 0
              i64.store offset=216
              local.get 0
              i32.const 16
              i32.add
              local.get 3
              i32.const 32
              i32.const 40
              call 165
              local.get 1
              i32.const 8
              local.get 0
              i32.load offset=16
              local.get 0
              i32.load offset=20
              call 88
              local.get 0
              i64.load offset=216
              local.set 13
              local.get 0
              i32.const 0
              i32.store offset=216
              local.get 0
              i32.const 8
              i32.add
              local.get 3
              i32.const 40
              i32.const 44
              call 165
              local.get 1
              i32.const 4
              local.get 0
              i32.load offset=8
              local.get 0
              i32.load offset=12
              call 88
              local.get 0
              i32.load offset=216
              local.set 7
              local.get 0
              i32.const 0
              i32.store offset=216
              local.get 0
              local.get 3
              i32.const 44
              i32.const 48
              call 165
              local.get 1
              i32.const 4
              local.get 0
              i32.load
              local.get 0
              i32.load offset=4
              call 88
              local.get 0
              i32.load offset=216
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
              i32.store offset=312
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
              i32.store offset=308
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
              i32.store offset=304
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
              i32.store offset=300
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
              i32.store offset=296
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
              i64.store offset=288
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
              i64.store offset=280
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
              i64.store offset=272
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
              i32.store offset=316
              local.get 3
              local.get 0
              i32.const 176
              i32.add
              call 167
              local.get 9
              local.set 1
              br 1 (;@4;)
            end
          end
          local.get 0
          i32.load offset=176
          local.get 0
          i32.load8_u offset=180
          call 151
          local.get 0
          i32.const 320
          i32.add
          global.set 0
          return
        end
        call 184
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
  (func (;183;) (type 2)
    nop)
  (func (;184;) (type 2)
    i32.const 1049344
    i32.const 14
    call 2
    unreachable)
  (func (;185;) (type 5) (param i32 i32 i32)
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
  (func (;186;) (type 3) (param i32)
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
  (global (;1;) i32 (i32.const 1059381))
  (global (;2;) i32 (i32.const 1059392))
  (export "memory" (memory 0))
  (export "init" (func 168))
  (export "acceptOffer" (func 169))
  (export "addAcceptedPayment" (func 170))
  (export "addAcceptedToken" (func 171))
  (export "addOffer" (func 172))
  (export "cancelOffer" (func 174))
  (export "numberOfOffers" (func 175))
  (export "setFees" (func 176))
  (export "togglePause" (func 177))
  (export "viewEmptyOfferIndexes" (func 178))
  (export "viewHighestOfferIndex" (func 179))
  (export "viewIsPaused" (func 180))
  (export "viewOffer" (func 181))
  (export "viewOffers" (func 182))
  (export "callBack" (func 183))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (data (;0;) (i32.const 1048576) "input too longContract is pausedOffer not foundNot enough quantityWrong token paymentOnly special addresses can cancel offersToken not acceptedQuantity must be greater than 0Quantity must be less than offered token amountincorrect number of ESDT transferstoo few argumentstoo many argumentswrong number of argumentsinput too shortManagedVec index out of rangeerror decoding ESDT attributes: EGLD.mapped.node_idindex out of range.item.node_links.value.info.indexinput out of rangestorage decode error: .len")
  (data (;1;) (i32.const 1049113) "accepted_tokensaccepted_paymentsempty_offer_indexeshighest_offer_indexpercentage_from_adder_to_ownerpercentage_from_accepter_to_ownerofferspause\00\00\00Endpoint can only be called by ownercannot subtract because result would be negativepanic occurred")
  (data (;2;) (i32.const 1049360) "\9c\ff\ff\ff"))
