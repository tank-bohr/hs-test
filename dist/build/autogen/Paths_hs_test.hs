module Paths_hs_test (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/xoma/experiments/hs-test/.cabal-sandbox/bin"
libdir     = "/Users/xoma/experiments/hs-test/.cabal-sandbox/lib/x86_64-osx-ghc-7.6.3/hs-test-0.1.0.0"
datadir    = "/Users/xoma/experiments/hs-test/.cabal-sandbox/share/x86_64-osx-ghc-7.6.3/hs-test-0.1.0.0"
libexecdir = "/Users/xoma/experiments/hs-test/.cabal-sandbox/libexec"
sysconfdir = "/Users/xoma/experiments/hs-test/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hs_test_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hs_test_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "hs_test_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hs_test_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hs_test_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
