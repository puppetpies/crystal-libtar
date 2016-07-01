@[Link("tar")]
lib LibTar
  struct Tar
    type : TartypeT*
    pathname : LibC::Char*
    fd : LibC::Long
    oflags : LibC::Int
    options : LibC::Int
    th_buf : TarHeader
    h : LibtarHashT*
    th_pathname : LibC::Char*
  end
  struct TartypeT
    openfunc : OpenfuncT
    closefunc : ClosefuncT
    readfunc : ReadfuncT
    writefunc : WritefuncT
  end
  alias OpenfuncT = (LibC::Char*, LibC::Int -> LibC::Int)
  alias ClosefuncT = (LibC::Int -> LibC::Int)
  alias X__SsizeT = LibC::Long
  alias SsizeT = X__SsizeT
  alias ReadfuncT = (LibC::Int, Void*, LibC::SizeT -> SsizeT)
  alias WritefuncT = (LibC::Int, Void*, LibC::SizeT -> SsizeT)
  struct TarHeader
    name : LibC::Char[100]
    mode : LibC::Char[8]
    uid : LibC::Char[8]
    gid : LibC::Char[8]
    size : LibC::Char[12]
    mtime : LibC::Char[12]
    chksum : LibC::Char[8]
    typeflag : LibC::Char
    linkname : LibC::Char[100]
    magic : LibC::Char[6]
    version : LibC::Char[2]
    uname : LibC::Char[32]
    gname : LibC::Char[32]
    devmajor : LibC::Char[8]
    devminor : LibC::Char[8]
    prefix : LibC::Char[155]
    padding : LibC::Char[12]
    gnu_longname : LibC::Char*
    gnu_longlink : LibC::Char*
  end
  struct LibtarHash
    numbuckets : LibC::Int
    table : LibtarListT**
    hashfunc : LibtarHashfuncT
    nents : LibC::UInt
  end
  type LibtarHashT = LibtarHash
  struct LibtarList
    first : LibtarListptrT
    last : LibtarListptrT
    cmpfunc : LibtarCmpfuncT
    flags : LibC::Int
    nents : LibC::UInt
  end
  type LibtarListT = LibtarList
  struct LibtarNode
    data : Void*
    next : LibtarNode*
    prev : LibtarNode*
  end
  alias LibtarListptrT = LibtarNode*
  alias LibtarCmpfuncT = (Void*, Void* -> LibC::Int)
  alias LibtarHashfuncT = (Void*, LibC::UInt -> LibC::UInt)
  fun tar_open(t : Tar**, pathname : LibC::Char*, type : TartypeT*, oflags : LibC::Int, mode : LibC::Int, options : LibC::Int) : LibC::Int
  fun tar_fdopen(t : Tar**, fd : LibC::Int, pathname : LibC::Char*, type : TartypeT*, oflags : LibC::Int, mode : LibC::Int, options : LibC::Int) : LibC::Int
  fun tar_fd(t : Tar*) : LibC::Int
  fun tar_close(t : Tar*) : LibC::Int
  alias TarDev = Void
  fun tar_dev_free(tdp : TarDev*)
  fun tar_append_file(t : Tar*, realname : LibC::Char*, savename : LibC::Char*) : LibC::Int
  fun tar_append_eof(t : Tar*) : LibC::Int
  fun tar_append_regfile(t : Tar*, realname : LibC::Char*) : LibC::Int
  fun th_read(t : Tar*) : LibC::Int
  fun th_write(t : Tar*) : LibC::Int
  alias X__ModeT = LibC::UInt
  alias ModeT = X__ModeT
  fun th_set_type(t : Tar*, mode : ModeT)
  fun th_set_path(t : Tar*, pathname : LibC::Char*)
  fun th_set_link(t : Tar*, linkname : LibC::Char*)
  alias X__DevT = LibC::ULong
  alias DevT = X__DevT
  fun th_set_device(t : Tar*, device : DevT)
  alias X__UidT = LibC::UInt
  alias UidT = X__UidT
  fun th_set_user(t : Tar*, uid : UidT)
  alias X__GidT = LibC::UInt
  alias GidT = X__GidT
  fun th_set_group(t : Tar*, gid : GidT)
  fun th_set_mode(t : Tar*, fmode : ModeT)
  struct Stat
    st_dev : X__DevT
    st_ino : X__InoT
    st_nlink : X__NlinkT
    st_mode : X__ModeT
    st_uid : X__UidT
    st_gid : X__GidT
    __pad0 : LibC::Int
    st_rdev : X__DevT
    st_size : X__OffT
    st_blksize : X__BlksizeT
    st_blocks : X__BlkcntT
    st_atim : Timespec
    st_mtim : Timespec
    st_ctim : Timespec
    __glibc_reserved : X__SyscallSlongT[3]
  end
  alias X__InoT = LibC::ULong
  alias X__NlinkT = LibC::ULong
  alias X__OffT = LibC::Long
  alias X__BlksizeT = LibC::Long
  alias X__BlkcntT = LibC::Long
  struct Timespec
    tv_sec : X__TimeT
    tv_nsec : X__SyscallSlongT
  end
  alias X__TimeT = LibC::Long
  alias X__SyscallSlongT = LibC::Long
  fun th_set_from_stat(t : Tar*, s : Stat*)
  fun th_finish(t : Tar*)
  fun tar_extract_file(t : Tar*, realname : LibC::Char*) : LibC::Int
  fun tar_extract_dir(t : Tar*, realname : LibC::Char*) : LibC::Int
  fun tar_extract_hardlink(t : Tar*, realname : LibC::Char*) : LibC::Int
  fun tar_extract_symlink(t : Tar*, realname : LibC::Char*) : LibC::Int
  fun tar_extract_chardev(t : Tar*, realname : LibC::Char*) : LibC::Int
  fun tar_extract_blockdev(t : Tar*, realname : LibC::Char*) : LibC::Int
  fun tar_extract_fifo(t : Tar*, realname : LibC::Char*) : LibC::Int
  fun tar_extract_regfile(t : Tar*, realname : LibC::Char*) : LibC::Int
  fun tar_skip_regfile(t : Tar*) : LibC::Int
  fun th_print(t : Tar*)
  fun th_print_long_ls(t : Tar*)
  fun path_hashfunc(key : LibC::Char*, numbuckets : LibC::Int) : LibC::Int
  fun dev_match(dev1 : DevT*, dev2 : DevT*) : LibC::Int
  alias InoT = X__InoT
  fun ino_match(ino1 : InoT*, ino2 : InoT*) : LibC::Int
  fun dev_hash(dev : DevT*) : LibC::Int
  fun ino_hash(inode : InoT*) : LibC::Int
  fun mkdirhier(path : LibC::Char*) : LibC::Int
  fun th_crc_calc(t : Tar*) : LibC::Int
  fun th_signed_crc_calc(t : Tar*) : LibC::Int
  fun oct_to_int(oct : LibC::Char*) : LibC::Int
  fun int_to_oct_nonull(num : LibC::Int, oct : LibC::Char*, octlen : LibC::SizeT)
  fun tar_extract_glob(t : Tar*, globname : LibC::Char*, prefix : LibC::Char*) : LibC::Int
  fun tar_extract_all(t : Tar*, prefix : LibC::Char*) : LibC::Int
  fun tar_append_tree(t : Tar*, realdir : LibC::Char*, savedir : LibC::Char*) : LibC::Int
  fun libtar_listptr_reset(x0 : LibtarListptrT*)
  fun libtar_listptr_data(x0 : LibtarListptrT*) : Void*
  alias LibtarIterateFuncT = (Void*, Void* -> LibC::Int)
  fun libtar_list_iterate(x0 : LibtarListT*, x1 : LibtarIterateFuncT, x2 : Void*) : LibC::Int
  alias LibtarFreefuncT = (Void* -> Void)
  fun libtar_list_empty(x0 : LibtarListT*, x1 : LibtarFreefuncT)
  fun libtar_list_free(x0 : LibtarListT*, x1 : LibtarFreefuncT)
  fun libtar_list_add(x0 : LibtarListT*, x1 : Void*) : LibC::Int
  fun libtar_list_del(x0 : LibtarListT*, x1 : LibtarListptrT*)
  fun libtar_list_next(x0 : LibtarListT*, x1 : LibtarListptrT*) : LibC::Int
  fun libtar_list_prev(x0 : LibtarListT*, x1 : LibtarListptrT*) : LibC::Int
  alias LibtarMatchfuncT = (Void*, Void* -> LibC::Int)
  fun libtar_list_search(x0 : LibtarListT*, x1 : LibtarListptrT*, x2 : Void*, x3 : LibtarMatchfuncT) : LibC::Int
  fun libtar_list_add_str(x0 : LibtarListT*, x1 : LibC::Char*, x2 : LibC::Char*) : LibC::Int
  fun libtar_str_match(x0 : LibC::Char*, x1 : LibC::Char*) : LibC::Int
  struct LibtarHashptr
    bucket : LibC::Int
    node : LibtarListptrT
  end
  type LibtarHashptrT = LibtarHashptr
  fun libtar_hashptr_reset(x0 : LibtarHashptrT*)
  fun libtar_hashptr_data(x0 : LibtarHashptrT*) : Void*
  fun libtar_hash_empty(x0 : LibtarHashT*, x1 : LibtarFreefuncT)
  fun libtar_hash_free(x0 : LibtarHashT*, x1 : LibtarFreefuncT)
  fun libtar_hash_next(x0 : LibtarHashT*, x1 : LibtarHashptrT*) : LibC::Int
  fun libtar_hash_search(x0 : LibtarHashT*, x1 : LibtarHashptrT*, x2 : Void*, x3 : LibtarMatchfuncT) : LibC::Int
  fun libtar_hash_getkey(x0 : LibtarHashT*, x1 : LibtarHashptrT*, x2 : Void*, x3 : LibtarMatchfuncT) : LibC::Int
  fun libtar_hash_add(x0 : LibtarHashT*, x1 : Void*) : LibC::Int
  fun libtar_hash_del(x0 : LibtarHashT*, x1 : LibtarHashptrT*) : LibC::Int
  fun libtar_list_nents(x0 : LibtarListT*) : LibC::UInt
  fun libtar_str_hashfunc(x0 : LibC::Char*, x1 : LibC::UInt) : LibC::UInt
  fun libtar_hash_nents(x0 : LibtarHashT*) : LibC::UInt
end
