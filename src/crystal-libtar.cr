require "./crystal-libtar/*"

module Archiver
  
  class Tar
    
    property? t : Pointer(Pointer(LibTar::Tar))
    
    def initialize
      @t = uninitialized Pointer(Pointer(LibTar::Tar))
    end
    
    def set_tartype(type)
      case type
      when "openfunc"
        r = LibTar::TartypeT.new.openfunc
      when "closefunc"
        r = LibTar::TartypeT.new.closefunc
      when "readfunc"
        r = LibTar::TartypeT.new.readfunc
      when "writefunc"
        r = LibTar::TartypeT.new.writefunc
      else
        r = LibTar::TartypeT.new.openfunc
      end
      return r
    end
    
    def open(pathname : String, type, oflags : Int32, mode : Int32, options : Int32)
      m = LibTar::TartypeT.new
      t_type = pointerof(m) # set_tartype(type)
      LibTar.tar_open(@t, pathname, t_type, oflags, mode, options)
    end

    def openfd(fd : Int32, pathname : String, type, oflags : Int32, mode : Int32, options : Int32)
      m = LibTar::TartypeT.new
      t_type = pointerof(m) # set_tartype(type)
      LibTar.tar_openfd(@t, fd, pathname, t_type, oflags, mode, options)
    end
    
    def append_file(realname : String, savefile : String)
      LibTar.tar_append_file(@t, realname, savefile)
    end

    def append_regfile(realname : String)
      LibTar.tar_append_regfile(@t, realname)
    end

    def extract_file(realname : String) : Int32
      LibTar.tar_extract_file(@t, realname)
    end
    
    def extract_dir(realname : String) : Int32
      LibTar.tar_extract_dir(@t, realname)
    end
    
    def extract_hardlink(realname : String) : Int32
      LibTar.tar_extract_hardlink(@t, realname)
    end
    
    def extract_symlink(realname : String) : Int32
      LibTar.tar_extract_symlink(@t, realname)
    end
    
    def extract_chardev(realname : String) : Int32
      LibTar.tar_extract_symlink(@t, realname)
    end
    
    def extract_blockdev(realname : String) : Int32
      LibTar.tar_extract_blockdev(@t, realname)
    end
    
    def extract_fifo(realname : String) : Int32
      LibTar.tar_extract_fifo(@t, realname)
    end
    
    def extract_regfile(realname : String) : Int32
      LibTar.tar_extract_regfile(@t, realname)
    end
    
    def th_read
      LibTar.th_read(@t)
    end
    
    def th_write
      LibTar.th_write(@t)
    end
    
    def th_set_type(mode : LibTar::ModeT)
      LibTar.th_set_type(mode)
    end
    
    def th_set_path(pathname : String)
      LibTar.th_set_path(@t, pathname)
    end
    
    def th_set_link(linkname : String)
      LibTar.th_set_link(@t, linkname)
    end
    
    def th_set_device(device : LibTar::DevT)
      LibTar.th_set_device(@t, device)
    end
    
    def append_eof
      LibTar.tar_append_eof(@t)
    end
    
    def fd
      LibTar.tar_fd(@t)
    end
    
    def close
      LibTar.tar_close(@t)
    end
    
  end
  
end

#t = Archiver::Tar.new
#t.open("README.tar", "openfunc", 0, 644, 0)

