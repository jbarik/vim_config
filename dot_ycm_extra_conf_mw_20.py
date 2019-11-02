from distutils.sysconfig import get_python_inc
import platform
import os
import subprocess
import ycm_core

import glob
import json
import re

#import logging
#import traceback
#logger = logging.getLogger("jp_ycm")
#logger.setLevel(logging.DEBUG)
#fh = logging.FileHandler("/home/jbarik/temp/ycm.log")
#formatter = logging.Formatter(logging.BASIC_FORMAT)
#fh.setFormatter(formatter)
#logger.addHandler(fh)
#logger.info("Logging starts")


DIR_OF_THIS_SCRIPT = os.path.abspath( os.path.dirname( __file__ ) )
DIR_OF_THIRD_PARTY = os.path.join( DIR_OF_THIS_SCRIPT, 'plugged/YouCompleteMe/third_party' )

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
g_backup_flags = [
'-Wall',
'-Wextra',
'-Werror',
'-Wno-long-long',
'-Wno-variadic-macros',
'-fexceptions',
'-DNDEBUG',
# THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
# language to use when compiling headers. So it will guess. Badly. So C++
# headers will be compiled as C headers. You don't want that so ALWAYS specify
# a "-std=<something>".
# For a C project, you would set this to something like 'c99' instead of
# 'c++11'.
'-std=c++14',
# ...and the same thing goes for the magic -x option which specifies the
# language that the files to be compiled are written in. This is mostly
# relevant for c++ headers.
# For a C project, you would set this to 'c' instead of 'c++'.
'-x',
'c++',
'-isystem',
'-I',
'.',
'-I',
'-isystem',
]

g_sandbox_root = []

mw_include_file_paths = []
try :
    g_sandbox_root = os.environ['WORKING_DIR']
    include_file_name = g_sandbox_root + '/include_path_string.txt'
    with open (include_file_name, "r") as includeFile:
        include_path_list = includeFile.read().splitlines()

    for path_entry in include_path_list:
        path_tuple = path_entry.partition('-I')
        mw_include_file_paths.append(path_tuple[1])
        mw_include_file_paths.append(path_tuple[2])

    g_backup_flags += mw_include_file_paths
except :
    print("Error during deduction of mathworks include path")


defaultFlag = {'flags': g_backup_flags,
               'include_paths_relative_to_dir': DIR_OF_THIS_SCRIPT}
dirFlagMap = {"default": defaultFlag}


def GetFlagForAnyFileInJSONFile(dbFolder):
    json_file_path = dbFolder + '/compile_commands.json'
    contents = json.loads(open(json_file_path).read())
    return contents[0]['arguments']


def GetCompilationFlag(filename, dbFolder):
  global dirFlagMap

  #logging.info("*** GetCompilationFlag called ")
  if dbFolder in dirFlagMap:
      flags = dirFlagMap[dbFolder]
      #logging.info('**** dbFolder found in dirFlagMap')
      # If flags are empty try the json file again. It is possible,
      # new file whose entry is not in the json file is opened first
      if flags:
         new_flags = dirFlagMap[dbFolder]
         return new_flags

  flags = GetFlagForAnyFileInJSONFile(dbFolder)

  if '-Werror' in flags: flags.remove('-Werror')
  basename = os.path.basename(filename)
  if basename in flags: flags.remove(basename)

  if not dbFolder in dirFlagMap:
    if flags:
       dirFlagMap[dbFolder] = flags

  return flags


def FindCompilationDBFolder(filename):
   dirname = os.path.dirname(filename)

   for x in range(0,7):
     DB = glob.glob0(dirname, 'compile_commands.json')
     if len(DB) != 0:
         return dirname
     dirname = os.path.dirname(dirname)

   return ''


def FindCompilationDBFolderInMaster(filename):
    pattern = '^.*\/matlab/'
    replace_with = '/local-ssd/jbarik/Bmasklib.latest_pass/matlab/'
    new_filename = re.sub(pattern, replace_with, filename)
    return FindCompilationDBFolder(new_filename)


def GetTrialDBFolderPath(dbFolderPath):
    pattern = '^.*\/matlab/'
    replace_with = g_sandbox_root + '/matlab/'
    new_folder_path = re.sub(pattern, replace_with, dbFolderPath)
    return new_folder_path


def Settings(**kwargs):
  #logging.debug("*** Settings called")
  #for line in traceback.format_stack():
  #  logging.debug(line.strip())
  #logging.debug("*** Traceback ends")

  include_path_relative_to_dir = []
  if kwargs['language'] == 'cfamily':
     filename = os.path.abspath(kwargs['filename'])
     db_path = FindCompilationDBFolder(filename)
     include_path_relative_to_dir = db_path

     if not db_path:
        #logging.info("*** db folder not found try master")
        db_path = FindCompilationDBFolderInMaster(filename)
        include_path_relative_to_dir = GetTrialDBFolderPath(db_path)

     #logging.info("*** include path relative to dir")
     #logging.info(include_path_relative_to_dir)
     if db_path:
         comp_flag = GetCompilationFlag(filename, db_path)
         return {
             'flags' : comp_flag,
             'include_paths_relative_to_dir': include_path_relative_to_dir,
             'override_filename' : filename
         }

     # If file is inside a valid sandbox, return null
     # else we end up with lot of red lines in the file
     elif "/matlab/" in filename:
         return {
             'flags' : [],
             'include_paths_relative_to_dir' : os.path.dirname(filename),
             'override_filename' : filename
         }

     else:
         return {
             'flags' : g_backup_flags,
             'include_paths_relative_to_dir' : os.path.dirname(filename),
             'override_filename' : filename
         }

def GetStandardLibraryIndexInSysPath( sys_path ):
  for path in sys_path:
    if os.path.isfile( os.path.join( path, 'os.py' ) ):
      return sys_path.index( path )
  raise RuntimeError('Could not find standard library path in Python path.' )


def PythonSysPath(**kwargs):
  sys_path = kwargs['sys_path']
  for folder in os.listdir(DIR_OF_THIRD_PARTY):
    if folder == 'python-future':
      folder = os.path.join(folder, 'src')
      sys_path.insert(GetStandardLibraryIndexInSysPath(sys_path) + 1,
                      os.path.realpath(os.path.join(DIR_OF_THIRD_PARTY,
                                                       folder)))
      continue

    if folder == 'cregex':
      interpreter_path = kwargs['interpreter_path']
      major_version = subprocess.check_output([
        interpreter_path, '-c', 'import sys; print( sys.version_info[0])']
      ).rstrip().decode( 'utf8' )
      folder = os.path.join(folder, 'regex_{}'.format(major_version))

    sys_path.insert(0, os.path.realpath, os.path.join(DIR_OF_THIRD_PARTY,
                                                        folder))
  return sys_path
